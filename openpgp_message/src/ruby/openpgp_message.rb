# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The OpenPGP Message Format is a format to store encryption and signature keys for emails.
# @see https://tools.ietf.org/html/rfc4880 Source
class OpenpgpMessage < Kaitai::Struct::Struct

  PUBLIC_KEY_ALGORITHMS = {
    1 => :public_key_algorithms_rsa_encrypt_or_sign_hac,
    2 => :public_key_algorithms_rsa_encrypt_only_hac,
    3 => :public_key_algorithms_rsa_sign_only_hac,
    16 => :public_key_algorithms_elgamal_encrypt_only_elgamal_hac,
    17 => :public_key_algorithms_dsa_digital_signature_algorithm_fips_hac,
    18 => :public_key_algorithms_reserved_for_elliptic_curve,
    19 => :public_key_algorithms_reserved_for_ecdsa,
    20 => :public_key_algorithms_reserved_formerly_elgamal_encrypt_or_sign_,
    21 => :public_key_algorithms_reserved_for_diffie_hellman_x_as_defined_for_ietf_s_mime,
    100 => :public_key_algorithms_private_experimental_algorithm_00,
    101 => :public_key_algorithms_private_experimental_algorithm_01,
    102 => :public_key_algorithms_private_experimental_algorithm_02,
    103 => :public_key_algorithms_private_experimental_algorithm_03,
    104 => :public_key_algorithms_private_experimental_algorithm_04,
    105 => :public_key_algorithms_private_experimental_algorithm_05,
    106 => :public_key_algorithms_private_experimental_algorithm_06,
    107 => :public_key_algorithms_private_experimental_algorithm_07,
    108 => :public_key_algorithms_private_experimental_algorithm_08,
    109 => :public_key_algorithms_private_experimental_algorithm_09,
    110 => :public_key_algorithms_private_experimental_algorithm_10,
  }
  I__PUBLIC_KEY_ALGORITHMS = PUBLIC_KEY_ALGORITHMS.invert

  SERVER_FLAGS = {
    128 => :server_flags_no_modify,
  }
  I__SERVER_FLAGS = SERVER_FLAGS.invert

  KEY_FLAGS = {
    1 => :key_flags_this_key_may_be_used_to_certify_other_keys,
    2 => :key_flags_this_key_may_be_used_to_sign_data,
    4 => :key_flags_this_key_may_be_used_to_encrypt_communications,
    8 => :key_flags_this_key_may_be_used_to_encrypt_storage,
    16 => :key_flags_the_private_component_of_this_key_may_have_been_split_by_a_secret_sharing_mechanism,
    32 => :key_flags_this_key_may_be_used_for_authentication,
    128 => :key_flags_the_private_component_of_this_key_may_be_in_the_possession_of_more_than_one_person,
  }
  I__KEY_FLAGS = KEY_FLAGS.invert

  COMPRESSION_ALGORITHMS = {
    0 => :compression_algorithms_uncompressed,
    1 => :compression_algorithms_zib,
    2 => :compression_algorithms_zlib,
    3 => :compression_algorithms_bzip,
    100 => :compression_algorithms_private_experimental_algorithm_00,
    101 => :compression_algorithms_private_experimental_algorithm_01,
    102 => :compression_algorithms_private_experimental_algorithm_02,
    103 => :compression_algorithms_private_experimental_algorithm_03,
    104 => :compression_algorithms_private_experimental_algorithm_04,
    105 => :compression_algorithms_private_experimental_algorithm_05,
    106 => :compression_algorithms_private_experimental_algorithm_06,
    107 => :compression_algorithms_private_experimental_algorithm_07,
    108 => :compression_algorithms_private_experimental_algorithm_08,
    109 => :compression_algorithms_private_experimental_algorithm_09,
    110 => :compression_algorithms_private_experimental_algorithm_10,
  }
  I__COMPRESSION_ALGORITHMS = COMPRESSION_ALGORITHMS.invert

  PACKET_TAGS = {
    0 => :packet_tags_reserved_a_packet_tag_must_not_have_this_value,
    1 => :packet_tags_public_key_encrypted_session_key_packet,
    2 => :packet_tags_signature_packet,
    3 => :packet_tags_symmetric_key_encrypted_session_key_packet,
    4 => :packet_tags_one_pass_signature_packet,
    5 => :packet_tags_secret_key_packet,
    6 => :packet_tags_public_key_packet,
    7 => :packet_tags_secret_subkey_packet,
    8 => :packet_tags_compressed_data_packet,
    9 => :packet_tags_symmetrically_encrypted_data_packet,
    10 => :packet_tags_marker_packet,
    11 => :packet_tags_literal_data_packet,
    12 => :packet_tags_trust_packet,
    13 => :packet_tags_user_id_packet,
    14 => :packet_tags_public_subkey_packet,
    17 => :packet_tags_user_attribute_packet,
    18 => :packet_tags_sym_encrypted_and_integrity_protected_data_packet,
    19 => :packet_tags_modification_detection_code_packet,
    60 => :packet_tags_private_or_experimental_values_0,
    61 => :packet_tags_private_or_experimental_values_1,
    62 => :packet_tags_private_or_experimental_values_2,
    63 => :packet_tags_private_or_experimental_values_3,
  }
  I__PACKET_TAGS = PACKET_TAGS.invert

  REVOCATION_CODES = {
    0 => :revocation_codes_no_reason_specified_key_revocations_or_cert_revocations,
    1 => :revocation_codes_key_is_superseded_key_revocations,
    2 => :revocation_codes_key_material_has_been_compromised_key_revocations,
    3 => :revocation_codes_key_is_retired_and_no_longer_used_key_revocations,
    32 => :revocation_codes_user_id_information_is_no_longer_valid_cert_revocations,
    100 => :revocation_codes_private_use_1,
    101 => :revocation_codes_private_use_2,
    102 => :revocation_codes_private_use_3,
    103 => :revocation_codes_private_use_4,
    110 => :revocation_codes_private_use_11,
  }
  I__REVOCATION_CODES = REVOCATION_CODES.invert

  HASH_ALGORITHMS = {
    1 => :hash_algorithms_md5,
    2 => :hash_algorithms_sha1,
    3 => :hash_algorithms_ripemd160,
    4 => :hash_algorithms_reserved4,
    5 => :hash_algorithms_reserved5,
    6 => :hash_algorithms_reserved6,
    7 => :hash_algorithms_reserved7,
    8 => :hash_algorithms_sha256,
    9 => :hash_algorithms_sha384,
    10 => :hash_algorithms_sha512,
    11 => :hash_algorithms_sha224,
    100 => :hash_algorithms_private_experimental_algorithm_00,
    101 => :hash_algorithms_private_experimental_algorithm_01,
    102 => :hash_algorithms_private_experimental_algorithm_02,
    103 => :hash_algorithms_private_experimental_algorithm_03,
    104 => :hash_algorithms_private_experimental_algorithm_04,
    105 => :hash_algorithms_private_experimental_algorithm_05,
    106 => :hash_algorithms_private_experimental_algorithm_06,
    107 => :hash_algorithms_private_experimental_algorithm_07,
    108 => :hash_algorithms_private_experimental_algorithm_08,
    109 => :hash_algorithms_private_experimental_algorithm_09,
    110 => :hash_algorithms_private_experimental_algorithm_10,
  }
  I__HASH_ALGORITHMS = HASH_ALGORITHMS.invert

  SYMMETRIC_KEY_ALGORITHM = {
    0 => :symmetric_key_algorithm_plain,
    1 => :symmetric_key_algorithm_idea,
    2 => :symmetric_key_algorithm_triple_des,
    3 => :symmetric_key_algorithm_cast5,
    4 => :symmetric_key_algorithm_blowfisch,
    5 => :symmetric_key_algorithm_reserved5,
    6 => :symmetric_key_algorithm_reserved6,
    7 => :symmetric_key_algorithm_aes_128,
    8 => :symmetric_key_algorithm_aes_192,
    9 => :symmetric_key_algorithm_aes_256,
    10 => :symmetric_key_algorithm_twofish_256,
    100 => :symmetric_key_algorithm_private_experimental_algorithm_00,
    101 => :symmetric_key_algorithm_private_experimental_algorithm_01,
    102 => :symmetric_key_algorithm_private_experimental_algorithm_02,
    103 => :symmetric_key_algorithm_private_experimental_algorithm_03,
    104 => :symmetric_key_algorithm_private_experimental_algorithm_04,
    105 => :symmetric_key_algorithm_private_experimental_algorithm_05,
    106 => :symmetric_key_algorithm_private_experimental_algorithm_06,
    107 => :symmetric_key_algorithm_private_experimental_algorithm_07,
    108 => :symmetric_key_algorithm_private_experimental_algorithm_08,
    109 => :symmetric_key_algorithm_private_experimental_algorithm_09,
    110 => :symmetric_key_algorithm_private_experimental_algorithm_10,
  }
  I__SYMMETRIC_KEY_ALGORITHM = SYMMETRIC_KEY_ALGORITHM.invert

  SUBPACKET_TYPES = {
    0 => :subpacket_types_reserved0,
    1 => :subpacket_types_reserved1,
    2 => :subpacket_types_signature_creation_time,
    3 => :subpacket_types_signature_expiration_time,
    4 => :subpacket_types_exportable_certification,
    5 => :subpacket_types_trust_signature,
    6 => :subpacket_types_regular_expression,
    7 => :subpacket_types_revocable,
    8 => :subpacket_types_reserved8,
    9 => :subpacket_types_key_expiration_time,
    10 => :subpacket_types_placeholder_for_backward_compatibility,
    11 => :subpacket_types_preferred_symmetric_algorithms,
    12 => :subpacket_types_revocation_key,
    13 => :subpacket_types_reserved13,
    14 => :subpacket_types_reserved14,
    15 => :subpacket_types_reserved15,
    16 => :subpacket_types_issuer,
    17 => :subpacket_types_reserved17,
    18 => :subpacket_types_reserved18,
    19 => :subpacket_types_reserved19,
    20 => :subpacket_types_notation_data,
    21 => :subpacket_types_preferred_hash_algorithms,
    22 => :subpacket_types_preferred_compression_algorithms,
    23 => :subpacket_types_key_server_preferences,
    24 => :subpacket_types_preferred_key_server,
    25 => :subpacket_types_primary_user_id,
    26 => :subpacket_types_policy_uri,
    27 => :subpacket_types_key_flags,
    28 => :subpacket_types_signers_user_id,
    29 => :subpacket_types_reason_for_revocation,
    30 => :subpacket_types_features,
    31 => :subpacket_types_signature_target,
    32 => :subpacket_types_embedded_signature,
  }
  I__SUBPACKET_TYPES = SUBPACKET_TYPES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @packets = []
    i = 0
    while not @_io.eof?
      @packets << Packet.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class PreferredHashAlgorithms < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @algorithm = []
      i = 0
      while not @_io.eof?
        @algorithm << Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::HASH_ALGORITHMS, @_io.read_u1)
        i += 1
      end
      self
    end
    attr_reader :algorithm
  end
  class PreferredCompressionAlgorithms < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @algorithm = []
      i = 0
      while not @_io.eof?
        @algorithm << Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::COMPRESSION_ALGORITHMS, @_io.read_u1)
        i += 1
      end
      self
    end
    attr_reader :algorithm
  end
  class SignersUserId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @user_id = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :user_id
  end
  class SecretKeyPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @public_key = PublicKeyPacket.new(@_io, self, @_root)
      @string_to_key = @_io.read_u1
      if string_to_key >= 254
        @symmetric_encryption_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::SYMMETRIC_KEY_ALGORITHM, @_io.read_u1)
      end
      @secret_key = @_io.read_bytes_full
      self
    end
    attr_reader :public_key
    attr_reader :string_to_key
    attr_reader :symmetric_encryption_algorithm
    attr_reader :secret_key
  end
  class KeyServerPreferences < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flag = []
      i = 0
      while not @_io.eof?
        @flag << Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::SERVER_FLAGS, @_io.read_u1)
        i += 1
      end
      self
    end
    attr_reader :flag
  end
  class RegularExpression < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @regex = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      self
    end
    attr_reader :regex
  end
  class Subpackets < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @subpacketss = []
      i = 0
      while not @_io.eof?
        @subpacketss << Subpacket.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :subpacketss
  end
  class RevocationKey < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class = @_io.read_u1
      @public_key_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PUBLIC_KEY_ALGORITHMS, @_io.read_u1)
      @fingerprint = @_io.read_bytes(20)
      self
    end
    attr_reader :class
    attr_reader :public_key_algorithm
    attr_reader :fingerprint
  end
  class UserIdPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @user_id = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :user_id
  end
  class PolicyUri < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @uri = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :uri
  end
  class SignatureTarget < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @public_key_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PUBLIC_KEY_ALGORITHMS, @_io.read_u1)
      @hash_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::HASH_ALGORITHMS, @_io.read_u1)
      @hash = @_io.read_bytes_full
      self
    end
    attr_reader :public_key_algorithm
    attr_reader :hash_algorithm
    attr_reader :hash
  end
  class KeyFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flag = []
      i = 0
      while not @_io.eof?
        @flag << Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::KEY_FLAGS, @_io.read_u1)
        i += 1
      end
      self
    end
    attr_reader :flag
  end
  class Features < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_bytes_full
      self
    end
    attr_reader :flags
  end
  class PrimaryUserId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @user_id = @_io.read_u1
      self
    end
    attr_reader :user_id
  end
  class Subpacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = LenSubpacket.new(@_io, self, @_root)
      @subpacket_type = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::SUBPACKET_TYPES, @_io.read_u1)
      case subpacket_type
      when :subpacket_types_preferred_key_server
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = PreferredKeyServer.new(_io__raw_content, self, @_root)
      when :subpacket_types_issuer
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = Issuer.new(_io__raw_content, self, @_root)
      when :subpacket_types_revocable
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = Revocable.new(_io__raw_content, self, @_root)
      when :subpacket_types_signature_target
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = SignatureTarget.new(_io__raw_content, self, @_root)
      when :subpacket_types_regular_expression
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = RegularExpression.new(_io__raw_content, self, @_root)
      when :subpacket_types_exportable_certification
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = ExportableCertification.new(_io__raw_content, self, @_root)
      when :subpacket_types_reason_for_revocation
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = ReasonForRevocation.new(_io__raw_content, self, @_root)
      when :subpacket_types_key_server_preferences
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = KeyServerPreferences.new(_io__raw_content, self, @_root)
      when :subpacket_types_signature_creation_time
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = SignatureCreationTime.new(_io__raw_content, self, @_root)
      when :subpacket_types_preferred_hash_algorithms
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = PreferredHashAlgorithms.new(_io__raw_content, self, @_root)
      when :subpacket_types_trust_signature
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = TrustSignature.new(_io__raw_content, self, @_root)
      when :subpacket_types_key_expiration_time
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = KeyExpirationTime.new(_io__raw_content, self, @_root)
      when :subpacket_types_key_flags
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = KeyFlags.new(_io__raw_content, self, @_root)
      when :subpacket_types_signature_expiration_time
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = SignatureExpirationTime.new(_io__raw_content, self, @_root)
      when :subpacket_types_features
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = Features.new(_io__raw_content, self, @_root)
      when :subpacket_types_signers_user_id
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = SignersUserId.new(_io__raw_content, self, @_root)
      when :subpacket_types_notation_data
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = NotationData.new(_io__raw_content, self, @_root)
      when :subpacket_types_revocation_key
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = RevocationKey.new(_io__raw_content, self, @_root)
      when :subpacket_types_preferred_compression_algorithms
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = PreferredCompressionAlgorithms.new(_io__raw_content, self, @_root)
      when :subpacket_types_policy_uri
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = PolicyUri.new(_io__raw_content, self, @_root)
      when :subpacket_types_primary_user_id
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = PrimaryUserId.new(_io__raw_content, self, @_root)
      when :subpacket_types_embedded_signature
        @_raw_content = @_io.read_bytes((len.len - 1))
        _io__raw_content = Kaitai::Struct::Stream.new(@_raw_content)
        @content = EmbeddedSignature.new(_io__raw_content, self, @_root)
      else
        @content = @_io.read_bytes((len.len - 1))
      end
      self
    end
    attr_reader :len
    attr_reader :subpacket_type
    attr_reader :content
    attr_reader :_raw_content
  end
  class OldPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _parent.len_type
      when 0
        @len = @_io.read_u1
      when 1
        @len = @_io.read_u2be
      when 2
        @len = @_io.read_u4be
      end
      case _parent.packet_type_old
      when :packet_tags_public_key_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PublicKeyPacket.new(_io__raw_body, self, @_root)
      when :packet_tags_public_subkey_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PublicKeyPacket.new(_io__raw_body, self, @_root)
      when :packet_tags_user_id_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = UserIdPacket.new(_io__raw_body, self, @_root)
      when :packet_tags_signature_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SignaturePacket.new(_io__raw_body, self, @_root)
      when :packet_tags_secret_subkey_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PublicKeyPacket.new(_io__raw_body, self, @_root)
      when :packet_tags_secret_key_packet
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SecretKeyPacket.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      self
    end
    attr_reader :len
    attr_reader :body
    attr_reader :_raw_body
  end
  class Issuer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyid = @_io.read_u8be
      self
    end
    attr_reader :keyid
  end
  class ExportableCertification < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @exportable = @_io.read_u1
      self
    end
    attr_reader :exportable
  end
  class SignatureExpirationTime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @time = @_io.read_u4be
      self
    end
    attr_reader :time
  end
  class SignatureCreationTime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @time = @_io.read_u4be
      self
    end
    attr_reader :time
  end
  class SignaturePacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u1
      @signature_type = @_io.read_u1
      @public_key_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PUBLIC_KEY_ALGORITHMS, @_io.read_u1)
      @hash_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::HASH_ALGORITHMS, @_io.read_u1)
      @len_hashed_subpacket = @_io.read_u2be
      @_raw_hashed_subpackets = @_io.read_bytes(len_hashed_subpacket)
      _io__raw_hashed_subpackets = Kaitai::Struct::Stream.new(@_raw_hashed_subpackets)
      @hashed_subpackets = Subpackets.new(_io__raw_hashed_subpackets, self, @_root)
      @len_unhashed_subpacket = @_io.read_u2be
      @_raw_unhashed_subpackets = @_io.read_bytes(len_unhashed_subpacket)
      _io__raw_unhashed_subpackets = Kaitai::Struct::Stream.new(@_raw_unhashed_subpackets)
      @unhashed_subpackets = Subpackets.new(_io__raw_unhashed_subpackets, self, @_root)
      @left_signed_hash = @_io.read_u2be
      @rsa_n = @_io.read_u2be
      @signature = @_io.read_bytes_full
      self
    end
    attr_reader :version
    attr_reader :signature_type
    attr_reader :public_key_algorithm
    attr_reader :hash_algorithm
    attr_reader :len_hashed_subpacket
    attr_reader :hashed_subpackets
    attr_reader :len_unhashed_subpacket
    attr_reader :unhashed_subpackets
    attr_reader :left_signed_hash
    attr_reader :rsa_n
    attr_reader :signature
    attr_reader :_raw_hashed_subpackets
    attr_reader :_raw_unhashed_subpackets
  end
  class Revocable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @revocable = @_io.read_u1
      self
    end
    attr_reader :revocable
  end
  class EmbeddedSignature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature_packet = SignaturePacket.new(@_io, self, @_root)
      self
    end
    attr_reader :signature_packet
  end
  class PreferredKeyServer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @uri = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :uri
  end
  class ReasonForRevocation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @revocation_code = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::REVOCATION_CODES, @_io.read_u1)
      @reason = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :revocation_code
    attr_reader :reason
  end
  class LenSubpacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @first_octet = @_io.read_u1
      if  ((first_octet >= 192) && (first_octet < 255)) 
        @second_octet = @_io.read_u1
      end
      if first_octet == 255
        @scalar = @_io.read_u4be
      end
      self
    end
    def len
      return @len unless @len.nil?
      @len = (first_octet < 192 ? first_octet : ( ((first_octet >= 192) && (first_octet < 255))  ? ((((first_octet - 192) << 8) + second_octet) + 192) : scalar))
      @len
    end
    attr_reader :first_octet
    attr_reader :second_octet
    attr_reader :scalar
  end
  class NotationData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_bytes(4)
      @len_name = @_io.read_u2be
      @len_value = @_io.read_u2be
      @name = @_io.read_bytes(len_name)
      @value = @_io.read_bytes(len_value)
      self
    end
    attr_reader :flags
    attr_reader :len_name
    attr_reader :len_value
    attr_reader :name
    attr_reader :value
  end
  class PublicKeyPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u1
      @timestamp = @_io.read_u4be
      @public_key_algorithm = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PUBLIC_KEY_ALGORITHMS, @_io.read_u1)
      @len_alg = @_io.read_u2be
      @rsa_n = @_io.read_bytes((len_alg / 8))
      @padding = @_io.read_u2be
      @rsa_e = @_io.read_bytes(3)
      self
    end
    attr_reader :version
    attr_reader :timestamp
    attr_reader :public_key_algorithm
    attr_reader :len_alg
    attr_reader :rsa_n
    attr_reader :padding
    attr_reader :rsa_e
  end
  class KeyExpirationTime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @time = @_io.read_u4be
      self
    end
    attr_reader :time
  end
  class Packet < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @one = @_io.read_bits_int_be(1) != 0
      @new_packet_format = @_io.read_bits_int_be(1) != 0
      if new_packet_format
        @packet_type_new = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PACKET_TAGS, @_io.read_bits_int_be(6))
      end
      if !(new_packet_format)
        @packet_type_old = Kaitai::Struct::Stream::resolve_enum(OpenpgpMessage::PACKET_TAGS, @_io.read_bits_int_be(4))
      end
      if !(new_packet_format)
        @len_type = @_io.read_bits_int_be(2)
      end
      @_io.align_to_byte
      case new_packet_format
      when false
        @body = OldPacket.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :one
    attr_reader :new_packet_format
    attr_reader :packet_type_new
    attr_reader :packet_type_old
    attr_reader :len_type
    attr_reader :body
  end
  class TrustSignature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @level = @_io.read_u1
      @amount = @_io.read_u1
      self
    end
    attr_reader :level
    attr_reader :amount
  end
  attr_reader :packets
end
