# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://bitcoin.org/en/developer-guide#transactions
#   https://en.bitcoin.it/wiki/Transaction
#    Source
class BitcoinTransaction < Kaitai::Struct::Struct

  SIGHASH_TYPE = {
    1 => :sighash_type_sighash_all,
    2 => :sighash_type_sighash_none,
    3 => :sighash_type_sighash_single,
    80 => :sighash_type_sighash_anyonecanpay,
  }
  I__SIGHASH_TYPE = SIGHASH_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.read_u4le
    @num_vins = @_io.read_u1
    @vins = Array.new(num_vins)
    (num_vins).times { |i|
      @vins[i] = Vin.new(@_io, self, @_root)
    }
    @num_vouts = @_io.read_u1
    @vouts = Array.new(num_vouts)
    (num_vouts).times { |i|
      @vouts[i] = Vout.new(@_io, self, @_root)
    }
    @locktime = @_io.read_u4le
    self
  end
  class Vout < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @amount = @_io.read_u8le
      @script_len = @_io.read_u1
      @script_pub_key = @_io.read_bytes(script_len)
      self
    end

    ##
    # Number of Satoshis to be transfered.
    attr_reader :amount

    ##
    # ScriptPubKey's length.
    attr_reader :script_len

    ##
    # ScriptPubKey.
    # @see https://en.bitcoin.it/wiki/Transaction#Output
    #   https://en.bitcoin.it/wiki/Script
    #    Source
    attr_reader :script_pub_key
  end
  class PublicKey < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = @_io.read_u1
      @x = @_io.read_bytes(32)
      @y = @_io.read_bytes(32)
      self
    end
    attr_reader :type

    ##
    # 'x' coordinate of the public key on the elliptic curve.
    attr_reader :x

    ##
    # 'y' coordinate of the public key on the elliptic curve.
    attr_reader :y
  end
  class Vin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @txid = @_io.read_bytes(32)
      @output_id = @_io.read_u4le
      @script_len = @_io.read_u1
      @_raw_script_sig = @_io.read_bytes(script_len)
      io = Kaitai::Struct::Stream.new(@_raw_script_sig)
      @script_sig = ScriptSignature.new(io, self, @_root)
      @end_of_vin = @_io.ensure_fixed_contents([255, 255, 255, 255].pack('C*'))
      self
    end

    ##
    # Previous transaction hash.
    attr_reader :txid

    ##
    # ID indexing an ouput of the transaction refered by txid.
    # This output will be used as an input in the present transaction.
    attr_reader :output_id

    ##
    # ScriptSig's length.
    attr_reader :script_len

    ##
    # ScriptSig.
    # @see https://en.bitcoin.it/wiki/Transaction#Input
    #   https://en.bitcoin.it/wiki/Script
    #    Source
    attr_reader :script_sig

    ##
    # Magic number indicating the end of the current input.
    attr_reader :end_of_vin
    attr_reader :_raw_script_sig
  end
  class ScriptSignature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sig_stack_len = @_io.read_u1
      @der_sig = DerSignature.new(@_io, self, @_root)
      @sig_type = Kaitai::Struct::Stream::resolve_enum(SIGHASH_TYPE, @_io.read_u1)
      @pubkey_stack_len = @_io.read_u1
      @pubkey = PublicKey.new(@_io, self, @_root)
      self
    end
    attr_reader :sig_stack_len

    ##
    # DER-encoded ECDSA signature.
    # @see https://en.wikipedia.org/wiki/X.690#DER_encoding
    #   https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
    #    Source
    attr_reader :der_sig

    ##
    # Type of signature.
    attr_reader :sig_type
    attr_reader :pubkey_stack_len

    ##
    # Public key (bitcoin address of the recipient).
    attr_reader :pubkey
  end
  class DerSignature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sequence = @_io.ensure_fixed_contents([48].pack('C*'))
      @sig_len = @_io.read_u1
      @sep_1 = @_io.ensure_fixed_contents([2].pack('C*'))
      @sig_r_len = @_io.read_u1
      @sig_r = @_io.read_bytes(sig_r_len)
      @sep_2 = @_io.ensure_fixed_contents([2].pack('C*'))
      @sig_s_len = @_io.read_u1
      @sig_s = @_io.read_bytes(sig_s_len)
      self
    end
    attr_reader :sequence
    attr_reader :sig_len
    attr_reader :sep_1

    ##
    # 'r' value's length.
    attr_reader :sig_r_len

    ##
    # 'r' value of the ECDSA signature.
    # @see https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
    attr_reader :sig_r
    attr_reader :sep_2

    ##
    # 's' value's length.
    attr_reader :sig_s_len

    ##
    # 's' value of the ECDSA signature.
    # @see https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
    attr_reader :sig_s
  end

  ##
  # Version number.
  attr_reader :version

  ##
  # Number of input transactions.
  attr_reader :num_vins

  ##
  # Input transactions.
  # An input refers to an output from a previous transaction.
  attr_reader :vins

  ##
  # Number of output transactions.
  attr_reader :num_vouts

  ##
  # Output transactions.
  attr_reader :vouts
  attr_reader :locktime
end
