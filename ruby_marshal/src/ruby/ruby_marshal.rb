# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Ruby's Marshal module allows serialization and deserialization of
# many standard and arbitrary Ruby objects in a compact binary
# format. It is relatively fast, available in stdlibs standard and
# allows conservation of language-specific properties (such as symbols
# or encoding-aware strings).
# 
# Feature-wise, it is comparable to other language-specific
# implementations, such as:
# 
# * Java's
#   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
# * .NET
#   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
# * Python's
#   [marshal](https://docs.python.org/3/library/marshal.html),
#   [pickle](https://docs.python.org/3/library/pickle.html) and
#   [shelve](https://docs.python.org/3/library/shelve.html)
# 
# From internal perspective, serialized stream consists of a simple
# magic header and a record.
# @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format Source
class RubyMarshal < Kaitai::Struct::Struct

  CODES = {
    34 => :codes_ruby_string,
    48 => :codes_const_nil,
    58 => :codes_ruby_symbol,
    59 => :codes_ruby_symbol_link,
    70 => :codes_const_false,
    73 => :codes_instance_var,
    83 => :codes_ruby_struct,
    84 => :codes_const_true,
    91 => :codes_ruby_array,
    105 => :codes_packed_int,
    108 => :codes_bignum,
    123 => :codes_ruby_hash,
  }
  I__CODES = CODES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.ensure_fixed_contents([4, 8].pack('C*'))
    @records = Record.new(@_io, self, @_root)
    self
  end
  class RubyArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_elements = PackedInt.new(@_io, self, @_root)
      @elements = Array.new(num_elements.value)
      (num_elements.value).times { |i|
        @elements[i] = Record.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_elements
    attr_reader :elements
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum Source
  class Bignum < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sign = @_io.read_u1
      @len_div_2 = PackedInt.new(@_io, self, @_root)
      @body = @_io.read_bytes((len_div_2.value * 2))
      self
    end

    ##
    # A single byte containing `+` for a positive value or `-` for a negative value.
    attr_reader :sign

    ##
    # Length of bignum body, divided by 2.
    attr_reader :len_div_2

    ##
    # Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
    attr_reader :body
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct Source
  class RubyStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = Record.new(@_io, self, @_root)
      @num_members = PackedInt.new(@_io, self, @_root)
      @members = Array.new(num_members.value)
      (num_members.value).times { |i|
        @members[i] = Pair.new(@_io, self, @_root)
      }
      self
    end

    ##
    # Symbol containing the name of the struct.
    attr_reader :name

    ##
    # Number of members in a struct
    attr_reader :num_members
    attr_reader :members
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence Source
  class RubySymbol < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = PackedInt.new(@_io, self, @_root)
      @name = (@_io.read_bytes(len.value)).force_encoding("UTF-8")
      self
    end
    attr_reader :len
    attr_reader :name
  end

  ##
  # Ruby uses sophisticated system to pack integers: first `code`
  # byte either determines packing scheme or carries encoded
  # immediate value (thus allowing smaller values from -123 to 122
  # (inclusive) to take only one byte. There are 11 encoding schemes
  # in total:
  # 
  # * 0 is encoded specially (as 0)
  # * 1..122 are encoded as immediate value with a shift
  # * 123..255 are encoded with code of 0x01 and 1 extra byte
  # * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
  # * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
  #   bytes
  # * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
  #   extra bytes
  # * -123..-1 are encoded as immediate value with another shift
  # * -256..-124 are encoded with code of 0xff and 1 extra byte
  # * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
  # * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
  #    bytes
  # * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
  #    extra bytes
  # 
  # Values beyond that are serialized as bignum (even if they
  # technically might be not Bignum class in Ruby implementation,
  # i.e. if they fit into 64 bits on a 64-bit platform).
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long Source
  class PackedInt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = @_io.read_u1
      case code
      when 4
        @encoded = @_io.read_u4le
      when 1
        @encoded = @_io.read_u1
      when 252
        @encoded = @_io.read_u4le
      when 253
        @encoded = @_io.read_u2le
      when 3
        @encoded = @_io.read_u2le
      when 2
        @encoded = @_io.read_u2le
      when 255
        @encoded = @_io.read_u1
      when 254
        @encoded = @_io.read_u2le
      end
      case code
      when 3
        @encoded2 = @_io.read_u1
      when 253
        @encoded2 = @_io.read_u1
      end
      self
    end
    def is_immediate
      return @is_immediate unless @is_immediate.nil?
      @is_immediate =  ((code > 4) && (code < 252)) 
      @is_immediate
    end
    def value
      return @value unless @value.nil?
      @value = (is_immediate ? (code < 128 ? (code - 5) : (4 - (~(code) & 127))) : (code == 0 ? 0 : (code == 255 ? (encoded - 256) : (code == 254 ? (encoded - 65536) : (code == 253 ? (((encoded2 << 16) | encoded) - 16777216) : (code == 3 ? ((encoded2 << 16) | encoded) : encoded))))))
      @value
    end
    attr_reader :code
    attr_reader :encoded

    ##
    # One extra byte for 3-byte integers (0x03 and 0xfd), as
    # there is no standard `u3` type in KS.
    attr_reader :encoded2
  end
  class Pair < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key = Record.new(@_io, self, @_root)
      @value = Record.new(@_io, self, @_root)
      self
    end
    attr_reader :key
    attr_reader :value
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables Source
  class InstanceVar < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @obj = Record.new(@_io, self, @_root)
      @num_vars = PackedInt.new(@_io, self, @_root)
      @vars = Array.new(num_vars.value)
      (num_vars.value).times { |i|
        @vars[i] = Pair.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :obj
    attr_reader :num_vars
    attr_reader :vars
  end

  ##
  # Each record starts with a single byte that determines its type
  # (`code`) and contents. If necessary, additional info as parsed
  # as `body`, to be determined by `code`.
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(RubyMarshal::CODES, @_io.read_u1)
      case code
      when :codes_packed_int
        @body = PackedInt.new(@_io, self, @_root)
      when :codes_bignum
        @body = Bignum.new(@_io, self, @_root)
      when :codes_ruby_array
        @body = RubyArray.new(@_io, self, @_root)
      when :codes_ruby_symbol_link
        @body = PackedInt.new(@_io, self, @_root)
      when :codes_ruby_struct
        @body = RubyStruct.new(@_io, self, @_root)
      when :codes_ruby_string
        @body = RubyString.new(@_io, self, @_root)
      when :codes_instance_var
        @body = InstanceVar.new(@_io, self, @_root)
      when :codes_ruby_hash
        @body = RubyHash.new(@_io, self, @_root)
      when :codes_ruby_symbol
        @body = RubySymbol.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :code
    attr_reader :body
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value Source
  class RubyHash < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_pairs = PackedInt.new(@_io, self, @_root)
      @pairs = Array.new(num_pairs.value)
      (num_pairs.value).times { |i|
        @pairs[i] = Pair.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_pairs
    attr_reader :pairs
  end

  ##
  # @see https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String Source
  class RubyString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = PackedInt.new(@_io, self, @_root)
      @body = @_io.read_bytes(len.value)
      self
    end
    attr_reader :len
    attr_reader :body
  end
  attr_reader :version
  attr_reader :records
end
