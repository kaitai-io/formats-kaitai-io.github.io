// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// SSH public keys are encoded in a special binary format, typically represented
    /// to end users as either one-liner OpenSSH format or multi-line PEM format
    /// (commerical SSH). Text wrapper carries extra information about user who
    /// created the key, comment, etc, but the inner binary is always base64-encoded
    /// and follows the same internal format.
    /// 
    /// This format spec deals with this internal binary format (called &quot;blob&quot; in
    /// openssh sources) only. Buffer is expected to be raw binary and not base64-d.
    /// Implementation closely follows code in OpenSSH.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970">Source</a>
    /// </remarks>
    public partial class SshPublicKey : KaitaiStruct
    {
        public static SshPublicKey FromFile(string fileName)
        {
            return new SshPublicKey(new KaitaiStream(fileName));
        }

        public SshPublicKey(KaitaiStream p__io, KaitaiStruct p__parent = null, SshPublicKey p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _keyName = new Cstring(m_io, this, m_root);
            switch (KeyName.Value) {
            case "ecdsa-sha2-nistp256": {
                _body = new KeyEcdsa(m_io, this, m_root);
                break;
            }
            case "ssh-dss": {
                _body = new KeyDsa(m_io, this, m_root);
                break;
            }
            case "ssh-ed25519": {
                _body = new KeyEd25519(m_io, this, m_root);
                break;
            }
            case "ssh-rsa": {
                _body = new KeyRsa(m_io, this, m_root);
                break;
            }
            }
        }

        /// <summary>
        /// Big integers serialization format used by ssh, v2. In the code, the following
        /// routines are used to read/write it:
        /// 
        /// * sshbuf_get_bignum2
        /// * sshbuf_get_bignum2_bytes_direct
        /// * sshbuf_put_bignum2
        /// * sshbuf_get_bignum2_bytes_direct
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
        /// https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
        /// ">Source</a>
        /// </remarks>
        public partial class Bignum2 : KaitaiStruct
        {
            public static Bignum2 FromFile(string fileName)
            {
                return new Bignum2(new KaitaiStream(fileName));
            }

            public Bignum2(KaitaiStream p__io, KaitaiStruct p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lengthInBits = false;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4be();
                _body = m_io.ReadBytes(Len);
            }
            private bool f_lengthInBits;
            private int _lengthInBits;

            /// <summary>
            /// Length of big integer in bits. In OpenSSH sources, this corresponds to
            /// `BN_num_bits` function.
            /// </summary>
            public int LengthInBits
            {
                get
                {
                    if (f_lengthInBits)
                        return _lengthInBits;
                    f_lengthInBits = true;
                    _lengthInBits = (int) ((Len - 1) * 8);
                    return _lengthInBits;
                }
            }
            private uint _len;
            private byte[] _body;
            private SshPublicKey m_root;
            private KaitaiStruct m_parent;
            public uint Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A integer-prefixed string designed to be read using `sshbuf_get_cstring`
        /// and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
        /// obscure misnomer, as typically &quot;C string&quot; means a null-terminated string.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181">Source</a>
        /// </remarks>
        public partial class Cstring : KaitaiStruct
        {
            public static Cstring FromFile(string fileName)
            {
                return new Cstring(new KaitaiStream(fileName));
            }

            public Cstring(KaitaiStream p__io, KaitaiStruct p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4be();
                _value = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(Len));
            }
            private uint _len;
            private string _value;
            private SshPublicKey m_root;
            private KaitaiStruct m_parent;
            public uint Len { get { return _len; } }
            public string Value { get { return _value; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Elliptic curve dump format used by ssh. In OpenSSH code, the following
        /// routines are used to read/write it:
        /// 
        /// * sshbuf_get_ec
        /// * get_ec
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
        /// https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
        /// ">Source</a>
        /// </remarks>
        public partial class EllipticCurve : KaitaiStruct
        {
            public static EllipticCurve FromFile(string fileName)
            {
                return new EllipticCurve(new KaitaiStream(fileName));
            }

            public EllipticCurve(KaitaiStream p__io, SshPublicKey.KeyEcdsa p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4be();
                _body = m_io.ReadBytes(Len);
            }
            private uint _len;
            private byte[] _body;
            private SshPublicKey m_root;
            private SshPublicKey.KeyEcdsa m_parent;
            public uint Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public SshPublicKey.KeyEcdsa M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051">Source</a>
        /// </remarks>
        public partial class KeyDsa : KaitaiStruct
        {
            public static KeyDsa FromFile(string fileName)
            {
                return new KeyDsa(new KaitaiStream(fileName));
            }

            public KeyDsa(KaitaiStream p__io, SshPublicKey p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dsaP = new Bignum2(m_io, this, m_root);
                _dsaQ = new Bignum2(m_io, this, m_root);
                _dsaG = new Bignum2(m_io, this, m_root);
                _dsaPubKey = new Bignum2(m_io, this, m_root);
            }
            private Bignum2 _dsaP;
            private Bignum2 _dsaQ;
            private Bignum2 _dsaG;
            private Bignum2 _dsaPubKey;
            private SshPublicKey m_root;
            private SshPublicKey m_parent;
            public Bignum2 DsaP { get { return _dsaP; } }
            public Bignum2 DsaQ { get { return _dsaQ; } }
            public Bignum2 DsaG { get { return _dsaG; } }
            public Bignum2 DsaPubKey { get { return _dsaPubKey; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public SshPublicKey M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103">Source</a>
        /// </remarks>
        public partial class KeyEcdsa : KaitaiStruct
        {
            public static KeyEcdsa FromFile(string fileName)
            {
                return new KeyEcdsa(new KaitaiStream(fileName));
            }

            public KeyEcdsa(KaitaiStream p__io, SshPublicKey p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _curveName = new Cstring(m_io, this, m_root);
                _ec = new EllipticCurve(m_io, this, m_root);
            }
            private Cstring _curveName;
            private EllipticCurve _ec;
            private SshPublicKey m_root;
            private SshPublicKey m_parent;
            public Cstring CurveName { get { return _curveName; } }
            public EllipticCurve Ec { get { return _ec; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public SshPublicKey M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124">Source</a>
        /// </remarks>
        public partial class KeyEd25519 : KaitaiStruct
        {
            public static KeyEd25519 FromFile(string fileName)
            {
                return new KeyEd25519(new KaitaiStream(fileName));
            }

            public KeyEd25519(KaitaiStream p__io, SshPublicKey p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenPk = m_io.ReadU4be();
                _pk = m_io.ReadBytes(LenPk);
            }
            private uint _lenPk;
            private byte[] _pk;
            private SshPublicKey m_root;
            private SshPublicKey m_parent;
            public uint LenPk { get { return _lenPk; } }
            public byte[] Pk { get { return _pk; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public SshPublicKey M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028">Source</a>
        /// </remarks>
        public partial class KeyRsa : KaitaiStruct
        {
            public static KeyRsa FromFile(string fileName)
            {
                return new KeyRsa(new KaitaiStream(fileName));
            }

            public KeyRsa(KaitaiStream p__io, SshPublicKey p__parent = null, SshPublicKey p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_keyLength = false;
                _read();
            }
            private void _read()
            {
                _rsaE = new Bignum2(m_io, this, m_root);
                _rsaN = new Bignum2(m_io, this, m_root);
            }
            private bool f_keyLength;
            private int _keyLength;

            /// <summary>
            /// Key length in bits
            /// </summary>
            public int KeyLength
            {
                get
                {
                    if (f_keyLength)
                        return _keyLength;
                    f_keyLength = true;
                    _keyLength = (int) (RsaN.LengthInBits);
                    return _keyLength;
                }
            }
            private Bignum2 _rsaE;
            private Bignum2 _rsaN;
            private SshPublicKey m_root;
            private SshPublicKey m_parent;

            /// <summary>
            /// Public key exponent, designated `e` in RSA documentation.
            /// </summary>
            public Bignum2 RsaE { get { return _rsaE; } }

            /// <summary>
            /// Modulus of both public and private keys, designated `n` in RSA
            /// documentation. Its length in bits is designated as &quot;key length&quot;.
            /// </summary>
            public Bignum2 RsaN { get { return _rsaN; } }
            public SshPublicKey M_Root { get { return m_root; } }
            public SshPublicKey M_Parent { get { return m_parent; } }
        }
        private Cstring _keyName;
        private KaitaiStruct _body;
        private SshPublicKey m_root;
        private KaitaiStruct m_parent;
        public Cstring KeyName { get { return _keyName; } }
        public KaitaiStruct Body { get { return _body; } }
        public SshPublicKey M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
