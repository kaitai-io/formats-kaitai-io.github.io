// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
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
public class EfivarSignatureList extends KaitaiStruct.ReadWrite {
    public static EfivarSignatureList fromFile(String fileName) throws IOException {
        return new EfivarSignatureList(new ByteBufferKaitaiStream(fileName));
    }
    public EfivarSignatureList() {
        this(null, null, null);
    }

    public EfivarSignatureList(KaitaiStream _io) {
        this(_io, null, null);
    }

    public EfivarSignatureList(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public EfivarSignatureList(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, EfivarSignatureList _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.varAttributes = new EfiVarAttr(this._io, this, _root);
        this.varAttributes._read();
        this.signatures = new ArrayList<SignatureList>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                SignatureList _t_signatures = new SignatureList(this._io, this, _root);
                try {
                    _t_signatures._read();
                } finally {
                    this.signatures.add(_t_signatures);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.varAttributes._fetchInstances();
        for (int i = 0; i < this.signatures.size(); i++) {
            this.signatures.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.varAttributes._write_Seq(this._io);
        for (int i = 0; i < this.signatures.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("signatures", 0, this._io.size() - this._io.pos());
            this.signatures.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("signatures", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.varAttributes._root(), _root()))
            throw new ConsistencyError("var_attributes", _root(), this.varAttributes._root());
        if (!Objects.equals(this.varAttributes._parent(), this))
            throw new ConsistencyError("var_attributes", this, this.varAttributes._parent());
        for (int i = 0; i < this.signatures.size(); i++) {
            if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("signatures", _root(), this.signatures.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("signatures", this, this.signatures.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Attributes of a UEFI variable
     */
    public static class EfiVarAttr extends KaitaiStruct.ReadWrite {
        public static EfiVarAttr fromFile(String fileName) throws IOException {
            return new EfiVarAttr(new ByteBufferKaitaiStream(fileName));
        }
        public EfiVarAttr() {
            this(null, null, null);
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
        }
        public void _read() {
            this.enhancedAuthenticatedAccess = this._io.readBitsIntBe(1) != 0;
            this.appendWrite = this._io.readBitsIntBe(1) != 0;
            this.timeBasedAuthenticatedWriteAccess = this._io.readBitsIntBe(1) != 0;
            this.authenticatedWriteAccess = this._io.readBitsIntBe(1) != 0;
            this.hardwareErrorRecord = this._io.readBitsIntBe(1) != 0;
            this.runtimeAccess = this._io.readBitsIntBe(1) != 0;
            this.bootserviceAccess = this._io.readBitsIntBe(1) != 0;
            this.nonVolatile = this._io.readBitsIntBe(1) != 0;
            this.reserved1 = this._io.readBitsIntBe(24);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.enhancedAuthenticatedAccess ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.appendWrite ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.timeBasedAuthenticatedWriteAccess ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.authenticatedWriteAccess ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hardwareErrorRecord ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.runtimeAccess ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.bootserviceAccess ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.nonVolatile ? 1 : 0));
            this._io.writeBitsIntBe(24, this.reserved1);
        }

        public void _check() {
            _dirty = false;
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
        public void setEnhancedAuthenticatedAccess(boolean _v) { _dirty = true; enhancedAuthenticatedAccess = _v; }
        public boolean appendWrite() { return appendWrite; }
        public void setAppendWrite(boolean _v) { _dirty = true; appendWrite = _v; }
        public boolean timeBasedAuthenticatedWriteAccess() { return timeBasedAuthenticatedWriteAccess; }
        public void setTimeBasedAuthenticatedWriteAccess(boolean _v) { _dirty = true; timeBasedAuthenticatedWriteAccess = _v; }
        public boolean authenticatedWriteAccess() { return authenticatedWriteAccess; }
        public void setAuthenticatedWriteAccess(boolean _v) { _dirty = true; authenticatedWriteAccess = _v; }
        public boolean hardwareErrorRecord() { return hardwareErrorRecord; }
        public void setHardwareErrorRecord(boolean _v) { _dirty = true; hardwareErrorRecord = _v; }
        public boolean runtimeAccess() { return runtimeAccess; }
        public void setRuntimeAccess(boolean _v) { _dirty = true; runtimeAccess = _v; }
        public boolean bootserviceAccess() { return bootserviceAccess; }
        public void setBootserviceAccess(boolean _v) { _dirty = true; bootserviceAccess = _v; }
        public boolean nonVolatile() { return nonVolatile; }
        public void setNonVolatile(boolean _v) { _dirty = true; nonVolatile = _v; }

        /**
         * Reserved (unused) bits
         */
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public EfivarSignatureList _root() { return _root; }
        public void set_root(EfivarSignatureList _v) { _dirty = true; _root = _v; }
        public EfivarSignatureList _parent() { return _parent; }
        public void set_parent(EfivarSignatureList _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "EFI_SIGNATURE_DATA"
     */
    public static class SignatureData extends KaitaiStruct.ReadWrite {
        public static SignatureData fromFile(String fileName) throws IOException {
            return new SignatureData(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureData() {
            this(null, null, null);
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
        }
        public void _read() {
            this.owner = this._io.readBytes(16);
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.owner);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.owner.length != 16)
                throw new ConsistencyError("owner", 16, this.owner.length);
            _dirty = false;
        }
        private byte[] owner;
        private byte[] data;
        private EfivarSignatureList _root;
        private EfivarSignatureList.SignatureList _parent;

        /**
         * An identifier which identifies the agent which added the signature to the list
         */
        public byte[] owner() { return owner; }
        public void setOwner(byte[] _v) { _dirty = true; owner = _v; }

        /**
         * The format of the signature is defined by the SignatureType.
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public EfivarSignatureList _root() { return _root; }
        public void set_root(EfivarSignatureList _v) { _dirty = true; _root = _v; }
        public EfivarSignatureList.SignatureList _parent() { return _parent; }
        public void set_parent(EfivarSignatureList.SignatureList _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "EFI_SIGNATURE_LIST"
     */
    public static class SignatureList extends KaitaiStruct.ReadWrite {
        public static SignatureList fromFile(String fileName) throws IOException {
            return new SignatureList(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.signatureType = this._io.readBytes(16);
            this.lenSignatureList = this._io.readU4le();
            this.lenSignatureHeader = this._io.readU4le();
            this.lenSignature = this._io.readU4le();
            this.header = this._io.readBytes(lenSignatureHeader());
            if (lenSignature() > 0) {
                this._raw_signatures = new ArrayList<byte[]>();
                this.signatures = new ArrayList<SignatureData>();
                for (int i = 0; i < ((lenSignatureList() - lenSignatureHeader()) - 28) / lenSignature(); i++) {
                    this._raw_signatures.add(this._io.readBytes(lenSignature()));
                    KaitaiStream _io__raw_signatures = new ByteBufferKaitaiStream(this._raw_signatures.get(i));
                    SignatureData _t_signatures = new SignatureData(_io__raw_signatures, this, _root);
                    try {
                        _t_signatures._read();
                    } finally {
                        this.signatures.add(_t_signatures);
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (lenSignature() > 0) {
                for (int i = 0; i < this.signatures.size(); i++) {
                    this.signatures.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signatureType);
            this._io.writeU4le(this.lenSignatureList);
            this._io.writeU4le(this.lenSignatureHeader);
            this._io.writeU4le(this.lenSignature);
            this._io.writeBytes(this.header);
            if (lenSignature() > 0) {
                this._raw_signatures = new ArrayList<byte[]>();
                for (int i = 0; i < this.signatures.size(); i++) {
                    final KaitaiStream _io__raw_signatures = new ByteBufferKaitaiStream(lenSignature());
                    this._io.addChildStream(_io__raw_signatures);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenSignature()));
                        final SignatureList _this = this;
                        final int _i = i;
                        _io__raw_signatures.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_signatures.add(_io__raw_signatures.toByteArray());
                                if (_this._raw_signatures.get(((Number) (_i)).intValue()).length != lenSignature())
                                    throw new ConsistencyError("raw(signatures)", lenSignature(), _this._raw_signatures.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_signatures.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.signatures.get(((Number) (i)).intValue())._write_Seq(_io__raw_signatures);
                }
            }
        }

        public void _check() {
            if (this.signatureType.length != 16)
                throw new ConsistencyError("signature_type", 16, this.signatureType.length);
            if (this.header.length != lenSignatureHeader())
                throw new ConsistencyError("header", lenSignatureHeader(), this.header.length);
            if (lenSignature() > 0) {
                if (this.signatures.size() != ((lenSignatureList() - lenSignatureHeader()) - 28) / lenSignature())
                    throw new ConsistencyError("signatures", ((lenSignatureList() - lenSignatureHeader()) - 28) / lenSignature(), this.signatures.size());
                for (int i = 0; i < this.signatures.size(); i++) {
                    if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("signatures", _root(), this.signatures.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("signatures", this, this.signatures.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
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
        public void _invalidateIsCertDerPkcs7() { this.isCertDerPkcs7 = null; }
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
        public void _invalidateIsCertRsa2048Key() { this.isCertRsa2048Key = null; }
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
        public void _invalidateIsCertRsa2048Sha1() { this.isCertRsa2048Sha1 = null; }
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
        public void _invalidateIsCertRsa2048Sha256() { this.isCertRsa2048Sha256 = null; }
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
        public void _invalidateIsCertSha1() { this.isCertSha1 = null; }
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
        public void _invalidateIsCertSha224() { this.isCertSha224 = null; }
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
        public void _invalidateIsCertSha256() { this.isCertSha256 = null; }
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
        public void _invalidateIsCertSha256X509() { this.isCertSha256X509 = null; }
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
        public void _invalidateIsCertSha384() { this.isCertSha384 = null; }
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
        public void _invalidateIsCertSha384X509() { this.isCertSha384X509 = null; }
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
        public void _invalidateIsCertSha512() { this.isCertSha512 = null; }
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
        public void _invalidateIsCertSha512X509() { this.isCertSha512X509 = null; }
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
        public void _invalidateIsCertX509() { this.isCertX509 = null; }
        private byte[] signatureType;
        private long lenSignatureList;
        private long lenSignatureHeader;
        private long lenSignature;
        private byte[] header;
        private List<SignatureData> signatures;
        private EfivarSignatureList _root;
        private EfivarSignatureList _parent;
        private List<byte[]> _raw_signatures;

        /**
         * Type of the signature as a GUID
         */
        public byte[] signatureType() { return signatureType; }
        public void setSignatureType(byte[] _v) { _dirty = true; signatureType = _v; }

        /**
         * Total size of the signature list, including this header
         */
        public long lenSignatureList() { return lenSignatureList; }
        public void setLenSignatureList(long _v) { _dirty = true; lenSignatureList = _v; }

        /**
         * Size of the signature header which precedes the array of signatures
         */
        public long lenSignatureHeader() { return lenSignatureHeader; }
        public void setLenSignatureHeader(long _v) { _dirty = true; lenSignatureHeader = _v; }

        /**
         * Size of each signature
         */
        public long lenSignature() { return lenSignature; }
        public void setLenSignature(long _v) { _dirty = true; lenSignature = _v; }

        /**
         * Header before the array of signatures
         */
        public byte[] header() { return header; }
        public void setHeader(byte[] _v) { _dirty = true; header = _v; }

        /**
         * An array of signatures
         */
        public List<SignatureData> signatures() { return signatures; }
        public void setSignatures(List<SignatureData> _v) { _dirty = true; signatures = _v; }
        public EfivarSignatureList _root() { return _root; }
        public void set_root(EfivarSignatureList _v) { _dirty = true; _root = _v; }
        public EfivarSignatureList _parent() { return _parent; }
        public void set_parent(EfivarSignatureList _v) { _dirty = true; _parent = _v; }
        public List<byte[]> _raw_signatures() { return _raw_signatures; }
        public void set_raw_Signatures(List<byte[]> _v) { _dirty = true; _raw_signatures = _v; }
    }
    private EfiVarAttr varAttributes;
    private List<SignatureList> signatures;
    private EfivarSignatureList _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Attributes of the UEFI variable
     */
    public EfiVarAttr varAttributes() { return varAttributes; }
    public void setVarAttributes(EfiVarAttr _v) { _dirty = true; varAttributes = _v; }
    public List<SignatureList> signatures() { return signatures; }
    public void setSignatures(List<SignatureList> _v) { _dirty = true; signatures = _v; }
    public EfivarSignatureList _root() { return _root; }
    public void set_root(EfivarSignatureList _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
