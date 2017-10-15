// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Native format of Hashcat password &quot;recovery&quot; utility
    /// A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://hashcat.net/wiki/doku.php?id=hccap">Source</a>
    /// </remarks>
    public partial class Hccap : KaitaiStruct
    {
        public static Hccap FromFile(string fileName)
        {
            return new Hccap(new KaitaiStream(fileName));
        }

        public Hccap(KaitaiStream p__io, KaitaiStruct p__parent = null, Hccap p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _records = new List<Hccap>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Hccap(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Hccap : KaitaiStruct
        {
            public static Hccap FromFile(string fileName)
            {
                return new Hccap(new KaitaiStream(fileName));
            }

            public Hccap(KaitaiStream p__io, Hccap p__parent = null, Hccap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root ?? this;
                _read();
            }
            private void _read()
            {
                _essid = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(36), 0, false));
                _apMac = m_io.ReadBytes(6);
                _stantionMac = m_io.ReadBytes(6);
                _stantionNonce = m_io.ReadBytes(32);
                _apNonce = m_io.ReadBytes(32);
                __raw_eapol = m_io.ReadBytes(256);
                var io___raw_eapol = new KaitaiStream(__raw_eapol);
                _eapol = new EapolFrame(io___raw_eapol, this, m_root);
                _eapolSize = m_io.ReadU4le();
                _keyver = m_io.ReadU4le();
                _keymic = m_io.ReadBytes(16);
            }
            private string _essid;
            private byte[] _apMac;
            private byte[] _stantionMac;
            private byte[] _stantionNonce;
            private byte[] _apNonce;
            private EapolFrame _eapol;
            private uint _eapolSize;
            private uint _keyver;
            private byte[] _keymic;
            private Hccap m_root;
            private Hccap m_parent;
            private byte[] __raw_eapol;
            public string Essid { get { return _essid; } }

            /// <summary>
            /// the bssid(MAC) of the access point
            /// </summary>
            public byte[] ApMac { get { return _apMac; } }

            /// <summary>
            /// the MAC address of a client connecting to the access point
            /// </summary>
            public byte[] StantionMac { get { return _stantionMac; } }
            public byte[] StantionNonce { get { return _stantionNonce; } }
            public byte[] ApNonce { get { return _apNonce; } }
            public EapolFrame Eapol { get { return _eapol; } }

            /// <summary>
            /// size of eapol
            /// </summary>
            public uint EapolSize { get { return _eapolSize; } }

            /// <summary>
            /// the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
            /// </summary>
            public uint Keyver { get { return _keyver; } }

            /// <summary>
            /// the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
            /// </summary>
            public byte[] Keymic { get { return _keymic; } }
            public Hccap M_Root { get { return m_root; } }
            public Hccap M_Parent { get { return m_parent; } }
            public byte[] M_RawEapol { get { return __raw_eapol; } }
        }
        public partial class EapolFrame : KaitaiStruct
        {
            public static EapolFrame FromFile(string fileName)
            {
                return new EapolFrame(new KaitaiStream(fileName));
            }

            public EapolFrame(KaitaiStream p__io, Hccap.Hccap p__parent = null, Hccap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _body = m_io.ReadBytes(M_Parent.EapolSize);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private Hccap m_root;
            private Hccap.Hccap m_parent;
            public Hccap M_Root { get { return m_root; } }
            public Hccap.Hccap M_Parent { get { return m_parent; } }
        }
        private List<Hccap> _records;
        private Hccap m_root;
        private KaitaiStruct m_parent;
        public List<Hccap> Records { get { return _records; } }
        public Hccap M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
