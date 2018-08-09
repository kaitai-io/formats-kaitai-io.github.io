// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Native format of Hashcat password &quot;recovery&quot; utility
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://hashcat.net/wiki/doku.php?id=hccapx">Source</a>
    /// </remarks>
    public partial class Hccapx : KaitaiStruct
    {
        public static Hccapx FromFile(string fileName)
        {
            return new Hccapx(new KaitaiStream(fileName));
        }

        public Hccapx(KaitaiStream p__io, KaitaiStruct p__parent = null, Hccapx p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _records = new List<HccapxRecord>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new HccapxRecord(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class HccapxRecord : KaitaiStruct
        {
            public static HccapxRecord FromFile(string fileName)
            {
                return new HccapxRecord(new KaitaiStream(fileName));
            }

            public HccapxRecord(KaitaiStream p__io, Hccapx p__parent = null, Hccapx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 72, 67, 80, 88 });
                _version = m_io.ReadU4le();
                _ignoreReplayCounter = m_io.ReadBitsInt(1) != 0;
                _messagePair = m_io.ReadBitsInt(7);
                m_io.AlignToByte();
                _lenEssid = m_io.ReadU1();
                _essid = m_io.ReadBytes(LenEssid);
                _padding1 = m_io.ReadBytes((32 - LenEssid));
                _keyver = m_io.ReadU1();
                _keymic = m_io.ReadBytes(16);
                _macAp = m_io.ReadBytes(6);
                _nonceAp = m_io.ReadBytes(32);
                _macStation = m_io.ReadBytes(6);
                _nonceStation = m_io.ReadBytes(32);
                _lenEapol = m_io.ReadU2le();
                _eapol = m_io.ReadBytes(LenEapol);
                _padding2 = m_io.ReadBytes((256 - LenEapol));
            }
            private byte[] _magic;
            private uint _version;
            private bool _ignoreReplayCounter;
            private ulong _messagePair;
            private byte _lenEssid;
            private byte[] _essid;
            private byte[] _padding1;
            private byte _keyver;
            private byte[] _keymic;
            private byte[] _macAp;
            private byte[] _nonceAp;
            private byte[] _macStation;
            private byte[] _nonceStation;
            private ushort _lenEapol;
            private byte[] _eapol;
            private byte[] _padding2;
            private Hccapx m_root;
            private Hccapx m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// The version number of the .hccapx file format.
            /// </summary>
            public uint Version { get { return _version; } }

            /// <summary>
            /// Indicates if the message pair matching was done based on
            /// replay counter or not.
            /// 
            /// Whenever it was set to 1 it means that the replay counter
            /// was ignored (i.e. it was not considered at all by the
            /// matching algorithm).
            /// 
            /// Hashcat currently does not perform any particular action
            /// based on this bit, but nonetheless this information could be
            /// crucial for some 3th party tools and for
            /// analysis/statistics. There could be some opportunity to
            /// implement some further logic based on this particular
            /// information also within hashcat (in the future).
            /// </summary>
            public bool IgnoreReplayCounter { get { return _ignoreReplayCounter; } }

            /// <summary>
            /// The message_pair value describes which messages of the 4-way
            /// handshake were combined to form the .hccapx structure. It is
            /// always a pair of 2 messages: 1 from the AP (access point)
            /// and 1 from the STA (client).
            /// 
            /// Furthermore, the message_pair value also gives a hint from
            /// which of the 2 messages the EAPOL origins. This is
            /// interesting data, but not necessarily needed for hashcat to
            /// be able to crack the hash.
            /// 
            /// On the other hand, it could be very important to know if
            /// “only” message 1 and message 2 were captured or if for
            /// instance message 3 and/or message 4 were captured too. If
            /// message 3 and/or message 4 were captured it should be a hard
            /// evidence that the connection was established and that the
            /// password the client used was the correct one.
            /// </summary>
            public ulong MessagePair { get { return _messagePair; } }
            public byte LenEssid { get { return _lenEssid; } }
            public byte[] Essid { get { return _essid; } }
            public byte[] Padding1 { get { return _padding1; } }

            /// <summary>
            /// The flag used to distinguish WPA from WPA2 ciphers. Value of
            /// 1 means WPA, other - WPA2.
            /// </summary>
            public byte Keyver { get { return _keyver; } }

            /// <summary>
            /// The final hash value. MD5 for WPA and SHA-1 for WPA2
            /// (truncated to 128 bit).
            /// </summary>
            public byte[] Keymic { get { return _keymic; } }

            /// <summary>
            /// The BSSID (MAC address) of the access point.
            /// </summary>
            public byte[] MacAp { get { return _macAp; } }

            /// <summary>
            /// Nonce (random salt) generated by the access point.
            /// </summary>
            public byte[] NonceAp { get { return _nonceAp; } }

            /// <summary>
            /// The MAC address of the client connecting to the access point.
            /// </summary>
            public byte[] MacStation { get { return _macStation; } }

            /// <summary>
            /// Nonce (random salt) generated by the client connecting to the access point.
            /// </summary>
            public byte[] NonceStation { get { return _nonceStation; } }

            /// <summary>
            /// The length of the EAPOL data.
            /// </summary>
            public ushort LenEapol { get { return _lenEapol; } }
            public byte[] Eapol { get { return _eapol; } }
            public byte[] Padding2 { get { return _padding2; } }
            public Hccapx M_Root { get { return m_root; } }
            public Hccapx M_Parent { get { return m_parent; } }
        }
        private List<HccapxRecord> _records;
        private Hccapx m_root;
        private KaitaiStruct m_parent;
        public List<HccapxRecord> Records { get { return _records; } }
        public Hccapx M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
