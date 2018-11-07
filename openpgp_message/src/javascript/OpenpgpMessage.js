// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.OpenpgpMessage = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * @see {@link https://tools.ietf.org/html/rfc4880|Source}
 */

var OpenpgpMessage = (function() {
  OpenpgpMessage.PublicKeyAlgorithms = Object.freeze({
    RSA_ENCRYPT_OR_SIGN_HAC: 1,
    RSA_ENCRYPT_ONLY_HAC: 2,
    RSA_SIGN_ONLY_HAC: 3,
    ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC: 16,
    DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC: 17,
    RESERVED_FOR_ELLIPTIC_CURVE: 18,
    RESERVED_FOR_ECDSA: 19,
    RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_: 20,
    RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME: 21,
    PRIVATE_EXPERIMENTAL_ALGORITHM_00: 100,
    PRIVATE_EXPERIMENTAL_ALGORITHM_01: 101,
    PRIVATE_EXPERIMENTAL_ALGORITHM_02: 102,
    PRIVATE_EXPERIMENTAL_ALGORITHM_03: 103,
    PRIVATE_EXPERIMENTAL_ALGORITHM_04: 104,
    PRIVATE_EXPERIMENTAL_ALGORITHM_05: 105,
    PRIVATE_EXPERIMENTAL_ALGORITHM_06: 106,
    PRIVATE_EXPERIMENTAL_ALGORITHM_07: 107,
    PRIVATE_EXPERIMENTAL_ALGORITHM_08: 108,
    PRIVATE_EXPERIMENTAL_ALGORITHM_09: 109,
    PRIVATE_EXPERIMENTAL_ALGORITHM_10: 110,

    1: "RSA_ENCRYPT_OR_SIGN_HAC",
    2: "RSA_ENCRYPT_ONLY_HAC",
    3: "RSA_SIGN_ONLY_HAC",
    16: "ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC",
    17: "DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC",
    18: "RESERVED_FOR_ELLIPTIC_CURVE",
    19: "RESERVED_FOR_ECDSA",
    20: "RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_",
    21: "RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME",
    100: "PRIVATE_EXPERIMENTAL_ALGORITHM_00",
    101: "PRIVATE_EXPERIMENTAL_ALGORITHM_01",
    102: "PRIVATE_EXPERIMENTAL_ALGORITHM_02",
    103: "PRIVATE_EXPERIMENTAL_ALGORITHM_03",
    104: "PRIVATE_EXPERIMENTAL_ALGORITHM_04",
    105: "PRIVATE_EXPERIMENTAL_ALGORITHM_05",
    106: "PRIVATE_EXPERIMENTAL_ALGORITHM_06",
    107: "PRIVATE_EXPERIMENTAL_ALGORITHM_07",
    108: "PRIVATE_EXPERIMENTAL_ALGORITHM_08",
    109: "PRIVATE_EXPERIMENTAL_ALGORITHM_09",
    110: "PRIVATE_EXPERIMENTAL_ALGORITHM_10",
  });

  OpenpgpMessage.ServerFlags = Object.freeze({
    NO_MODIFY: 128,

    128: "NO_MODIFY",
  });

  OpenpgpMessage.KeyFlags = Object.freeze({
    THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS: 1,
    THIS_KEY_MAY_BE_USED_TO_SIGN_DATA: 2,
    THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS: 4,
    THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE: 8,
    THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM: 16,
    THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION: 32,
    THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON: 128,

    1: "THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS",
    2: "THIS_KEY_MAY_BE_USED_TO_SIGN_DATA",
    4: "THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS",
    8: "THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE",
    16: "THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM",
    32: "THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION",
    128: "THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON",
  });

  OpenpgpMessage.CompressionAlgorithms = Object.freeze({
    UNCOMPRESSED: 0,
    ZIB: 1,
    ZLIB: 2,
    BZIP: 3,
    PRIVATE_EXPERIMENTAL_ALGORITHM_00: 100,
    PRIVATE_EXPERIMENTAL_ALGORITHM_01: 101,
    PRIVATE_EXPERIMENTAL_ALGORITHM_02: 102,
    PRIVATE_EXPERIMENTAL_ALGORITHM_03: 103,
    PRIVATE_EXPERIMENTAL_ALGORITHM_04: 104,
    PRIVATE_EXPERIMENTAL_ALGORITHM_05: 105,
    PRIVATE_EXPERIMENTAL_ALGORITHM_06: 106,
    PRIVATE_EXPERIMENTAL_ALGORITHM_07: 107,
    PRIVATE_EXPERIMENTAL_ALGORITHM_08: 108,
    PRIVATE_EXPERIMENTAL_ALGORITHM_09: 109,
    PRIVATE_EXPERIMENTAL_ALGORITHM_10: 110,

    0: "UNCOMPRESSED",
    1: "ZIB",
    2: "ZLIB",
    3: "BZIP",
    100: "PRIVATE_EXPERIMENTAL_ALGORITHM_00",
    101: "PRIVATE_EXPERIMENTAL_ALGORITHM_01",
    102: "PRIVATE_EXPERIMENTAL_ALGORITHM_02",
    103: "PRIVATE_EXPERIMENTAL_ALGORITHM_03",
    104: "PRIVATE_EXPERIMENTAL_ALGORITHM_04",
    105: "PRIVATE_EXPERIMENTAL_ALGORITHM_05",
    106: "PRIVATE_EXPERIMENTAL_ALGORITHM_06",
    107: "PRIVATE_EXPERIMENTAL_ALGORITHM_07",
    108: "PRIVATE_EXPERIMENTAL_ALGORITHM_08",
    109: "PRIVATE_EXPERIMENTAL_ALGORITHM_09",
    110: "PRIVATE_EXPERIMENTAL_ALGORITHM_10",
  });

  OpenpgpMessage.PacketTags = Object.freeze({
    RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE: 0,
    PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET: 1,
    SIGNATURE_PACKET: 2,
    SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET: 3,
    ONE_PASS_SIGNATURE_PACKET: 4,
    SECRET_KEY_PACKET: 5,
    PUBLIC_KEY_PACKET: 6,
    SECRET_SUBKEY_PACKET: 7,
    COMPRESSED_DATA_PACKET: 8,
    SYMMETRICALLY_ENCRYPTED_DATA_PACKET: 9,
    MARKER_PACKET: 10,
    LITERAL_DATA_PACKET: 11,
    TRUST_PACKET: 12,
    USER_ID_PACKET: 13,
    PUBLIC_SUBKEY_PACKET: 14,
    USER_ATTRIBUTE_PACKET: 17,
    SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET: 18,
    MODIFICATION_DETECTION_CODE_PACKET: 19,
    PRIVATE_OR_EXPERIMENTAL_VALUES_0: 60,
    PRIVATE_OR_EXPERIMENTAL_VALUES_1: 61,
    PRIVATE_OR_EXPERIMENTAL_VALUES_2: 62,
    PRIVATE_OR_EXPERIMENTAL_VALUES_3: 63,

    0: "RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE",
    1: "PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET",
    2: "SIGNATURE_PACKET",
    3: "SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET",
    4: "ONE_PASS_SIGNATURE_PACKET",
    5: "SECRET_KEY_PACKET",
    6: "PUBLIC_KEY_PACKET",
    7: "SECRET_SUBKEY_PACKET",
    8: "COMPRESSED_DATA_PACKET",
    9: "SYMMETRICALLY_ENCRYPTED_DATA_PACKET",
    10: "MARKER_PACKET",
    11: "LITERAL_DATA_PACKET",
    12: "TRUST_PACKET",
    13: "USER_ID_PACKET",
    14: "PUBLIC_SUBKEY_PACKET",
    17: "USER_ATTRIBUTE_PACKET",
    18: "SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET",
    19: "MODIFICATION_DETECTION_CODE_PACKET",
    60: "PRIVATE_OR_EXPERIMENTAL_VALUES_0",
    61: "PRIVATE_OR_EXPERIMENTAL_VALUES_1",
    62: "PRIVATE_OR_EXPERIMENTAL_VALUES_2",
    63: "PRIVATE_OR_EXPERIMENTAL_VALUES_3",
  });

  OpenpgpMessage.RevocationCodes = Object.freeze({
    NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS: 0,
    KEY_IS_SUPERSEDED_KEY_REVOCATIONS: 1,
    KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS: 2,
    KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS: 3,
    USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS: 32,
    PRIVATE_USE_1: 100,
    PRIVATE_USE_2: 101,
    PRIVATE_USE_3: 102,
    PRIVATE_USE_4: 103,
    PRIVATE_USE_11: 110,

    0: "NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS",
    1: "KEY_IS_SUPERSEDED_KEY_REVOCATIONS",
    2: "KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS",
    3: "KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS",
    32: "USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS",
    100: "PRIVATE_USE_1",
    101: "PRIVATE_USE_2",
    102: "PRIVATE_USE_3",
    103: "PRIVATE_USE_4",
    110: "PRIVATE_USE_11",
  });

  OpenpgpMessage.HashAlgorithms = Object.freeze({
    MD5: 1,
    SHA1: 2,
    RIPEMD160: 3,
    RESERVED_4: 4,
    RESERVED_5: 5,
    RESERVED_6: 6,
    RESERVED_7: 7,
    SHA256: 8,
    SHA384: 9,
    SHA512: 10,
    SHA224: 11,
    PRIVATE_EXPERIMENTAL_ALGORITHM_00: 100,
    PRIVATE_EXPERIMENTAL_ALGORITHM_01: 101,
    PRIVATE_EXPERIMENTAL_ALGORITHM_02: 102,
    PRIVATE_EXPERIMENTAL_ALGORITHM_03: 103,
    PRIVATE_EXPERIMENTAL_ALGORITHM_04: 104,
    PRIVATE_EXPERIMENTAL_ALGORITHM_05: 105,
    PRIVATE_EXPERIMENTAL_ALGORITHM_06: 106,
    PRIVATE_EXPERIMENTAL_ALGORITHM_07: 107,
    PRIVATE_EXPERIMENTAL_ALGORITHM_08: 108,
    PRIVATE_EXPERIMENTAL_ALGORITHM_09: 109,
    PRIVATE_EXPERIMENTAL_ALGORITHM_10: 110,

    1: "MD5",
    2: "SHA1",
    3: "RIPEMD160",
    4: "RESERVED_4",
    5: "RESERVED_5",
    6: "RESERVED_6",
    7: "RESERVED_7",
    8: "SHA256",
    9: "SHA384",
    10: "SHA512",
    11: "SHA224",
    100: "PRIVATE_EXPERIMENTAL_ALGORITHM_00",
    101: "PRIVATE_EXPERIMENTAL_ALGORITHM_01",
    102: "PRIVATE_EXPERIMENTAL_ALGORITHM_02",
    103: "PRIVATE_EXPERIMENTAL_ALGORITHM_03",
    104: "PRIVATE_EXPERIMENTAL_ALGORITHM_04",
    105: "PRIVATE_EXPERIMENTAL_ALGORITHM_05",
    106: "PRIVATE_EXPERIMENTAL_ALGORITHM_06",
    107: "PRIVATE_EXPERIMENTAL_ALGORITHM_07",
    108: "PRIVATE_EXPERIMENTAL_ALGORITHM_08",
    109: "PRIVATE_EXPERIMENTAL_ALGORITHM_09",
    110: "PRIVATE_EXPERIMENTAL_ALGORITHM_10",
  });

  OpenpgpMessage.SymmetricKeyAlgorithm = Object.freeze({
    PLAIN: 0,
    IDEA: 1,
    TRIPLE_DES: 2,
    CAST5: 3,
    BLOWFISCH: 4,
    RESERVED_5: 5,
    RESERVED_6: 6,
    AES_128: 7,
    AES_192: 8,
    AES_256: 9,
    TWOFISH_256: 10,
    PRIVATE_EXPERIMENTAL_ALGORITHM_00: 100,
    PRIVATE_EXPERIMENTAL_ALGORITHM_01: 101,
    PRIVATE_EXPERIMENTAL_ALGORITHM_02: 102,
    PRIVATE_EXPERIMENTAL_ALGORITHM_03: 103,
    PRIVATE_EXPERIMENTAL_ALGORITHM_04: 104,
    PRIVATE_EXPERIMENTAL_ALGORITHM_05: 105,
    PRIVATE_EXPERIMENTAL_ALGORITHM_06: 106,
    PRIVATE_EXPERIMENTAL_ALGORITHM_07: 107,
    PRIVATE_EXPERIMENTAL_ALGORITHM_08: 108,
    PRIVATE_EXPERIMENTAL_ALGORITHM_09: 109,
    PRIVATE_EXPERIMENTAL_ALGORITHM_10: 110,

    0: "PLAIN",
    1: "IDEA",
    2: "TRIPLE_DES",
    3: "CAST5",
    4: "BLOWFISCH",
    5: "RESERVED_5",
    6: "RESERVED_6",
    7: "AES_128",
    8: "AES_192",
    9: "AES_256",
    10: "TWOFISH_256",
    100: "PRIVATE_EXPERIMENTAL_ALGORITHM_00",
    101: "PRIVATE_EXPERIMENTAL_ALGORITHM_01",
    102: "PRIVATE_EXPERIMENTAL_ALGORITHM_02",
    103: "PRIVATE_EXPERIMENTAL_ALGORITHM_03",
    104: "PRIVATE_EXPERIMENTAL_ALGORITHM_04",
    105: "PRIVATE_EXPERIMENTAL_ALGORITHM_05",
    106: "PRIVATE_EXPERIMENTAL_ALGORITHM_06",
    107: "PRIVATE_EXPERIMENTAL_ALGORITHM_07",
    108: "PRIVATE_EXPERIMENTAL_ALGORITHM_08",
    109: "PRIVATE_EXPERIMENTAL_ALGORITHM_09",
    110: "PRIVATE_EXPERIMENTAL_ALGORITHM_10",
  });

  OpenpgpMessage.SubpacketTypes = Object.freeze({
    RESERVED: 0,
    RESERVED: 1,
    SIGNATURE_CREATION_TIME: 2,
    SIGNATURE_EXPIRATION_TIME: 3,
    EXPORTABLE_CERTIFICATION: 4,
    TRUST_SIGNATURE: 5,
    REGULAR_EXPRESSION: 6,
    REVOCABLE: 7,
    RESERVED: 8,
    KEY_EXPIRATION_TIME: 9,
    PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY: 10,
    PREFERRED_SYMMETRIC_ALGORITHMS: 11,
    REVOCATION_KEY: 12,
    RESERVED: 13,
    RESERVED: 14,
    RESERVED: 15,
    ISSUER: 16,
    RESERVED: 17,
    RESERVED: 18,
    RESERVED: 19,
    NOTATION_DATA: 20,
    PREFERRED_HASH_ALGORITHMS: 21,
    PREFERRED_COMPRESSION_ALGORITHMS: 22,
    KEY_SERVER_PREFERENCES: 23,
    PREFERRED_KEY_SERVER: 24,
    PRIMARY_USER_ID: 25,
    POLICY_URI: 26,
    KEY_FLAGS: 27,
    SIGNERS_USER_ID: 28,
    REASON_FOR_REVOCATION: 29,
    FEATURES: 30,
    SIGNATURE_TARGET: 31,
    EMBEDDED_SIGNATURE: 32,

    0: "RESERVED",
    1: "RESERVED",
    2: "SIGNATURE_CREATION_TIME",
    3: "SIGNATURE_EXPIRATION_TIME",
    4: "EXPORTABLE_CERTIFICATION",
    5: "TRUST_SIGNATURE",
    6: "REGULAR_EXPRESSION",
    7: "REVOCABLE",
    8: "RESERVED",
    9: "KEY_EXPIRATION_TIME",
    10: "PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY",
    11: "PREFERRED_SYMMETRIC_ALGORITHMS",
    12: "REVOCATION_KEY",
    13: "RESERVED",
    14: "RESERVED",
    15: "RESERVED",
    16: "ISSUER",
    17: "RESERVED",
    18: "RESERVED",
    19: "RESERVED",
    20: "NOTATION_DATA",
    21: "PREFERRED_HASH_ALGORITHMS",
    22: "PREFERRED_COMPRESSION_ALGORITHMS",
    23: "KEY_SERVER_PREFERENCES",
    24: "PREFERRED_KEY_SERVER",
    25: "PRIMARY_USER_ID",
    26: "POLICY_URI",
    27: "KEY_FLAGS",
    28: "SIGNERS_USER_ID",
    29: "REASON_FOR_REVOCATION",
    30: "FEATURES",
    31: "SIGNATURE_TARGET",
    32: "EMBEDDED_SIGNATURE",
  });

  function OpenpgpMessage(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  OpenpgpMessage.prototype._read = function() {
    this.packets = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packets.push(new Packet(this._io, this, this._root));
      i++;
    }
  }

  var PreferredHashAlgorithms = OpenpgpMessage.PreferredHashAlgorithms = (function() {
    function PreferredHashAlgorithms(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PreferredHashAlgorithms.prototype._read = function() {
      this.algorithm = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.algorithm.push(this._io.readU1());
        i++;
      }
    }

    return PreferredHashAlgorithms;
  })();

  var PreferredCompressionAlgorithms = OpenpgpMessage.PreferredCompressionAlgorithms = (function() {
    function PreferredCompressionAlgorithms(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PreferredCompressionAlgorithms.prototype._read = function() {
      this.algorithm = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.algorithm.push(this._io.readU1());
        i++;
      }
    }

    return PreferredCompressionAlgorithms;
  })();

  var SignersUserId = OpenpgpMessage.SignersUserId = (function() {
    function SignersUserId(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignersUserId.prototype._read = function() {
      this.userId = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return SignersUserId;
  })();

  var SecretKeyPacket = OpenpgpMessage.SecretKeyPacket = (function() {
    function SecretKeyPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SecretKeyPacket.prototype._read = function() {
      this.publicKey = new PublicKeyPacket(this._io, this, this._root);
      this.stringToKey = this._io.readU1();
      if (this.stringToKey >= 254) {
        this.symmetricEncryptionAlgorithm = this._io.readU1();
      }
      this.secretKey = this._io.readBytesFull();
    }

    return SecretKeyPacket;
  })();

  var KeyServerPreferences = OpenpgpMessage.KeyServerPreferences = (function() {
    function KeyServerPreferences(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyServerPreferences.prototype._read = function() {
      this.flag = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.flag.push(this._io.readU1());
        i++;
      }
    }

    return KeyServerPreferences;
  })();

  var RegularExpression = OpenpgpMessage.RegularExpression = (function() {
    function RegularExpression(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RegularExpression.prototype._read = function() {
      this.regex = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
    }

    return RegularExpression;
  })();

  var Subpackets = OpenpgpMessage.Subpackets = (function() {
    function Subpackets(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subpackets.prototype._read = function() {
      this.subpacketss = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.subpacketss.push(new Subpacket(this._io, this, this._root));
        i++;
      }
    }

    return Subpackets;
  })();

  var RevocationKey = OpenpgpMessage.RevocationKey = (function() {
    function RevocationKey(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RevocationKey.prototype._read = function() {
      this.class = this._io.readU1();
      this.publicKeyAlgorithm = this._io.readU1();
      this.fingerprint = this._io.readBytes(20);
    }

    return RevocationKey;
  })();

  var UserIdPacket = OpenpgpMessage.UserIdPacket = (function() {
    function UserIdPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    UserIdPacket.prototype._read = function() {
      this.userId = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return UserIdPacket;
  })();

  var PolicyUri = OpenpgpMessage.PolicyUri = (function() {
    function PolicyUri(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolicyUri.prototype._read = function() {
      this.uri = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return PolicyUri;
  })();

  var SignatureTarget = OpenpgpMessage.SignatureTarget = (function() {
    function SignatureTarget(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignatureTarget.prototype._read = function() {
      this.publicKeyAlgorithm = this._io.readU1();
      this.hashAlgorithm = this._io.readU1();
      this.hash = this._io.readBytesFull();
    }

    return SignatureTarget;
  })();

  var KeyFlags = OpenpgpMessage.KeyFlags = (function() {
    function KeyFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyFlags.prototype._read = function() {
      this.flag = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.flag.push(this._io.readU1());
        i++;
      }
    }

    return KeyFlags;
  })();

  var Features = OpenpgpMessage.Features = (function() {
    function Features(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Features.prototype._read = function() {
      this.flags = this._io.readBytesFull();
    }

    return Features;
  })();

  var PrimaryUserId = OpenpgpMessage.PrimaryUserId = (function() {
    function PrimaryUserId(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PrimaryUserId.prototype._read = function() {
      this.userId = this._io.readU1();
    }

    return PrimaryUserId;
  })();

  var Subpacket = OpenpgpMessage.Subpacket = (function() {
    function Subpacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subpacket.prototype._read = function() {
      this.len = new LenSubpacket(this._io, this, this._root);
      this.subpacketType = this._io.readU1();
      switch (this.subpacketType) {
      case OpenpgpMessage.SubpacketTypes.EXPORTABLE_CERTIFICATION:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new ExportableCertification(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.PREFERRED_HASH_ALGORITHMS:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new PreferredHashAlgorithms(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.EMBEDDED_SIGNATURE:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new EmbeddedSignature(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.TRUST_SIGNATURE:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new TrustSignature(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.REASON_FOR_REVOCATION:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new ReasonForRevocation(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.FEATURES:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new Features(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.SIGNATURE_EXPIRATION_TIME:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new SignatureExpirationTime(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.PREFERRED_COMPRESSION_ALGORITHMS:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new PreferredCompressionAlgorithms(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.REVOCABLE:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new Revocable(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.REGULAR_EXPRESSION:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new RegularExpression(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.NOTATION_DATA:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new NotationData(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.KEY_EXPIRATION_TIME:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new KeyExpirationTime(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.SIGNATURE_CREATION_TIME:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new SignatureCreationTime(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.REVOCATION_KEY:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new RevocationKey(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.KEY_FLAGS:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new KeyFlags(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.ISSUER:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new Issuer(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.SIGNATURE_TARGET:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new SignatureTarget(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.KEY_SERVER_PREFERENCES:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new KeyServerPreferences(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.SIGNERS_USER_ID:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new SignersUserId(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.POLICY_URI:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new PolicyUri(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.PREFERRED_KEY_SERVER:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new PreferredKeyServer(_io__raw_content, this, this._root);
        break;
      case OpenpgpMessage.SubpacketTypes.PRIMARY_USER_ID:
        this._raw_content = this._io.readBytes((this.len.len - 1));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new PrimaryUserId(_io__raw_content, this, this._root);
        break;
      default:
        this.content = this._io.readBytes((this.len.len - 1));
        break;
      }
    }

    return Subpacket;
  })();

  var OldPacket = OpenpgpMessage.OldPacket = (function() {
    function OldPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OldPacket.prototype._read = function() {
      switch (this._parent.lenType) {
      case 0:
        this.len = this._io.readU1();
        break;
      case 1:
        this.len = this._io.readU2be();
        break;
      case 2:
        this.len = this._io.readU4be();
        break;
      }
      switch (this._parent.packetTypeOld) {
      case OpenpgpMessage.PacketTags.PUBLIC_KEY_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PublicKeyPacket(_io__raw_body, this, this._root);
        break;
      case OpenpgpMessage.PacketTags.SECRET_SUBKEY_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PublicKeyPacket(_io__raw_body, this, this._root);
        break;
      case OpenpgpMessage.PacketTags.USER_ID_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new UserIdPacket(_io__raw_body, this, this._root);
        break;
      case OpenpgpMessage.PacketTags.SECRET_KEY_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SecretKeyPacket(_io__raw_body, this, this._root);
        break;
      case OpenpgpMessage.PacketTags.SIGNATURE_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SignaturePacket(_io__raw_body, this, this._root);
        break;
      case OpenpgpMessage.PacketTags.PUBLIC_SUBKEY_PACKET:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PublicKeyPacket(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.len);
        break;
      }
    }

    return OldPacket;
  })();

  var Issuer = OpenpgpMessage.Issuer = (function() {
    function Issuer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Issuer.prototype._read = function() {
      this.keyid = this._io.readU8be();
    }

    return Issuer;
  })();

  var ExportableCertification = OpenpgpMessage.ExportableCertification = (function() {
    function ExportableCertification(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExportableCertification.prototype._read = function() {
      this.exportable = this._io.readU1();
    }

    return ExportableCertification;
  })();

  var SignatureExpirationTime = OpenpgpMessage.SignatureExpirationTime = (function() {
    function SignatureExpirationTime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignatureExpirationTime.prototype._read = function() {
      this.time = this._io.readU4be();
    }

    return SignatureExpirationTime;
  })();

  var SignatureCreationTime = OpenpgpMessage.SignatureCreationTime = (function() {
    function SignatureCreationTime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignatureCreationTime.prototype._read = function() {
      this.time = this._io.readU4be();
    }

    return SignatureCreationTime;
  })();

  var SignaturePacket = OpenpgpMessage.SignaturePacket = (function() {
    function SignaturePacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SignaturePacket.prototype._read = function() {
      this.version = this._io.readU1();
      this.signatureType = this._io.readU1();
      this.publicKeyAlgorithm = this._io.readU1();
      this.hashAlgorithm = this._io.readU1();
      this.lenHashedSubpacket = this._io.readU2be();
      this._raw_hashedSubpackets = this._io.readBytes(this.lenHashedSubpacket);
      var _io__raw_hashedSubpackets = new KaitaiStream(this._raw_hashedSubpackets);
      this.hashedSubpackets = new Subpackets(_io__raw_hashedSubpackets, this, this._root);
      this.lenUnhashedSubpacket = this._io.readU2be();
      this._raw_unhashedSubpackets = this._io.readBytes(this.lenUnhashedSubpacket);
      var _io__raw_unhashedSubpackets = new KaitaiStream(this._raw_unhashedSubpackets);
      this.unhashedSubpackets = new Subpackets(_io__raw_unhashedSubpackets, this, this._root);
      this.leftSignedHash = this._io.readU2be();
      this.rsaN = this._io.readU2be();
      this.signature = this._io.readBytesFull();
    }

    return SignaturePacket;
  })();

  var Revocable = OpenpgpMessage.Revocable = (function() {
    function Revocable(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Revocable.prototype._read = function() {
      this.revocable = this._io.readU1();
    }

    return Revocable;
  })();

  var EmbeddedSignature = OpenpgpMessage.EmbeddedSignature = (function() {
    function EmbeddedSignature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EmbeddedSignature.prototype._read = function() {
      this.signaturePacket = new SignaturePacket(this._io, this, this._root);
    }

    return EmbeddedSignature;
  })();

  var PreferredKeyServer = OpenpgpMessage.PreferredKeyServer = (function() {
    function PreferredKeyServer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PreferredKeyServer.prototype._read = function() {
      this.uri = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return PreferredKeyServer;
  })();

  var ReasonForRevocation = OpenpgpMessage.ReasonForRevocation = (function() {
    function ReasonForRevocation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ReasonForRevocation.prototype._read = function() {
      this.revocationCode = this._io.readU1();
      this.reason = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return ReasonForRevocation;
  })();

  var LenSubpacket = OpenpgpMessage.LenSubpacket = (function() {
    function LenSubpacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LenSubpacket.prototype._read = function() {
      this.firstOctet = this._io.readU1();
      if ( ((this.firstOctet >= 192) && (this.firstOctet < 255)) ) {
        this.secondOctet = this._io.readU1();
      }
      if (this.firstOctet == 255) {
        this.scalar = this._io.readU4be();
      }
    }
    Object.defineProperty(LenSubpacket.prototype, 'len', {
      get: function() {
        if (this._m_len !== undefined)
          return this._m_len;
        this._m_len = (this.firstOctet < 192 ? this.firstOctet : ( ((this.firstOctet >= 192) && (this.firstOctet < 255))  ? ((((this.firstOctet - 192) << 8) + this.secondOctet) + 192) : this.scalar));
        return this._m_len;
      }
    });

    return LenSubpacket;
  })();

  var NotationData = OpenpgpMessage.NotationData = (function() {
    function NotationData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NotationData.prototype._read = function() {
      this.flags = this._io.readBytes(4);
      this.lenName = this._io.readU2be();
      this.lenValue = this._io.readU2be();
      this.name = this._io.readBytes(this.lenName);
      this.value = this._io.readBytes(this.lenValue);
    }

    return NotationData;
  })();

  var PublicKeyPacket = OpenpgpMessage.PublicKeyPacket = (function() {
    function PublicKeyPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PublicKeyPacket.prototype._read = function() {
      this.version = this._io.readU1();
      this.timestamp = this._io.readU4be();
      this.publicKeyAlgorithm = this._io.readU1();
      this.lenAlg = this._io.readU2be();
      this.rsaN = this._io.readBytes(Math.floor(this.lenAlg / 8));
      this.padding = this._io.readU2be();
      this.rsaE = this._io.readBytes(3);
    }

    return PublicKeyPacket;
  })();

  var KeyExpirationTime = OpenpgpMessage.KeyExpirationTime = (function() {
    function KeyExpirationTime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    KeyExpirationTime.prototype._read = function() {
      this.time = this._io.readU4be();
    }

    return KeyExpirationTime;
  })();

  var Packet = OpenpgpMessage.Packet = (function() {
    function Packet(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Packet.prototype._read = function() {
      this.one = this._io.readBitsInt(1) != 0;
      this.newPacketFormat = this._io.readBitsInt(1) != 0;
      if (this.newPacketFormat) {
        this.packetTypeNew = this._io.readBitsInt(6);
      }
      if (!(this.newPacketFormat)) {
        this.packetTypeOld = this._io.readBitsInt(4);
      }
      if (!(this.newPacketFormat)) {
        this.lenType = this._io.readBitsInt(2);
      }
      this._io.alignToByte();
      switch (this.newPacketFormat) {
      case false:
        this.body = new OldPacket(this._io, this, this._root);
        break;
      }
    }

    return Packet;
  })();

  var TrustSignature = OpenpgpMessage.TrustSignature = (function() {
    function TrustSignature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TrustSignature.prototype._read = function() {
      this.level = this._io.readU1();
      this.amount = this._io.readU1();
    }

    return TrustSignature;
  })();

  return OpenpgpMessage;
})();
return OpenpgpMessage;
}));
