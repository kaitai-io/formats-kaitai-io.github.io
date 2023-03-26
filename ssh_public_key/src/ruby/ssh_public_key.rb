# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# SSH public keys are encoded in a special binary format, typically represented
# to end users as either one-liner OpenSSH format or multi-line PEM format
# (commerical SSH). Text wrapper carries extra information about user who
# created the key, comment, etc, but the inner binary is always base64-encoded
# and follows the same internal format.
# 
# This format spec deals with this internal binary format (called "blob" in
# openssh sources) only. Buffer is expected to be raw binary and not base64-d.
# Implementation closely follows code in OpenSSH.
# @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970 Source
class SshPublicKey < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @key_name = Cstring.new(@_io, self, @_root)
    case key_name.value
    when "ssh-rsa"
      @body = KeyRsa.new(@_io, self, @_root)
    when "ecdsa-sha2-nistp256"
      @body = KeyEcdsa.new(@_io, self, @_root)
    when "ssh-ed25519"
      @body = KeyEd25519.new(@_io, self, @_root)
    when "ssh-dss"
      @body = KeyDsa.new(@_io, self, @_root)
    end
    self
  end

  ##
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028 Source
  class KeyRsa < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rsa_e = Bignum2.new(@_io, self, @_root)
      @rsa_n = Bignum2.new(@_io, self, @_root)
      self
    end

    ##
    # Key length in bits
    def key_length
      return @key_length unless @key_length.nil?
      @key_length = rsa_n.length_in_bits
      @key_length
    end

    ##
    # Public key exponent, designated `e` in RSA documentation.
    attr_reader :rsa_e

    ##
    # Modulus of both public and private keys, designated `n` in RSA
    # documentation. Its length in bits is designated as "key length".
    attr_reader :rsa_n
  end

  ##
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124 Source
  class KeyEd25519 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_pk = @_io.read_u4be
      @pk = @_io.read_bytes(len_pk)
      self
    end
    attr_reader :len_pk
    attr_reader :pk
  end

  ##
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103 Source
  class KeyEcdsa < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @curve_name = Cstring.new(@_io, self, @_root)
      @ec = EllipticCurve.new(@_io, self, @_root)
      self
    end
    attr_reader :curve_name
    attr_reader :ec
  end

  ##
  # A integer-prefixed string designed to be read using `sshbuf_get_cstring`
  # and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
  # obscure misnomer, as typically "C string" means a null-terminated string.
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181 Source
  class Cstring < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4be
      @value = (@_io.read_bytes(len)).force_encoding("ASCII")
      self
    end
    attr_reader :len
    attr_reader :value
  end

  ##
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051 Source
  class KeyDsa < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dsa_p = Bignum2.new(@_io, self, @_root)
      @dsa_q = Bignum2.new(@_io, self, @_root)
      @dsa_g = Bignum2.new(@_io, self, @_root)
      @dsa_pub_key = Bignum2.new(@_io, self, @_root)
      self
    end
    attr_reader :dsa_p
    attr_reader :dsa_q
    attr_reader :dsa_g
    attr_reader :dsa_pub_key
  end

  ##
  # Elliptic curve dump format used by ssh. In OpenSSH code, the following
  # routines are used to read/write it:
  # 
  # * sshbuf_get_ec
  # * get_ec
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
  #   https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
  #    Source
  class EllipticCurve < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4be
      @body = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :body
  end

  ##
  # Big integers serialization format used by ssh, v2. In the code, the following
  # routines are used to read/write it:
  # 
  # * sshbuf_get_bignum2
  # * sshbuf_get_bignum2_bytes_direct
  # * sshbuf_put_bignum2
  # * sshbuf_get_bignum2_bytes_direct
  # @see https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
  #   https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
  #    Source
  class Bignum2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4be
      @body = @_io.read_bytes(len)
      self
    end

    ##
    # Length of big integer in bits. In OpenSSH sources, this corresponds to
    # `BN_num_bits` function.
    def length_in_bits
      return @length_in_bits unless @length_in_bits.nil?
      @length_in_bits = ((len - 1) * 8)
      @length_in_bits
    end
    attr_reader :len
    attr_reader :body
  end
  attr_reader :key_name
  attr_reader :body
end
