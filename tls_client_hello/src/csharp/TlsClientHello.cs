// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class TlsClientHello : KaitaiStruct
    {
        public static TlsClientHello FromFile(string fileName)
        {
            return new TlsClientHello(new KaitaiStream(fileName));
        }

        public TlsClientHello(KaitaiStream p__io, KaitaiStruct p__parent = null, TlsClientHello p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _version = new Version(m_io, this, m_root);
            _random = new Random(m_io, this, m_root);
            _sessionId = new SessionId(m_io, this, m_root);
            _cipherSuites = new CipherSuites(m_io, this, m_root);
            _compressionMethods = new CompressionMethods(m_io, this, m_root);
            if (M_Io.IsEof == false) {
                _extensions = new Extensions(m_io, this, m_root);
            }
        }
        public partial class ServerName : KaitaiStruct
        {
            public static ServerName FromFile(string fileName)
            {
                return new ServerName(new KaitaiStream(fileName));
            }

            public ServerName(KaitaiStream p__io, TlsClientHello.Sni p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _nameType = m_io.ReadU1();
                _length = m_io.ReadU2be();
                _hostName = m_io.ReadBytes(Length);
            }
            private byte _nameType;
            private ushort _length;
            private byte[] _hostName;
            private TlsClientHello m_root;
            private TlsClientHello.Sni m_parent;
            public byte NameType { get { return _nameType; } }
            public ushort Length { get { return _length; } }
            public byte[] HostName { get { return _hostName; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello.Sni M_Parent { get { return m_parent; } }
        }
        public partial class Random : KaitaiStruct
        {
            public static Random FromFile(string fileName)
            {
                return new Random(new KaitaiStream(fileName));
            }

            public Random(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _gmtUnixTime = m_io.ReadU4be();
                _random = m_io.ReadBytes(28);
            }
            private uint _gmtUnixTime;
            private byte[] _random;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public uint GmtUnixTime { get { return _gmtUnixTime; } }
            public byte[] Random { get { return _random; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class SessionId : KaitaiStruct
        {
            public static SessionId FromFile(string fileName)
            {
                return new SessionId(new KaitaiStream(fileName));
            }

            public SessionId(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                _sid = m_io.ReadBytes(Len);
            }
            private byte _len;
            private byte[] _sid;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public byte Len { get { return _len; } }
            public byte[] Sid { get { return _sid; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class Sni : KaitaiStruct
        {
            public static Sni FromFile(string fileName)
            {
                return new Sni(new KaitaiStream(fileName));
            }

            public Sni(KaitaiStream p__io, TlsClientHello.Extension p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _listLength = m_io.ReadU2be();
                _serverNames = new List<ServerName>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _serverNames.Add(new ServerName(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private ushort _listLength;
            private List<ServerName> _serverNames;
            private TlsClientHello m_root;
            private TlsClientHello.Extension m_parent;
            public ushort ListLength { get { return _listLength; } }
            public List<ServerName> ServerNames { get { return _serverNames; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello.Extension M_Parent { get { return m_parent; } }
        }
        public partial class CipherSuites : KaitaiStruct
        {
            public static CipherSuites FromFile(string fileName)
            {
                return new CipherSuites(new KaitaiStream(fileName));
            }

            public CipherSuites(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU2be();
                _cipherSuites = new List<ushort>();
                for (var i = 0; i < (Len / 2); i++)
                {
                    _cipherSuites.Add(m_io.ReadU2be());
                }
            }
            private ushort _len;
            private List<ushort> _cipherSuites;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public ushort Len { get { return _len; } }
            public List<ushort> CipherSuites { get { return _cipherSuites; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class CompressionMethods : KaitaiStruct
        {
            public static CompressionMethods FromFile(string fileName)
            {
                return new CompressionMethods(new KaitaiStream(fileName));
            }

            public CompressionMethods(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                _compressionMethods = m_io.ReadBytes(Len);
            }
            private byte _len;
            private byte[] _compressionMethods;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public byte Len { get { return _len; } }
            public byte[] CompressionMethods { get { return _compressionMethods; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class Alpn : KaitaiStruct
        {
            public static Alpn FromFile(string fileName)
            {
                return new Alpn(new KaitaiStream(fileName));
            }

            public Alpn(KaitaiStream p__io, TlsClientHello.Extension p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _extLen = m_io.ReadU2be();
                _alpnProtocols = new List<Protocol>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _alpnProtocols.Add(new Protocol(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private ushort _extLen;
            private List<Protocol> _alpnProtocols;
            private TlsClientHello m_root;
            private TlsClientHello.Extension m_parent;
            public ushort ExtLen { get { return _extLen; } }
            public List<Protocol> AlpnProtocols { get { return _alpnProtocols; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello.Extension M_Parent { get { return m_parent; } }
        }
        public partial class Extensions : KaitaiStruct
        {
            public static Extensions FromFile(string fileName)
            {
                return new Extensions(new KaitaiStream(fileName));
            }

            public Extensions(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU2be();
                _extensions = new List<Extension>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _extensions.Add(new Extension(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private ushort _len;
            private List<Extension> _extensions;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public ushort Len { get { return _len; } }
            public List<Extension> Extensions { get { return _extensions; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class Version : KaitaiStruct
        {
            public static Version FromFile(string fileName)
            {
                return new Version(new KaitaiStream(fileName));
            }

            public Version(KaitaiStream p__io, TlsClientHello p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _major = m_io.ReadU1();
                _minor = m_io.ReadU1();
            }
            private byte _major;
            private byte _minor;
            private TlsClientHello m_root;
            private TlsClientHello m_parent;
            public byte Major { get { return _major; } }
            public byte Minor { get { return _minor; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello M_Parent { get { return m_parent; } }
        }
        public partial class Protocol : KaitaiStruct
        {
            public static Protocol FromFile(string fileName)
            {
                return new Protocol(new KaitaiStream(fileName));
            }

            public Protocol(KaitaiStream p__io, TlsClientHello.Alpn p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _strlen = m_io.ReadU1();
                _name = m_io.ReadBytes(Strlen);
            }
            private byte _strlen;
            private byte[] _name;
            private TlsClientHello m_root;
            private TlsClientHello.Alpn m_parent;
            public byte Strlen { get { return _strlen; } }
            public byte[] Name { get { return _name; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello.Alpn M_Parent { get { return m_parent; } }
        }
        public partial class Extension : KaitaiStruct
        {
            public static Extension FromFile(string fileName)
            {
                return new Extension(new KaitaiStream(fileName));
            }

            public Extension(KaitaiStream p__io, TlsClientHello.Extensions p__parent = null, TlsClientHello p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = m_io.ReadU2be();
                _len = m_io.ReadU2be();
                switch (Type) {
                case 0: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Sni(io___raw_body, this, m_root);
                    break;
                }
                case 16: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Alpn(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Len);
                    break;
                }
                }
            }
            private ushort _type;
            private ushort _len;
            private object _body;
            private TlsClientHello m_root;
            private TlsClientHello.Extensions m_parent;
            private byte[] __raw_body;
            public ushort Type { get { return _type; } }
            public ushort Len { get { return _len; } }
            public object Body { get { return _body; } }
            public TlsClientHello M_Root { get { return m_root; } }
            public TlsClientHello.Extensions M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        private Version _version;
        private Random _random;
        private SessionId _sessionId;
        private CipherSuites _cipherSuites;
        private CompressionMethods _compressionMethods;
        private Extensions _extensions;
        private TlsClientHello m_root;
        private KaitaiStruct m_parent;
        public Version Version { get { return _version; } }
        public Random Random { get { return _random; } }
        public SessionId SessionId { get { return _sessionId; } }
        public CipherSuites CipherSuites { get { return _cipherSuites; } }
        public CompressionMethods CompressionMethods { get { return _compressionMethods; } }
        public Extensions Extensions { get { return _extensions; } }
        public TlsClientHello M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
