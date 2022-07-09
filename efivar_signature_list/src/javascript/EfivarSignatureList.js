// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.EfivarSignatureList = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
 * ("d719b2cb-3d3a-4596-a3bc-dad00e67656f" is defined as
 * EFI_IMAGE_SECURITY_DATABASE_GUID and "8be4df61-93ca-11d2-aa0d-00e098032b8c"
 * as EFI_GLOBAL_VARIABLE).
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * EFI_SIGNATURE_LIST structures.
 * @see {@link https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf|Source}
 */

var EfivarSignatureList = (function() {
  function EfivarSignatureList(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  EfivarSignatureList.prototype._read = function() {
    this.varAttributes = new EfiVarAttr(this._io, this, this._root);
    this.signatures = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.signatures.push(new SignatureList(this._io, this, this._root));
      i++;
    }
  }

  /**
   * @see EFI_SIGNATURE_LIST
   */

  var SignatureList = EfivarSignatureList.SignatureList = (function() {
    function SignatureList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignatureList.prototype._read = function() {
      this.signatureType = this._io.readBytes(16);
      this.lenSignatureList = this._io.readU4le();
      this.lenSignatureHeader = this._io.readU4le();
      this.lenSignature = this._io.readU4le();
      this.header = this._io.readBytes(this.lenSignatureHeader);
      if (this.lenSignature > 0) {
        this._raw_signatures = [];
        this.signatures = [];
        for (var i = 0; i < Math.floor(((this.lenSignatureList - this.lenSignatureHeader) - 28) / this.lenSignature); i++) {
          this._raw_signatures.push(this._io.readBytes(this.lenSignature));
          var _io__raw_signatures = new KaitaiStream(this._raw_signatures[i]);
          this.signatures.push(new SignatureData(_io__raw_signatures, this, this._root));
        }
      }
    }

    /**
     * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * @see EFI_CERT_X509_SHA512_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha512X509', {
      get: function() {
        if (this._m_isCertSha512X509 !== undefined)
          return this._m_isCertSha512X509;
        this._m_isCertSha512X509 = (KaitaiStream.byteArrayCompare(this.signatureType, [99, 191, 109, 68, 2, 37, 218, 76, 188, 250, 36, 101, 210, 176, 254, 157]) == 0);
        return this._m_isCertSha512X509;
      }
    });

    /**
     * SHA-224 hash
     * @see EFI_CERT_SHA224_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha224', {
      get: function() {
        if (this._m_isCertSha224 !== undefined)
          return this._m_isCertSha224;
        this._m_isCertSha224 = (KaitaiStream.byteArrayCompare(this.signatureType, [51, 82, 110, 11, 92, 166, 201, 68, 148, 7, 217, 171, 131, 191, 200, 189]) == 0);
        return this._m_isCertSha224;
      }
    });

    /**
     * X.509 certificate
     * @see EFI_CERT_X509_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertX509', {
      get: function() {
        if (this._m_isCertX509 !== undefined)
          return this._m_isCertX509;
        this._m_isCertX509 = (KaitaiStream.byteArrayCompare(this.signatureType, [161, 89, 192, 165, 228, 148, 167, 74, 135, 181, 171, 21, 92, 43, 240, 114]) == 0);
        return this._m_isCertX509;
      }
    });

    /**
     * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * @see EFI_CERT_X509_SHA256_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha256X509', {
      get: function() {
        if (this._m_isCertSha256X509 !== undefined)
          return this._m_isCertSha256X509;
        this._m_isCertSha256X509 = (KaitaiStream.byteArrayCompare(this.signatureType, [146, 164, 210, 59, 192, 150, 121, 64, 180, 32, 252, 249, 142, 241, 3, 237]) == 0);
        return this._m_isCertSha256X509;
      }
    });

    /**
     * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
     * @see EFI_CERT_RSA2048_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertRsa2048Key', {
      get: function() {
        if (this._m_isCertRsa2048Key !== undefined)
          return this._m_isCertRsa2048Key;
        this._m_isCertRsa2048Key = (KaitaiStream.byteArrayCompare(this.signatureType, [232, 102, 87, 60, 156, 38, 52, 78, 170, 20, 237, 119, 110, 133, 179, 182]) == 0);
        return this._m_isCertRsa2048Key;
      }
    });

    /**
     * SHA-512 hash
     * @see EFI_CERT_SHA512_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha512', {
      get: function() {
        if (this._m_isCertSha512 !== undefined)
          return this._m_isCertSha512;
        this._m_isCertSha512 = (KaitaiStream.byteArrayCompare(this.signatureType, [174, 15, 62, 9, 196, 166, 80, 79, 159, 27, 212, 30, 43, 137, 193, 154]) == 0);
        return this._m_isCertSha512;
      }
    });

    /**
     * SHA-384 hash
     * @see EFI_CERT_SHA384_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha384', {
      get: function() {
        if (this._m_isCertSha384 !== undefined)
          return this._m_isCertSha384;
        this._m_isCertSha384 = (KaitaiStream.byteArrayCompare(this.signatureType, [7, 83, 62, 255, 208, 159, 201, 72, 133, 241, 138, 213, 108, 112, 30, 1]) == 0);
        return this._m_isCertSha384;
      }
    });

    /**
     * SHA-1 hash
     * @see EFI_CERT_SHA1_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha1', {
      get: function() {
        if (this._m_isCertSha1 !== undefined)
          return this._m_isCertSha1;
        this._m_isCertSha1 = (KaitaiStream.byteArrayCompare(this.signatureType, [18, 165, 108, 130, 16, 207, 201, 74, 177, 135, 190, 1, 73, 102, 49, 189]) == 0);
        return this._m_isCertSha1;
      }
    });

    /**
     * RSA-2048 signature of a SHA-1 hash
     * @see EFI_CERT_RSA2048_SHA1_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertRsa2048Sha1', {
      get: function() {
        if (this._m_isCertRsa2048Sha1 !== undefined)
          return this._m_isCertRsa2048Sha1;
        this._m_isCertRsa2048Sha1 = (KaitaiStream.byteArrayCompare(this.signatureType, [79, 68, 248, 103, 67, 135, 241, 72, 163, 40, 30, 170, 184, 115, 96, 128]) == 0);
        return this._m_isCertRsa2048Sha1;
      }
    });

    /**
     * SHA-256 hash
     * @see EFI_CERT_SHA256_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha256', {
      get: function() {
        if (this._m_isCertSha256 !== undefined)
          return this._m_isCertSha256;
        this._m_isCertSha256 = (KaitaiStream.byteArrayCompare(this.signatureType, [38, 22, 196, 193, 76, 80, 146, 64, 172, 169, 65, 249, 54, 147, 67, 40]) == 0);
        return this._m_isCertSha256;
      }
    });

    /**
     * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * @see EFI_CERT_X509_SHA384_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertSha384X509', {
      get: function() {
        if (this._m_isCertSha384X509 !== undefined)
          return this._m_isCertSha384X509;
        this._m_isCertSha384X509 = (KaitaiStream.byteArrayCompare(this.signatureType, [110, 135, 118, 112, 194, 128, 230, 78, 170, 210, 40, 179, 73, 166, 134, 91]) == 0);
        return this._m_isCertSha384X509;
      }
    });

    /**
     * RSA-2048 signature of a SHA-256 hash
     * @see EFI_CERT_RSA2048_SHA256_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertRsa2048Sha256', {
      get: function() {
        if (this._m_isCertRsa2048Sha256 !== undefined)
          return this._m_isCertRsa2048Sha256;
        this._m_isCertRsa2048Sha256 = (KaitaiStream.byteArrayCompare(this.signatureType, [144, 97, 179, 226, 155, 135, 61, 74, 173, 141, 242, 231, 187, 163, 39, 132]) == 0);
        return this._m_isCertRsa2048Sha256;
      }
    });

    /**
     * DER-encoded PKCS #7 version 1.5 [RFC2315]
     * @see EFI_CERT_TYPE_PKCS7_GUID
     */
    Object.defineProperty(SignatureList.prototype, 'isCertDerPkcs7', {
      get: function() {
        if (this._m_isCertDerPkcs7 !== undefined)
          return this._m_isCertDerPkcs7;
        this._m_isCertDerPkcs7 = (KaitaiStream.byteArrayCompare(this.signatureType, [157, 210, 175, 74, 223, 104, 238, 73, 138, 169, 52, 125, 55, 86, 101, 167]) == 0);
        return this._m_isCertDerPkcs7;
      }
    });

    /**
     * Type of the signature as a GUID
     */

    /**
     * Total size of the signature list, including this header
     */

    /**
     * Size of the signature header which precedes the array of signatures
     */

    /**
     * Size of each signature
     */

    /**
     * Header before the array of signatures
     */

    /**
     * An array of signatures
     */

    return SignatureList;
  })();

  /**
   * @see EFI_SIGNATURE_DATA
   */

  var SignatureData = EfivarSignatureList.SignatureData = (function() {
    function SignatureData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignatureData.prototype._read = function() {
      this.owner = this._io.readBytes(16);
      this.data = this._io.readBytesFull();
    }

    /**
     * An identifier which identifies the agent which added the signature to the list
     */

    /**
     * The format of the signature is defined by the SignatureType.
     */

    return SignatureData;
  })();

  /**
   * Attributes of a UEFI variable
   */

  var EfiVarAttr = EfivarSignatureList.EfiVarAttr = (function() {
    function EfiVarAttr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EfiVarAttr.prototype._read = function() {
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

    /**
     * Reserved (unused) bits
     */

    return EfiVarAttr;
  })();

  /**
   * Attributes of the UEFI variable
   */

  return EfivarSignatureList;
})();
return EfivarSignatureList;
}));
