// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.SshPublicKey = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
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
 * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L1970|Source}
 */

var SshPublicKey = (function() {
  function SshPublicKey(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SshPublicKey.prototype._read = function() {
    this.keyName = new Cstring(this._io, this, this._root);
    switch (this.keyName.value) {
    case "ssh-rsa":
      this.body = new KeyRsa(this._io, this, this._root);
      break;
    case "ecdsa-sha2-nistp256":
      this.body = new KeyEcdsa(this._io, this, this._root);
      break;
    case "ssh-ed25519":
      this.body = new KeyEd25519(this._io, this, this._root);
      break;
    case "ssh-dss":
      this.body = new KeyDsa(this._io, this, this._root);
      break;
    }
  }

  /**
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2011-L2028|Source}
   */

  var KeyRsa = SshPublicKey.KeyRsa = (function() {
    function KeyRsa(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyRsa.prototype._read = function() {
      this.rsaE = new Bignum2(this._io, this, this._root);
      this.rsaN = new Bignum2(this._io, this, this._root);
    }

    /**
     * Key length in bits
     */
    Object.defineProperty(KeyRsa.prototype, 'keyLength', {
      get: function() {
        if (this._m_keyLength !== undefined)
          return this._m_keyLength;
        this._m_keyLength = this.rsaN.lengthInBits;
        return this._m_keyLength;
      }
    });

    /**
     * Public key exponent, designated `e` in RSA documentation.
     */

    /**
     * Modulus of both public and private keys, designated `n` in RSA
     * documentation. Its length in bits is designated as "key length".
     */

    return KeyRsa;
  })();

  /**
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2111-L2124|Source}
   */

  var KeyEd25519 = SshPublicKey.KeyEd25519 = (function() {
    function KeyEd25519(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyEd25519.prototype._read = function() {
      this.lenPk = this._io.readU4be();
      this.pk = this._io.readBytes(this.lenPk);
    }

    return KeyEd25519;
  })();

  /**
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2060-L2103|Source}
   */

  var KeyEcdsa = SshPublicKey.KeyEcdsa = (function() {
    function KeyEcdsa(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyEcdsa.prototype._read = function() {
      this.curveName = new Cstring(this._io, this, this._root);
      this.ec = new EllipticCurve(this._io, this, this._root);
    }

    return KeyEcdsa;
  })();

  /**
   * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
   * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
   * obscure misnomer, as typically "C string" means a null-terminated string.
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L181|Source}
   */

  var Cstring = SshPublicKey.Cstring = (function() {
    function Cstring(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Cstring.prototype._read = function() {
      this.len = this._io.readU4be();
      this.value = KaitaiStream.bytesToStr(this._io.readBytes(this.len), "ASCII");
    }

    return Cstring;
  })();

  /**
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2036-L2051|Source}
   */

  var KeyDsa = SshPublicKey.KeyDsa = (function() {
    function KeyDsa(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyDsa.prototype._read = function() {
      this.dsaP = new Bignum2(this._io, this, this._root);
      this.dsaQ = new Bignum2(this._io, this, this._root);
      this.dsaG = new Bignum2(this._io, this, this._root);
      this.dsaPubKey = new Bignum2(this._io, this, this._root);
    }

    return KeyDsa;
  })();

  /**
   * Elliptic curve dump format used by ssh. In OpenSSH code, the following
   * routines are used to read/write it:
   * 
   * * sshbuf_get_ec
   * * get_ec
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L90
   * https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L76
   * |Source}
   */

  var EllipticCurve = SshPublicKey.EllipticCurve = (function() {
    function EllipticCurve(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EllipticCurve.prototype._read = function() {
      this.len = this._io.readU4be();
      this.body = this._io.readBytes(this.len);
    }

    return EllipticCurve;
  })();

  /**
   * Big integers serialization format used by ssh, v2. In the code, the following
   * routines are used to read/write it:
   * 
   * * sshbuf_get_bignum2
   * * sshbuf_get_bignum2_bytes_direct
   * * sshbuf_put_bignum2
   * * sshbuf_get_bignum2_bytes_direct
   * @see {@link https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L35
   * https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L431
   * |Source}
   */

  var Bignum2 = SshPublicKey.Bignum2 = (function() {
    function Bignum2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bignum2.prototype._read = function() {
      this.len = this._io.readU4be();
      this.body = this._io.readBytes(this.len);
    }

    /**
     * Length of big integer in bits. In OpenSSH sources, this corresponds to
     * `BN_num_bits` function.
     */
    Object.defineProperty(Bignum2.prototype, 'lengthInBits', {
      get: function() {
        if (this._m_lengthInBits !== undefined)
          return this._m_lengthInBits;
        this._m_lengthInBits = ((this.len - 1) * 8);
        return this._m_lengthInBits;
      }
    });

    return Bignum2;
  })();

  return SshPublicKey;
})();
return SshPublicKey;
}));
