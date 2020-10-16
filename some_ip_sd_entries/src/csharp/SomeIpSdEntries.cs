// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The entries are used to synchronize the state of services instances and the 
    /// Publish/-Subscribe handling.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">- section 4.1.2.3  Entry Format</a>
    /// </remarks>
    public partial class SomeIpSdEntries : KaitaiStruct
    {
        public static SomeIpSdEntries FromFile(string fileName)
        {
            return new SomeIpSdEntries(new KaitaiStream(fileName));
        }

        public SomeIpSdEntries(KaitaiStream p__io, KaitaiStruct p__parent = null, SomeIpSdEntries p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _entries = new List<SdEntry>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _entries.Add(new SdEntry(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class SdEntry : KaitaiStruct
        {
            public static SdEntry FromFile(string fileName)
            {
                return new SdEntry(new KaitaiStream(fileName));
            }


            public enum EntryTypes
            {
                Find = 0,
                Offer = 1,
                Subscribe = 6,
                SubscribeAck = 7,
            }
            public SdEntry(KaitaiStream p__io, SomeIpSdEntries p__parent = null, SomeIpSdEntries p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new SdEntryHeader(m_io, this, m_root);
                switch (Header.Type) {
                case EntryTypes.Find: {
                    _content = new SdServiceEntry(m_io, this, m_root);
                    break;
                }
                case EntryTypes.Offer: {
                    _content = new SdServiceEntry(m_io, this, m_root);
                    break;
                }
                case EntryTypes.Subscribe: {
                    _content = new SdEventgroupEntry(m_io, this, m_root);
                    break;
                }
                case EntryTypes.SubscribeAck: {
                    _content = new SdEventgroupEntry(m_io, this, m_root);
                    break;
                }
                }
            }
            public partial class SdEntryHeader : KaitaiStruct
            {
                public static SdEntryHeader FromFile(string fileName)
                {
                    return new SdEntryHeader(new KaitaiStream(fileName));
                }

                public SdEntryHeader(KaitaiStream p__io, SomeIpSdEntries.SdEntry p__parent = null, SomeIpSdEntries p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _type = ((SomeIpSdEntries.SdEntry.EntryTypes) m_io.ReadU1());
                    _indexFirstOptions = m_io.ReadU1();
                    _indexSecondOptions = m_io.ReadU1();
                    _numberFirstOptions = m_io.ReadBitsIntBe(4);
                    _numberSecondOptions = m_io.ReadBitsIntBe(4);
                    m_io.AlignToByte();
                    _serviceId = m_io.ReadU2be();
                    _instanceId = m_io.ReadU2be();
                    _majorVersion = m_io.ReadU1();
                    _ttl = m_io.ReadBitsIntBe(24);
                }
                private EntryTypes _type;
                private byte _indexFirstOptions;
                private byte _indexSecondOptions;
                private ulong _numberFirstOptions;
                private ulong _numberSecondOptions;
                private ushort _serviceId;
                private ushort _instanceId;
                private byte _majorVersion;
                private ulong _ttl;
                private SomeIpSdEntries m_root;
                private SomeIpSdEntries.SdEntry m_parent;
                public EntryTypes Type { get { return _type; } }
                public byte IndexFirstOptions { get { return _indexFirstOptions; } }
                public byte IndexSecondOptions { get { return _indexSecondOptions; } }
                public ulong NumberFirstOptions { get { return _numberFirstOptions; } }
                public ulong NumberSecondOptions { get { return _numberSecondOptions; } }
                public ushort ServiceId { get { return _serviceId; } }
                public ushort InstanceId { get { return _instanceId; } }
                public byte MajorVersion { get { return _majorVersion; } }
                public ulong Ttl { get { return _ttl; } }
                public SomeIpSdEntries M_Root { get { return m_root; } }
                public SomeIpSdEntries.SdEntry M_Parent { get { return m_parent; } }
            }
            public partial class SdServiceEntry : KaitaiStruct
            {
                public static SdServiceEntry FromFile(string fileName)
                {
                    return new SdServiceEntry(new KaitaiStream(fileName));
                }

                public SdServiceEntry(KaitaiStream p__io, SomeIpSdEntries.SdEntry p__parent = null, SomeIpSdEntries p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _minorVersion = m_io.ReadU4be();
                }
                private uint _minorVersion;
                private SomeIpSdEntries m_root;
                private SomeIpSdEntries.SdEntry m_parent;
                public uint MinorVersion { get { return _minorVersion; } }
                public SomeIpSdEntries M_Root { get { return m_root; } }
                public SomeIpSdEntries.SdEntry M_Parent { get { return m_parent; } }
            }
            public partial class SdEventgroupEntry : KaitaiStruct
            {
                public static SdEventgroupEntry FromFile(string fileName)
                {
                    return new SdEventgroupEntry(new KaitaiStream(fileName));
                }

                public SdEventgroupEntry(KaitaiStream p__io, SomeIpSdEntries.SdEntry p__parent = null, SomeIpSdEntries p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _initialDataRequested = m_io.ReadBitsIntBe(1) != 0;
                    _reserved2 = m_io.ReadBitsIntBe(3);
                    _counter = m_io.ReadBitsIntBe(4);
                    m_io.AlignToByte();
                    _eventGroupId = m_io.ReadU2be();
                }
                private byte _reserved;
                private bool _initialDataRequested;
                private ulong _reserved2;
                private ulong _counter;
                private ushort _eventGroupId;
                private SomeIpSdEntries m_root;
                private SomeIpSdEntries.SdEntry m_parent;
                public byte Reserved { get { return _reserved; } }
                public bool InitialDataRequested { get { return _initialDataRequested; } }
                public ulong Reserved2 { get { return _reserved2; } }
                public ulong Counter { get { return _counter; } }
                public ushort EventGroupId { get { return _eventGroupId; } }
                public SomeIpSdEntries M_Root { get { return m_root; } }
                public SomeIpSdEntries.SdEntry M_Parent { get { return m_parent; } }
            }
            private SdEntryHeader _header;
            private KaitaiStruct _content;
            private SomeIpSdEntries m_root;
            private SomeIpSdEntries m_parent;
            public SdEntryHeader Header { get { return _header; } }
            public KaitaiStruct Content { get { return _content; } }
            public SomeIpSdEntries M_Root { get { return m_root; } }
            public SomeIpSdEntries M_Parent { get { return m_parent; } }
        }
        private List<SdEntry> _entries;
        private SomeIpSdEntries m_root;
        private KaitaiStruct m_parent;
        public List<SdEntry> Entries { get { return _entries; } }
        public SomeIpSdEntries M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
