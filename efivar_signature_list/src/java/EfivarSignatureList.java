// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from:
 * 
 * ```
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * ```
 * 
 * Note:
 * 
 * * `d719b2cb-3d3a-4596-a3bc-dad00e67656f` is defined as `EFI_IMAGE_SECURITY_DATABASE_GUID`
 * * `8be4df61-93ca-11d2-aa0d-00e098032b8c` is defined as `EFI_GLOBAL_VARIABLE`
 * 
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * `EFI_SIGNATURE_LIST` structures.
 * @see <a href="https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf">Source</a>
 */
public class EfivarSignatureList extends KaitaiStruct {
    public static EfivarSignatureList fromFile(String fileName) throws IOException {
        return new EfivarSignatureList(new ByteBufferKaitaiStream(fileName));
    }

    public EfivarSignatureList(KaitaiStream _io) {
        this(_io, null, null);
    }

    public EfivarSignatureList(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public EfivarSignatureList(KaitaiStream _io, KaitaiStruct _parent, EfivarSignatureList _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.varAttributes = new EfiVarAttr(this._io, this, _root);
        this.signatures = new ArrayList<SignatureList>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.signatures.add(new SignatureList(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        this.varAttributes._fetchInstances();
        for (int i = 0; i < this.signatures.size(); i++) {
            this.signatures.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * Attributes of a UEFI variable
     */
    public static class EfiVarAttr extends KaitaiStruct {
        public static EfiVarAttr fromFile(String fileName) throws IOException {
            return new EfiVarAttr(new ByteBufferKaitaiStream(fileName));
        }

        public EfiVarAttr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EfiVarAttr(KaitaiStream _io, EfivarSignatureList _parent) {
            this(_io, _parent, null);
        }

        public EfiVarAttr(KaitaiStream _io, EfivarSignatureList _parent, EfivarSignatureList _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.enhancedAuthenticatedAccess = this._io.readBitsIntBe(1) != 0;
            this.appendWrite = this._io.readBitsIntBe(1) != 0;
            this.timeBasedAuthenticatedWriteAccess = this._io.readBitsIntBe(1) != 0;
            this.authenticatedWriteAccess = this._io.readBitsIntBe(1) != 0;
            this.hardwareErrorRecord = this._io.readBitsIntBe(1) != 0;
            this.runtimeAccess = this._io.readBitsIntBe(1) != 0;
            this.bootserviceAccess = this._io.readBitsIntBe(1) != 0;
            this.nonVolatile = this._io.readBitsIntBe(1) != 0;
            this.reserved1 = this._io.readBitsIntBe(24);
        }

        public void _fetchInstances() {
        }
        private boolean enhancedAuthenticatedAccess;
        private boolean appendWrite;
        private boolean timeBasedAuthenticatedWriteAccess;
        private boolean authenticatedWriteAccess;
        private boolean hardwareErrorRecord;
        private boolean runtimeAccess;
        private boolean bootserviceAccess;
        private boolean nonVolatile;
        private long reserved1;
        private EfivarSignatureList _root;
        private EfivarSignatureList _parent;
        public boolean enhancedAuthenticatedAccess() { return enhancedAuthenticatedAccess; }
        public boolean appendWrite() { return appendWrite; }
        public boolean timeBasedAuthenticatedWriteAccess() { return timeBasedAuthenticatedWriteAccess; }
        public boolean authenticatedWriteAccess() { return authenticatedWriteAccess; }
        public boolean hardwareErrorRecord() { return hardwareErrorRecord; }
        public boolean runtimeAccess() { return runtimeAccess; }
        public boolean bootserviceAccess() { return bootserviceAccess; }
        public boolean nonVolatile() { return nonVolatile; }

        /**
         * Reserved (unused) bits
         */
        public long reserved1() { return reserved1; }
        public EfivarSignatureList _root() { return _root; }
        public EfivarSignatureList _parent() { return _parent; }
    }

    /**
     * @see "EFI_SIGNATURE_DATA"
     */
    public static class SignatureData extends KaitaiStruct {
        public static SignatureData fromFile(String fileName) throws IOException {
            return new SignatureData(new ByteBufferKaitaiStream(fileName));
        }

        public SignatureData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureData(KaitaiStream _io, EfivarSignatureList.SignatureList _parent) {
            this(_io, _parent, null);
        }

        public SignatureData(KaitaiStream _io, EfivarSignatureList.SignatureList _parent, EfivarSignatureList _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.owner = this._io.readBytes(16);
            this.data = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private byte[] owner;
        private byte[] data;
        private EfivarSignatureList _root;
        private EfivarSignatureList.SignatureList _parent;

        /**
         * An identifier which identifies the agent which added the signature to the list
         */
        public byte[] owner() { return owner; }

        /**
         * The format of the signature is defined by the SignatureType.
         */
        public byte[] data() { return data; }
        public EfivarSignatureList _root() { return _root; }
        public EfivarSignatureList.SignatureList _parent() { return _parent; }
    }

    /**
     * @see "EFI_SIGNATURE_LIST"
     */
    public static class SignatureList extends KaitaiStruct {
        public static SignatureList fromFile(String fileName) throws IOException {
            return new SignatureList(new ByteBufferKaitaiStream(fileName));
        }

        public SignatureList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureList(KaitaiStream _io, EfivarSignatureList _parent) {
            this(_io, _parent, null);
        }

        public SignatureList(KaitaiStream _io, EfivarSignatureList _parent, EfivarSignatureList _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.signatureType = this._io.readBytes(16);
            this.lenSignatureList = this._io.readU4le();
            this.lenSignatureHeader = this._io.readU4le();
            this.lenSignature = this._io.readU4le();
            this.header = this._io.readBytes(lenSignatureHeader());
            if (lenSignature() > 0) {
                this.signatures = new ArrayList<SignatureData>();
                for (int i = 0; i < ((lenSignatureList() - lenSignatureHeader()) - 28) / lenSignature(); i++) {
                    KaitaiStream _io_signatures = this._io.substream(lenSignature());
                    this.signatures.add(new SignatureData(_io_signatures, this, _root));
                }
            }
        }

        public void _fetchInstances() {
            if (lenSignature() > 0) {
                for (int i = 0; i < this.signatures.size(); i++) {
                    this.signatures.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }
        private Boolean isCertDerPkcs7;

        /**
         * DER-encoded PKCS #7 version 1.5 [RFC2315]
         * @see "EFI_CERT_TYPE_PKCS7_GUID"
         */
        public Boolean isCertDerPkcs7() {
            if (this.isCertDerPkcs7 != null)
                return this.isCertDerPkcs7;
            this.isCertDerPkcs7 = Arrays.equals(signatureType(), new byte[] { -99, -46, -81, 74, -33, 104, -18, 73, -118, -87, 52, 125, 55, 86, 101, -89 });
            return this.isCertDerPkcs7;
        }
        private Boolean isCertRsa2048Key;

        /**
         * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
         * @see "EFI_CERT_RSA2048_GUID"
         */
        public Boolean isCertRsa2048Key() {
            if (this.isCertRsa2048Key != null)
                return this.isCertRsa2048Key;
            this.isCertRsa2048Key = Arrays.equals(signatureType(), new byte[] { -24, 102, 87, 60, -100, 38, 52, 78, -86, 20, -19, 119, 110, -123, -77, -74 });
            return this.isCertRsa2048Key;
        }
        private Boolean isCertRsa2048Sha1;

        /**
         * RSA-2048 signature of a SHA-1 hash
         * @see "EFI_CERT_RSA2048_SHA1_GUID"
         */
        public Boolean isCertRsa2048Sha1() {
            if (this.isCertRsa2048Sha1 != null)
                return this.isCertRsa2048Sha1;
            this.isCertRsa2048Sha1 = Arrays.equals(signatureType(), new byte[] { 79, 68, -8, 103, 67, -121, -15, 72, -93, 40, 30, -86, -72, 115, 96, -128 });
            return this.isCertRsa2048Sha1;
        }
        private Boolean isCertRsa2048Sha256;

        /**
         * RSA-2048 signature of a SHA-256 hash
         * @see "EFI_CERT_RSA2048_SHA256_GUID"
         */
        public Boolean isCertRsa2048Sha256() {
            if (this.isCertRsa2048Sha256 != null)
                return this.isCertRsa2048Sha256;
            this.isCertRsa2048Sha256 = Arrays.equals(signatureType(), new byte[] { -112, 97, -77, -30, -101, -121, 61, 74, -83, -115, -14, -25, -69, -93, 39, -124 });
            return this.isCertRsa2048Sha256;
        }
        private Boolean isCertSha1;

        /**
         * SHA-1 hash
         * @see "EFI_CERT_SHA1_GUID"
         */
        public Boolean isCertSha1() {
            if (this.isCertSha1 != null)
                return this.isCertSha1;
            this.isCertSha1 = Arrays.equals(signatureType(), new byte[] { 18, -91, 108, -126, 16, -49, -55, 74, -79, -121, -66, 1, 73, 102, 49, -67 });
            return this.isCertSha1;
        }
        private Boolean isCertSha224;

        /**
         * SHA-224 hash
         * @see "EFI_CERT_SHA224_GUID"
         */
        public Boolean isCertSha224() {
            if (this.isCertSha224 != null)
                return this.isCertSha224;
            this.isCertSha224 = Arrays.equals(signatureType(), new byte[] { 51, 82, 110, 11, 92, -90, -55, 68, -108, 7, -39, -85, -125, -65, -56, -67 });
            return this.isCertSha224;
        }
        private Boolean isCertSha256;

        /**
         * SHA-256 hash
         * @see "EFI_CERT_SHA256_GUID"
         */
        public Boolean isCertSha256() {
            if (this.isCertSha256 != null)
                return this.isCertSha256;
            this.isCertSha256 = Arrays.equals(signatureType(), new byte[] { 38, 22, -60, -63, 76, 80, -110, 64, -84, -87, 65, -7, 54, -109, 67, 40 });
            return this.isCertSha256;
        }
        private Boolean isCertSha256X509;

        /**
         * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * @see "EFI_CERT_X509_SHA256_GUID"
         */
        public Boolean isCertSha256X509() {
            if (this.isCertSha256X509 != null)
                return this.isCertSha256X509;
            this.isCertSha256X509 = Arrays.equals(signatureType(), new byte[] { -110, -92, -46, 59, -64, -106, 121, 64, -76, 32, -4, -7, -114, -15, 3, -19 });
            return this.isCertSha256X509;
        }
        private Boolean isCertSha384;

        /**
         * SHA-384 hash
         * @see "EFI_CERT_SHA384_GUID"
         */
        public Boolean isCertSha384() {
            if (this.isCertSha384 != null)
                return this.isCertSha384;
            this.isCertSha384 = Arrays.equals(signatureType(), new byte[] { 7, 83, 62, -1, -48, -97, -55, 72, -123, -15, -118, -43, 108, 112, 30, 1 });
            return this.isCertSha384;
        }
        private Boolean isCertSha384X509;

        /**
         * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * @see "EFI_CERT_X509_SHA384_GUID"
         */
        public Boolean isCertSha384X509() {
            if (this.isCertSha384X509 != null)
                return this.isCertSha384X509;
            this.isCertSha384X509 = Arrays.equals(signatureType(), new byte[] { 110, -121, 118, 112, -62, -128, -26, 78, -86, -46, 40, -77, 73, -90, -122, 91 });
            return this.isCertSha384X509;
        }
        private Boolean isCertSha512;

        /**
         * SHA-512 hash
         * @see "EFI_CERT_SHA512_GUID"
         */
        public Boolean isCertSha512() {
            if (this.isCertSha512 != null)
                return this.isCertSha512;
            this.isCertSha512 = Arrays.equals(signatureType(), new byte[] { -82, 15, 62, 9, -60, -90, 80, 79, -97, 27, -44, 30, 43, -119, -63, -102 });
            return this.isCertSha512;
        }
        private Boolean isCertSha512X509;

        /**
         * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
         * @see "EFI_CERT_X509_SHA512_GUID"
         */
        public Boolean isCertSha512X509() {
            if (this.isCertSha512X509 != null)
                return this.isCertSha512X509;
            this.isCertSha512X509 = Arrays.equals(signatureType(), new byte[] { 99, -65, 109, 68, 2, 37, -38, 76, -68, -6, 36, 101, -46, -80, -2, -99 });
            return this.isCertSha512X509;
        }
        private Boolean isCertX509;

        /**
         * X.509 certificate
         * @see "EFI_CERT_X509_GUID"
         */
        public Boolean isCertX509() {
            if (this.isCertX509 != null)
                return this.isCertX509;
            this.isCertX509 = Arrays.equals(signatureType(), new byte[] { -95, 89, -64, -91, -28, -108, -89, 74, -121, -75, -85, 21, 92, 43, -16, 114 });
            return this.isCertX509;
        }
        private byte[] signatureType;
        private long lenSignatureList;
        private long lenSignatureHeader;
        private long lenSignature;
        private byte[] header;
        private List<SignatureData> signatures;
        private EfivarSignatureList _root;
        private EfivarSignatureList _parent;

        /**
         * Type of the signature as a GUID
         */
        public byte[] signatureType() { return signatureType; }

        /**
         * Total size of the signature list, including this header
         */
        public long lenSignatureList() { return lenSignatureList; }

        /**
         * Size of the signature header which precedes the array of signatures
         */
        public long lenSignatureHeader() { return lenSignatureHeader; }

        /**
         * Size of each signature
         */
        public long lenSignature() { return lenSignature; }

        /**
         * Header before the array of signatures
         */
        public byte[] header() { return header; }

        /**
         * An array of signatures
         */
        public List<SignatureData> signatures() { return signatures; }
        public EfivarSignatureList _root() { return _root; }
        public EfivarSignatureList _parent() { return _parent; }
    }
    private EfiVarAttr varAttributes;
    private List<SignatureList> signatures;
    private EfivarSignatureList _root;
    private KaitaiStruct _parent;

    /**
     * Attributes of the UEFI variable
     */
    public EfiVarAttr varAttributes() { return varAttributes; }
    public List<SignatureList> signatures() { return signatures; }
    public EfivarSignatureList _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
