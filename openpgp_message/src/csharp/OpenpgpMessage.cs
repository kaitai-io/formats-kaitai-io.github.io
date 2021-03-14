// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The OpenPGP Message Format is a format to store encryption and signature keys for emails.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://tools.ietf.org/html/rfc4880">Source</a>
    /// </remarks>
    public partial class OpenpgpMessage : KaitaiStruct
    {
        public static OpenpgpMessage FromFile(string fileName)
        {
            return new OpenpgpMessage(new KaitaiStream(fileName));
        }


        public enum PublicKeyAlgorithms
        {
            RsaEncryptOrSignHac = 1,
            RsaEncryptOnlyHac = 2,
            RsaSignOnlyHac = 3,
            ElgamalEncryptOnlyElgamalHac = 16,
            DsaDigitalSignatureAlgorithmFipsHac = 17,
            ReservedForEllipticCurve = 18,
            ReservedForEcdsa = 19,
            ReservedFormerlyElgamalEncryptOrSign = 20,
            ReservedForDiffieHellmanXAsDefinedForIetfSMime = 21,
            PrivateExperimentalAlgorithm00 = 100,
            PrivateExperimentalAlgorithm01 = 101,
            PrivateExperimentalAlgorithm02 = 102,
            PrivateExperimentalAlgorithm03 = 103,
            PrivateExperimentalAlgorithm04 = 104,
            PrivateExperimentalAlgorithm05 = 105,
            PrivateExperimentalAlgorithm06 = 106,
            PrivateExperimentalAlgorithm07 = 107,
            PrivateExperimentalAlgorithm08 = 108,
            PrivateExperimentalAlgorithm09 = 109,
            PrivateExperimentalAlgorithm10 = 110,
        }

        public enum ServerFlags
        {
            NoModify = 128,
        }

        public enum KeyFlags
        {
            ThisKeyMayBeUsedToCertifyOtherKeys = 1,
            ThisKeyMayBeUsedToSignData = 2,
            ThisKeyMayBeUsedToEncryptCommunications = 4,
            ThisKeyMayBeUsedToEncryptStorage = 8,
            ThePrivateComponentOfThisKeyMayHaveBeenSplitByASecretSharingMechanism = 16,
            ThisKeyMayBeUsedForAuthentication = 32,
            ThePrivateComponentOfThisKeyMayBeInThePossessionOfMoreThanOnePerson = 128,
        }

        public enum CompressionAlgorithms
        {
            Uncompressed = 0,
            Zib = 1,
            Zlib = 2,
            Bzip = 3,
            PrivateExperimentalAlgorithm00 = 100,
            PrivateExperimentalAlgorithm01 = 101,
            PrivateExperimentalAlgorithm02 = 102,
            PrivateExperimentalAlgorithm03 = 103,
            PrivateExperimentalAlgorithm04 = 104,
            PrivateExperimentalAlgorithm05 = 105,
            PrivateExperimentalAlgorithm06 = 106,
            PrivateExperimentalAlgorithm07 = 107,
            PrivateExperimentalAlgorithm08 = 108,
            PrivateExperimentalAlgorithm09 = 109,
            PrivateExperimentalAlgorithm10 = 110,
        }

        public enum PacketTags
        {
            ReservedAPacketTagMustNotHaveThisValue = 0,
            PublicKeyEncryptedSessionKeyPacket = 1,
            SignaturePacket = 2,
            SymmetricKeyEncryptedSessionKeyPacket = 3,
            OnePassSignaturePacket = 4,
            SecretKeyPacket = 5,
            PublicKeyPacket = 6,
            SecretSubkeyPacket = 7,
            CompressedDataPacket = 8,
            SymmetricallyEncryptedDataPacket = 9,
            MarkerPacket = 10,
            LiteralDataPacket = 11,
            TrustPacket = 12,
            UserIdPacket = 13,
            PublicSubkeyPacket = 14,
            UserAttributePacket = 17,
            SymEncryptedAndIntegrityProtectedDataPacket = 18,
            ModificationDetectionCodePacket = 19,
            PrivateOrExperimentalValues0 = 60,
            PrivateOrExperimentalValues1 = 61,
            PrivateOrExperimentalValues2 = 62,
            PrivateOrExperimentalValues3 = 63,
        }

        public enum RevocationCodes
        {
            NoReasonSpecifiedKeyRevocationsOrCertRevocations = 0,
            KeyIsSupersededKeyRevocations = 1,
            KeyMaterialHasBeenCompromisedKeyRevocations = 2,
            KeyIsRetiredAndNoLongerUsedKeyRevocations = 3,
            UserIdInformationIsNoLongerValidCertRevocations = 32,
            PrivateUse1 = 100,
            PrivateUse2 = 101,
            PrivateUse3 = 102,
            PrivateUse4 = 103,
            PrivateUse11 = 110,
        }

        public enum HashAlgorithms
        {
            Md5 = 1,
            Sha1 = 2,
            Ripemd160 = 3,
            Reserved4 = 4,
            Reserved5 = 5,
            Reserved6 = 6,
            Reserved7 = 7,
            Sha256 = 8,
            Sha384 = 9,
            Sha512 = 10,
            Sha224 = 11,
            PrivateExperimentalAlgorithm00 = 100,
            PrivateExperimentalAlgorithm01 = 101,
            PrivateExperimentalAlgorithm02 = 102,
            PrivateExperimentalAlgorithm03 = 103,
            PrivateExperimentalAlgorithm04 = 104,
            PrivateExperimentalAlgorithm05 = 105,
            PrivateExperimentalAlgorithm06 = 106,
            PrivateExperimentalAlgorithm07 = 107,
            PrivateExperimentalAlgorithm08 = 108,
            PrivateExperimentalAlgorithm09 = 109,
            PrivateExperimentalAlgorithm10 = 110,
        }

        public enum SymmetricKeyAlgorithm
        {
            Plain = 0,
            Idea = 1,
            TripleDes = 2,
            Cast5 = 3,
            Blowfisch = 4,
            Reserved5 = 5,
            Reserved6 = 6,
            Aes128 = 7,
            Aes192 = 8,
            Aes256 = 9,
            Twofish256 = 10,
            PrivateExperimentalAlgorithm00 = 100,
            PrivateExperimentalAlgorithm01 = 101,
            PrivateExperimentalAlgorithm02 = 102,
            PrivateExperimentalAlgorithm03 = 103,
            PrivateExperimentalAlgorithm04 = 104,
            PrivateExperimentalAlgorithm05 = 105,
            PrivateExperimentalAlgorithm06 = 106,
            PrivateExperimentalAlgorithm07 = 107,
            PrivateExperimentalAlgorithm08 = 108,
            PrivateExperimentalAlgorithm09 = 109,
            PrivateExperimentalAlgorithm10 = 110,
        }

        public enum SubpacketTypes
        {
            Reserved0 = 0,
            Reserved1 = 1,
            SignatureCreationTime = 2,
            SignatureExpirationTime = 3,
            ExportableCertification = 4,
            TrustSignature = 5,
            RegularExpression = 6,
            Revocable = 7,
            Reserved8 = 8,
            KeyExpirationTime = 9,
            PlaceholderForBackwardCompatibility = 10,
            PreferredSymmetricAlgorithms = 11,
            RevocationKey = 12,
            Reserved13 = 13,
            Reserved14 = 14,
            Reserved15 = 15,
            Issuer = 16,
            Reserved17 = 17,
            Reserved18 = 18,
            Reserved19 = 19,
            NotationData = 20,
            PreferredHashAlgorithms = 21,
            PreferredCompressionAlgorithms = 22,
            KeyServerPreferences = 23,
            PreferredKeyServer = 24,
            PrimaryUserId = 25,
            PolicyUri = 26,
            KeyFlags = 27,
            SignersUserId = 28,
            ReasonForRevocation = 29,
            Features = 30,
            SignatureTarget = 31,
            EmbeddedSignature = 32,
        }
        public OpenpgpMessage(KaitaiStream p__io, KaitaiStruct p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _packets = new List<Packet>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _packets.Add(new Packet(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class PreferredHashAlgorithms : KaitaiStruct
        {
            public static PreferredHashAlgorithms FromFile(string fileName)
            {
                return new PreferredHashAlgorithms(new KaitaiStream(fileName));
            }

            public PreferredHashAlgorithms(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _algorithm = new List<HashAlgorithms>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _algorithm.Add(((OpenpgpMessage.HashAlgorithms) m_io.ReadU1()));
                        i++;
                    }
                }
            }
            private List<HashAlgorithms> _algorithm;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public List<HashAlgorithms> Algorithm { get { return _algorithm; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class PreferredCompressionAlgorithms : KaitaiStruct
        {
            public static PreferredCompressionAlgorithms FromFile(string fileName)
            {
                return new PreferredCompressionAlgorithms(new KaitaiStream(fileName));
            }

            public PreferredCompressionAlgorithms(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _algorithm = new List<CompressionAlgorithms>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _algorithm.Add(((OpenpgpMessage.CompressionAlgorithms) m_io.ReadU1()));
                        i++;
                    }
                }
            }
            private List<CompressionAlgorithms> _algorithm;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public List<CompressionAlgorithms> Algorithm { get { return _algorithm; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SignersUserId : KaitaiStruct
        {
            public static SignersUserId FromFile(string fileName)
            {
                return new SignersUserId(new KaitaiStream(fileName));
            }

            public SignersUserId(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _userId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _userId;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public string UserId { get { return _userId; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SecretKeyPacket : KaitaiStruct
        {
            public static SecretKeyPacket FromFile(string fileName)
            {
                return new SecretKeyPacket(new KaitaiStream(fileName));
            }

            public SecretKeyPacket(KaitaiStream p__io, OpenpgpMessage.OldPacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _publicKey = new PublicKeyPacket(m_io, this, m_root);
                _stringToKey = m_io.ReadU1();
                if (StringToKey >= 254) {
                    _symmetricEncryptionAlgorithm = ((OpenpgpMessage.SymmetricKeyAlgorithm) m_io.ReadU1());
                }
                _secretKey = m_io.ReadBytesFull();
            }
            private PublicKeyPacket _publicKey;
            private byte _stringToKey;
            private SymmetricKeyAlgorithm _symmetricEncryptionAlgorithm;
            private byte[] _secretKey;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.OldPacket m_parent;
            public PublicKeyPacket PublicKey { get { return _publicKey; } }
            public byte StringToKey { get { return _stringToKey; } }
            public SymmetricKeyAlgorithm SymmetricEncryptionAlgorithm { get { return _symmetricEncryptionAlgorithm; } }
            public byte[] SecretKey { get { return _secretKey; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.OldPacket M_Parent { get { return m_parent; } }
        }
        public partial class KeyServerPreferences : KaitaiStruct
        {
            public static KeyServerPreferences FromFile(string fileName)
            {
                return new KeyServerPreferences(new KaitaiStream(fileName));
            }

            public KeyServerPreferences(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flag = new List<ServerFlags>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _flag.Add(((OpenpgpMessage.ServerFlags) m_io.ReadU1()));
                        i++;
                    }
                }
            }
            private List<ServerFlags> _flag;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public List<ServerFlags> Flag { get { return _flag; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class RegularExpression : KaitaiStruct
        {
            public static RegularExpression FromFile(string fileName)
            {
                return new RegularExpression(new KaitaiStream(fileName));
            }

            public RegularExpression(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _regex = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _regex;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public string Regex { get { return _regex; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class Subpackets : KaitaiStruct
        {
            public static Subpackets FromFile(string fileName)
            {
                return new Subpackets(new KaitaiStream(fileName));
            }

            public Subpackets(KaitaiStream p__io, OpenpgpMessage.SignaturePacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _subpacketss = new List<Subpacket>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _subpacketss.Add(new Subpacket(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Subpacket> _subpacketss;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.SignaturePacket m_parent;
            public List<Subpacket> Subpacketss { get { return _subpacketss; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.SignaturePacket M_Parent { get { return m_parent; } }
        }
        public partial class RevocationKey : KaitaiStruct
        {
            public static RevocationKey FromFile(string fileName)
            {
                return new RevocationKey(new KaitaiStream(fileName));
            }

            public RevocationKey(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _class = m_io.ReadU1();
                _publicKeyAlgorithm = ((OpenpgpMessage.PublicKeyAlgorithms) m_io.ReadU1());
                _fingerprint = m_io.ReadBytes(20);
            }
            private byte _class;
            private PublicKeyAlgorithms _publicKeyAlgorithm;
            private byte[] _fingerprint;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte Class { get { return _class; } }
            public PublicKeyAlgorithms PublicKeyAlgorithm { get { return _publicKeyAlgorithm; } }
            public byte[] Fingerprint { get { return _fingerprint; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class UserIdPacket : KaitaiStruct
        {
            public static UserIdPacket FromFile(string fileName)
            {
                return new UserIdPacket(new KaitaiStream(fileName));
            }

            public UserIdPacket(KaitaiStream p__io, OpenpgpMessage.OldPacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _userId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _userId;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.OldPacket m_parent;
            public string UserId { get { return _userId; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.OldPacket M_Parent { get { return m_parent; } }
        }
        public partial class PolicyUri : KaitaiStruct
        {
            public static PolicyUri FromFile(string fileName)
            {
                return new PolicyUri(new KaitaiStream(fileName));
            }

            public PolicyUri(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _uri = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _uri;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public string Uri { get { return _uri; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SignatureTarget : KaitaiStruct
        {
            public static SignatureTarget FromFile(string fileName)
            {
                return new SignatureTarget(new KaitaiStream(fileName));
            }

            public SignatureTarget(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _publicKeyAlgorithm = ((OpenpgpMessage.PublicKeyAlgorithms) m_io.ReadU1());
                _hashAlgorithm = ((OpenpgpMessage.HashAlgorithms) m_io.ReadU1());
                _hash = m_io.ReadBytesFull();
            }
            private PublicKeyAlgorithms _publicKeyAlgorithm;
            private HashAlgorithms _hashAlgorithm;
            private byte[] _hash;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public PublicKeyAlgorithms PublicKeyAlgorithm { get { return _publicKeyAlgorithm; } }
            public HashAlgorithms HashAlgorithm { get { return _hashAlgorithm; } }
            public byte[] Hash { get { return _hash; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class KeyFlags : KaitaiStruct
        {
            public static KeyFlags FromFile(string fileName)
            {
                return new KeyFlags(new KaitaiStream(fileName));
            }

            public KeyFlags(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flag = new List<KeyFlags>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _flag.Add((() m_io.ReadU1()));
                        i++;
                    }
                }
            }
            private List<KeyFlags> _flag;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public List<KeyFlags> Flag { get { return _flag; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class Features : KaitaiStruct
        {
            public static Features FromFile(string fileName)
            {
                return new Features(new KaitaiStream(fileName));
            }

            public Features(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadBytesFull();
            }
            private byte[] _flags;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte[] Flags { get { return _flags; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class PrimaryUserId : KaitaiStruct
        {
            public static PrimaryUserId FromFile(string fileName)
            {
                return new PrimaryUserId(new KaitaiStream(fileName));
            }

            public PrimaryUserId(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _userId = m_io.ReadU1();
            }
            private byte _userId;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte UserId { get { return _userId; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class Subpacket : KaitaiStruct
        {
            public static Subpacket FromFile(string fileName)
            {
                return new Subpacket(new KaitaiStream(fileName));
            }

            public Subpacket(KaitaiStream p__io, OpenpgpMessage.Subpackets p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = new LenSubpacket(m_io, this, m_root);
                _subpacketType = ((OpenpgpMessage.SubpacketTypes) m_io.ReadU1());
                switch (SubpacketType) {
                case OpenpgpMessage.SubpacketTypes.PreferredKeyServer: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new PreferredKeyServer(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.Issuer: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new Issuer(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.Revocable: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new Revocable(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.SignatureTarget: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new SignatureTarget(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.RegularExpression: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new RegularExpression(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.ExportableCertification: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new ExportableCertification(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.ReasonForRevocation: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new ReasonForRevocation(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.KeyServerPreferences: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new KeyServerPreferences(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.SignatureCreationTime: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new SignatureCreationTime(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.PreferredHashAlgorithms: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new PreferredHashAlgorithms(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.TrustSignature: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new TrustSignature(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.KeyExpirationTime: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new KeyExpirationTime(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.KeyFlags: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new KeyFlags(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.SignatureExpirationTime: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new SignatureExpirationTime(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.Features: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new Features(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.SignersUserId: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new SignersUserId(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.NotationData: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new NotationData(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.RevocationKey: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new RevocationKey(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.PreferredCompressionAlgorithms: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new PreferredCompressionAlgorithms(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.PolicyUri: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new PolicyUri(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.PrimaryUserId: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new PrimaryUserId(io___raw_content, this, m_root);
                    break;
                }
                case OpenpgpMessage.SubpacketTypes.EmbeddedSignature: {
                    __raw_content = m_io.ReadBytes((Len.Len - 1));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new EmbeddedSignature(io___raw_content, this, m_root);
                    break;
                }
                default: {
                    _content = m_io.ReadBytes((Len.Len - 1));
                    break;
                }
                }
            }
            private LenSubpacket _len;
            private SubpacketTypes _subpacketType;
            private object _content;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpackets m_parent;
            private byte[] __raw_content;
            public LenSubpacket Len { get { return _len; } }
            public SubpacketTypes SubpacketType { get { return _subpacketType; } }
            public object Content { get { return _content; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpackets M_Parent { get { return m_parent; } }
            public byte[] M_RawContent { get { return __raw_content; } }
        }
        public partial class OldPacket : KaitaiStruct
        {
            public static OldPacket FromFile(string fileName)
            {
                return new OldPacket(new KaitaiStream(fileName));
            }

            public OldPacket(KaitaiStream p__io, OpenpgpMessage.Packet p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                switch (M_Parent.LenType) {
                case 0: {
                    _len = m_io.ReadU1();
                    break;
                }
                case 1: {
                    _len = m_io.ReadU2be();
                    break;
                }
                case 2: {
                    _len = m_io.ReadU4be();
                    break;
                }
                }
                switch (M_Parent.PacketTypeOld) {
                case OpenpgpMessage.PacketTags.PublicKeyPacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PublicKeyPacket(io___raw_body, this, m_root);
                    break;
                }
                case OpenpgpMessage.PacketTags.PublicSubkeyPacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PublicKeyPacket(io___raw_body, this, m_root);
                    break;
                }
                case OpenpgpMessage.PacketTags.UserIdPacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new UserIdPacket(io___raw_body, this, m_root);
                    break;
                }
                case OpenpgpMessage.PacketTags.SignaturePacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SignaturePacket(io___raw_body, this, m_root);
                    break;
                }
                case OpenpgpMessage.PacketTags.SecretSubkeyPacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PublicKeyPacket(io___raw_body, this, m_root);
                    break;
                }
                case OpenpgpMessage.PacketTags.SecretKeyPacket: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SecretKeyPacket(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Len);
                    break;
                }
                }
            }
            private uint _len;
            private object _body;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Packet m_parent;
            private byte[] __raw_body;
            public uint Len { get { return _len; } }
            public object Body { get { return _body; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Packet M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class Issuer : KaitaiStruct
        {
            public static Issuer FromFile(string fileName)
            {
                return new Issuer(new KaitaiStream(fileName));
            }

            public Issuer(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _keyid = m_io.ReadU8be();
            }
            private ulong _keyid;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public ulong Keyid { get { return _keyid; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class ExportableCertification : KaitaiStruct
        {
            public static ExportableCertification FromFile(string fileName)
            {
                return new ExportableCertification(new KaitaiStream(fileName));
            }

            public ExportableCertification(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _exportable = m_io.ReadU1();
            }
            private byte _exportable;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte Exportable { get { return _exportable; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SignatureExpirationTime : KaitaiStruct
        {
            public static SignatureExpirationTime FromFile(string fileName)
            {
                return new SignatureExpirationTime(new KaitaiStream(fileName));
            }

            public SignatureExpirationTime(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _time = m_io.ReadU4be();
            }
            private uint _time;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public uint Time { get { return _time; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SignatureCreationTime : KaitaiStruct
        {
            public static SignatureCreationTime FromFile(string fileName)
            {
                return new SignatureCreationTime(new KaitaiStream(fileName));
            }

            public SignatureCreationTime(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _time = m_io.ReadU4be();
            }
            private uint _time;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public uint Time { get { return _time; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class SignaturePacket : KaitaiStruct
        {
            public static SignaturePacket FromFile(string fileName)
            {
                return new SignaturePacket(new KaitaiStream(fileName));
            }

            public SignaturePacket(KaitaiStream p__io, KaitaiStruct p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU1();
                _signatureType = m_io.ReadU1();
                _publicKeyAlgorithm = ((OpenpgpMessage.PublicKeyAlgorithms) m_io.ReadU1());
                _hashAlgorithm = ((OpenpgpMessage.HashAlgorithms) m_io.ReadU1());
                _lenHashedSubpacket = m_io.ReadU2be();
                __raw_hashedSubpackets = m_io.ReadBytes(LenHashedSubpacket);
                var io___raw_hashedSubpackets = new KaitaiStream(__raw_hashedSubpackets);
                _hashedSubpackets = new Subpackets(io___raw_hashedSubpackets, this, m_root);
                _lenUnhashedSubpacket = m_io.ReadU2be();
                __raw_unhashedSubpackets = m_io.ReadBytes(LenUnhashedSubpacket);
                var io___raw_unhashedSubpackets = new KaitaiStream(__raw_unhashedSubpackets);
                _unhashedSubpackets = new Subpackets(io___raw_unhashedSubpackets, this, m_root);
                _leftSignedHash = m_io.ReadU2be();
                _rsaN = m_io.ReadU2be();
                _signature = m_io.ReadBytesFull();
            }
            private byte _version;
            private byte _signatureType;
            private PublicKeyAlgorithms _publicKeyAlgorithm;
            private HashAlgorithms _hashAlgorithm;
            private ushort _lenHashedSubpacket;
            private Subpackets _hashedSubpackets;
            private ushort _lenUnhashedSubpacket;
            private Subpackets _unhashedSubpackets;
            private ushort _leftSignedHash;
            private ushort _rsaN;
            private byte[] _signature;
            private OpenpgpMessage m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_hashedSubpackets;
            private byte[] __raw_unhashedSubpackets;
            public byte Version { get { return _version; } }
            public byte SignatureType { get { return _signatureType; } }
            public PublicKeyAlgorithms PublicKeyAlgorithm { get { return _publicKeyAlgorithm; } }
            public HashAlgorithms HashAlgorithm { get { return _hashAlgorithm; } }
            public ushort LenHashedSubpacket { get { return _lenHashedSubpacket; } }
            public Subpackets HashedSubpackets { get { return _hashedSubpackets; } }
            public ushort LenUnhashedSubpacket { get { return _lenUnhashedSubpacket; } }
            public Subpackets UnhashedSubpackets { get { return _unhashedSubpackets; } }
            public ushort LeftSignedHash { get { return _leftSignedHash; } }
            public ushort RsaN { get { return _rsaN; } }
            public byte[] Signature { get { return _signature; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawHashedSubpackets { get { return __raw_hashedSubpackets; } }
            public byte[] M_RawUnhashedSubpackets { get { return __raw_unhashedSubpackets; } }
        }
        public partial class Revocable : KaitaiStruct
        {
            public static Revocable FromFile(string fileName)
            {
                return new Revocable(new KaitaiStream(fileName));
            }

            public Revocable(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _revocable = m_io.ReadU1();
            }
            private byte _revocable;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte Revocable { get { return _revocable; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class EmbeddedSignature : KaitaiStruct
        {
            public static EmbeddedSignature FromFile(string fileName)
            {
                return new EmbeddedSignature(new KaitaiStream(fileName));
            }

            public EmbeddedSignature(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signaturePacket = new SignaturePacket(m_io, this, m_root);
            }
            private SignaturePacket _signaturePacket;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public SignaturePacket SignaturePacket { get { return _signaturePacket; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class PreferredKeyServer : KaitaiStruct
        {
            public static PreferredKeyServer FromFile(string fileName)
            {
                return new PreferredKeyServer(new KaitaiStream(fileName));
            }

            public PreferredKeyServer(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _uri = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _uri;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public string Uri { get { return _uri; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class ReasonForRevocation : KaitaiStruct
        {
            public static ReasonForRevocation FromFile(string fileName)
            {
                return new ReasonForRevocation(new KaitaiStream(fileName));
            }

            public ReasonForRevocation(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _revocationCode = ((OpenpgpMessage.RevocationCodes) m_io.ReadU1());
                _reason = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private RevocationCodes _revocationCode;
            private string _reason;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public RevocationCodes RevocationCode { get { return _revocationCode; } }
            public string Reason { get { return _reason; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class LenSubpacket : KaitaiStruct
        {
            public static LenSubpacket FromFile(string fileName)
            {
                return new LenSubpacket(new KaitaiStream(fileName));
            }

            public LenSubpacket(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_len = false;
                _read();
            }
            private void _read()
            {
                _firstOctet = m_io.ReadU1();
                if ( ((FirstOctet >= 192) && (FirstOctet < 255)) ) {
                    _secondOctet = m_io.ReadU1();
                }
                if (FirstOctet == 255) {
                    _scalar = m_io.ReadU4be();
                }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    _len = (int) ((FirstOctet < 192 ? FirstOctet : ( ((FirstOctet >= 192) && (FirstOctet < 255))  ? ((((FirstOctet - 192) << 8) + SecondOctet) + 192) : Scalar)));
                    f_len = true;
                    return _len;
                }
            }
            private byte _firstOctet;
            private byte? _secondOctet;
            private uint? _scalar;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte FirstOctet { get { return _firstOctet; } }
            public byte? SecondOctet { get { return _secondOctet; } }
            public uint? Scalar { get { return _scalar; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class NotationData : KaitaiStruct
        {
            public static NotationData FromFile(string fileName)
            {
                return new NotationData(new KaitaiStream(fileName));
            }

            public NotationData(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadBytes(4);
                _lenName = m_io.ReadU2be();
                _lenValue = m_io.ReadU2be();
                _name = m_io.ReadBytes(LenName);
                _value = m_io.ReadBytes(LenValue);
            }
            private byte[] _flags;
            private ushort _lenName;
            private ushort _lenValue;
            private byte[] _name;
            private byte[] _value;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte[] Flags { get { return _flags; } }
            public ushort LenName { get { return _lenName; } }
            public ushort LenValue { get { return _lenValue; } }
            public byte[] Name { get { return _name; } }
            public byte[] Value { get { return _value; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class PublicKeyPacket : KaitaiStruct
        {
            public static PublicKeyPacket FromFile(string fileName)
            {
                return new PublicKeyPacket(new KaitaiStream(fileName));
            }

            public PublicKeyPacket(KaitaiStream p__io, KaitaiStruct p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU1();
                _timestamp = m_io.ReadU4be();
                _publicKeyAlgorithm = ((OpenpgpMessage.PublicKeyAlgorithms) m_io.ReadU1());
                _lenAlg = m_io.ReadU2be();
                _rsaN = m_io.ReadBytes((LenAlg / 8));
                _padding = m_io.ReadU2be();
                _rsaE = m_io.ReadBytes(3);
            }
            private byte _version;
            private uint _timestamp;
            private PublicKeyAlgorithms _publicKeyAlgorithm;
            private ushort _lenAlg;
            private byte[] _rsaN;
            private ushort _padding;
            private byte[] _rsaE;
            private OpenpgpMessage m_root;
            private KaitaiStruct m_parent;
            public byte Version { get { return _version; } }
            public uint Timestamp { get { return _timestamp; } }
            public PublicKeyAlgorithms PublicKeyAlgorithm { get { return _publicKeyAlgorithm; } }
            public ushort LenAlg { get { return _lenAlg; } }
            public byte[] RsaN { get { return _rsaN; } }
            public ushort Padding { get { return _padding; } }
            public byte[] RsaE { get { return _rsaE; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class KeyExpirationTime : KaitaiStruct
        {
            public static KeyExpirationTime FromFile(string fileName)
            {
                return new KeyExpirationTime(new KaitaiStream(fileName));
            }

            public KeyExpirationTime(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _time = m_io.ReadU4be();
            }
            private uint _time;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public uint Time { get { return _time; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        public partial class Packet : KaitaiStruct
        {
            public static Packet FromFile(string fileName)
            {
                return new Packet(new KaitaiStream(fileName));
            }

            public Packet(KaitaiStream p__io, OpenpgpMessage p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _one = m_io.ReadBitsIntBe(1) != 0;
                _newPacketFormat = m_io.ReadBitsIntBe(1) != 0;
                if (NewPacketFormat) {
                    _packetTypeNew = ((OpenpgpMessage.PacketTags) m_io.ReadBitsIntBe(6));
                }
                if (!(NewPacketFormat)) {
                    _packetTypeOld = ((OpenpgpMessage.PacketTags) m_io.ReadBitsIntBe(4));
                }
                if (!(NewPacketFormat)) {
                    _lenType = m_io.ReadBitsIntBe(2);
                }
                m_io.AlignToByte();
                {
                    bool on = NewPacketFormat;
                    if (on == false)
                    {
                        _body = new OldPacket(m_io, this, m_root);
                    }
                }
            }
            private bool _one;
            private bool _newPacketFormat;
            private PacketTags _packetTypeNew;
            private PacketTags _packetTypeOld;
            private ulong? _lenType;
            private OldPacket _body;
            private OpenpgpMessage m_root;
            private OpenpgpMessage m_parent;
            public bool One { get { return _one; } }
            public bool NewPacketFormat { get { return _newPacketFormat; } }
            public PacketTags PacketTypeNew { get { return _packetTypeNew; } }
            public PacketTags PacketTypeOld { get { return _packetTypeOld; } }
            public ulong? LenType { get { return _lenType; } }
            public OldPacket Body { get { return _body; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage M_Parent { get { return m_parent; } }
        }
        public partial class TrustSignature : KaitaiStruct
        {
            public static TrustSignature FromFile(string fileName)
            {
                return new TrustSignature(new KaitaiStream(fileName));
            }

            public TrustSignature(KaitaiStream p__io, OpenpgpMessage.Subpacket p__parent = null, OpenpgpMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _level = m_io.ReadU1();
                _amount = m_io.ReadU1();
            }
            private byte _level;
            private byte _amount;
            private OpenpgpMessage m_root;
            private OpenpgpMessage.Subpacket m_parent;
            public byte Level { get { return _level; } }
            public byte Amount { get { return _amount; } }
            public OpenpgpMessage M_Root { get { return m_root; } }
            public OpenpgpMessage.Subpacket M_Parent { get { return m_parent; } }
        }
        private List<Packet> _packets;
        private OpenpgpMessage m_root;
        private KaitaiStruct m_parent;
        public List<Packet> Packets { get { return _packets; } }
        public OpenpgpMessage M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
