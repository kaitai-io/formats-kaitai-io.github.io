// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// systemd, a popular user-space system/service management suite on Linux,
    /// offers logging functionality, storing incoming logs in a binary journal
    /// format.
    /// 
    /// On live Linux system running systemd, these journals are typically located at:
    /// 
    /// * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
    /// * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/">Source</a>
    /// </remarks>
    public partial class SystemdJournal : KaitaiStruct
    {
        public static SystemdJournal FromFile(string fileName)
        {
            return new SystemdJournal(new KaitaiStream(fileName));
        }


        public enum State
        {
            Offline = 0,
            Online = 1,
            Archived = 2,
        }
        public SystemdJournal(KaitaiStream p__io, KaitaiStruct p__parent = null, SystemdJournal p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_dataHashTable = false;
            f_fieldHashTable = false;
            f_lenHeader = false;
            _read();
        }
        private void _read()
        {
            __raw_header = m_io.ReadBytes(LenHeader);
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
            _objects = new List<JournalObject>();
            for (var i = 0; i < Header.NumObjects; i++)
            {
                _objects.Add(new JournalObject(m_io, this, m_root));
            }
        }

        /// <summary>
        /// Data objects are designed to carry log payload, typically in
        /// form of a &quot;key=value&quot; string in `payload` attribute.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects">Source</a>
        /// </remarks>
        public partial class DataObject : KaitaiStruct
        {
            public static DataObject FromFile(string fileName)
            {
                return new DataObject(new KaitaiStream(fileName));
            }

            public DataObject(KaitaiStream p__io, SystemdJournal.JournalObject p__parent = null, SystemdJournal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_entry = false;
                f_entryArray = false;
                f_headField = false;
                f_nextHash = false;
                _read();
            }
            private void _read()
            {
                _hash = m_io.ReadU8le();
                _ofsNextHash = m_io.ReadU8le();
                _ofsHeadField = m_io.ReadU8le();
                _ofsEntry = m_io.ReadU8le();
                _ofsEntryArray = m_io.ReadU8le();
                _numEntries = m_io.ReadU8le();
                _payload = m_io.ReadBytesFull();
            }
            private bool f_entry;
            private JournalObject _entry;
            public JournalObject Entry
            {
                get
                {
                    if (f_entry)
                        return _entry;
                    f_entry = true;
                    if (OfsEntry != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsEntry);
                        _entry = new JournalObject(io, this, m_root);
                        io.Seek(_pos);
                    }
                    return _entry;
                }
            }
            private bool f_entryArray;
            private JournalObject _entryArray;
            public JournalObject EntryArray
            {
                get
                {
                    if (f_entryArray)
                        return _entryArray;
                    f_entryArray = true;
                    if (OfsEntryArray != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsEntryArray);
                        _entryArray = new JournalObject(io, this, m_root);
                        io.Seek(_pos);
                    }
                    return _entryArray;
                }
            }
            private bool f_headField;
            private JournalObject _headField;
            public JournalObject HeadField
            {
                get
                {
                    if (f_headField)
                        return _headField;
                    f_headField = true;
                    if (OfsHeadField != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsHeadField);
                        _headField = new JournalObject(io, this, m_root);
                        io.Seek(_pos);
                    }
                    return _headField;
                }
            }
            private bool f_nextHash;
            private JournalObject _nextHash;
            public JournalObject NextHash
            {
                get
                {
                    if (f_nextHash)
                        return _nextHash;
                    f_nextHash = true;
                    if (OfsNextHash != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsNextHash);
                        _nextHash = new JournalObject(io, this, m_root);
                        io.Seek(_pos);
                    }
                    return _nextHash;
                }
            }
            private ulong _hash;
            private ulong _ofsNextHash;
            private ulong _ofsHeadField;
            private ulong _ofsEntry;
            private ulong _ofsEntryArray;
            private ulong _numEntries;
            private byte[] _payload;
            private SystemdJournal m_root;
            private SystemdJournal.JournalObject m_parent;
            public ulong Hash { get { return _hash; } }
            public ulong OfsNextHash { get { return _ofsNextHash; } }
            public ulong OfsHeadField { get { return _ofsHeadField; } }
            public ulong OfsEntry { get { return _ofsEntry; } }
            public ulong OfsEntryArray { get { return _ofsEntryArray; } }
            public ulong NumEntries { get { return _numEntries; } }
            public byte[] Payload { get { return _payload; } }
            public SystemdJournal M_Root { get { return m_root; } }
            public SystemdJournal.JournalObject M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, SystemdJournal p__parent = null, SystemdJournal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signature = m_io.ReadBytes(8);
                if (!((KaitaiStream.ByteArrayCompare(_signature, new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }, _signature, m_io, "/types/header/seq/0");
                }
                _compatibleFlags = m_io.ReadU4le();
                _incompatibleFlags = m_io.ReadU4le();
                _state = ((SystemdJournal.State) m_io.ReadU1());
                _reserved = m_io.ReadBytes(7);
                _fileId = m_io.ReadBytes(16);
                _machineId = m_io.ReadBytes(16);
                _bootId = m_io.ReadBytes(16);
                _seqnumId = m_io.ReadBytes(16);
                _lenHeader = m_io.ReadU8le();
                _lenArena = m_io.ReadU8le();
                _ofsDataHashTable = m_io.ReadU8le();
                _lenDataHashTable = m_io.ReadU8le();
                _ofsFieldHashTable = m_io.ReadU8le();
                _lenFieldHashTable = m_io.ReadU8le();
                _ofsTailObject = m_io.ReadU8le();
                _numObjects = m_io.ReadU8le();
                _numEntries = m_io.ReadU8le();
                _tailEntrySeqnum = m_io.ReadU8le();
                _headEntrySeqnum = m_io.ReadU8le();
                _ofsEntryArray = m_io.ReadU8le();
                _headEntryRealtime = m_io.ReadU8le();
                _tailEntryRealtime = m_io.ReadU8le();
                _tailEntryMonotonic = m_io.ReadU8le();
                if (!(M_Io.IsEof)) {
                    _numData = m_io.ReadU8le();
                }
                if (!(M_Io.IsEof)) {
                    _numFields = m_io.ReadU8le();
                }
                if (!(M_Io.IsEof)) {
                    _numTags = m_io.ReadU8le();
                }
                if (!(M_Io.IsEof)) {
                    _numEntryArrays = m_io.ReadU8le();
                }
            }
            private byte[] _signature;
            private uint _compatibleFlags;
            private uint _incompatibleFlags;
            private State _state;
            private byte[] _reserved;
            private byte[] _fileId;
            private byte[] _machineId;
            private byte[] _bootId;
            private byte[] _seqnumId;
            private ulong _lenHeader;
            private ulong _lenArena;
            private ulong _ofsDataHashTable;
            private ulong _lenDataHashTable;
            private ulong _ofsFieldHashTable;
            private ulong _lenFieldHashTable;
            private ulong _ofsTailObject;
            private ulong _numObjects;
            private ulong _numEntries;
            private ulong _tailEntrySeqnum;
            private ulong _headEntrySeqnum;
            private ulong _ofsEntryArray;
            private ulong _headEntryRealtime;
            private ulong _tailEntryRealtime;
            private ulong _tailEntryMonotonic;
            private ulong? _numData;
            private ulong? _numFields;
            private ulong? _numTags;
            private ulong? _numEntryArrays;
            private SystemdJournal m_root;
            private SystemdJournal m_parent;
            public byte[] Signature { get { return _signature; } }
            public uint CompatibleFlags { get { return _compatibleFlags; } }
            public uint IncompatibleFlags { get { return _incompatibleFlags; } }
            public State State { get { return _state; } }
            public byte[] Reserved { get { return _reserved; } }
            public byte[] FileId { get { return _fileId; } }
            public byte[] MachineId { get { return _machineId; } }
            public byte[] BootId { get { return _bootId; } }
            public byte[] SeqnumId { get { return _seqnumId; } }
            public ulong LenHeader { get { return _lenHeader; } }
            public ulong LenArena { get { return _lenArena; } }
            public ulong OfsDataHashTable { get { return _ofsDataHashTable; } }
            public ulong LenDataHashTable { get { return _lenDataHashTable; } }
            public ulong OfsFieldHashTable { get { return _ofsFieldHashTable; } }
            public ulong LenFieldHashTable { get { return _lenFieldHashTable; } }
            public ulong OfsTailObject { get { return _ofsTailObject; } }
            public ulong NumObjects { get { return _numObjects; } }
            public ulong NumEntries { get { return _numEntries; } }
            public ulong TailEntrySeqnum { get { return _tailEntrySeqnum; } }
            public ulong HeadEntrySeqnum { get { return _headEntrySeqnum; } }
            public ulong OfsEntryArray { get { return _ofsEntryArray; } }
            public ulong HeadEntryRealtime { get { return _headEntryRealtime; } }
            public ulong TailEntryRealtime { get { return _tailEntryRealtime; } }
            public ulong TailEntryMonotonic { get { return _tailEntryMonotonic; } }
            public ulong? NumData { get { return _numData; } }
            public ulong? NumFields { get { return _numFields; } }
            public ulong? NumTags { get { return _numTags; } }
            public ulong? NumEntryArrays { get { return _numEntryArrays; } }
            public SystemdJournal M_Root { get { return m_root; } }
            public SystemdJournal M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects">Source</a>
        /// </remarks>
        public partial class JournalObject : KaitaiStruct
        {
            public static JournalObject FromFile(string fileName)
            {
                return new JournalObject(new KaitaiStream(fileName));
            }


            public enum ObjectTypes
            {
                Unused = 0,
                Data = 1,
                Field = 2,
                Entry = 3,
                DataHashTable = 4,
                FieldHashTable = 5,
                EntryArray = 6,
                Tag = 7,
            }
            public JournalObject(KaitaiStream p__io, KaitaiStruct p__parent = null, SystemdJournal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _padding = m_io.ReadBytes(KaitaiStream.Mod(8 - M_Io.Pos, 8));
                _objectType = ((ObjectTypes) m_io.ReadU1());
                _flags = m_io.ReadU1();
                _reserved = m_io.ReadBytes(6);
                _lenObject = m_io.ReadU8le();
                switch (ObjectType) {
                case ObjectTypes.Data: {
                    __raw_payload = m_io.ReadBytes(LenObject - 16);
                    var io___raw_payload = new KaitaiStream(__raw_payload);
                    _payload = new DataObject(io___raw_payload, this, m_root);
                    break;
                }
                default: {
                    _payload = m_io.ReadBytes(LenObject - 16);
                    break;
                }
                }
            }
            private byte[] _padding;
            private ObjectTypes _objectType;
            private byte _flags;
            private byte[] _reserved;
            private ulong _lenObject;
            private object _payload;
            private SystemdJournal m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_payload;
            public byte[] Padding { get { return _padding; } }
            public ObjectTypes ObjectType { get { return _objectType; } }
            public byte Flags { get { return _flags; } }
            public byte[] Reserved { get { return _reserved; } }
            public ulong LenObject { get { return _lenObject; } }
            public object Payload { get { return _payload; } }
            public SystemdJournal M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawPayload { get { return __raw_payload; } }
        }
        private bool f_dataHashTable;
        private byte[] _dataHashTable;
        public byte[] DataHashTable
        {
            get
            {
                if (f_dataHashTable)
                    return _dataHashTable;
                f_dataHashTable = true;
                long _pos = m_io.Pos;
                m_io.Seek(Header.OfsDataHashTable);
                _dataHashTable = m_io.ReadBytes(Header.LenDataHashTable);
                m_io.Seek(_pos);
                return _dataHashTable;
            }
        }
        private bool f_fieldHashTable;
        private byte[] _fieldHashTable;
        public byte[] FieldHashTable
        {
            get
            {
                if (f_fieldHashTable)
                    return _fieldHashTable;
                f_fieldHashTable = true;
                long _pos = m_io.Pos;
                m_io.Seek(Header.OfsFieldHashTable);
                _fieldHashTable = m_io.ReadBytes(Header.LenFieldHashTable);
                m_io.Seek(_pos);
                return _fieldHashTable;
            }
        }
        private bool f_lenHeader;
        private ulong _lenHeader;

        /// <summary>
        /// Header length is used to set substream size, as it thus required
        /// prior to declaration of header.
        /// </summary>
        public ulong LenHeader
        {
            get
            {
                if (f_lenHeader)
                    return _lenHeader;
                f_lenHeader = true;
                long _pos = m_io.Pos;
                m_io.Seek(88);
                _lenHeader = m_io.ReadU8le();
                m_io.Seek(_pos);
                return _lenHeader;
            }
        }
        private Header _header;
        private List<JournalObject> _objects;
        private SystemdJournal m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public Header Header { get { return _header; } }
        public List<JournalObject> Objects { get { return _objects; } }
        public SystemdJournal M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}
