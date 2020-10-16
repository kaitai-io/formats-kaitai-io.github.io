# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Parse UEFI variables db and dbx that contain signatures, certificates and
# hashes. On a Linux system using UEFI, these variables are readable from
# /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
# /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
# /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
# /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
# ("d719b2cb-3d3a-4596-a3bc-dad00e67656f" is defined as
# EFI_IMAGE_SECURITY_DATABASE_GUID and "8be4df61-93ca-11d2-aa0d-00e098032b8c"
# as EFI_GLOBAL_VARIABLE).
# Each file contains an EFI attribute (32-bit integer) followed by a list of
# EFI_SIGNATURE_LIST structures.
# @see https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf Source
class EfivarSignatureList < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @var_attributes = EfiVarAttr.new(@_io, self, @_root)
    @signatures = []
    i = 0
    while not @_io.eof?
      @signatures << SignatureList.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # @see '' EFI_SIGNATURE_LIST
  class SignatureList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature_type = @_io.read_bytes(16)
      @len_signature_list = @_io.read_u4le
      @len_signature_header = @_io.read_u4le
      @len_signature = @_io.read_u4le
      @header = @_io.read_bytes(len_signature_header)
      if len_signature > 0
        @_raw_signatures = Array.new((((len_signature_list - len_signature_header) - 28) / len_signature))
        @signatures = Array.new((((len_signature_list - len_signature_header) - 28) / len_signature))
        ((((len_signature_list - len_signature_header) - 28) / len_signature)).times { |i|
          @_raw_signatures[i] = @_io.read_bytes(len_signature)
          _io__raw_signatures = Kaitai::Struct::Stream.new(@_raw_signatures[i])
          @signatures[i] = SignatureData.new(_io__raw_signatures, self, @_root)
        }
      end
      self
    end

    ##
    # SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
    # @see '' EFI_CERT_X509_SHA512_GUID
    def is_cert_sha512_x509
      return @is_cert_sha512_x509 unless @is_cert_sha512_x509.nil?
      @is_cert_sha512_x509 = signature_type == [99, 191, 109, 68, 2, 37, 218, 76, 188, 250, 36, 101, 210, 176, 254, 157].pack('C*')
      @is_cert_sha512_x509
    end

    ##
    # SHA-224 hash
    # @see '' EFI_CERT_SHA224_GUID
    def is_cert_sha224
      return @is_cert_sha224 unless @is_cert_sha224.nil?
      @is_cert_sha224 = signature_type == [51, 82, 110, 11, 92, 166, 201, 68, 148, 7, 217, 171, 131, 191, 200, 189].pack('C*')
      @is_cert_sha224
    end

    ##
    # X.509 certificate
    # @see '' EFI_CERT_X509_GUID
    def is_cert_x509
      return @is_cert_x509 unless @is_cert_x509.nil?
      @is_cert_x509 = signature_type == [161, 89, 192, 165, 228, 148, 167, 74, 135, 181, 171, 21, 92, 43, 240, 114].pack('C*')
      @is_cert_x509
    end

    ##
    # SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
    # @see '' EFI_CERT_X509_SHA256_GUID
    def is_cert_sha256_x509
      return @is_cert_sha256_x509 unless @is_cert_sha256_x509.nil?
      @is_cert_sha256_x509 = signature_type == [146, 164, 210, 59, 192, 150, 121, 64, 180, 32, 252, 249, 142, 241, 3, 237].pack('C*')
      @is_cert_sha256_x509
    end

    ##
    # RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
    # @see '' EFI_CERT_RSA2048_GUID
    def is_cert_rsa2048_key
      return @is_cert_rsa2048_key unless @is_cert_rsa2048_key.nil?
      @is_cert_rsa2048_key = signature_type == [232, 102, 87, 60, 156, 38, 52, 78, 170, 20, 237, 119, 110, 133, 179, 182].pack('C*')
      @is_cert_rsa2048_key
    end

    ##
    # SHA-512 hash
    # @see '' EFI_CERT_SHA512_GUID
    def is_cert_sha512
      return @is_cert_sha512 unless @is_cert_sha512.nil?
      @is_cert_sha512 = signature_type == [174, 15, 62, 9, 196, 166, 80, 79, 159, 27, 212, 30, 43, 137, 193, 154].pack('C*')
      @is_cert_sha512
    end

    ##
    # SHA-384 hash
    # @see '' EFI_CERT_SHA384_GUID
    def is_cert_sha384
      return @is_cert_sha384 unless @is_cert_sha384.nil?
      @is_cert_sha384 = signature_type == [7, 83, 62, 255, 208, 159, 201, 72, 133, 241, 138, 213, 108, 112, 30, 1].pack('C*')
      @is_cert_sha384
    end

    ##
    # SHA-1 hash
    # @see '' EFI_CERT_SHA1_GUID
    def is_cert_sha1
      return @is_cert_sha1 unless @is_cert_sha1.nil?
      @is_cert_sha1 = signature_type == [18, 165, 108, 130, 16, 207, 201, 74, 177, 135, 190, 1, 73, 102, 49, 189].pack('C*')
      @is_cert_sha1
    end

    ##
    # RSA-2048 signature of a SHA-1 hash
    # @see '' EFI_CERT_RSA2048_SHA1_GUID
    def is_cert_rsa2048_sha1
      return @is_cert_rsa2048_sha1 unless @is_cert_rsa2048_sha1.nil?
      @is_cert_rsa2048_sha1 = signature_type == [79, 68, 248, 103, 67, 135, 241, 72, 163, 40, 30, 170, 184, 115, 96, 128].pack('C*')
      @is_cert_rsa2048_sha1
    end

    ##
    # SHA-256 hash
    # @see '' EFI_CERT_SHA256_GUID
    def is_cert_sha256
      return @is_cert_sha256 unless @is_cert_sha256.nil?
      @is_cert_sha256 = signature_type == [38, 22, 196, 193, 76, 80, 146, 64, 172, 169, 65, 249, 54, 147, 67, 40].pack('C*')
      @is_cert_sha256
    end

    ##
    # SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
    # @see '' EFI_CERT_X509_SHA384_GUID
    def is_cert_sha384_x509
      return @is_cert_sha384_x509 unless @is_cert_sha384_x509.nil?
      @is_cert_sha384_x509 = signature_type == [110, 135, 118, 112, 194, 128, 230, 78, 170, 210, 40, 179, 73, 166, 134, 91].pack('C*')
      @is_cert_sha384_x509
    end

    ##
    # RSA-2048 signature of a SHA-256 hash
    # @see '' EFI_CERT_RSA2048_SHA256_GUID
    def is_cert_rsa2048_sha256
      return @is_cert_rsa2048_sha256 unless @is_cert_rsa2048_sha256.nil?
      @is_cert_rsa2048_sha256 = signature_type == [144, 97, 179, 226, 155, 135, 61, 74, 173, 141, 242, 231, 187, 163, 39, 132].pack('C*')
      @is_cert_rsa2048_sha256
    end

    ##
    # DER-encoded PKCS #7 version 1.5 [RFC2315]
    # @see '' EFI_CERT_TYPE_PKCS7_GUID
    def is_cert_der_pkcs7
      return @is_cert_der_pkcs7 unless @is_cert_der_pkcs7.nil?
      @is_cert_der_pkcs7 = signature_type == [157, 210, 175, 74, 223, 104, 238, 73, 138, 169, 52, 125, 55, 86, 101, 167].pack('C*')
      @is_cert_der_pkcs7
    end

    ##
    # Type of the signature as a GUID
    attr_reader :signature_type

    ##
    # Total size of the signature list, including this header
    attr_reader :len_signature_list

    ##
    # Size of the signature header which precedes the array of signatures
    attr_reader :len_signature_header

    ##
    # Size of each signature
    attr_reader :len_signature

    ##
    # Header before the array of signatures
    attr_reader :header

    ##
    # An array of signatures
    attr_reader :signatures
    attr_reader :_raw_signatures
  end

  ##
  # @see '' EFI_SIGNATURE_DATA
  class SignatureData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @owner = @_io.read_bytes(16)
      @data = @_io.read_bytes_full
      self
    end

    ##
    # An identifier which identifies the agent which added the signature to the list
    attr_reader :owner

    ##
    # The format of the signature is defined by the SignatureType.
    attr_reader :data
  end

  ##
  # Attributes of a UEFI variable
  class EfiVarAttr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @enhanced_authenticated_access = @_io.read_bits_int_be(1) != 0
      @append_write = @_io.read_bits_int_be(1) != 0
      @time_based_authenticated_write_access = @_io.read_bits_int_be(1) != 0
      @authenticated_write_access = @_io.read_bits_int_be(1) != 0
      @hardware_error_record = @_io.read_bits_int_be(1) != 0
      @runtime_access = @_io.read_bits_int_be(1) != 0
      @bootservice_access = @_io.read_bits_int_be(1) != 0
      @non_volatile = @_io.read_bits_int_be(1) != 0
      @reserved1 = @_io.read_bits_int_be(24)
      self
    end
    attr_reader :enhanced_authenticated_access
    attr_reader :append_write
    attr_reader :time_based_authenticated_write_access
    attr_reader :authenticated_write_access
    attr_reader :hardware_error_record
    attr_reader :runtime_access
    attr_reader :bootservice_access
    attr_reader :non_volatile

    ##
    # Reserved (unused) bits
    attr_reader :reserved1
  end

  ##
  # Attributes of the UEFI variable
  attr_reader :var_attributes
  attr_reader :signatures
end
