// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * SSH public keys are encoded in a special binary format, typically represented
 * to end users as either one-liner OpenSSH format or multi-line PEM format
 * (commerical SSH). Text wrapper carries extra information about user who
 * created the key, comment, etc, but the inner binary is always base64-encoded
 * and follows the same internal format.
 * 
 * This format spec deals with this internal binary format (called "blob" in
 * openssh sources) only. Buffer is expected to be raw binary and not base64-d.
 * Implementation closely follows code in OpenSSH.
 * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970">Source</a>
 */
public class SshPublicKey extends KaitaiStruct.ReadWrite {
    public static SshPublicKey fromFile(String fileName) throws IOException {
        return new SshPublicKey(new ByteBufferKaitaiStream(fileName));
    }
    public SshPublicKey() {
        this(null, null, null);
    }

    public SshPublicKey(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SshPublicKey(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SshPublicKey(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SshPublicKey _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.keyName = new Cstring(this._io, this, _root);
        this.keyName._read();
        switch (keyName().value()) {
        case "ecdsa-sha2-nistp256": {
            this.body = new KeyEcdsa(this._io, this, _root);
            ((KeyEcdsa) (this.body))._read();
            break;
        }
        case "ssh-dss": {
            this.body = new KeyDsa(this._io, this, _root);
            ((KeyDsa) (this.body))._read();
            break;
        }
        case "ssh-ed25519": {
            this.body = new KeyEd25519(this._io, this, _root);
            ((KeyEd25519) (this.body))._read();
            break;
        }
        case "ssh-rsa": {
            this.body = new KeyRsa(this._io, this, _root);
            ((KeyRsa) (this.body))._read();
            break;
        }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.keyName._fetchInstances();
        switch (keyName().value()) {
        case "ecdsa-sha2-nistp256": {
            ((KeyEcdsa) (this.body))._fetchInstances();
            break;
        }
        case "ssh-dss": {
            ((KeyDsa) (this.body))._fetchInstances();
            break;
        }
        case "ssh-ed25519": {
            ((KeyEd25519) (this.body))._fetchInstances();
            break;
        }
        case "ssh-rsa": {
            ((KeyRsa) (this.body))._fetchInstances();
            break;
        }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.keyName._write_Seq(this._io);
        switch (keyName().value()) {
        case "ecdsa-sha2-nistp256": {
            ((KeyEcdsa) (this.body))._write_Seq(this._io);
            break;
        }
        case "ssh-dss": {
            ((KeyDsa) (this.body))._write_Seq(this._io);
            break;
        }
        case "ssh-ed25519": {
            ((KeyEd25519) (this.body))._write_Seq(this._io);
            break;
        }
        case "ssh-rsa": {
            ((KeyRsa) (this.body))._write_Seq(this._io);
            break;
        }
        }
    }

    public void _check() {
        if (!Objects.equals(this.keyName._root(), _root()))
            throw new ConsistencyError("key_name", _root(), this.keyName._root());
        if (!Objects.equals(this.keyName._parent(), this))
            throw new ConsistencyError("key_name", this, this.keyName._parent());
        switch (keyName().value()) {
        case "ecdsa-sha2-nistp256": {
            if (!Objects.equals(((SshPublicKey.KeyEcdsa) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((SshPublicKey.KeyEcdsa) (this.body))._root());
            if (!Objects.equals(((SshPublicKey.KeyEcdsa) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((SshPublicKey.KeyEcdsa) (this.body))._parent());
            break;
        }
        case "ssh-dss": {
            if (!Objects.equals(((SshPublicKey.KeyDsa) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((SshPublicKey.KeyDsa) (this.body))._root());
            if (!Objects.equals(((SshPublicKey.KeyDsa) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((SshPublicKey.KeyDsa) (this.body))._parent());
            break;
        }
        case "ssh-ed25519": {
            if (!Objects.equals(((SshPublicKey.KeyEd25519) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((SshPublicKey.KeyEd25519) (this.body))._root());
            if (!Objects.equals(((SshPublicKey.KeyEd25519) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((SshPublicKey.KeyEd25519) (this.body))._parent());
            break;
        }
        case "ssh-rsa": {
            if (!Objects.equals(((SshPublicKey.KeyRsa) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((SshPublicKey.KeyRsa) (this.body))._root());
            if (!Objects.equals(((SshPublicKey.KeyRsa) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((SshPublicKey.KeyRsa) (this.body))._parent());
            break;
        }
        }
        _dirty = false;
    }

    /**
     * Big integers serialization format used by ssh, v2. In the code, the following
     * routines are used to read/write it:
     * 
     * * sshbuf_get_bignum2
     * * sshbuf_get_bignum2_bytes_direct
     * * sshbuf_put_bignum2
     * * sshbuf_get_bignum2_bytes_direct
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
     * https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
     * ">Source</a>
     */
    public static class Bignum2 extends KaitaiStruct.ReadWrite {
        public static Bignum2 fromFile(String fileName) throws IOException {
            return new Bignum2(new ByteBufferKaitaiStream(fileName));
        }
        public Bignum2() {
            this(null, null, null);
        }

        public Bignum2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bignum2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Bignum2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4be();
            this.body = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.len);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != len())
                throw new ConsistencyError("body", len(), this.body.length);
            _dirty = false;
        }
        private Integer lengthInBits;

        /**
         * Length of big integer in bits. In OpenSSH sources, this corresponds to
         * `BN_num_bits` function.
         */
        public Integer lengthInBits() {
            if (this.lengthInBits != null)
                return this.lengthInBits;
            this.lengthInBits = ((Number) ((len() - 1) * 8)).intValue();
            return this.lengthInBits;
        }
        public void _invalidateLengthInBits() { this.lengthInBits = null; }
        private long len;
        private byte[] body;
        private SshPublicKey _root;
        private KaitaiStruct.ReadWrite _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
     * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
     * obscure misnomer, as typically "C string" means a null-terminated string.
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181">Source</a>
     */
    public static class Cstring extends KaitaiStruct.ReadWrite {
        public static Cstring fromFile(String fileName) throws IOException {
            return new Cstring(new ByteBufferKaitaiStream(fileName));
        }
        public Cstring() {
            this(null, null, null);
        }

        public Cstring(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4be();
            this.value = new String(this._io.readBytes(len()), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.len);
            this._io.writeBytes((this.value).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if ((this.value).getBytes(Charset.forName("ASCII")).length != len())
                throw new ConsistencyError("value", len(), (this.value).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private long len;
        private String value;
        private SshPublicKey _root;
        private KaitaiStruct.ReadWrite _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public String value() { return value; }
        public void setValue(String _v) { _dirty = true; value = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Elliptic curve dump format used by ssh. In OpenSSH code, the following
     * routines are used to read/write it:
     * 
     * * sshbuf_get_ec
     * * get_ec
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
     * https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
     * ">Source</a>
     */
    public static class EllipticCurve extends KaitaiStruct.ReadWrite {
        public static EllipticCurve fromFile(String fileName) throws IOException {
            return new EllipticCurve(new ByteBufferKaitaiStream(fileName));
        }
        public EllipticCurve() {
            this(null, null, null);
        }

        public EllipticCurve(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EllipticCurve(KaitaiStream _io, SshPublicKey.KeyEcdsa _parent) {
            this(_io, _parent, null);
        }

        public EllipticCurve(KaitaiStream _io, SshPublicKey.KeyEcdsa _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4be();
            this.body = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.len);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != len())
                throw new ConsistencyError("body", len(), this.body.length);
            _dirty = false;
        }
        private long len;
        private byte[] body;
        private SshPublicKey _root;
        private SshPublicKey.KeyEcdsa _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public SshPublicKey.KeyEcdsa _parent() { return _parent; }
        public void set_parent(SshPublicKey.KeyEcdsa _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051">Source</a>
     */
    public static class KeyDsa extends KaitaiStruct.ReadWrite {
        public static KeyDsa fromFile(String fileName) throws IOException {
            return new KeyDsa(new ByteBufferKaitaiStream(fileName));
        }
        public KeyDsa() {
            this(null, null, null);
        }

        public KeyDsa(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyDsa(KaitaiStream _io, SshPublicKey _parent) {
            this(_io, _parent, null);
        }

        public KeyDsa(KaitaiStream _io, SshPublicKey _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.dsaP = new Bignum2(this._io, this, _root);
            this.dsaP._read();
            this.dsaQ = new Bignum2(this._io, this, _root);
            this.dsaQ._read();
            this.dsaG = new Bignum2(this._io, this, _root);
            this.dsaG._read();
            this.dsaPubKey = new Bignum2(this._io, this, _root);
            this.dsaPubKey._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.dsaP._fetchInstances();
            this.dsaQ._fetchInstances();
            this.dsaG._fetchInstances();
            this.dsaPubKey._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.dsaP._write_Seq(this._io);
            this.dsaQ._write_Seq(this._io);
            this.dsaG._write_Seq(this._io);
            this.dsaPubKey._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.dsaP._root(), _root()))
                throw new ConsistencyError("dsa_p", _root(), this.dsaP._root());
            if (!Objects.equals(this.dsaP._parent(), this))
                throw new ConsistencyError("dsa_p", this, this.dsaP._parent());
            if (!Objects.equals(this.dsaQ._root(), _root()))
                throw new ConsistencyError("dsa_q", _root(), this.dsaQ._root());
            if (!Objects.equals(this.dsaQ._parent(), this))
                throw new ConsistencyError("dsa_q", this, this.dsaQ._parent());
            if (!Objects.equals(this.dsaG._root(), _root()))
                throw new ConsistencyError("dsa_g", _root(), this.dsaG._root());
            if (!Objects.equals(this.dsaG._parent(), this))
                throw new ConsistencyError("dsa_g", this, this.dsaG._parent());
            if (!Objects.equals(this.dsaPubKey._root(), _root()))
                throw new ConsistencyError("dsa_pub_key", _root(), this.dsaPubKey._root());
            if (!Objects.equals(this.dsaPubKey._parent(), this))
                throw new ConsistencyError("dsa_pub_key", this, this.dsaPubKey._parent());
            _dirty = false;
        }
        private Bignum2 dsaP;
        private Bignum2 dsaQ;
        private Bignum2 dsaG;
        private Bignum2 dsaPubKey;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public Bignum2 dsaP() { return dsaP; }
        public void setDsaP(Bignum2 _v) { _dirty = true; dsaP = _v; }
        public Bignum2 dsaQ() { return dsaQ; }
        public void setDsaQ(Bignum2 _v) { _dirty = true; dsaQ = _v; }
        public Bignum2 dsaG() { return dsaG; }
        public void setDsaG(Bignum2 _v) { _dirty = true; dsaG = _v; }
        public Bignum2 dsaPubKey() { return dsaPubKey; }
        public void setDsaPubKey(Bignum2 _v) { _dirty = true; dsaPubKey = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public SshPublicKey _parent() { return _parent; }
        public void set_parent(SshPublicKey _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103">Source</a>
     */
    public static class KeyEcdsa extends KaitaiStruct.ReadWrite {
        public static KeyEcdsa fromFile(String fileName) throws IOException {
            return new KeyEcdsa(new ByteBufferKaitaiStream(fileName));
        }
        public KeyEcdsa() {
            this(null, null, null);
        }

        public KeyEcdsa(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyEcdsa(KaitaiStream _io, SshPublicKey _parent) {
            this(_io, _parent, null);
        }

        public KeyEcdsa(KaitaiStream _io, SshPublicKey _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.curveName = new Cstring(this._io, this, _root);
            this.curveName._read();
            this.ec = new EllipticCurve(this._io, this, _root);
            this.ec._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.curveName._fetchInstances();
            this.ec._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.curveName._write_Seq(this._io);
            this.ec._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.curveName._root(), _root()))
                throw new ConsistencyError("curve_name", _root(), this.curveName._root());
            if (!Objects.equals(this.curveName._parent(), this))
                throw new ConsistencyError("curve_name", this, this.curveName._parent());
            if (!Objects.equals(this.ec._root(), _root()))
                throw new ConsistencyError("ec", _root(), this.ec._root());
            if (!Objects.equals(this.ec._parent(), this))
                throw new ConsistencyError("ec", this, this.ec._parent());
            _dirty = false;
        }
        private Cstring curveName;
        private EllipticCurve ec;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public Cstring curveName() { return curveName; }
        public void setCurveName(Cstring _v) { _dirty = true; curveName = _v; }
        public EllipticCurve ec() { return ec; }
        public void setEc(EllipticCurve _v) { _dirty = true; ec = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public SshPublicKey _parent() { return _parent; }
        public void set_parent(SshPublicKey _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124">Source</a>
     */
    public static class KeyEd25519 extends KaitaiStruct.ReadWrite {
        public static KeyEd25519 fromFile(String fileName) throws IOException {
            return new KeyEd25519(new ByteBufferKaitaiStream(fileName));
        }
        public KeyEd25519() {
            this(null, null, null);
        }

        public KeyEd25519(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyEd25519(KaitaiStream _io, SshPublicKey _parent) {
            this(_io, _parent, null);
        }

        public KeyEd25519(KaitaiStream _io, SshPublicKey _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenPk = this._io.readU4be();
            this.pk = this._io.readBytes(lenPk());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.lenPk);
            this._io.writeBytes(this.pk);
        }

        public void _check() {
            if (this.pk.length != lenPk())
                throw new ConsistencyError("pk", lenPk(), this.pk.length);
            _dirty = false;
        }
        private long lenPk;
        private byte[] pk;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public long lenPk() { return lenPk; }
        public void setLenPk(long _v) { _dirty = true; lenPk = _v; }
        public byte[] pk() { return pk; }
        public void setPk(byte[] _v) { _dirty = true; pk = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public SshPublicKey _parent() { return _parent; }
        public void set_parent(SshPublicKey _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028">Source</a>
     */
    public static class KeyRsa extends KaitaiStruct.ReadWrite {
        public static KeyRsa fromFile(String fileName) throws IOException {
            return new KeyRsa(new ByteBufferKaitaiStream(fileName));
        }
        public KeyRsa() {
            this(null, null, null);
        }

        public KeyRsa(KaitaiStream _io) {
            this(_io, null, null);
        }

        public KeyRsa(KaitaiStream _io, SshPublicKey _parent) {
            this(_io, _parent, null);
        }

        public KeyRsa(KaitaiStream _io, SshPublicKey _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.rsaE = new Bignum2(this._io, this, _root);
            this.rsaE._read();
            this.rsaN = new Bignum2(this._io, this, _root);
            this.rsaN._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.rsaE._fetchInstances();
            this.rsaN._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.rsaE._write_Seq(this._io);
            this.rsaN._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.rsaE._root(), _root()))
                throw new ConsistencyError("rsa_e", _root(), this.rsaE._root());
            if (!Objects.equals(this.rsaE._parent(), this))
                throw new ConsistencyError("rsa_e", this, this.rsaE._parent());
            if (!Objects.equals(this.rsaN._root(), _root()))
                throw new ConsistencyError("rsa_n", _root(), this.rsaN._root());
            if (!Objects.equals(this.rsaN._parent(), this))
                throw new ConsistencyError("rsa_n", this, this.rsaN._parent());
            _dirty = false;
        }
        private Integer keyLength;

        /**
         * Key length in bits
         */
        public Integer keyLength() {
            if (this.keyLength != null)
                return this.keyLength;
            this.keyLength = ((Number) (rsaN().lengthInBits())).intValue();
            return this.keyLength;
        }
        public void _invalidateKeyLength() { this.keyLength = null; }
        private Bignum2 rsaE;
        private Bignum2 rsaN;
        private SshPublicKey _root;
        private SshPublicKey _parent;

        /**
         * Public key exponent, designated `e` in RSA documentation.
         */
        public Bignum2 rsaE() { return rsaE; }
        public void setRsaE(Bignum2 _v) { _dirty = true; rsaE = _v; }

        /**
         * Modulus of both public and private keys, designated `n` in RSA
         * documentation. Its length in bits is designated as "key length".
         */
        public Bignum2 rsaN() { return rsaN; }
        public void setRsaN(Bignum2 _v) { _dirty = true; rsaN = _v; }
        public SshPublicKey _root() { return _root; }
        public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
        public SshPublicKey _parent() { return _parent; }
        public void set_parent(SshPublicKey _v) { _dirty = true; _parent = _v; }
    }
    private Cstring keyName;
    private KaitaiStruct.ReadWrite body;
    private SshPublicKey _root;
    private KaitaiStruct.ReadWrite _parent;
    public Cstring keyName() { return keyName; }
    public void setKeyName(Cstring _v) { _dirty = true; keyName = _v; }
    public KaitaiStruct.ReadWrite body() { return body; }
    public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
    public SshPublicKey _root() { return _root; }
    public void set_root(SshPublicKey _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
