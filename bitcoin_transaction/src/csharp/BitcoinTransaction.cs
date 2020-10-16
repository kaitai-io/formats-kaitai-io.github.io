// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://bitcoin.org/en/developer-guide#transactions
    /// https://en.bitcoin.it/wiki/Transaction
    /// ">Source</a>
    /// </remarks>
    public partial class BitcoinTransaction : KaitaiStruct
    {
        public static BitcoinTransaction FromFile(string fileName)
        {
            return new BitcoinTransaction(new KaitaiStream(fileName));
        }

        public BitcoinTransaction(KaitaiStream p__io, KaitaiStruct p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _version = m_io.ReadU4le();
            _numVins = m_io.ReadU1();
            _vins = new List<Vin>((int) (NumVins));
            for (var i = 0; i < NumVins; i++)
            {
                _vins.Add(new Vin(m_io, this, m_root));
            }
            _numVouts = m_io.ReadU1();
            _vouts = new List<Vout>((int) (NumVouts));
            for (var i = 0; i < NumVouts; i++)
            {
                _vouts.Add(new Vout(m_io, this, m_root));
            }
            _locktime = m_io.ReadU4le();
        }
        public partial class Vin : KaitaiStruct
        {
            public static Vin FromFile(string fileName)
            {
                return new Vin(new KaitaiStream(fileName));
            }

            public Vin(KaitaiStream p__io, BitcoinTransaction p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _txid = m_io.ReadBytes(32);
                _outputId = m_io.ReadU4le();
                _lenScript = m_io.ReadU1();
                __raw_scriptSig = m_io.ReadBytes(LenScript);
                var io___raw_scriptSig = new KaitaiStream(__raw_scriptSig);
                _scriptSig = new ScriptSignature(io___raw_scriptSig, this, m_root);
                _endOfVin = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(EndOfVin, new byte[] { 255, 255, 255, 255 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 255, 255, 255, 255 }, EndOfVin, M_Io, "/types/vin/seq/4");
                }
            }
            public partial class ScriptSignature : KaitaiStruct
            {
                public static ScriptSignature FromFile(string fileName)
                {
                    return new ScriptSignature(new KaitaiStream(fileName));
                }


                public enum SighashType
                {
                    SighashAll = 1,
                    SighashNone = 2,
                    SighashSingle = 3,
                    SighashAnyonecanpay = 80,
                }
                public ScriptSignature(KaitaiStream p__io, BitcoinTransaction.Vin p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenSigStack = m_io.ReadU1();
                    _derSig = new DerSignature(m_io, this, m_root);
                    _sigType = ((SighashType) m_io.ReadU1());
                    _lenPubkeyStack = m_io.ReadU1();
                    _pubkey = new PublicKey(m_io, this, m_root);
                }
                public partial class DerSignature : KaitaiStruct
                {
                    public static DerSignature FromFile(string fileName)
                    {
                        return new DerSignature(new KaitaiStream(fileName));
                    }

                    public DerSignature(KaitaiStream p__io, BitcoinTransaction.Vin.ScriptSignature p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _sequence = m_io.ReadBytes(1);
                        if (!((KaitaiStream.ByteArrayCompare(Sequence, new byte[] { 48 }) == 0)))
                        {
                            throw new ValidationNotEqualError(new byte[] { 48 }, Sequence, M_Io, "/types/vin/types/script_signature/types/der_signature/seq/0");
                        }
                        _lenSig = m_io.ReadU1();
                        _sep1 = m_io.ReadBytes(1);
                        if (!((KaitaiStream.ByteArrayCompare(Sep1, new byte[] { 2 }) == 0)))
                        {
                            throw new ValidationNotEqualError(new byte[] { 2 }, Sep1, M_Io, "/types/vin/types/script_signature/types/der_signature/seq/2");
                        }
                        _lenSigR = m_io.ReadU1();
                        _sigR = m_io.ReadBytes(LenSigR);
                        _sep2 = m_io.ReadBytes(1);
                        if (!((KaitaiStream.ByteArrayCompare(Sep2, new byte[] { 2 }) == 0)))
                        {
                            throw new ValidationNotEqualError(new byte[] { 2 }, Sep2, M_Io, "/types/vin/types/script_signature/types/der_signature/seq/5");
                        }
                        _lenSigS = m_io.ReadU1();
                        _sigS = m_io.ReadBytes(LenSigS);
                    }
                    private byte[] _sequence;
                    private byte _lenSig;
                    private byte[] _sep1;
                    private byte _lenSigR;
                    private byte[] _sigR;
                    private byte[] _sep2;
                    private byte _lenSigS;
                    private byte[] _sigS;
                    private BitcoinTransaction m_root;
                    private BitcoinTransaction.Vin.ScriptSignature m_parent;
                    public byte[] Sequence { get { return _sequence; } }
                    public byte LenSig { get { return _lenSig; } }
                    public byte[] Sep1 { get { return _sep1; } }

                    /// <summary>
                    /// 'r' value's length.
                    /// </summary>
                    public byte LenSigR { get { return _lenSigR; } }

                    /// <summary>
                    /// 'r' value of the ECDSA signature.
                    /// </summary>
                    /// <remarks>
                    /// Reference: <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                    /// </remarks>
                    public byte[] SigR { get { return _sigR; } }
                    public byte[] Sep2 { get { return _sep2; } }

                    /// <summary>
                    /// 's' value's length.
                    /// </summary>
                    public byte LenSigS { get { return _lenSigS; } }

                    /// <summary>
                    /// 's' value of the ECDSA signature.
                    /// </summary>
                    /// <remarks>
                    /// Reference: <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
                    /// </remarks>
                    public byte[] SigS { get { return _sigS; } }
                    public BitcoinTransaction M_Root { get { return m_root; } }
                    public BitcoinTransaction.Vin.ScriptSignature M_Parent { get { return m_parent; } }
                }
                public partial class PublicKey : KaitaiStruct
                {
                    public static PublicKey FromFile(string fileName)
                    {
                        return new PublicKey(new KaitaiStream(fileName));
                    }

                    public PublicKey(KaitaiStream p__io, BitcoinTransaction.Vin.ScriptSignature p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _type = m_io.ReadU1();
                        _x = m_io.ReadBytes(32);
                        _y = m_io.ReadBytes(32);
                    }
                    private byte _type;
                    private byte[] _x;
                    private byte[] _y;
                    private BitcoinTransaction m_root;
                    private BitcoinTransaction.Vin.ScriptSignature m_parent;
                    public byte Type { get { return _type; } }

                    /// <summary>
                    /// 'x' coordinate of the public key on the elliptic curve.
                    /// </summary>
                    public byte[] X { get { return _x; } }

                    /// <summary>
                    /// 'y' coordinate of the public key on the elliptic curve.
                    /// </summary>
                    public byte[] Y { get { return _y; } }
                    public BitcoinTransaction M_Root { get { return m_root; } }
                    public BitcoinTransaction.Vin.ScriptSignature M_Parent { get { return m_parent; } }
                }
                private byte _lenSigStack;
                private DerSignature _derSig;
                private SighashType _sigType;
                private byte _lenPubkeyStack;
                private PublicKey _pubkey;
                private BitcoinTransaction m_root;
                private BitcoinTransaction.Vin m_parent;
                public byte LenSigStack { get { return _lenSigStack; } }

                /// <summary>
                /// DER-encoded ECDSA signature.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://en.wikipedia.org/wiki/X.690#DER_encoding
                /// https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
                /// ">Source</a>
                /// </remarks>
                public DerSignature DerSig { get { return _derSig; } }

                /// <summary>
                /// Type of signature.
                /// </summary>
                public SighashType SigType { get { return _sigType; } }
                public byte LenPubkeyStack { get { return _lenPubkeyStack; } }

                /// <summary>
                /// Public key (bitcoin address of the recipient).
                /// </summary>
                public PublicKey Pubkey { get { return _pubkey; } }
                public BitcoinTransaction M_Root { get { return m_root; } }
                public BitcoinTransaction.Vin M_Parent { get { return m_parent; } }
            }
            private byte[] _txid;
            private uint _outputId;
            private byte _lenScript;
            private ScriptSignature _scriptSig;
            private byte[] _endOfVin;
            private BitcoinTransaction m_root;
            private BitcoinTransaction m_parent;
            private byte[] __raw_scriptSig;

            /// <summary>
            /// Previous transaction hash.
            /// </summary>
            public byte[] Txid { get { return _txid; } }

            /// <summary>
            /// ID indexing an ouput of the transaction refered by txid.
            /// This output will be used as an input in the present transaction.
            /// </summary>
            public uint OutputId { get { return _outputId; } }

            /// <summary>
            /// ScriptSig's length.
            /// </summary>
            public byte LenScript { get { return _lenScript; } }

            /// <summary>
            /// ScriptSig.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://en.bitcoin.it/wiki/Transaction#Input
            /// https://en.bitcoin.it/wiki/Script
            /// ">Source</a>
            /// </remarks>
            public ScriptSignature ScriptSig { get { return _scriptSig; } }

            /// <summary>
            /// Magic number indicating the end of the current input.
            /// </summary>
            public byte[] EndOfVin { get { return _endOfVin; } }
            public BitcoinTransaction M_Root { get { return m_root; } }
            public BitcoinTransaction M_Parent { get { return m_parent; } }
            public byte[] M_RawScriptSig { get { return __raw_scriptSig; } }
        }
        public partial class Vout : KaitaiStruct
        {
            public static Vout FromFile(string fileName)
            {
                return new Vout(new KaitaiStream(fileName));
            }

            public Vout(KaitaiStream p__io, BitcoinTransaction p__parent = null, BitcoinTransaction p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _amount = m_io.ReadU8le();
                _lenScript = m_io.ReadU1();
                _scriptPubKey = m_io.ReadBytes(LenScript);
            }
            private ulong _amount;
            private byte _lenScript;
            private byte[] _scriptPubKey;
            private BitcoinTransaction m_root;
            private BitcoinTransaction m_parent;

            /// <summary>
            /// Number of Satoshis to be transfered.
            /// </summary>
            public ulong Amount { get { return _amount; } }

            /// <summary>
            /// ScriptPubKey's length.
            /// </summary>
            public byte LenScript { get { return _lenScript; } }

            /// <summary>
            /// ScriptPubKey.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://en.bitcoin.it/wiki/Transaction#Output
            /// https://en.bitcoin.it/wiki/Script
            /// ">Source</a>
            /// </remarks>
            public byte[] ScriptPubKey { get { return _scriptPubKey; } }
            public BitcoinTransaction M_Root { get { return m_root; } }
            public BitcoinTransaction M_Parent { get { return m_parent; } }
        }
        private uint _version;
        private byte _numVins;
        private List<Vin> _vins;
        private byte _numVouts;
        private List<Vout> _vouts;
        private uint _locktime;
        private BitcoinTransaction m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Version number.
        /// </summary>
        public uint Version { get { return _version; } }

        /// <summary>
        /// Number of input transactions.
        /// </summary>
        public byte NumVins { get { return _numVins; } }

        /// <summary>
        /// Input transactions.
        /// An input refers to an output from a previous transaction.
        /// </summary>
        public List<Vin> Vins { get { return _vins; } }

        /// <summary>
        /// Number of output transactions.
        /// </summary>
        public byte NumVouts { get { return _numVouts; } }

        /// <summary>
        /// Output transactions.
        /// </summary>
        public List<Vout> Vouts { get { return _vouts; } }
        public uint Locktime { get { return _locktime; } }
        public BitcoinTransaction M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
