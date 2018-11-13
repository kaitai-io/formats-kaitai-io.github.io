<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

class SshPublicKey extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_keyName = new \SshPublicKey\Cstring($this->_io, $this, $this->_root);
        switch ($this->keyName()->value()) {
            case "ssh-rsa":
                $this->_m_body = new \SshPublicKey\KeyRsa($this->_io, $this, $this->_root);
                break;
            case "ecdsa-sha2-nistp256":
                $this->_m_body = new \SshPublicKey\KeyEcdsa($this->_io, $this, $this->_root);
                break;
            case "ssh-ed25519":
                $this->_m_body = new \SshPublicKey\KeyEd25519($this->_io, $this, $this->_root);
                break;
            case "ssh-dss":
                $this->_m_body = new \SshPublicKey\KeyDsa($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_keyName;
    protected $_m_body;
    public function keyName() { return $this->_m_keyName; }
    public function body() { return $this->_m_body; }
}

namespace \SshPublicKey;

class KeyRsa extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SshPublicKey $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_rsaE = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
        $this->_m_rsaN = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
    }
    protected $_m_keyLength;

    /**
     * Key length in bits
     */
    public function keyLength() {
        if ($this->_m_keyLength !== null)
            return $this->_m_keyLength;
        $this->_m_keyLength = $this->rsaN()->lengthInBits();
        return $this->_m_keyLength;
    }
    protected $_m_rsaE;
    protected $_m_rsaN;

    /**
     * Public key exponent, designated `e` in RSA documentation.
     */
    public function rsaE() { return $this->_m_rsaE; }

    /**
     * Modulus of both public and private keys, designated `n` in RSA
     * documentation. Its length in bits is designated as "key length".
     */
    public function rsaN() { return $this->_m_rsaN; }
}

namespace \SshPublicKey;

class KeyEd25519 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SshPublicKey $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenPk = $this->_io->readU4be();
        $this->_m_pk = $this->_io->readBytes($this->lenPk());
    }
    protected $_m_lenPk;
    protected $_m_pk;
    public function lenPk() { return $this->_m_lenPk; }
    public function pk() { return $this->_m_pk; }
}

namespace \SshPublicKey;

class KeyEcdsa extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SshPublicKey $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_curveName = new \SshPublicKey\Cstring($this->_io, $this, $this->_root);
        $this->_m_ec = new \SshPublicKey\EllipticCurve($this->_io, $this, $this->_root);
    }
    protected $_m_curveName;
    protected $_m_ec;
    public function curveName() { return $this->_m_curveName; }
    public function ec() { return $this->_m_ec; }
}

/**
 * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
 * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
 * obscure misnomer, as typically "C string" means a null-terminated string.
 */

namespace \SshPublicKey;

class Cstring extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU4be();
        $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->len()), "ASCII");
    }
    protected $_m_len;
    protected $_m_value;
    public function len() { return $this->_m_len; }
    public function value() { return $this->_m_value; }
}

namespace \SshPublicKey;

class KeyDsa extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SshPublicKey $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dsaP = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
        $this->_m_dsaQ = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
        $this->_m_dsaG = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
        $this->_m_dsaPubKey = new \SshPublicKey\Bignum2($this->_io, $this, $this->_root);
    }
    protected $_m_dsaP;
    protected $_m_dsaQ;
    protected $_m_dsaG;
    protected $_m_dsaPubKey;
    public function dsaP() { return $this->_m_dsaP; }
    public function dsaQ() { return $this->_m_dsaQ; }
    public function dsaG() { return $this->_m_dsaG; }
    public function dsaPubKey() { return $this->_m_dsaPubKey; }
}

/**
 * Elliptic curve dump format used by ssh. In OpenSSH code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_ec
 * * get_ec
 */

namespace \SshPublicKey;

class EllipticCurve extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SshPublicKey\KeyEcdsa $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU4be();
        $this->_m_body = $this->_io->readBytes($this->len());
    }
    protected $_m_len;
    protected $_m_body;
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
}

/**
 * Big integers serialization format used by ssh, v2. In the code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 * * sshbuf_put_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 */

namespace \SshPublicKey;

class Bignum2 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SshPublicKey $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU4be();
        $this->_m_body = $this->_io->readBytes($this->len());
    }
    protected $_m_lengthInBits;

    /**
     * Length of big integer in bits. In OpenSSH sources, this corresponds to
     * `BN_num_bits` function.
     */
    public function lengthInBits() {
        if ($this->_m_lengthInBits !== null)
            return $this->_m_lengthInBits;
        $this->_m_lengthInBits = (($this->len() - 1) * 8);
        return $this->_m_lengthInBits;
    }
    protected $_m_len;
    protected $_m_body;
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
}
