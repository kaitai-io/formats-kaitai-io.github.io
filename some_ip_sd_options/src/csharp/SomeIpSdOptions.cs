// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// FormatOptions are used to transport additional information to the entries. 
    /// This includes forinstance the information how a service instance is 
    /// reachable (IP-Address, TransportProtocol, Port Number).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
    /// -">section 4.1.2.4 Options Format</a>
    /// </remarks>
    public partial class SomeIpSdOptions : KaitaiStruct
    {
        public static SomeIpSdOptions FromFile(string fileName)
        {
            return new SomeIpSdOptions(new KaitaiStream(fileName));
        }

        public SomeIpSdOptions(KaitaiStream p__io, KaitaiStruct p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _entries = new List<SdOption>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _entries.Add(new SdOption(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class SdOption : KaitaiStruct
        {
            public static SdOption FromFile(string fileName)
            {
                return new SdOption(new KaitaiStream(fileName));
            }


            public enum OptionTypes
            {
                ConfigurationOption = 1,
                LoadBalancingOption = 2,
                Ipv4EndpointOption = 4,
                Ipv6EndpointOption = 6,
                Ipv4MulticastOption = 20,
                Ipv6MulticastOption = 22,
                Ipv4SdEndpointOption = 36,
                Ipv6SdEndpointOption = 38,
            }
            public SdOption(KaitaiStream p__io, SomeIpSdOptions p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new SdOptionHeader(m_io, this, m_root);
                switch (Header.Type) {
                case OptionTypes.LoadBalancingOption: {
                    _content = new SdLoadBalancingOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.ConfigurationOption: {
                    _content = new SdConfigurationOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv4SdEndpointOption: {
                    _content = new SdIpv4SdEndpointOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv4EndpointOption: {
                    _content = new SdIpv4EndpointOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv6SdEndpointOption: {
                    _content = new SdIpv6SdEndpointOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv4MulticastOption: {
                    _content = new SdIpv4MulticastOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv6EndpointOption: {
                    _content = new SdIpv6EndpointOption(m_io, this, m_root);
                    break;
                }
                case OptionTypes.Ipv6MulticastOption: {
                    _content = new SdIpv6MulticastOption(m_io, this, m_root);
                    break;
                }
                }
            }
            public partial class SdOptionHeader : KaitaiStruct
            {
                public static SdOptionHeader FromFile(string fileName)
                {
                    return new SdOptionHeader(new KaitaiStream(fileName));
                }

                public SdOptionHeader(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU2be();
                    _type = ((SomeIpSdOptions.SdOption.OptionTypes) m_io.ReadU1());
                }
                private ushort _length;
                private OptionTypes _type;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public ushort Length { get { return _length; } }
                public OptionTypes Type { get { return _type; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdConfigString : KaitaiStruct
            {
                public static SdConfigString FromFile(string fileName)
                {
                    return new SdConfigString(new KaitaiStream(fileName));
                }

                public SdConfigString(KaitaiStream p__io, SomeIpSdOptions.SdOption.SdConfigStringsContainer p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU1();
                    if (Length != 0) {
                        __raw_config = m_io.ReadBytes(Length);
                        var io___raw_config = new KaitaiStream(__raw_config);
                        _config = new SdConfigKvPair(io___raw_config, this, m_root);
                    }
                }
                private byte _length;
                private SdConfigKvPair _config;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption.SdConfigStringsContainer m_parent;
                private byte[] __raw_config;
                public byte Length { get { return _length; } }
                public SdConfigKvPair Config { get { return _config; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption.SdConfigStringsContainer M_Parent { get { return m_parent; } }
                public byte[] M_RawConfig { get { return __raw_config; } }
            }
            public partial class SdConfigStringsContainer : KaitaiStruct
            {
                public static SdConfigStringsContainer FromFile(string fileName)
                {
                    return new SdConfigStringsContainer(new KaitaiStream(fileName));
                }

                public SdConfigStringsContainer(KaitaiStream p__io, SomeIpSdOptions.SdOption.SdConfigurationOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _configStrings = new List<SdConfigString>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _configStrings.Add(new SdConfigString(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<SdConfigString> _configStrings;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption.SdConfigurationOption m_parent;
                public List<SdConfigString> ConfigStrings { get { return _configStrings; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption.SdConfigurationOption M_Parent { get { return m_parent; } }
            }
            public partial class SdConfigurationOption : KaitaiStruct
            {
                public static SdConfigurationOption FromFile(string fileName)
                {
                    return new SdConfigurationOption(new KaitaiStream(fileName));
                }

                public SdConfigurationOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    __raw_configurations = m_io.ReadBytes((M_Parent.Header.Length - 1));
                    var io___raw_configurations = new KaitaiStream(__raw_configurations);
                    _configurations = new SdConfigStringsContainer(io___raw_configurations, this, m_root);
                }
                private byte _reserved;
                private SdConfigStringsContainer _configurations;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                private byte[] __raw_configurations;
                public byte Reserved { get { return _reserved; } }
                public SdConfigStringsContainer Configurations { get { return _configurations; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
                public byte[] M_RawConfigurations { get { return __raw_configurations; } }
            }
            public partial class SdIpv4MulticastOption : KaitaiStruct
            {
                public static SdIpv4MulticastOption FromFile(string fileName)
                {
                    return new SdIpv4MulticastOption(new KaitaiStream(fileName));
                }

                public SdIpv4MulticastOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(4);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdIpv4SdEndpointOption : KaitaiStruct
            {
                public static SdIpv4SdEndpointOption FromFile(string fileName)
                {
                    return new SdIpv4SdEndpointOption(new KaitaiStream(fileName));
                }

                public SdIpv4SdEndpointOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(4);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdIpv6MulticastOption : KaitaiStruct
            {
                public static SdIpv6MulticastOption FromFile(string fileName)
                {
                    return new SdIpv6MulticastOption(new KaitaiStream(fileName));
                }

                public SdIpv6MulticastOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(16);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdConfigKvPair : KaitaiStruct
            {
                public static SdConfigKvPair FromFile(string fileName)
                {
                    return new SdConfigKvPair(new KaitaiStream(fileName));
                }

                public SdConfigKvPair(KaitaiStream p__io, SomeIpSdOptions.SdOption.SdConfigString p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _key = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(61, false, true, true));
                    _value = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
                }
                private string _key;
                private string _value;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption.SdConfigString m_parent;
                public string Key { get { return _key; } }
                public string Value { get { return _value; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption.SdConfigString M_Parent { get { return m_parent; } }
            }
            public partial class SdIpv6SdEndpointOption : KaitaiStruct
            {
                public static SdIpv6SdEndpointOption FromFile(string fileName)
                {
                    return new SdIpv6SdEndpointOption(new KaitaiStream(fileName));
                }

                public SdIpv6SdEndpointOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(16);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdIpv4EndpointOption : KaitaiStruct
            {
                public static SdIpv4EndpointOption FromFile(string fileName)
                {
                    return new SdIpv4EndpointOption(new KaitaiStream(fileName));
                }

                public SdIpv4EndpointOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(4);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdIpv6EndpointOption : KaitaiStruct
            {
                public static SdIpv6EndpointOption FromFile(string fileName)
                {
                    return new SdIpv6EndpointOption(new KaitaiStream(fileName));
                }

                public SdIpv6EndpointOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _address = m_io.ReadBytes(16);
                    _reserved2 = m_io.ReadU1();
                    _l4Protocol = m_io.ReadU1();
                    _port = m_io.ReadU2be();
                }
                private byte _reserved;
                private byte[] _address;
                private byte _reserved2;
                private byte _l4Protocol;
                private ushort _port;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public byte[] Address { get { return _address; } }
                public byte Reserved2 { get { return _reserved2; } }
                public byte L4Protocol { get { return _l4Protocol; } }
                public ushort Port { get { return _port; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            public partial class SdLoadBalancingOption : KaitaiStruct
            {
                public static SdLoadBalancingOption FromFile(string fileName)
                {
                    return new SdLoadBalancingOption(new KaitaiStream(fileName));
                }

                public SdLoadBalancingOption(KaitaiStream p__io, SomeIpSdOptions.SdOption p__parent = null, SomeIpSdOptions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU1();
                    _priority = m_io.ReadU2be();
                    _weight = m_io.ReadU2be();
                }
                private byte _reserved;
                private ushort _priority;
                private ushort _weight;
                private SomeIpSdOptions m_root;
                private SomeIpSdOptions.SdOption m_parent;
                public byte Reserved { get { return _reserved; } }
                public ushort Priority { get { return _priority; } }
                public ushort Weight { get { return _weight; } }
                public SomeIpSdOptions M_Root { get { return m_root; } }
                public SomeIpSdOptions.SdOption M_Parent { get { return m_parent; } }
            }
            private SdOptionHeader _header;
            private KaitaiStruct _content;
            private SomeIpSdOptions m_root;
            private SomeIpSdOptions m_parent;
            public SdOptionHeader Header { get { return _header; } }
            public KaitaiStruct Content { get { return _content; } }
            public SomeIpSdOptions M_Root { get { return m_root; } }
            public SomeIpSdOptions M_Parent { get { return m_parent; } }
        }
        private List<SdOption> _entries;
        private SomeIpSdOptions m_root;
        private KaitaiStruct m_parent;
        public List<SdOption> Entries { get { return _entries; } }
        public SomeIpSdOptions M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
