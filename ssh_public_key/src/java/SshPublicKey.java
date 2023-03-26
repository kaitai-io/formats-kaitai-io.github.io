// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
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
public class SshPublicKey extends KaitaiStruct {
    public static SshPublicKey fromFile(String fileName) throws IOException {
        return new SshPublicKey(new ByteBufferKaitaiStream(fileName));
    }

    public SshPublicKey(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SshPublicKey(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SshPublicKey(KaitaiStream _io, KaitaiStruct _parent, SshPublicKey _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.keyName = new Cstring(this._io, this, _root);
        switch (keyName().value()) {
        case "ssh-rsa": {
            this.body = new KeyRsa(this._io, this, _root);
            break;
        }
        case "ecdsa-sha2-nistp256": {
            this.body = new KeyEcdsa(this._io, this, _root);
            break;
        }
        case "ssh-ed25519": {
            this.body = new KeyEd25519(this._io, this, _root);
            break;
        }
        case "ssh-dss": {
            this.body = new KeyDsa(this._io, this, _root);
            break;
        }
        }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028">Source</a>
     */
    public static class KeyRsa extends KaitaiStruct {
        public static KeyRsa fromFile(String fileName) throws IOException {
            return new KeyRsa(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.rsaE = new Bignum2(this._io, this, _root);
            this.rsaN = new Bignum2(this._io, this, _root);
        }
        private Integer keyLength;

        /**
         * Key length in bits
         */
        public Integer keyLength() {
            if (this.keyLength != null)
                return this.keyLength;
            int _tmp = (int) (rsaN().lengthInBits());
            this.keyLength = _tmp;
            return this.keyLength;
        }
        private Bignum2 rsaE;
        private Bignum2 rsaN;
        private SshPublicKey _root;
        private SshPublicKey _parent;

        /**
         * Public key exponent, designated `e` in RSA documentation.
         */
        public Bignum2 rsaE() { return rsaE; }

        /**
         * Modulus of both public and private keys, designated `n` in RSA
         * documentation. Its length in bits is designated as "key length".
         */
        public Bignum2 rsaN() { return rsaN; }
        public SshPublicKey _root() { return _root; }
        public SshPublicKey _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124">Source</a>
     */
    public static class KeyEd25519 extends KaitaiStruct {
        public static KeyEd25519 fromFile(String fileName) throws IOException {
            return new KeyEd25519(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenPk = this._io.readU4be();
            this.pk = this._io.readBytes(lenPk());
        }
        private long lenPk;
        private byte[] pk;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public long lenPk() { return lenPk; }
        public byte[] pk() { return pk; }
        public SshPublicKey _root() { return _root; }
        public SshPublicKey _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103">Source</a>
     */
    public static class KeyEcdsa extends KaitaiStruct {
        public static KeyEcdsa fromFile(String fileName) throws IOException {
            return new KeyEcdsa(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.curveName = new Cstring(this._io, this, _root);
            this.ec = new EllipticCurve(this._io, this, _root);
        }
        private Cstring curveName;
        private EllipticCurve ec;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public Cstring curveName() { return curveName; }
        public EllipticCurve ec() { return ec; }
        public SshPublicKey _root() { return _root; }
        public SshPublicKey _parent() { return _parent; }
    }

    /**
     * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
     * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
     * obscure misnomer, as typically "C string" means a null-terminated string.
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181">Source</a>
     */
    public static class Cstring extends KaitaiStruct {
        public static Cstring fromFile(String fileName) throws IOException {
            return new Cstring(new ByteBufferKaitaiStream(fileName));
        }

        public Cstring(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU4be();
            this.value = new String(this._io.readBytes(len()), Charset.forName("ASCII"));
        }
        private long len;
        private String value;
        private SshPublicKey _root;
        private KaitaiStruct _parent;
        public long len() { return len; }
        public String value() { return value; }
        public SshPublicKey _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051">Source</a>
     */
    public static class KeyDsa extends KaitaiStruct {
        public static KeyDsa fromFile(String fileName) throws IOException {
            return new KeyDsa(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.dsaP = new Bignum2(this._io, this, _root);
            this.dsaQ = new Bignum2(this._io, this, _root);
            this.dsaG = new Bignum2(this._io, this, _root);
            this.dsaPubKey = new Bignum2(this._io, this, _root);
        }
        private Bignum2 dsaP;
        private Bignum2 dsaQ;
        private Bignum2 dsaG;
        private Bignum2 dsaPubKey;
        private SshPublicKey _root;
        private SshPublicKey _parent;
        public Bignum2 dsaP() { return dsaP; }
        public Bignum2 dsaQ() { return dsaQ; }
        public Bignum2 dsaG() { return dsaG; }
        public Bignum2 dsaPubKey() { return dsaPubKey; }
        public SshPublicKey _root() { return _root; }
        public SshPublicKey _parent() { return _parent; }
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
    public static class EllipticCurve extends KaitaiStruct {
        public static EllipticCurve fromFile(String fileName) throws IOException {
            return new EllipticCurve(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.len = this._io.readU4be();
            this.body = this._io.readBytes(len());
        }
        private long len;
        private byte[] body;
        private SshPublicKey _root;
        private SshPublicKey.KeyEcdsa _parent;
        public long len() { return len; }
        public byte[] body() { return body; }
        public SshPublicKey _root() { return _root; }
        public SshPublicKey.KeyEcdsa _parent() { return _parent; }
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
    public static class Bignum2 extends KaitaiStruct {
        public static Bignum2 fromFile(String fileName) throws IOException {
            return new Bignum2(new ByteBufferKaitaiStream(fileName));
        }

        public Bignum2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bignum2(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Bignum2(KaitaiStream _io, KaitaiStruct _parent, SshPublicKey _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU4be();
            this.body = this._io.readBytes(len());
        }
        private Integer lengthInBits;

        /**
         * Length of big integer in bits. In OpenSSH sources, this corresponds to
         * `BN_num_bits` function.
         */
        public Integer lengthInBits() {
            if (this.lengthInBits != null)
                return this.lengthInBits;
            int _tmp = (int) (((len() - 1) * 8));
            this.lengthInBits = _tmp;
            return this.lengthInBits;
        }
        private long len;
        private byte[] body;
        private SshPublicKey _root;
        private KaitaiStruct _parent;
        public long len() { return len; }
        public byte[] body() { return body; }
        public SshPublicKey _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Cstring keyName;
    private KaitaiStruct body;
    private SshPublicKey _root;
    private KaitaiStruct _parent;
    public Cstring keyName() { return keyName; }
    public KaitaiStruct body() { return body; }
    public SshPublicKey _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
