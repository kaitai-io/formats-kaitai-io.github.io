// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// EVT files are Windows Event Log files written by older Windows
    /// operating systems (2000, XP, 2003). They are used as binary log
    /// files by several major Windows subsystems and
    /// applications. Typically, several of them can be found in
    /// `%WINDIR%\system32\config` directory:
    /// 
    /// * Application = `AppEvent.evt`
    /// * System = `SysEvent.evt`
    /// * Security = `SecEvent.evt`
    /// 
    /// Alternatively, one can export any system event log as distinct .evt
    /// file using relevant option in Event Viewer application.
    /// 
    /// A Windows application can submit an entry into these logs using
    /// [ReportEventA](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
    /// function of Windows API.
    /// 
    /// Internally, EVT files consist of a fixed-size header and event
    /// records. There are several usage scenarios (non-wrapping vs wrapping
    /// log files) which result in slightly different organization of
    /// records.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format">Source</a>
    /// </remarks>
    public partial class WindowsEvtLog : KaitaiStruct
    {
        public static WindowsEvtLog FromFile(string fileName)
        {
            return new WindowsEvtLog(new KaitaiStream(fileName));
        }

        public WindowsEvtLog(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)">Source</a>
        /// </remarks>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, WindowsEvtLog p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenHeader = m_io.ReadU4le();
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 76, 102, 76, 101 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 76, 102, 76, 101 }, Magic, M_Io, "/types/header/seq/1");
                }
                _versionMajor = m_io.ReadU4le();
                _versionMinor = m_io.ReadU4le();
                _ofsStart = m_io.ReadU4le();
                _ofsEnd = m_io.ReadU4le();
                _curRecIdx = m_io.ReadU4le();
                _oldestRecIdx = m_io.ReadU4le();
                _lenFileMax = m_io.ReadU4le();
                _flags = new Flags(m_io, this, m_root);
                _retention = m_io.ReadU4le();
                _lenHeader2 = m_io.ReadU4le();
            }
            public partial class Flags : KaitaiStruct
            {
                public static Flags FromFile(string fileName)
                {
                    return new Flags(new KaitaiStream(fileName));
                }

                public Flags(KaitaiStream p__io, WindowsEvtLog.Header p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadBitsIntBe(28);
                    _archive = m_io.ReadBitsIntBe(1) != 0;
                    _logFull = m_io.ReadBitsIntBe(1) != 0;
                    _wrap = m_io.ReadBitsIntBe(1) != 0;
                    _dirty = m_io.ReadBitsIntBe(1) != 0;
                }
                private ulong _reserved;
                private bool _archive;
                private bool _logFull;
                private bool _wrap;
                private bool _dirty;
                private WindowsEvtLog m_root;
                private WindowsEvtLog.Header m_parent;
                public ulong Reserved { get { return _reserved; } }

                /// <summary>
                /// True if archive attribute has been set for this log file.
                /// </summary>
                public bool Archive { get { return _archive; } }

                /// <summary>
                /// True if last write operation failed due to log being full.
                /// </summary>
                public bool LogFull { get { return _logFull; } }

                /// <summary>
                /// True if wrapping of record has occured.
                /// </summary>
                public bool Wrap { get { return _wrap; } }

                /// <summary>
                /// True if write operation was in progress, but log file
                /// wasn't properly closed.
                /// </summary>
                public bool Dirty { get { return _dirty; } }
                public WindowsEvtLog M_Root { get { return m_root; } }
                public WindowsEvtLog.Header M_Parent { get { return m_parent; } }
            }
            private uint _lenHeader;
            private byte[] _magic;
            private uint _versionMajor;
            private uint _versionMinor;
            private uint _ofsStart;
            private uint _ofsEnd;
            private uint _curRecIdx;
            private uint _oldestRecIdx;
            private uint _lenFileMax;
            private Flags _flags;
            private uint _retention;
            private uint _lenHeader2;
            private WindowsEvtLog m_root;
            private WindowsEvtLog m_parent;

            /// <summary>
            /// Size of the header structure, must be 0x30.
            /// </summary>
            public uint LenHeader { get { return _lenHeader; } }
            public byte[] Magic { get { return _magic; } }
            public uint VersionMajor { get { return _versionMajor; } }
            public uint VersionMinor { get { return _versionMinor; } }

            /// <summary>
            /// Offset of oldest record kept in this log file.
            /// </summary>
            public uint OfsStart { get { return _ofsStart; } }

            /// <summary>
            /// Offset of EOF log record, which is a placeholder for new record.
            /// </summary>
            public uint OfsEnd { get { return _ofsEnd; } }

            /// <summary>
            /// Index of current record, where a new submission would be
            /// written to (normally there should to EOF log record there).
            /// </summary>
            public uint CurRecIdx { get { return _curRecIdx; } }

            /// <summary>
            /// Index of oldest record in the log file
            /// </summary>
            public uint OldestRecIdx { get { return _oldestRecIdx; } }

            /// <summary>
            /// Total maximum size of the log file
            /// </summary>
            public uint LenFileMax { get { return _lenFileMax; } }
            public Flags Flags { get { return _flags; } }
            public uint Retention { get { return _retention; } }

            /// <summary>
            /// Size of the header structure repeated again, and again it must be 0x30.
            /// </summary>
            public uint LenHeader2 { get { return _lenHeader2; } }
            public WindowsEvtLog M_Root { get { return m_root; } }
            public WindowsEvtLog M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
        /// </remarks>
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, WindowsEvtLog p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenRecord = m_io.ReadU4le();
                _type = m_io.ReadU4le();
                switch (Type) {
                case 1699505740: {
                    __raw_body = m_io.ReadBytes((LenRecord - 12));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RecordBody(io___raw_body, this, m_root);
                    break;
                }
                case 286331153: {
                    __raw_body = m_io.ReadBytes((LenRecord - 12));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new CursorRecordBody(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes((LenRecord - 12));
                    break;
                }
                }
                _lenRecord2 = m_io.ReadU4le();
            }
            private uint _lenRecord;
            private uint _type;
            private object _body;
            private uint _lenRecord2;
            private WindowsEvtLog m_root;
            private WindowsEvtLog m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// Size of whole record, including all headers, footers and data
            /// </summary>
            public uint LenRecord { get { return _lenRecord; } }

            /// <summary>
            /// Type of record. Normal log records specify &quot;LfLe&quot;
            /// (0x654c664c) in this field, cursor records use 0x11111111.
            /// </summary>
            public uint Type { get { return _type; } }

            /// <summary>
            /// Record body interpretation depends on type of record. Body
            /// size is specified in a way that it won't include a 8-byte
            /// &quot;header&quot; (`len_record` + `type`) and a &quot;footer&quot;
            /// (`len_record2`).
            /// </summary>
            public object Body { get { return _body; } }

            /// <summary>
            /// Size of whole record again.
            /// </summary>
            public uint LenRecord2 { get { return _lenRecord2; } }
            public WindowsEvtLog M_Root { get { return m_root; } }
            public WindowsEvtLog M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
        /// </remarks>
        public partial class RecordBody : KaitaiStruct
        {
            public static RecordBody FromFile(string fileName)
            {
                return new RecordBody(new KaitaiStream(fileName));
            }


            public enum EventTypes
            {
                Error = 1,
                AuditFailure = 2,
                AuditSuccess = 3,
                Info = 4,
                Warning = 5,
            }
            public RecordBody(KaitaiStream p__io, WindowsEvtLog.Record p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_userSid = false;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _idx = m_io.ReadU4le();
                _timeGenerated = m_io.ReadU4le();
                _timeWritten = m_io.ReadU4le();
                _eventId = m_io.ReadU4le();
                _eventType = ((EventTypes) m_io.ReadU2le());
                _numStrings = m_io.ReadU2le();
                _eventCategory = m_io.ReadU2le();
                _reserved = m_io.ReadBytes(6);
                _ofsStrings = m_io.ReadU4le();
                _lenUserSid = m_io.ReadU4le();
                _ofsUserSid = m_io.ReadU4le();
                _lenData = m_io.ReadU4le();
                _ofsData = m_io.ReadU4le();
            }
            private bool f_userSid;
            private byte[] _userSid;
            public byte[] UserSid
            {
                get
                {
                    if (f_userSid)
                        return _userSid;
                    long _pos = m_io.Pos;
                    m_io.Seek((OfsUserSid - 8));
                    _userSid = m_io.ReadBytes(LenUserSid);
                    m_io.Seek(_pos);
                    f_userSid = true;
                    return _userSid;
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    long _pos = m_io.Pos;
                    m_io.Seek((OfsData - 8));
                    _data = m_io.ReadBytes(LenData);
                    m_io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private uint _idx;
            private uint _timeGenerated;
            private uint _timeWritten;
            private uint _eventId;
            private EventTypes _eventType;
            private ushort _numStrings;
            private ushort _eventCategory;
            private byte[] _reserved;
            private uint _ofsStrings;
            private uint _lenUserSid;
            private uint _ofsUserSid;
            private uint _lenData;
            private uint _ofsData;
            private WindowsEvtLog m_root;
            private WindowsEvtLog.Record m_parent;

            /// <summary>
            /// Index of record in the file.
            /// </summary>
            public uint Idx { get { return _idx; } }

            /// <summary>
            /// Time when this record was generated, POSIX timestamp format.
            /// </summary>
            public uint TimeGenerated { get { return _timeGenerated; } }

            /// <summary>
            /// Time when thsi record was written into the log file, POSIX timestamp format.
            /// </summary>
            public uint TimeWritten { get { return _timeWritten; } }

            /// <summary>
            /// Identifier of an event, meaning is specific to particular
            /// source of events / event type.
            /// </summary>
            public uint EventId { get { return _eventId; } }

            /// <summary>
            /// Type of event.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-types">Source</a>
            /// </remarks>
            public EventTypes EventType { get { return _eventType; } }

            /// <summary>
            /// Number of strings present in the log.
            /// </summary>
            public ushort NumStrings { get { return _numStrings; } }

            /// <remarks>
            /// Reference: <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-categories">Source</a>
            /// </remarks>
            public ushort EventCategory { get { return _eventCategory; } }
            public byte[] Reserved { get { return _reserved; } }

            /// <summary>
            /// Offset of strings present in the log
            /// </summary>
            public uint OfsStrings { get { return _ofsStrings; } }
            public uint LenUserSid { get { return _lenUserSid; } }
            public uint OfsUserSid { get { return _ofsUserSid; } }
            public uint LenData { get { return _lenData; } }
            public uint OfsData { get { return _ofsData; } }
            public WindowsEvtLog M_Root { get { return m_root; } }
            public WindowsEvtLog.Record M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record">Source</a>
        /// </remarks>
        public partial class CursorRecordBody : KaitaiStruct
        {
            public static CursorRecordBody FromFile(string fileName)
            {
                return new CursorRecordBody(new KaitaiStream(fileName));
            }

            public CursorRecordBody(KaitaiStream p__io, WindowsEvtLog.Record p__parent = null, WindowsEvtLog p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(12);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }, Magic, M_Io, "/types/cursor_record_body/seq/0");
                }
                _ofsFirstRecord = m_io.ReadU4le();
                _ofsNextRecord = m_io.ReadU4le();
                _idxNextRecord = m_io.ReadU4le();
                _idxFirstRecord = m_io.ReadU4le();
            }
            private byte[] _magic;
            private uint _ofsFirstRecord;
            private uint _ofsNextRecord;
            private uint _idxNextRecord;
            private uint _idxFirstRecord;
            private WindowsEvtLog m_root;
            private WindowsEvtLog.Record m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint OfsFirstRecord { get { return _ofsFirstRecord; } }
            public uint OfsNextRecord { get { return _ofsNextRecord; } }
            public uint IdxNextRecord { get { return _idxNextRecord; } }
            public uint IdxFirstRecord { get { return _idxFirstRecord; } }
            public WindowsEvtLog M_Root { get { return m_root; } }
            public WindowsEvtLog.Record M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private List<Record> _records;
        private WindowsEvtLog m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public List<Record> Records { get { return _records; } }
        public WindowsEvtLog M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
