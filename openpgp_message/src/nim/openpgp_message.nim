import kaitai_struct_nim_runtime
import options

type
  OpenpgpMessage* = ref object of KaitaiStruct
    `packets`*: seq[OpenpgpMessage_Packet]
    `parent`*: KaitaiStruct
  OpenpgpMessage_PublicKeyAlgorithms* = enum
    rsa_encrypt_or_sign_hac = 1
    rsa_encrypt_only_hac = 2
    rsa_sign_only_hac = 3
    elgamal_encrypt_only_elgamal_hac = 16
    dsa_digital_signature_algorithm_fips_hac = 17
    reserved_for_elliptic_curve = 18
    reserved_for_ecdsa = 19
    reserved_formerly_elgamal_encrypt_or_sign_ = 20
    reserved_for_diffie_hellman_x_as_defined_for_ietf_s_mime = 21
    private_experimental_algorithm_00 = 100
    private_experimental_algorithm_01 = 101
    private_experimental_algorithm_02 = 102
    private_experimental_algorithm_03 = 103
    private_experimental_algorithm_04 = 104
    private_experimental_algorithm_05 = 105
    private_experimental_algorithm_06 = 106
    private_experimental_algorithm_07 = 107
    private_experimental_algorithm_08 = 108
    private_experimental_algorithm_09 = 109
    private_experimental_algorithm_10 = 110
  OpenpgpMessage_ServerFlags* = enum
    no_modify = 128
  OpenpgpMessage_KeyFlags* = enum
    this_key_may_be_used_to_certify_other_keys = 1
    this_key_may_be_used_to_sign_data = 2
    this_key_may_be_used_to_encrypt_communications = 4
    this_key_may_be_used_to_encrypt_storage = 8
    the_private_component_of_this_key_may_have_been_split_by_a_secret_sharing_mechanism = 16
    this_key_may_be_used_for_authentication = 32
    the_private_component_of_this_key_may_be_in_the_possession_of_more_than_one_person = 128
  OpenpgpMessage_CompressionAlgorithms* = enum
    uncompressed = 0
    zib = 1
    zlib = 2
    bzip = 3
    private_experimental_algorithm_00 = 100
    private_experimental_algorithm_01 = 101
    private_experimental_algorithm_02 = 102
    private_experimental_algorithm_03 = 103
    private_experimental_algorithm_04 = 104
    private_experimental_algorithm_05 = 105
    private_experimental_algorithm_06 = 106
    private_experimental_algorithm_07 = 107
    private_experimental_algorithm_08 = 108
    private_experimental_algorithm_09 = 109
    private_experimental_algorithm_10 = 110
  OpenpgpMessage_PacketTags* = enum
    reserved_a_packet_tag_must_not_have_this_value = 0
    public_key_encrypted_session_key_packet = 1
    signature_packet = 2
    symmetric_key_encrypted_session_key_packet = 3
    one_pass_signature_packet = 4
    secret_key_packet = 5
    public_key_packet = 6
    secret_subkey_packet = 7
    compressed_data_packet = 8
    symmetrically_encrypted_data_packet = 9
    marker_packet = 10
    literal_data_packet = 11
    trust_packet = 12
    user_id_packet = 13
    public_subkey_packet = 14
    user_attribute_packet = 17
    sym_encrypted_and_integrity_protected_data_packet = 18
    modification_detection_code_packet = 19
    private_or_experimental_values_0 = 60
    private_or_experimental_values_1 = 61
    private_or_experimental_values_2 = 62
    private_or_experimental_values_3 = 63
  OpenpgpMessage_RevocationCodes* = enum
    no_reason_specified_key_revocations_or_cert_revocations = 0
    key_is_superseded_key_revocations = 1
    key_material_has_been_compromised_key_revocations = 2
    key_is_retired_and_no_longer_used_key_revocations = 3
    user_id_information_is_no_longer_valid_cert_revocations = 32
    private_use_1 = 100
    private_use_2 = 101
    private_use_3 = 102
    private_use_4 = 103
    private_use_11 = 110
  OpenpgpMessage_HashAlgorithms* = enum
    md5 = 1
    sha1 = 2
    ripemd160 = 3
    reserved4 = 4
    reserved5 = 5
    reserved6 = 6
    reserved7 = 7
    sha256 = 8
    sha384 = 9
    sha512 = 10
    sha224 = 11
    private_experimental_algorithm_00 = 100
    private_experimental_algorithm_01 = 101
    private_experimental_algorithm_02 = 102
    private_experimental_algorithm_03 = 103
    private_experimental_algorithm_04 = 104
    private_experimental_algorithm_05 = 105
    private_experimental_algorithm_06 = 106
    private_experimental_algorithm_07 = 107
    private_experimental_algorithm_08 = 108
    private_experimental_algorithm_09 = 109
    private_experimental_algorithm_10 = 110
  OpenpgpMessage_SymmetricKeyAlgorithm* = enum
    plain = 0
    idea = 1
    triple_des = 2
    cast5 = 3
    blowfisch = 4
    reserved5 = 5
    reserved6 = 6
    aes_128 = 7
    aes_192 = 8
    aes_256 = 9
    twofish_256 = 10
    private_experimental_algorithm_00 = 100
    private_experimental_algorithm_01 = 101
    private_experimental_algorithm_02 = 102
    private_experimental_algorithm_03 = 103
    private_experimental_algorithm_04 = 104
    private_experimental_algorithm_05 = 105
    private_experimental_algorithm_06 = 106
    private_experimental_algorithm_07 = 107
    private_experimental_algorithm_08 = 108
    private_experimental_algorithm_09 = 109
    private_experimental_algorithm_10 = 110
  OpenpgpMessage_SubpacketTypes* = enum
    reserved0 = 0
    reserved1 = 1
    signature_creation_time = 2
    signature_expiration_time = 3
    exportable_certification = 4
    trust_signature = 5
    regular_expression = 6
    revocable = 7
    reserved8 = 8
    key_expiration_time = 9
    placeholder_for_backward_compatibility = 10
    preferred_symmetric_algorithms = 11
    revocation_key = 12
    reserved13 = 13
    reserved14 = 14
    reserved15 = 15
    issuer = 16
    reserved17 = 17
    reserved18 = 18
    reserved19 = 19
    notation_data = 20
    preferred_hash_algorithms = 21
    preferred_compression_algorithms = 22
    key_server_preferences = 23
    preferred_key_server = 24
    primary_user_id = 25
    policy_uri = 26
    key_flags = 27
    signers_user_id = 28
    reason_for_revocation = 29
    features = 30
    signature_target = 31
    embedded_signature = 32
  OpenpgpMessage_PreferredHashAlgorithms* = ref object of KaitaiStruct
    `algorithm`*: seq[OpenpgpMessage_HashAlgorithms]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_PreferredCompressionAlgorithms* = ref object of KaitaiStruct
    `algorithm`*: seq[OpenpgpMessage_CompressionAlgorithms]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SignersUserId* = ref object of KaitaiStruct
    `userId`*: string
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SecretKeyPacket* = ref object of KaitaiStruct
    `publicKey`*: OpenpgpMessage_PublicKeyPacket
    `stringToKey`*: uint8
    `symmetricEncryptionAlgorithm`*: OpenpgpMessage_SymmetricKeyAlgorithm
    `secretKey`*: seq[byte]
    `parent`*: OpenpgpMessage_OldPacket
  OpenpgpMessage_KeyServerPreferences* = ref object of KaitaiStruct
    `flag`*: seq[OpenpgpMessage_ServerFlags]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_RegularExpression* = ref object of KaitaiStruct
    `regex`*: string
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_Subpackets* = ref object of KaitaiStruct
    `subpacketss`*: seq[OpenpgpMessage_Subpacket]
    `parent`*: OpenpgpMessage_SignaturePacket
  OpenpgpMessage_RevocationKey* = ref object of KaitaiStruct
    `class`*: uint8
    `publicKeyAlgorithm`*: OpenpgpMessage_PublicKeyAlgorithms
    `fingerprint`*: seq[byte]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_UserIdPacket* = ref object of KaitaiStruct
    `userId`*: string
    `parent`*: OpenpgpMessage_OldPacket
  OpenpgpMessage_PolicyUri* = ref object of KaitaiStruct
    `uri`*: string
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SignatureTarget* = ref object of KaitaiStruct
    `publicKeyAlgorithm`*: OpenpgpMessage_PublicKeyAlgorithms
    `hashAlgorithm`*: OpenpgpMessage_HashAlgorithms
    `hash`*: seq[byte]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_KeyFlags* = ref object of KaitaiStruct
    `flag`*: seq[OpenpgpMessage_KeyFlags]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_Features* = ref object of KaitaiStruct
    `flags`*: seq[byte]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_PrimaryUserId* = ref object of KaitaiStruct
    `userId`*: uint8
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_Subpacket* = ref object of KaitaiStruct
    `len`*: OpenpgpMessage_LenSubpacket
    `subpacketType`*: OpenpgpMessage_SubpacketTypes
    `content`*: KaitaiStruct
    `parent`*: OpenpgpMessage_Subpackets
    `rawContent`*: seq[byte]
  OpenpgpMessage_OldPacket* = ref object of KaitaiStruct
    `len`*: uint32
    `body`*: KaitaiStruct
    `parent`*: OpenpgpMessage_Packet
    `rawBody`*: seq[byte]
  OpenpgpMessage_Issuer* = ref object of KaitaiStruct
    `keyid`*: uint64
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_ExportableCertification* = ref object of KaitaiStruct
    `exportable`*: uint8
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SignatureExpirationTime* = ref object of KaitaiStruct
    `time`*: uint32
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SignatureCreationTime* = ref object of KaitaiStruct
    `time`*: uint32
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_SignaturePacket* = ref object of KaitaiStruct
    `version`*: uint8
    `signatureType`*: uint8
    `publicKeyAlgorithm`*: OpenpgpMessage_PublicKeyAlgorithms
    `hashAlgorithm`*: OpenpgpMessage_HashAlgorithms
    `lenHashedSubpacket`*: uint16
    `hashedSubpackets`*: OpenpgpMessage_Subpackets
    `lenUnhashedSubpacket`*: uint16
    `unhashedSubpackets`*: OpenpgpMessage_Subpackets
    `leftSignedHash`*: uint16
    `rsaN`*: uint16
    `signature`*: seq[byte]
    `parent`*: KaitaiStruct
    `rawHashedSubpackets`*: seq[byte]
    `rawUnhashedSubpackets`*: seq[byte]
  OpenpgpMessage_Revocable* = ref object of KaitaiStruct
    `revocable`*: uint8
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_EmbeddedSignature* = ref object of KaitaiStruct
    `signaturePacket`*: OpenpgpMessage_SignaturePacket
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_PreferredKeyServer* = ref object of KaitaiStruct
    `uri`*: string
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_ReasonForRevocation* = ref object of KaitaiStruct
    `revocationCode`*: OpenpgpMessage_RevocationCodes
    `reason`*: string
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_LenSubpacket* = ref object of KaitaiStruct
    `firstOctet`*: uint8
    `secondOctet`*: uint8
    `scalar`*: uint32
    `parent`*: OpenpgpMessage_Subpacket
    `lenInst`*: int
  OpenpgpMessage_NotationData* = ref object of KaitaiStruct
    `flags`*: seq[byte]
    `lenName`*: uint16
    `lenValue`*: uint16
    `name`*: seq[byte]
    `value`*: seq[byte]
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_PublicKeyPacket* = ref object of KaitaiStruct
    `version`*: uint8
    `timestamp`*: uint32
    `publicKeyAlgorithm`*: OpenpgpMessage_PublicKeyAlgorithms
    `lenAlg`*: uint16
    `rsaN`*: seq[byte]
    `padding`*: uint16
    `rsaE`*: seq[byte]
    `parent`*: KaitaiStruct
  OpenpgpMessage_KeyExpirationTime* = ref object of KaitaiStruct
    `time`*: uint32
    `parent`*: OpenpgpMessage_Subpacket
  OpenpgpMessage_Packet* = ref object of KaitaiStruct
    `one`*: bool
    `newPacketFormat`*: bool
    `packetTypeNew`*: OpenpgpMessage_PacketTags
    `packetTypeOld`*: OpenpgpMessage_PacketTags
    `lenType`*: uint64
    `body`*: OpenpgpMessage_OldPacket
    `parent`*: OpenpgpMessage
  OpenpgpMessage_TrustSignature* = ref object of KaitaiStruct
    `level`*: uint8
    `amount`*: uint8
    `parent`*: OpenpgpMessage_Subpacket

proc read*(_: typedesc[OpenpgpMessage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage
proc read*(_: typedesc[OpenpgpMessage_PreferredHashAlgorithms], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredHashAlgorithms
proc read*(_: typedesc[OpenpgpMessage_PreferredCompressionAlgorithms], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredCompressionAlgorithms
proc read*(_: typedesc[OpenpgpMessage_SignersUserId], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignersUserId
proc read*(_: typedesc[OpenpgpMessage_SecretKeyPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_OldPacket): OpenpgpMessage_SecretKeyPacket
proc read*(_: typedesc[OpenpgpMessage_KeyServerPreferences], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyServerPreferences
proc read*(_: typedesc[OpenpgpMessage_RegularExpression], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_RegularExpression
proc read*(_: typedesc[OpenpgpMessage_Subpackets], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_SignaturePacket): OpenpgpMessage_Subpackets
proc read*(_: typedesc[OpenpgpMessage_RevocationKey], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_RevocationKey
proc read*(_: typedesc[OpenpgpMessage_UserIdPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_OldPacket): OpenpgpMessage_UserIdPacket
proc read*(_: typedesc[OpenpgpMessage_PolicyUri], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PolicyUri
proc read*(_: typedesc[OpenpgpMessage_SignatureTarget], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureTarget
proc read*(_: typedesc[OpenpgpMessage_KeyFlags], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyFlags
proc read*(_: typedesc[OpenpgpMessage_Features], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Features
proc read*(_: typedesc[OpenpgpMessage_PrimaryUserId], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PrimaryUserId
proc read*(_: typedesc[OpenpgpMessage_Subpacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpackets): OpenpgpMessage_Subpacket
proc read*(_: typedesc[OpenpgpMessage_OldPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Packet): OpenpgpMessage_OldPacket
proc read*(_: typedesc[OpenpgpMessage_Issuer], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Issuer
proc read*(_: typedesc[OpenpgpMessage_ExportableCertification], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_ExportableCertification
proc read*(_: typedesc[OpenpgpMessage_SignatureExpirationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureExpirationTime
proc read*(_: typedesc[OpenpgpMessage_SignatureCreationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureCreationTime
proc read*(_: typedesc[OpenpgpMessage_SignaturePacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage_SignaturePacket
proc read*(_: typedesc[OpenpgpMessage_Revocable], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Revocable
proc read*(_: typedesc[OpenpgpMessage_EmbeddedSignature], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_EmbeddedSignature
proc read*(_: typedesc[OpenpgpMessage_PreferredKeyServer], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredKeyServer
proc read*(_: typedesc[OpenpgpMessage_ReasonForRevocation], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_ReasonForRevocation
proc read*(_: typedesc[OpenpgpMessage_LenSubpacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_LenSubpacket
proc read*(_: typedesc[OpenpgpMessage_NotationData], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_NotationData
proc read*(_: typedesc[OpenpgpMessage_PublicKeyPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage_PublicKeyPacket
proc read*(_: typedesc[OpenpgpMessage_KeyExpirationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyExpirationTime
proc read*(_: typedesc[OpenpgpMessage_Packet], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage): OpenpgpMessage_Packet
proc read*(_: typedesc[OpenpgpMessage_TrustSignature], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_TrustSignature

proc len*(this: OpenpgpMessage_LenSubpacket): int


##[
The OpenPGP Message Format is a format to store encryption and signature keys for emails.
@see <a href="https://tools.ietf.org/html/rfc4880">Source</a>
]##
proc read*(_: typedesc[OpenpgpMessage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage =
  template this: untyped = result
  this = new(OpenpgpMessage)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_Packet.read(this.io, this.root, this)
      this.packets.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage], filename: string): OpenpgpMessage =
  OpenpgpMessage.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PreferredHashAlgorithms], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredHashAlgorithms =
  template this: untyped = result
  this = new(OpenpgpMessage_PreferredHashAlgorithms)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_HashAlgorithms(this.io.readU1())
      this.algorithm.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage_PreferredHashAlgorithms], filename: string): OpenpgpMessage_PreferredHashAlgorithms =
  OpenpgpMessage_PreferredHashAlgorithms.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PreferredCompressionAlgorithms], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredCompressionAlgorithms =
  template this: untyped = result
  this = new(OpenpgpMessage_PreferredCompressionAlgorithms)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_CompressionAlgorithms(this.io.readU1())
      this.algorithm.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage_PreferredCompressionAlgorithms], filename: string): OpenpgpMessage_PreferredCompressionAlgorithms =
  OpenpgpMessage_PreferredCompressionAlgorithms.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SignersUserId], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignersUserId =
  template this: untyped = result
  this = new(OpenpgpMessage_SignersUserId)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let userIdExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.userId = userIdExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SignersUserId], filename: string): OpenpgpMessage_SignersUserId =
  OpenpgpMessage_SignersUserId.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SecretKeyPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_OldPacket): OpenpgpMessage_SecretKeyPacket =
  template this: untyped = result
  this = new(OpenpgpMessage_SecretKeyPacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let publicKeyExpr = OpenpgpMessage_PublicKeyPacket.read(this.io, this.root, this)
  this.publicKey = publicKeyExpr
  let stringToKeyExpr = this.io.readU1()
  this.stringToKey = stringToKeyExpr
  if this.stringToKey >= 254:
    let symmetricEncryptionAlgorithmExpr = OpenpgpMessage_SymmetricKeyAlgorithm(this.io.readU1())
    this.symmetricEncryptionAlgorithm = symmetricEncryptionAlgorithmExpr
  let secretKeyExpr = this.io.readBytesFull()
  this.secretKey = secretKeyExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SecretKeyPacket], filename: string): OpenpgpMessage_SecretKeyPacket =
  OpenpgpMessage_SecretKeyPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_KeyServerPreferences], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyServerPreferences =
  template this: untyped = result
  this = new(OpenpgpMessage_KeyServerPreferences)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_ServerFlags(this.io.readU1())
      this.flag.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage_KeyServerPreferences], filename: string): OpenpgpMessage_KeyServerPreferences =
  OpenpgpMessage_KeyServerPreferences.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_RegularExpression], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_RegularExpression =
  template this: untyped = result
  this = new(OpenpgpMessage_RegularExpression)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let regexExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.regex = regexExpr

proc fromFile*(_: typedesc[OpenpgpMessage_RegularExpression], filename: string): OpenpgpMessage_RegularExpression =
  OpenpgpMessage_RegularExpression.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Subpackets], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_SignaturePacket): OpenpgpMessage_Subpackets =
  template this: untyped = result
  this = new(OpenpgpMessage_Subpackets)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_Subpacket.read(this.io, this.root, this)
      this.subpacketss.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage_Subpackets], filename: string): OpenpgpMessage_Subpackets =
  OpenpgpMessage_Subpackets.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_RevocationKey], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_RevocationKey =
  template this: untyped = result
  this = new(OpenpgpMessage_RevocationKey)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let classExpr = this.io.readU1()
  this.class = classExpr
  let publicKeyAlgorithmExpr = OpenpgpMessage_PublicKeyAlgorithms(this.io.readU1())
  this.publicKeyAlgorithm = publicKeyAlgorithmExpr
  let fingerprintExpr = this.io.readBytes(int(20))
  this.fingerprint = fingerprintExpr

proc fromFile*(_: typedesc[OpenpgpMessage_RevocationKey], filename: string): OpenpgpMessage_RevocationKey =
  OpenpgpMessage_RevocationKey.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_UserIdPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_OldPacket): OpenpgpMessage_UserIdPacket =
  template this: untyped = result
  this = new(OpenpgpMessage_UserIdPacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let userIdExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.userId = userIdExpr

proc fromFile*(_: typedesc[OpenpgpMessage_UserIdPacket], filename: string): OpenpgpMessage_UserIdPacket =
  OpenpgpMessage_UserIdPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PolicyUri], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PolicyUri =
  template this: untyped = result
  this = new(OpenpgpMessage_PolicyUri)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uriExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.uri = uriExpr

proc fromFile*(_: typedesc[OpenpgpMessage_PolicyUri], filename: string): OpenpgpMessage_PolicyUri =
  OpenpgpMessage_PolicyUri.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SignatureTarget], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureTarget =
  template this: untyped = result
  this = new(OpenpgpMessage_SignatureTarget)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let publicKeyAlgorithmExpr = OpenpgpMessage_PublicKeyAlgorithms(this.io.readU1())
  this.publicKeyAlgorithm = publicKeyAlgorithmExpr
  let hashAlgorithmExpr = OpenpgpMessage_HashAlgorithms(this.io.readU1())
  this.hashAlgorithm = hashAlgorithmExpr
  let hashExpr = this.io.readBytesFull()
  this.hash = hashExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SignatureTarget], filename: string): OpenpgpMessage_SignatureTarget =
  OpenpgpMessage_SignatureTarget.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_KeyFlags], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyFlags =
  template this: untyped = result
  this = new(OpenpgpMessage_KeyFlags)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = OpenpgpMessage_KeyFlags(this.io.readU1())
      this.flag.add(it)
      inc i

proc fromFile*(_: typedesc[OpenpgpMessage_KeyFlags], filename: string): OpenpgpMessage_KeyFlags =
  OpenpgpMessage_KeyFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Features], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Features =
  template this: untyped = result
  this = new(OpenpgpMessage_Features)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readBytesFull()
  this.flags = flagsExpr

proc fromFile*(_: typedesc[OpenpgpMessage_Features], filename: string): OpenpgpMessage_Features =
  OpenpgpMessage_Features.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PrimaryUserId], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PrimaryUserId =
  template this: untyped = result
  this = new(OpenpgpMessage_PrimaryUserId)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let userIdExpr = this.io.readU1()
  this.userId = userIdExpr

proc fromFile*(_: typedesc[OpenpgpMessage_PrimaryUserId], filename: string): OpenpgpMessage_PrimaryUserId =
  OpenpgpMessage_PrimaryUserId.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Subpacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpackets): OpenpgpMessage_Subpacket =
  template this: untyped = result
  this = new(OpenpgpMessage_Subpacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = OpenpgpMessage_LenSubpacket.read(this.io, this.root, this)
  this.len = lenExpr
  let subpacketTypeExpr = OpenpgpMessage_SubpacketTypes(this.io.readU1())
  this.subpacketType = subpacketTypeExpr
  block:
    let on = this.subpacketType
    if on == openpgp_message.preferred_key_server:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_PreferredKeyServer.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.issuer:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_Issuer.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.revocable:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_Revocable.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.signature_target:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_SignatureTarget.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.regular_expression:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_RegularExpression.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.exportable_certification:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_ExportableCertification.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.reason_for_revocation:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_ReasonForRevocation.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.key_server_preferences:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_KeyServerPreferences.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.signature_creation_time:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_SignatureCreationTime.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.preferred_hash_algorithms:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_PreferredHashAlgorithms.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.trust_signature:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_TrustSignature.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.key_expiration_time:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_KeyExpirationTime.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.key_flags:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_KeyFlags.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.signature_expiration_time:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_SignatureExpirationTime.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.features:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_Features.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.signers_user_id:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_SignersUserId.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.notation_data:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_NotationData.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.revocation_key:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_RevocationKey.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.preferred_compression_algorithms:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_PreferredCompressionAlgorithms.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.policy_uri:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_PolicyUri.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.primary_user_id:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_PrimaryUserId.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == openpgp_message.embedded_signature:
      let rawContentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = OpenpgpMessage_EmbeddedSignature.read(rawContentIo, this.root, this)
      this.content = contentExpr
    else:
      let contentExpr = this.io.readBytes(int((this.len.len - 1)))
      this.content = contentExpr

proc fromFile*(_: typedesc[OpenpgpMessage_Subpacket], filename: string): OpenpgpMessage_Subpacket =
  OpenpgpMessage_Subpacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_OldPacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Packet): OpenpgpMessage_OldPacket =
  template this: untyped = result
  this = new(OpenpgpMessage_OldPacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    let on = this.parent.lenType
    if on == 0:
      let lenExpr = uint32(this.io.readU1())
      this.len = lenExpr
    elif on == 1:
      let lenExpr = uint32(this.io.readU2be())
      this.len = lenExpr
    elif on == 2:
      let lenExpr = this.io.readU4be()
      this.len = lenExpr
  block:
    let on = this.parent.packetTypeOld
    if on == openpgp_message.public_key_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_PublicKeyPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == openpgp_message.public_subkey_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_PublicKeyPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == openpgp_message.user_id_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_UserIdPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == openpgp_message.signature_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_SignaturePacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == openpgp_message.secret_subkey_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_PublicKeyPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == openpgp_message.secret_key_packet:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = OpenpgpMessage_SecretKeyPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.len))
      this.body = bodyExpr

proc fromFile*(_: typedesc[OpenpgpMessage_OldPacket], filename: string): OpenpgpMessage_OldPacket =
  OpenpgpMessage_OldPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Issuer], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Issuer =
  template this: untyped = result
  this = new(OpenpgpMessage_Issuer)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyidExpr = this.io.readU8be()
  this.keyid = keyidExpr

proc fromFile*(_: typedesc[OpenpgpMessage_Issuer], filename: string): OpenpgpMessage_Issuer =
  OpenpgpMessage_Issuer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_ExportableCertification], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_ExportableCertification =
  template this: untyped = result
  this = new(OpenpgpMessage_ExportableCertification)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let exportableExpr = this.io.readU1()
  this.exportable = exportableExpr

proc fromFile*(_: typedesc[OpenpgpMessage_ExportableCertification], filename: string): OpenpgpMessage_ExportableCertification =
  OpenpgpMessage_ExportableCertification.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SignatureExpirationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureExpirationTime =
  template this: untyped = result
  this = new(OpenpgpMessage_SignatureExpirationTime)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timeExpr = this.io.readU4be()
  this.time = timeExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SignatureExpirationTime], filename: string): OpenpgpMessage_SignatureExpirationTime =
  OpenpgpMessage_SignatureExpirationTime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SignatureCreationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_SignatureCreationTime =
  template this: untyped = result
  this = new(OpenpgpMessage_SignatureCreationTime)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timeExpr = this.io.readU4be()
  this.time = timeExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SignatureCreationTime], filename: string): OpenpgpMessage_SignatureCreationTime =
  OpenpgpMessage_SignatureCreationTime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_SignaturePacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage_SignaturePacket =
  template this: untyped = result
  this = new(OpenpgpMessage_SignaturePacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let signatureTypeExpr = this.io.readU1()
  this.signatureType = signatureTypeExpr
  let publicKeyAlgorithmExpr = OpenpgpMessage_PublicKeyAlgorithms(this.io.readU1())
  this.publicKeyAlgorithm = publicKeyAlgorithmExpr
  let hashAlgorithmExpr = OpenpgpMessage_HashAlgorithms(this.io.readU1())
  this.hashAlgorithm = hashAlgorithmExpr
  let lenHashedSubpacketExpr = this.io.readU2be()
  this.lenHashedSubpacket = lenHashedSubpacketExpr
  let rawHashedSubpacketsExpr = this.io.readBytes(int(this.lenHashedSubpacket))
  this.rawHashedSubpackets = rawHashedSubpacketsExpr
  let rawHashedSubpacketsIo = newKaitaiStream(rawHashedSubpacketsExpr)
  let hashedSubpacketsExpr = OpenpgpMessage_Subpackets.read(rawHashedSubpacketsIo, this.root, this)
  this.hashedSubpackets = hashedSubpacketsExpr
  let lenUnhashedSubpacketExpr = this.io.readU2be()
  this.lenUnhashedSubpacket = lenUnhashedSubpacketExpr
  let rawUnhashedSubpacketsExpr = this.io.readBytes(int(this.lenUnhashedSubpacket))
  this.rawUnhashedSubpackets = rawUnhashedSubpacketsExpr
  let rawUnhashedSubpacketsIo = newKaitaiStream(rawUnhashedSubpacketsExpr)
  let unhashedSubpacketsExpr = OpenpgpMessage_Subpackets.read(rawUnhashedSubpacketsIo, this.root, this)
  this.unhashedSubpackets = unhashedSubpacketsExpr
  let leftSignedHashExpr = this.io.readU2be()
  this.leftSignedHash = leftSignedHashExpr
  let rsaNExpr = this.io.readU2be()
  this.rsaN = rsaNExpr
  let signatureExpr = this.io.readBytesFull()
  this.signature = signatureExpr

proc fromFile*(_: typedesc[OpenpgpMessage_SignaturePacket], filename: string): OpenpgpMessage_SignaturePacket =
  OpenpgpMessage_SignaturePacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Revocable], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_Revocable =
  template this: untyped = result
  this = new(OpenpgpMessage_Revocable)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let revocableExpr = this.io.readU1()
  this.revocable = revocableExpr

proc fromFile*(_: typedesc[OpenpgpMessage_Revocable], filename: string): OpenpgpMessage_Revocable =
  OpenpgpMessage_Revocable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_EmbeddedSignature], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_EmbeddedSignature =
  template this: untyped = result
  this = new(OpenpgpMessage_EmbeddedSignature)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signaturePacketExpr = OpenpgpMessage_SignaturePacket.read(this.io, this.root, this)
  this.signaturePacket = signaturePacketExpr

proc fromFile*(_: typedesc[OpenpgpMessage_EmbeddedSignature], filename: string): OpenpgpMessage_EmbeddedSignature =
  OpenpgpMessage_EmbeddedSignature.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PreferredKeyServer], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_PreferredKeyServer =
  template this: untyped = result
  this = new(OpenpgpMessage_PreferredKeyServer)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uriExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.uri = uriExpr

proc fromFile*(_: typedesc[OpenpgpMessage_PreferredKeyServer], filename: string): OpenpgpMessage_PreferredKeyServer =
  OpenpgpMessage_PreferredKeyServer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_ReasonForRevocation], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_ReasonForRevocation =
  template this: untyped = result
  this = new(OpenpgpMessage_ReasonForRevocation)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let revocationCodeExpr = OpenpgpMessage_RevocationCodes(this.io.readU1())
  this.revocationCode = revocationCodeExpr
  let reasonExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.reason = reasonExpr

proc fromFile*(_: typedesc[OpenpgpMessage_ReasonForRevocation], filename: string): OpenpgpMessage_ReasonForRevocation =
  OpenpgpMessage_ReasonForRevocation.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_LenSubpacket], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_LenSubpacket =
  template this: untyped = result
  this = new(OpenpgpMessage_LenSubpacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let firstOctetExpr = this.io.readU1()
  this.firstOctet = firstOctetExpr
  if  ((this.firstOctet >= 192) and (this.firstOctet < 255)) :
    let secondOctetExpr = this.io.readU1()
    this.secondOctet = secondOctetExpr
  if this.firstOctet == 255:
    let scalarExpr = this.io.readU4be()
    this.scalar = scalarExpr

proc len(this: OpenpgpMessage_LenSubpacket): int = 
  if this.lenInst != nil:
    return this.lenInst
  let lenInstExpr = int((if this.firstOctet < 192: this.firstOctet else: (if  ((this.firstOctet >= 192) and (this.firstOctet < 255)) : ((((this.firstOctet - 192) shl 8) + this.secondOctet) + 192) else: this.scalar)))
  this.lenInst = lenInstExpr
  if this.lenInst != nil:
    return this.lenInst

proc fromFile*(_: typedesc[OpenpgpMessage_LenSubpacket], filename: string): OpenpgpMessage_LenSubpacket =
  OpenpgpMessage_LenSubpacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_NotationData], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_NotationData =
  template this: untyped = result
  this = new(OpenpgpMessage_NotationData)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readBytes(int(4))
  this.flags = flagsExpr
  let lenNameExpr = this.io.readU2be()
  this.lenName = lenNameExpr
  let lenValueExpr = this.io.readU2be()
  this.lenValue = lenValueExpr
  let nameExpr = this.io.readBytes(int(this.lenName))
  this.name = nameExpr
  let valueExpr = this.io.readBytes(int(this.lenValue))
  this.value = valueExpr

proc fromFile*(_: typedesc[OpenpgpMessage_NotationData], filename: string): OpenpgpMessage_NotationData =
  OpenpgpMessage_NotationData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_PublicKeyPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): OpenpgpMessage_PublicKeyPacket =
  template this: untyped = result
  this = new(OpenpgpMessage_PublicKeyPacket)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let timestampExpr = this.io.readU4be()
  this.timestamp = timestampExpr
  let publicKeyAlgorithmExpr = OpenpgpMessage_PublicKeyAlgorithms(this.io.readU1())
  this.publicKeyAlgorithm = publicKeyAlgorithmExpr
  let lenAlgExpr = this.io.readU2be()
  this.lenAlg = lenAlgExpr
  let rsaNExpr = this.io.readBytes(int((this.lenAlg div 8)))
  this.rsaN = rsaNExpr
  let paddingExpr = this.io.readU2be()
  this.padding = paddingExpr
  let rsaEExpr = this.io.readBytes(int(3))
  this.rsaE = rsaEExpr

proc fromFile*(_: typedesc[OpenpgpMessage_PublicKeyPacket], filename: string): OpenpgpMessage_PublicKeyPacket =
  OpenpgpMessage_PublicKeyPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_KeyExpirationTime], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_KeyExpirationTime =
  template this: untyped = result
  this = new(OpenpgpMessage_KeyExpirationTime)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timeExpr = this.io.readU4be()
  this.time = timeExpr

proc fromFile*(_: typedesc[OpenpgpMessage_KeyExpirationTime], filename: string): OpenpgpMessage_KeyExpirationTime =
  OpenpgpMessage_KeyExpirationTime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_Packet], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage): OpenpgpMessage_Packet =
  template this: untyped = result
  this = new(OpenpgpMessage_Packet)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let oneExpr = this.io.readBitsIntBe(1) != 0
  this.one = oneExpr
  let newPacketFormatExpr = this.io.readBitsIntBe(1) != 0
  this.newPacketFormat = newPacketFormatExpr
  if this.newPacketFormat:
    let packetTypeNewExpr = OpenpgpMessage_PacketTags(this.io.readBitsIntBe(6))
    this.packetTypeNew = packetTypeNewExpr
  if not(this.newPacketFormat):
    let packetTypeOldExpr = OpenpgpMessage_PacketTags(this.io.readBitsIntBe(4))
    this.packetTypeOld = packetTypeOldExpr
  if not(this.newPacketFormat):
    let lenTypeExpr = this.io.readBitsIntBe(2)
    this.lenType = lenTypeExpr
  alignToByte(this.io)
  block:
    let on = this.newPacketFormat
    if on == false:
      let bodyExpr = OpenpgpMessage_OldPacket.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[OpenpgpMessage_Packet], filename: string): OpenpgpMessage_Packet =
  OpenpgpMessage_Packet.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[OpenpgpMessage_TrustSignature], io: KaitaiStream, root: KaitaiStruct, parent: OpenpgpMessage_Subpacket): OpenpgpMessage_TrustSignature =
  template this: untyped = result
  this = new(OpenpgpMessage_TrustSignature)
  let root = if root == nil: cast[OpenpgpMessage](this) else: cast[OpenpgpMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let levelExpr = this.io.readU1()
  this.level = levelExpr
  let amountExpr = this.io.readU1()
  this.amount = amountExpr

proc fromFile*(_: typedesc[OpenpgpMessage_TrustSignature], filename: string): OpenpgpMessage_TrustSignature =
  OpenpgpMessage_TrustSignature.read(newKaitaiFileStream(filename), nil, nil)

