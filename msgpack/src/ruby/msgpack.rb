# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# MessagePack (msgpack) is a system to serialize arbitrary structured data into a compact binary stream.
# @see https://github.com/msgpack/msgpack/blob/master/spec.md Source
class Msgpack < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @b1 = @_io.read_u1
    case b1
    when 211
      @int_extra = @_io.read_s8be
    when 209
      @int_extra = @_io.read_s2be
    when 210
      @int_extra = @_io.read_s4be
    when 208
      @int_extra = @_io.read_s1
    when 205
      @int_extra = @_io.read_u2be
    when 207
      @int_extra = @_io.read_u8be
    when 204
      @int_extra = @_io.read_u1
    when 206
      @int_extra = @_io.read_u4be
    end
    if is_float_32
      @float_32_value = @_io.read_f4be
    end
    if is_float_64
      @float_64_value = @_io.read_f8be
    end
    if is_str_8
      @str_len_8 = @_io.read_u1
    end
    if is_str_16
      @str_len_16 = @_io.read_u2be
    end
    if is_str_32
      @str_len_32 = @_io.read_u4be
    end
    if is_str
      @str_value = (@_io.read_bytes(str_len)).force_encoding("UTF-8")
    end
    if is_array_16
      @num_array_elements_16 = @_io.read_u2be
    end
    if is_array_32
      @num_array_elements_32 = @_io.read_u4be
    end
    if is_array
      @array_elements = Array.new(num_array_elements)
      (num_array_elements).times { |i|
        @array_elements[i] = Msgpack.new(@_io)
      }
    end
    if is_map_16
      @num_map_elements_16 = @_io.read_u2be
    end
    if is_map_32
      @num_map_elements_32 = @_io.read_u4be
    end
    if is_map
      @map_elements = Array.new(num_map_elements)
      (num_map_elements).times { |i|
        @map_elements[i] = MapTuple.new(@_io, self, @_root)
      }
    end
  end
  class MapTuple < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @key = Msgpack.new(@_io)
      @value = Msgpack.new(@_io)
    end
    attr_reader :key
    attr_reader :value
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array Source
  def is_array_32
    return @is_array_32 unless @is_array_32.nil?
    @is_array_32 = b1 == 221
    @is_array_32
  end
  def int_value
    return @int_value unless @int_value.nil?
    if is_int
      @int_value = (is_pos_int7 ? pos_int7_value : (is_neg_int5 ? neg_int5_value : 4919))
    end
    @int_value
  end
  def str_len
    return @str_len unless @str_len.nil?
    if is_str
      @str_len = (is_fix_str ? (b1 & 31) : (is_str_8 ? str_len_8 : (is_str_16 ? str_len_16 : str_len_32)))
    end
    @str_len
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array Source
  def is_fix_array
    return @is_fix_array unless @is_fix_array.nil?
    @is_fix_array = (b1 & 240) == 144
    @is_fix_array
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map Source
  def is_map
    return @is_map unless @is_map.nil?
    @is_map =  ((is_fix_map) || (is_map_16) || (is_map_32)) 
    @is_map
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array Source
  def is_array
    return @is_array unless @is_array.nil?
    @is_array =  ((is_fix_array) || (is_array_16) || (is_array_32)) 
    @is_array
  end
  def is_float
    return @is_float unless @is_float.nil?
    @is_float =  ((is_float_32) || (is_float_64)) 
    @is_float
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str Source
  def is_str_8
    return @is_str_8 unless @is_str_8.nil?
    @is_str_8 = b1 == 217
    @is_str_8
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map Source
  def is_fix_map
    return @is_fix_map unless @is_fix_map.nil?
    @is_fix_map = (b1 & 240) == 128
    @is_fix_map
  end
  def is_int
    return @is_int unless @is_int.nil?
    @is_int =  ((is_pos_int7) || (is_neg_int5)) 
    @is_int
  end
  def is_bool
    return @is_bool unless @is_bool.nil?
    @is_bool =  ((b1 == 194) || (b1 == 195)) 
    @is_bool
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str Source
  def is_str_16
    return @is_str_16 unless @is_str_16.nil?
    @is_str_16 = b1 == 218
    @is_str_16
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float Source
  def is_float_64
    return @is_float_64 unless @is_float_64.nil?
    @is_float_64 = b1 == 203
    @is_float_64
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map Source
  def is_map_16
    return @is_map_16 unless @is_map_16.nil?
    @is_map_16 = b1 == 222
    @is_map_16
  end
  def is_neg_int5
    return @is_neg_int5 unless @is_neg_int5.nil?
    @is_neg_int5 = (b1 & 224) == 224
    @is_neg_int5
  end
  def pos_int7_value
    return @pos_int7_value unless @pos_int7_value.nil?
    if is_pos_int7
      @pos_int7_value = b1
    end
    @pos_int7_value
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil Source
  def is_nil
    return @is_nil unless @is_nil.nil?
    @is_nil = b1 == 192
    @is_nil
  end
  def float_value
    return @float_value unless @float_value.nil?
    if is_float
      @float_value = (is_float_32 ? float_32_value : float_64_value)
    end
    @float_value
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array Source
  def num_array_elements
    return @num_array_elements unless @num_array_elements.nil?
    if is_array
      @num_array_elements = (is_fix_array ? (b1 & 15) : (is_array_16 ? num_array_elements_16 : num_array_elements_32))
    end
    @num_array_elements
  end
  def neg_int5_value
    return @neg_int5_value unless @neg_int5_value.nil?
    if is_neg_int5
      @neg_int5_value = -((b1 & 31))
    end
    @neg_int5_value
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool Source
  def bool_value
    return @bool_value unless @bool_value.nil?
    if is_bool
      @bool_value = b1 == 194
    end
    @bool_value
  end
  def is_pos_int7
    return @is_pos_int7 unless @is_pos_int7.nil?
    @is_pos_int7 = (b1 & 128) == 0
    @is_pos_int7
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array Source
  def is_array_16
    return @is_array_16 unless @is_array_16.nil?
    @is_array_16 = b1 == 220
    @is_array_16
  end
  def is_str
    return @is_str unless @is_str.nil?
    @is_str =  ((is_fix_str) || (is_str_8) || (is_str_16) || (is_str_32)) 
    @is_str
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str Source
  def is_fix_str
    return @is_fix_str unless @is_fix_str.nil?
    @is_fix_str = (b1 & 224) == 160
    @is_fix_str
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str Source
  def is_str_32
    return @is_str_32 unless @is_str_32.nil?
    @is_str_32 = b1 == 219
    @is_str_32
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map Source
  def num_map_elements
    return @num_map_elements unless @num_map_elements.nil?
    if is_map
      @num_map_elements = (is_fix_map ? (b1 & 15) : (is_map_16 ? num_map_elements_16 : num_map_elements_32))
    end
    @num_map_elements
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float Source
  def is_float_32
    return @is_float_32 unless @is_float_32.nil?
    @is_float_32 = b1 == 202
    @is_float_32
  end

  ##
  # @see https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map Source
  def is_map_32
    return @is_map_32 unless @is_map_32.nil?
    @is_map_32 = b1 == 223
    @is_map_32
  end

  ##
  # First byte is msgpack message is either a piece of data by
  # itself or determines types of further, more complex data
  # structures.
  attr_reader :b1
  attr_reader :int_extra
  attr_reader :float_32_value
  attr_reader :float_64_value
  attr_reader :str_len_8
  attr_reader :str_len_16
  attr_reader :str_len_32
  attr_reader :str_value
  attr_reader :num_array_elements_16
  attr_reader :num_array_elements_32
  attr_reader :array_elements
  attr_reader :num_map_elements_16
  attr_reader :num_map_elements_32
  attr_reader :map_elements
end
