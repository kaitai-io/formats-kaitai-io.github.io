// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Parse UEFI variables db and dbx that contain signatures, certificates and
    /// hashes. On a Linux system using UEFI, these variables are readable from
    /// /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
    /// /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
    /// /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
    /// /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
    /// (&quot;d719b2cb-3d3a-4596-a3bc-dad00e67656f&quot; is defined as
    /// EFI_IMAGE_SECURITY_DATABASE_GUID and &quot;8be4df61-93ca-11d2-aa0d-00e098032b8c&quot;
    /// as EFI_GLOBAL_VARIABLE).
    /// Each file contains an EFI attribute (32-bit integer) followed by a list of
    /// EFI_SIGNATURE_LIST structures.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf">Source</a>
    /// </remarks>
    public partial class EfivarSignatureList : KaitaiStruct
    {
        public static EfivarSignatureList FromFile(string fileName)
        {
            return new EfivarSignatureList(new KaitaiStream(fileName));
        }

        public EfivarSignatureList(KaitaiStream p__io, KaitaiStruct p__parent = null, EfivarSignatureList p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _varAttributes = new EfiVarAttr(m_io, this, m_root);
            _signatures = new List<SignatureList>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _signatures.Add(new SignatureList(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <remarks>
        /// Reference: EFI_SIGNATURE_LIST
        /// </remarks>
        public partial class SignatureList : KaitaiStruct
        {
            public static SignatureList FromFile(string fileName)
            {
                return new SignatureList(new KaitaiStream(fileName));
            }

            public SignatureList(KaitaiStream p__io, EfivarSignatureList p__parent = null, EfivarSignatureList p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isCertSha512X509 = false;
                f_isCertSha224 = false;
                f_isCertX509 = false;
                f_isCertSha256X509 = false;
                f_isCertRsa2048Key = false;
                f_isCertSha512 = false;
                f_isCertSha384 = false;
                f_isCertSha1 = false;
                f_isCertRsa2048Sha1 = false;
                f_isCertSha256 = false;
                f_isCertSha384X509 = false;
                f_isCertRsa2048Sha256 = false;
                f_isCertDerPkcs7 = false;
                _read();
            }
            private void _read()
            {
                _signatureType = m_io.ReadBytes(16);
                _lenSignatureList = m_io.ReadU4le();
                _lenSignatureHeader = m_io.ReadU4le();
                _lenSignature = m_io.ReadU4le();
                _header = m_io.ReadBytes(LenSignatureHeader);
                if (LenSignature > 0) {
                    __raw_signatures = new List<byte[]>((int) ((((LenSignatureList - LenSignatureHeader) - 28) / LenSignature)));
                    _signatures = new List<SignatureData>((int) ((((LenSignatureList - LenSignatureHeader) - 28) / LenSignature)));
                    for (var i = 0; i < (((LenSignatureList - LenSignatureHeader) - 28) / LenSignature); i++)
                    {
                        __raw_signatures.Add(m_io.ReadBytes(LenSignature));
                        var io___raw_signatures = new KaitaiStream(__raw_signatures[__raw_signatures.Count - 1]);
                        _signatures.Add(new SignatureData(io___raw_signatures, this, m_root));
                    }
                }
            }
            private bool f_isCertSha512X509;
            private bool _isCertSha512X509;

            /// <summary>
            /// SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_X509_SHA512_GUID
            /// </remarks>
            public bool IsCertSha512X509
            {
                get
                {
                    if (f_isCertSha512X509)
                        return _isCertSha512X509;
                    _isCertSha512X509 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 99, 191, 109, 68, 2, 37, 218, 76, 188, 250, 36, 101, 210, 176, 254, 157 }) == 0));
                    f_isCertSha512X509 = true;
                    return _isCertSha512X509;
                }
            }
            private bool f_isCertSha224;
            private bool _isCertSha224;

            /// <summary>
            /// SHA-224 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_SHA224_GUID
            /// </remarks>
            public bool IsCertSha224
            {
                get
                {
                    if (f_isCertSha224)
                        return _isCertSha224;
                    _isCertSha224 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 51, 82, 110, 11, 92, 166, 201, 68, 148, 7, 217, 171, 131, 191, 200, 189 }) == 0));
                    f_isCertSha224 = true;
                    return _isCertSha224;
                }
            }
            private bool f_isCertX509;
            private bool _isCertX509;

            /// <summary>
            /// X.509 certificate
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_X509_GUID
            /// </remarks>
            public bool IsCertX509
            {
                get
                {
                    if (f_isCertX509)
                        return _isCertX509;
                    _isCertX509 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 161, 89, 192, 165, 228, 148, 167, 74, 135, 181, 171, 21, 92, 43, 240, 114 }) == 0));
                    f_isCertX509 = true;
                    return _isCertX509;
                }
            }
            private bool f_isCertSha256X509;
            private bool _isCertSha256X509;

            /// <summary>
            /// SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_X509_SHA256_GUID
            /// </remarks>
            public bool IsCertSha256X509
            {
                get
                {
                    if (f_isCertSha256X509)
                        return _isCertSha256X509;
                    _isCertSha256X509 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 146, 164, 210, 59, 192, 150, 121, 64, 180, 32, 252, 249, 142, 241, 3, 237 }) == 0));
                    f_isCertSha256X509 = true;
                    return _isCertSha256X509;
                }
            }
            private bool f_isCertRsa2048Key;
            private bool _isCertRsa2048Key;

            /// <summary>
            /// RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_RSA2048_GUID
            /// </remarks>
            public bool IsCertRsa2048Key
            {
                get
                {
                    if (f_isCertRsa2048Key)
                        return _isCertRsa2048Key;
                    _isCertRsa2048Key = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 232, 102, 87, 60, 156, 38, 52, 78, 170, 20, 237, 119, 110, 133, 179, 182 }) == 0));
                    f_isCertRsa2048Key = true;
                    return _isCertRsa2048Key;
                }
            }
            private bool f_isCertSha512;
            private bool _isCertSha512;

            /// <summary>
            /// SHA-512 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_SHA512_GUID
            /// </remarks>
            public bool IsCertSha512
            {
                get
                {
                    if (f_isCertSha512)
                        return _isCertSha512;
                    _isCertSha512 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 174, 15, 62, 9, 196, 166, 80, 79, 159, 27, 212, 30, 43, 137, 193, 154 }) == 0));
                    f_isCertSha512 = true;
                    return _isCertSha512;
                }
            }
            private bool f_isCertSha384;
            private bool _isCertSha384;

            /// <summary>
            /// SHA-384 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_SHA384_GUID
            /// </remarks>
            public bool IsCertSha384
            {
                get
                {
                    if (f_isCertSha384)
                        return _isCertSha384;
                    _isCertSha384 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 7, 83, 62, 255, 208, 159, 201, 72, 133, 241, 138, 213, 108, 112, 30, 1 }) == 0));
                    f_isCertSha384 = true;
                    return _isCertSha384;
                }
            }
            private bool f_isCertSha1;
            private bool _isCertSha1;

            /// <summary>
            /// SHA-1 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_SHA1_GUID
            /// </remarks>
            public bool IsCertSha1
            {
                get
                {
                    if (f_isCertSha1)
                        return _isCertSha1;
                    _isCertSha1 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 18, 165, 108, 130, 16, 207, 201, 74, 177, 135, 190, 1, 73, 102, 49, 189 }) == 0));
                    f_isCertSha1 = true;
                    return _isCertSha1;
                }
            }
            private bool f_isCertRsa2048Sha1;
            private bool _isCertRsa2048Sha1;

            /// <summary>
            /// RSA-2048 signature of a SHA-1 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_RSA2048_SHA1_GUID
            /// </remarks>
            public bool IsCertRsa2048Sha1
            {
                get
                {
                    if (f_isCertRsa2048Sha1)
                        return _isCertRsa2048Sha1;
                    _isCertRsa2048Sha1 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 79, 68, 248, 103, 67, 135, 241, 72, 163, 40, 30, 170, 184, 115, 96, 128 }) == 0));
                    f_isCertRsa2048Sha1 = true;
                    return _isCertRsa2048Sha1;
                }
            }
            private bool f_isCertSha256;
            private bool _isCertSha256;

            /// <summary>
            /// SHA-256 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_SHA256_GUID
            /// </remarks>
            public bool IsCertSha256
            {
                get
                {
                    if (f_isCertSha256)
                        return _isCertSha256;
                    _isCertSha256 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 38, 22, 196, 193, 76, 80, 146, 64, 172, 169, 65, 249, 54, 147, 67, 40 }) == 0));
                    f_isCertSha256 = true;
                    return _isCertSha256;
                }
            }
            private bool f_isCertSha384X509;
            private bool _isCertSha384X509;

            /// <summary>
            /// SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_X509_SHA384_GUID
            /// </remarks>
            public bool IsCertSha384X509
            {
                get
                {
                    if (f_isCertSha384X509)
                        return _isCertSha384X509;
                    _isCertSha384X509 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 110, 135, 118, 112, 194, 128, 230, 78, 170, 210, 40, 179, 73, 166, 134, 91 }) == 0));
                    f_isCertSha384X509 = true;
                    return _isCertSha384X509;
                }
            }
            private bool f_isCertRsa2048Sha256;
            private bool _isCertRsa2048Sha256;

            /// <summary>
            /// RSA-2048 signature of a SHA-256 hash
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_RSA2048_SHA256_GUID
            /// </remarks>
            public bool IsCertRsa2048Sha256
            {
                get
                {
                    if (f_isCertRsa2048Sha256)
                        return _isCertRsa2048Sha256;
                    _isCertRsa2048Sha256 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 144, 97, 179, 226, 155, 135, 61, 74, 173, 141, 242, 231, 187, 163, 39, 132 }) == 0));
                    f_isCertRsa2048Sha256 = true;
                    return _isCertRsa2048Sha256;
                }
            }
            private bool f_isCertDerPkcs7;
            private bool _isCertDerPkcs7;

            /// <summary>
            /// DER-encoded PKCS #7 version 1.5 [RFC2315]
            /// </summary>
            /// <remarks>
            /// Reference: EFI_CERT_TYPE_PKCS7_GUID
            /// </remarks>
            public bool IsCertDerPkcs7
            {
                get
                {
                    if (f_isCertDerPkcs7)
                        return _isCertDerPkcs7;
                    _isCertDerPkcs7 = (bool) ((KaitaiStream.ByteArrayCompare(SignatureType, new byte[] { 157, 210, 175, 74, 223, 104, 238, 73, 138, 169, 52, 125, 55, 86, 101, 167 }) == 0));
                    f_isCertDerPkcs7 = true;
                    return _isCertDerPkcs7;
                }
            }
            private byte[] _signatureType;
            private uint _lenSignatureList;
            private uint _lenSignatureHeader;
            private uint _lenSignature;
            private byte[] _header;
            private List<SignatureData> _signatures;
            private EfivarSignatureList m_root;
            private EfivarSignatureList m_parent;
            private List<byte[]> __raw_signatures;

            /// <summary>
            /// Type of the signature as a GUID
            /// </summary>
            public byte[] SignatureType { get { return _signatureType; } }

            /// <summary>
            /// Total size of the signature list, including this header
            /// </summary>
            public uint LenSignatureList { get { return _lenSignatureList; } }

            /// <summary>
            /// Size of the signature header which precedes the array of signatures
            /// </summary>
            public uint LenSignatureHeader { get { return _lenSignatureHeader; } }

            /// <summary>
            /// Size of each signature
            /// </summary>
            public uint LenSignature { get { return _lenSignature; } }

            /// <summary>
            /// Header before the array of signatures
            /// </summary>
            public byte[] Header { get { return _header; } }

            /// <summary>
            /// An array of signatures
            /// </summary>
            public List<SignatureData> Signatures { get { return _signatures; } }
            public EfivarSignatureList M_Root { get { return m_root; } }
            public EfivarSignatureList M_Parent { get { return m_parent; } }
            public List<byte[]> M_RawSignatures { get { return __raw_signatures; } }
        }

        /// <remarks>
        /// Reference: EFI_SIGNATURE_DATA
        /// </remarks>
        public partial class SignatureData : KaitaiStruct
        {
            public static SignatureData FromFile(string fileName)
            {
                return new SignatureData(new KaitaiStream(fileName));
            }

            public SignatureData(KaitaiStream p__io, EfivarSignatureList.SignatureList p__parent = null, EfivarSignatureList p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _owner = m_io.ReadBytes(16);
                _data = m_io.ReadBytesFull();
            }
            private byte[] _owner;
            private byte[] _data;
            private EfivarSignatureList m_root;
            private EfivarSignatureList.SignatureList m_parent;

            /// <summary>
            /// An identifier which identifies the agent which added the signature to the list
            /// </summary>
            public byte[] Owner { get { return _owner; } }

            /// <summary>
            /// The format of the signature is defined by the SignatureType.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public EfivarSignatureList M_Root { get { return m_root; } }
            public EfivarSignatureList.SignatureList M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Attributes of a UEFI variable
        /// </summary>
        public partial class EfiVarAttr : KaitaiStruct
        {
            public static EfiVarAttr FromFile(string fileName)
            {
                return new EfiVarAttr(new KaitaiStream(fileName));
            }

            public EfiVarAttr(KaitaiStream p__io, EfivarSignatureList p__parent = null, EfivarSignatureList p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _enhancedAuthenticatedAccess = m_io.ReadBitsIntBe(1) != 0;
                _appendWrite = m_io.ReadBitsIntBe(1) != 0;
                _timeBasedAuthenticatedWriteAccess = m_io.ReadBitsIntBe(1) != 0;
                _authenticatedWriteAccess = m_io.ReadBitsIntBe(1) != 0;
                _hardwareErrorRecord = m_io.ReadBitsIntBe(1) != 0;
                _runtimeAccess = m_io.ReadBitsIntBe(1) != 0;
                _bootserviceAccess = m_io.ReadBitsIntBe(1) != 0;
                _nonVolatile = m_io.ReadBitsIntBe(1) != 0;
                _reserved1 = m_io.ReadBitsIntBe(24);
            }
            private bool _enhancedAuthenticatedAccess;
            private bool _appendWrite;
            private bool _timeBasedAuthenticatedWriteAccess;
            private bool _authenticatedWriteAccess;
            private bool _hardwareErrorRecord;
            private bool _runtimeAccess;
            private bool _bootserviceAccess;
            private bool _nonVolatile;
            private ulong _reserved1;
            private EfivarSignatureList m_root;
            private EfivarSignatureList m_parent;
            public bool EnhancedAuthenticatedAccess { get { return _enhancedAuthenticatedAccess; } }
            public bool AppendWrite { get { return _appendWrite; } }
            public bool TimeBasedAuthenticatedWriteAccess { get { return _timeBasedAuthenticatedWriteAccess; } }
            public bool AuthenticatedWriteAccess { get { return _authenticatedWriteAccess; } }
            public bool HardwareErrorRecord { get { return _hardwareErrorRecord; } }
            public bool RuntimeAccess { get { return _runtimeAccess; } }
            public bool BootserviceAccess { get { return _bootserviceAccess; } }
            public bool NonVolatile { get { return _nonVolatile; } }

            /// <summary>
            /// Reserved (unused) bits
            /// </summary>
            public ulong Reserved1 { get { return _reserved1; } }
            public EfivarSignatureList M_Root { get { return m_root; } }
            public EfivarSignatureList M_Parent { get { return m_parent; } }
        }
        private EfiVarAttr _varAttributes;
        private List<SignatureList> _signatures;
        private EfivarSignatureList m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Attributes of the UEFI variable
        /// </summary>
        public EfiVarAttr VarAttributes { get { return _varAttributes; } }
        public List<SignatureList> Signatures { get { return _signatures; } }
        public EfivarSignatureList M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
