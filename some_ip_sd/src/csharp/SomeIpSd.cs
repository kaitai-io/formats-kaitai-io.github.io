// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// The main tasks of the Service Discovery Protocol are communicating the
    /// availability of functional entities called services in the in-vehicle
    /// communication as well as controlling the send behavior of event messages.
    /// This allows sending only event messages to receivers requiring them (Publish/Subscribe).
    /// The solution described here is also known as SOME/IP-SD
    /// (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">Source</a>
    /// </remarks>
    public partial class SomeIpSd : KaitaiStruct
    {
        public static SomeIpSd FromFile(string fileName)
        {
            return new SomeIpSd(new KaitaiStream(fileName));
        }

        public SomeIpSd(KaitaiStream p__io, KaitaiStruct p__parent = null, SomeIpSd p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _flags = new SdFlags(m_io, this, m_root);
            _reserved = m_io.ReadBytes(3);
            _lenEntries = m_io.ReadU4be();
            __raw_entries = m_io.ReadBytes(LenEntries);
            var io___raw_entries = new KaitaiStream(__raw_entries);
            _entries = new SomeIpSdEntries(io___raw_entries);
            _lenOptions = m_io.ReadU4be();
            __raw_options = m_io.ReadBytes(LenOptions);
            var io___raw_options = new KaitaiStream(__raw_options);
            _options = new SomeIpSdOptions(io___raw_options);
        }

        /// <remarks>
        /// Reference: AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
        /// </remarks>
        public partial class SdFlags : KaitaiStruct
        {
            public static SdFlags FromFile(string fileName)
            {
                return new SdFlags(new KaitaiStream(fileName));
            }

            public SdFlags(KaitaiStream p__io, SomeIpSd p__parent = null, SomeIpSd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reboot = m_io.ReadBitsIntBe(1) != 0;
                _unicast = m_io.ReadBitsIntBe(1) != 0;
                _initialData = m_io.ReadBitsIntBe(1) != 0;
                _reserved = m_io.ReadBitsIntBe(5);
            }
            private bool _reboot;
            private bool _unicast;
            private bool _initialData;
            private ulong _reserved;
            private SomeIpSd m_root;
            private SomeIpSd m_parent;
            public bool Reboot { get { return _reboot; } }
            public bool Unicast { get { return _unicast; } }
            public bool InitialData { get { return _initialData; } }
            public ulong Reserved { get { return _reserved; } }
            public SomeIpSd M_Root { get { return m_root; } }
            public SomeIpSd M_Parent { get { return m_parent; } }
        }
        private SdFlags _flags;
        private byte[] _reserved;
        private uint _lenEntries;
        private SomeIpSdEntries _entries;
        private uint _lenOptions;
        private SomeIpSdOptions _options;
        private SomeIpSd m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_entries;
        private byte[] __raw_options;

        /// <summary>
        /// The SOME/IP-SD Header shall start with an 8 Bit field called flags.
        /// </summary>
        public SdFlags Flags { get { return _flags; } }
        public byte[] Reserved { get { return _reserved; } }
        public uint LenEntries { get { return _lenEntries; } }
        public SomeIpSdEntries Entries { get { return _entries; } }
        public uint LenOptions { get { return _lenOptions; } }
        public SomeIpSdOptions Options { get { return _options; } }
        public SomeIpSd M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawEntries { get { return __raw_entries; } }
        public byte[] M_RawOptions { get { return __raw_options; } }
    }
}
