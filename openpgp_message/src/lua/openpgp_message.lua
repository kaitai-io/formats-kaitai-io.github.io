-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- The OpenPGP Message Format is a format to store encryption and signature keys for emails.
-- See also: Source (https://tools.ietf.org/html/rfc4880)
OpenpgpMessage = class.class(KaitaiStruct)

OpenpgpMessage.PublicKeyAlgorithms = enum.Enum {
  rsa_encrypt_or_sign_hac = 1,
  rsa_encrypt_only_hac = 2,
  rsa_sign_only_hac = 3,
  elgamal_encrypt_only_elgamal_hac = 16,
  dsa_digital_signature_algorithm_fips_hac = 17,
  reserved_for_elliptic_curve = 18,
  reserved_for_ecdsa = 19,
  reserved_formerly_elgamal_encrypt_or_sign_ = 20,
  reserved_for_diffie_hellman_x_as_defined_for_ietf_s_mime = 21,
  private_experimental_algorithm_00 = 100,
  private_experimental_algorithm_01 = 101,
  private_experimental_algorithm_02 = 102,
  private_experimental_algorithm_03 = 103,
  private_experimental_algorithm_04 = 104,
  private_experimental_algorithm_05 = 105,
  private_experimental_algorithm_06 = 106,
  private_experimental_algorithm_07 = 107,
  private_experimental_algorithm_08 = 108,
  private_experimental_algorithm_09 = 109,
  private_experimental_algorithm_10 = 110,
}

OpenpgpMessage.ServerFlags = enum.Enum {
  no_modify = 128,
}

OpenpgpMessage.KeyFlags = enum.Enum {
  this_key_may_be_used_to_certify_other_keys = 1,
  this_key_may_be_used_to_sign_data = 2,
  this_key_may_be_used_to_encrypt_communications = 4,
  this_key_may_be_used_to_encrypt_storage = 8,
  the_private_component_of_this_key_may_have_been_split_by_a_secret_sharing_mechanism = 16,
  this_key_may_be_used_for_authentication = 32,
  the_private_component_of_this_key_may_be_in_the_possession_of_more_than_one_person = 128,
}

OpenpgpMessage.CompressionAlgorithms = enum.Enum {
  uncompressed = 0,
  zib = 1,
  zlib = 2,
  bzip = 3,
  private_experimental_algorithm_00 = 100,
  private_experimental_algorithm_01 = 101,
  private_experimental_algorithm_02 = 102,
  private_experimental_algorithm_03 = 103,
  private_experimental_algorithm_04 = 104,
  private_experimental_algorithm_05 = 105,
  private_experimental_algorithm_06 = 106,
  private_experimental_algorithm_07 = 107,
  private_experimental_algorithm_08 = 108,
  private_experimental_algorithm_09 = 109,
  private_experimental_algorithm_10 = 110,
}

OpenpgpMessage.PacketTags = enum.Enum {
  reserved_a_packet_tag_must_not_have_this_value = 0,
  public_key_encrypted_session_key_packet = 1,
  signature_packet = 2,
  symmetric_key_encrypted_session_key_packet = 3,
  one_pass_signature_packet = 4,
  secret_key_packet = 5,
  public_key_packet = 6,
  secret_subkey_packet = 7,
  compressed_data_packet = 8,
  symmetrically_encrypted_data_packet = 9,
  marker_packet = 10,
  literal_data_packet = 11,
  trust_packet = 12,
  user_id_packet = 13,
  public_subkey_packet = 14,
  user_attribute_packet = 17,
  sym_encrypted_and_integrity_protected_data_packet = 18,
  modification_detection_code_packet = 19,
  private_or_experimental_values_0 = 60,
  private_or_experimental_values_1 = 61,
  private_or_experimental_values_2 = 62,
  private_or_experimental_values_3 = 63,
}

OpenpgpMessage.RevocationCodes = enum.Enum {
  no_reason_specified_key_revocations_or_cert_revocations = 0,
  key_is_superseded_key_revocations = 1,
  key_material_has_been_compromised_key_revocations = 2,
  key_is_retired_and_no_longer_used_key_revocations = 3,
  user_id_information_is_no_longer_valid_cert_revocations = 32,
  private_use_1 = 100,
  private_use_2 = 101,
  private_use_3 = 102,
  private_use_4 = 103,
  private_use_11 = 110,
}

OpenpgpMessage.HashAlgorithms = enum.Enum {
  md5 = 1,
  sha1 = 2,
  ripemd160 = 3,
  reserved4 = 4,
  reserved5 = 5,
  reserved6 = 6,
  reserved7 = 7,
  sha256 = 8,
  sha384 = 9,
  sha512 = 10,
  sha224 = 11,
  private_experimental_algorithm_00 = 100,
  private_experimental_algorithm_01 = 101,
  private_experimental_algorithm_02 = 102,
  private_experimental_algorithm_03 = 103,
  private_experimental_algorithm_04 = 104,
  private_experimental_algorithm_05 = 105,
  private_experimental_algorithm_06 = 106,
  private_experimental_algorithm_07 = 107,
  private_experimental_algorithm_08 = 108,
  private_experimental_algorithm_09 = 109,
  private_experimental_algorithm_10 = 110,
}

OpenpgpMessage.SymmetricKeyAlgorithm = enum.Enum {
  plain = 0,
  idea = 1,
  triple_des = 2,
  cast5 = 3,
  blowfisch = 4,
  reserved5 = 5,
  reserved6 = 6,
  aes_128 = 7,
  aes_192 = 8,
  aes_256 = 9,
  twofish_256 = 10,
  private_experimental_algorithm_00 = 100,
  private_experimental_algorithm_01 = 101,
  private_experimental_algorithm_02 = 102,
  private_experimental_algorithm_03 = 103,
  private_experimental_algorithm_04 = 104,
  private_experimental_algorithm_05 = 105,
  private_experimental_algorithm_06 = 106,
  private_experimental_algorithm_07 = 107,
  private_experimental_algorithm_08 = 108,
  private_experimental_algorithm_09 = 109,
  private_experimental_algorithm_10 = 110,
}

OpenpgpMessage.SubpacketTypes = enum.Enum {
  reserved0 = 0,
  reserved1 = 1,
  signature_creation_time = 2,
  signature_expiration_time = 3,
  exportable_certification = 4,
  trust_signature = 5,
  regular_expression = 6,
  revocable = 7,
  reserved8 = 8,
  key_expiration_time = 9,
  placeholder_for_backward_compatibility = 10,
  preferred_symmetric_algorithms = 11,
  revocation_key = 12,
  reserved13 = 13,
  reserved14 = 14,
  reserved15 = 15,
  issuer = 16,
  reserved17 = 17,
  reserved18 = 18,
  reserved19 = 19,
  notation_data = 20,
  preferred_hash_algorithms = 21,
  preferred_compression_algorithms = 22,
  key_server_preferences = 23,
  preferred_key_server = 24,
  primary_user_id = 25,
  policy_uri = 26,
  key_flags = 27,
  signers_user_id = 28,
  reason_for_revocation = 29,
  features = 30,
  signature_target = 31,
  embedded_signature = 32,
}

function OpenpgpMessage:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage:_read()
  self.packets = {}
  local i = 0
  while not self._io:is_eof() do
    self.packets[i + 1] = OpenpgpMessage.Packet(self._io, self, self._root)
    i = i + 1
  end
end


OpenpgpMessage.PreferredHashAlgorithms = class.class(KaitaiStruct)

function OpenpgpMessage.PreferredHashAlgorithms:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PreferredHashAlgorithms:_read()
  self.algorithm = {}
  local i = 0
  while not self._io:is_eof() do
    self.algorithm[i + 1] = OpenpgpMessage.HashAlgorithms(self._io:read_u1())
    i = i + 1
  end
end


OpenpgpMessage.PreferredCompressionAlgorithms = class.class(KaitaiStruct)

function OpenpgpMessage.PreferredCompressionAlgorithms:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PreferredCompressionAlgorithms:_read()
  self.algorithm = {}
  local i = 0
  while not self._io:is_eof() do
    self.algorithm[i + 1] = OpenpgpMessage.CompressionAlgorithms(self._io:read_u1())
    i = i + 1
  end
end


OpenpgpMessage.SignersUserId = class.class(KaitaiStruct)

function OpenpgpMessage.SignersUserId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SignersUserId:_read()
  self.user_id = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


OpenpgpMessage.SecretKeyPacket = class.class(KaitaiStruct)

function OpenpgpMessage.SecretKeyPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SecretKeyPacket:_read()
  self.public_key = OpenpgpMessage.PublicKeyPacket(self._io, self, self._root)
  self.string_to_key = self._io:read_u1()
  if self.string_to_key >= 254 then
    self.symmetric_encryption_algorithm = OpenpgpMessage.SymmetricKeyAlgorithm(self._io:read_u1())
  end
  self.secret_key = self._io:read_bytes_full()
end


OpenpgpMessage.KeyServerPreferences = class.class(KaitaiStruct)

function OpenpgpMessage.KeyServerPreferences:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.KeyServerPreferences:_read()
  self.flag = {}
  local i = 0
  while not self._io:is_eof() do
    self.flag[i + 1] = OpenpgpMessage.ServerFlags(self._io:read_u1())
    i = i + 1
  end
end


OpenpgpMessage.RegularExpression = class.class(KaitaiStruct)

function OpenpgpMessage.RegularExpression:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.RegularExpression:_read()
  self.regex = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
end


OpenpgpMessage.Subpackets = class.class(KaitaiStruct)

function OpenpgpMessage.Subpackets:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Subpackets:_read()
  self.subpacketss = {}
  local i = 0
  while not self._io:is_eof() do
    self.subpacketss[i + 1] = OpenpgpMessage.Subpacket(self._io, self, self._root)
    i = i + 1
  end
end


OpenpgpMessage.RevocationKey = class.class(KaitaiStruct)

function OpenpgpMessage.RevocationKey:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.RevocationKey:_read()
  self.class = self._io:read_u1()
  self.public_key_algorithm = OpenpgpMessage.PublicKeyAlgorithms(self._io:read_u1())
  self.fingerprint = self._io:read_bytes(20)
end


OpenpgpMessage.UserIdPacket = class.class(KaitaiStruct)

function OpenpgpMessage.UserIdPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.UserIdPacket:_read()
  self.user_id = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


OpenpgpMessage.PolicyUri = class.class(KaitaiStruct)

function OpenpgpMessage.PolicyUri:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PolicyUri:_read()
  self.uri = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


OpenpgpMessage.SignatureTarget = class.class(KaitaiStruct)

function OpenpgpMessage.SignatureTarget:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SignatureTarget:_read()
  self.public_key_algorithm = OpenpgpMessage.PublicKeyAlgorithms(self._io:read_u1())
  self.hash_algorithm = OpenpgpMessage.HashAlgorithms(self._io:read_u1())
  self.hash = self._io:read_bytes_full()
end


OpenpgpMessage.KeyFlags = class.class(KaitaiStruct)

function OpenpgpMessage.KeyFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.KeyFlags:_read()
  self.flag = {}
  local i = 0
  while not self._io:is_eof() do
    self.flag[i + 1] = OpenpgpMessage.KeyFlags(self._io:read_u1())
    i = i + 1
  end
end


OpenpgpMessage.Features = class.class(KaitaiStruct)

function OpenpgpMessage.Features:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Features:_read()
  self.flags = self._io:read_bytes_full()
end


OpenpgpMessage.PrimaryUserId = class.class(KaitaiStruct)

function OpenpgpMessage.PrimaryUserId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PrimaryUserId:_read()
  self.user_id = self._io:read_u1()
end


OpenpgpMessage.Subpacket = class.class(KaitaiStruct)

function OpenpgpMessage.Subpacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Subpacket:_read()
  self.len = OpenpgpMessage.LenSubpacket(self._io, self, self._root)
  self.subpacket_type = OpenpgpMessage.SubpacketTypes(self._io:read_u1())
  local _on = self.subpacket_type
  if _on == OpenpgpMessage.SubpacketTypes.preferred_key_server then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.PreferredKeyServer(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.issuer then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.Issuer(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.revocable then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.Revocable(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.signature_target then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.SignatureTarget(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.regular_expression then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.RegularExpression(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.exportable_certification then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.ExportableCertification(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.ReasonForRevocation(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.KeyServerPreferences(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.SignatureCreationTime(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.PreferredHashAlgorithms(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.trust_signature then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.TrustSignature(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.KeyExpirationTime(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.key_flags then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.KeyFlags(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.SignatureExpirationTime(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.features then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.Features(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.signers_user_id then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.SignersUserId(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.notation_data then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.NotationData(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.revocation_key then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.RevocationKey(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.PreferredCompressionAlgorithms(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.policy_uri then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.PolicyUri(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.primary_user_id then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.PrimaryUserId(_io, self, self._root)
  elseif _on == OpenpgpMessage.SubpacketTypes.embedded_signature then
    self._raw_content = self._io:read_bytes((self.len.len - 1))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = OpenpgpMessage.EmbeddedSignature(_io, self, self._root)
  else
    self.content = self._io:read_bytes((self.len.len - 1))
  end
end


OpenpgpMessage.OldPacket = class.class(KaitaiStruct)

function OpenpgpMessage.OldPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.OldPacket:_read()
  local _on = self._parent.len_type
  if _on == 0 then
    self.len = self._io:read_u1()
  elseif _on == 1 then
    self.len = self._io:read_u2be()
  elseif _on == 2 then
    self.len = self._io:read_u4be()
  end
  local _on = self._parent.packet_type_old
  if _on == OpenpgpMessage.PacketTags.public_key_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.PublicKeyPacket(_io, self, self._root)
  elseif _on == OpenpgpMessage.PacketTags.public_subkey_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.PublicKeyPacket(_io, self, self._root)
  elseif _on == OpenpgpMessage.PacketTags.user_id_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.UserIdPacket(_io, self, self._root)
  elseif _on == OpenpgpMessage.PacketTags.signature_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.SignaturePacket(_io, self, self._root)
  elseif _on == OpenpgpMessage.PacketTags.secret_subkey_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.PublicKeyPacket(_io, self, self._root)
  elseif _on == OpenpgpMessage.PacketTags.secret_key_packet then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = OpenpgpMessage.SecretKeyPacket(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len)
  end
end


OpenpgpMessage.Issuer = class.class(KaitaiStruct)

function OpenpgpMessage.Issuer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Issuer:_read()
  self.keyid = self._io:read_u8be()
end


OpenpgpMessage.ExportableCertification = class.class(KaitaiStruct)

function OpenpgpMessage.ExportableCertification:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.ExportableCertification:_read()
  self.exportable = self._io:read_u1()
end


OpenpgpMessage.SignatureExpirationTime = class.class(KaitaiStruct)

function OpenpgpMessage.SignatureExpirationTime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SignatureExpirationTime:_read()
  self.time = self._io:read_u4be()
end


OpenpgpMessage.SignatureCreationTime = class.class(KaitaiStruct)

function OpenpgpMessage.SignatureCreationTime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SignatureCreationTime:_read()
  self.time = self._io:read_u4be()
end


OpenpgpMessage.SignaturePacket = class.class(KaitaiStruct)

function OpenpgpMessage.SignaturePacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.SignaturePacket:_read()
  self.version = self._io:read_u1()
  self.signature_type = self._io:read_u1()
  self.public_key_algorithm = OpenpgpMessage.PublicKeyAlgorithms(self._io:read_u1())
  self.hash_algorithm = OpenpgpMessage.HashAlgorithms(self._io:read_u1())
  self.len_hashed_subpacket = self._io:read_u2be()
  self._raw_hashed_subpackets = self._io:read_bytes(self.len_hashed_subpacket)
  local _io = KaitaiStream(stringstream(self._raw_hashed_subpackets))
  self.hashed_subpackets = OpenpgpMessage.Subpackets(_io, self, self._root)
  self.len_unhashed_subpacket = self._io:read_u2be()
  self._raw_unhashed_subpackets = self._io:read_bytes(self.len_unhashed_subpacket)
  local _io = KaitaiStream(stringstream(self._raw_unhashed_subpackets))
  self.unhashed_subpackets = OpenpgpMessage.Subpackets(_io, self, self._root)
  self.left_signed_hash = self._io:read_u2be()
  self.rsa_n = self._io:read_u2be()
  self.signature = self._io:read_bytes_full()
end


OpenpgpMessage.Revocable = class.class(KaitaiStruct)

function OpenpgpMessage.Revocable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Revocable:_read()
  self.revocable = self._io:read_u1()
end


OpenpgpMessage.EmbeddedSignature = class.class(KaitaiStruct)

function OpenpgpMessage.EmbeddedSignature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.EmbeddedSignature:_read()
  self.signature_packet = OpenpgpMessage.SignaturePacket(self._io, self, self._root)
end


OpenpgpMessage.PreferredKeyServer = class.class(KaitaiStruct)

function OpenpgpMessage.PreferredKeyServer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PreferredKeyServer:_read()
  self.uri = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


OpenpgpMessage.ReasonForRevocation = class.class(KaitaiStruct)

function OpenpgpMessage.ReasonForRevocation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.ReasonForRevocation:_read()
  self.revocation_code = OpenpgpMessage.RevocationCodes(self._io:read_u1())
  self.reason = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


OpenpgpMessage.LenSubpacket = class.class(KaitaiStruct)

function OpenpgpMessage.LenSubpacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.LenSubpacket:_read()
  self.first_octet = self._io:read_u1()
  if  ((self.first_octet >= 192) and (self.first_octet < 255))  then
    self.second_octet = self._io:read_u1()
  end
  if self.first_octet == 255 then
    self.scalar = self._io:read_u4be()
  end
end

OpenpgpMessage.LenSubpacket.property.len = {}
function OpenpgpMessage.LenSubpacket.property.len:get()
  if self._m_len ~= nil then
    return self._m_len
  end

  self._m_len = utils.box_unwrap((self.first_octet < 192) and utils.box_wrap(self.first_octet) or (utils.box_unwrap(( ((self.first_octet >= 192) and (self.first_octet < 255)) ) and utils.box_wrap(((((self.first_octet - 192) << 8) + self.second_octet) + 192)) or (self.scalar))))
  return self._m_len
end


OpenpgpMessage.NotationData = class.class(KaitaiStruct)

function OpenpgpMessage.NotationData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.NotationData:_read()
  self.flags = self._io:read_bytes(4)
  self.len_name = self._io:read_u2be()
  self.len_value = self._io:read_u2be()
  self.name = self._io:read_bytes(self.len_name)
  self.value = self._io:read_bytes(self.len_value)
end


OpenpgpMessage.PublicKeyPacket = class.class(KaitaiStruct)

function OpenpgpMessage.PublicKeyPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.PublicKeyPacket:_read()
  self.version = self._io:read_u1()
  self.timestamp = self._io:read_u4be()
  self.public_key_algorithm = OpenpgpMessage.PublicKeyAlgorithms(self._io:read_u1())
  self.len_alg = self._io:read_u2be()
  self.rsa_n = self._io:read_bytes(math.floor(self.len_alg / 8))
  self.padding = self._io:read_u2be()
  self.rsa_e = self._io:read_bytes(3)
end


OpenpgpMessage.KeyExpirationTime = class.class(KaitaiStruct)

function OpenpgpMessage.KeyExpirationTime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.KeyExpirationTime:_read()
  self.time = self._io:read_u4be()
end


OpenpgpMessage.Packet = class.class(KaitaiStruct)

function OpenpgpMessage.Packet:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.Packet:_read()
  self.one = self._io:read_bits_int_be(1) ~= 0
  self.new_packet_format = self._io:read_bits_int_be(1) ~= 0
  if self.new_packet_format then
    self.packet_type_new = OpenpgpMessage.PacketTags(self._io:read_bits_int_be(6))
  end
  if not(self.new_packet_format) then
    self.packet_type_old = OpenpgpMessage.PacketTags(self._io:read_bits_int_be(4))
  end
  if not(self.new_packet_format) then
    self.len_type = self._io:read_bits_int_be(2)
  end
  self._io:align_to_byte()
  local _on = self.new_packet_format
  if _on == false then
    self.body = OpenpgpMessage.OldPacket(self._io, self, self._root)
  end
end


OpenpgpMessage.TrustSignature = class.class(KaitaiStruct)

function OpenpgpMessage.TrustSignature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function OpenpgpMessage.TrustSignature:_read()
  self.level = self._io:read_u1()
  self.amount = self._io:read_u1()
end


