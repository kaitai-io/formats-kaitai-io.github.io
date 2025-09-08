# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A serialized PHP value, in the format used by PHP's built-in `serialize` and
# `unserialize` functions. This format closely mirrors PHP's data model:
# it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
# associative arrays, objects, and recursive data structures using references.
# The only PHP values not supported by this format are *resources*,
# which usually correspond to native file or connection handles and cannot be
# meaningfully serialized.
# 
# There is no official documentation for this data format;
# this spec was created based on the PHP source code and the behavior of
# `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
# serialized data between PHP versions, but in practice, the format has
# remained fully backwards-compatible - values serialized by an older
# PHP version can be unserialized on any newer PHP version.
# This spec supports serialized values from PHP 7.3 or any earlier version.
# @see https://www.php.net/manual/en/function.serialize.php Source
# @see https://www.php.net/manual/en/function.serialize.php#66147 Source
# @see https://www.php.net/manual/en/function.unserialize.php Source
# @see https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re Source
# @see https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822 Source
class PhpSerializedValue < Kaitai::Struct::Struct

  BOOL_VALUE = {
    48 => :bool_value_false,
    49 => :bool_value_true,
  }
  I__BOOL_VALUE = BOOL_VALUE.invert

  VALUE_TYPE = {
    67 => :value_type_custom_serialized_object,
    78 => :value_type_null,
    79 => :value_type_object,
    82 => :value_type_variable_reference,
    83 => :value_type_php_6_string,
    97 => :value_type_array,
    98 => :value_type_bool,
    100 => :value_type_float,
    105 => :value_type_int,
    111 => :value_type_php_3_object,
    114 => :value_type_object_reference,
    115 => :value_type_string,
  }
  I__VALUE_TYPE = VALUE_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @type = Kaitai::Struct::Stream::resolve_enum(VALUE_TYPE, @_io.read_u1)
    case type
    when :value_type_array
      @contents = ArrayContents.new(@_io, self, @_root)
    when :value_type_bool
      @contents = BoolContents.new(@_io, self, @_root)
    when :value_type_custom_serialized_object
      @contents = CustomSerializedObjectContents.new(@_io, self, @_root)
    when :value_type_float
      @contents = FloatContents.new(@_io, self, @_root)
    when :value_type_int
      @contents = IntContents.new(@_io, self, @_root)
    when :value_type_null
      @contents = NullContents.new(@_io, self, @_root)
    when :value_type_object
      @contents = ObjectContents.new(@_io, self, @_root)
    when :value_type_object_reference
      @contents = IntContents.new(@_io, self, @_root)
    when :value_type_php_3_object
      @contents = Php3ObjectContents.new(@_io, self, @_root)
    when :value_type_php_6_string
      @contents = StringContents.new(@_io, self, @_root)
    when :value_type_string
      @contents = StringContents.new(@_io, self, @_root)
    when :value_type_variable_reference
      @contents = IntContents.new(@_io, self, @_root)
    end
    self
  end

  ##
  # The contents of an array value.
  class ArrayContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/array_contents/seq/0") if not @colon == [58].pack('C*')
      @elements = CountPrefixedMapping.new(@_io, self, @_root)
      self
    end
    attr_reader :colon

    ##
    # The array's elements. Keys must be of type `int` or `string`,
    # values may have any type.
    attr_reader :elements
  end

  ##
  # The contents of a boolean value (`value_type::bool`).
  class BoolContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/bool_contents/seq/0") if not @colon == [58].pack('C*')
      @value_dec = Kaitai::Struct::Stream::resolve_enum(PhpSerializedValue::BOOL_VALUE, @_io.read_u1)
      @semicolon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([59].pack('C*'), @semicolon, @_io, "/types/bool_contents/seq/2") if not @semicolon == [59].pack('C*')
      self
    end

    ##
    # The value of the `bool`, parsed as a boolean.
    def value
      return @value unless @value.nil?
      @value = value_dec == :bool_value_true
      @value
    end
    attr_reader :colon

    ##
    # The value of the `bool`: `0` for `false` or `1` for `true`.
    attr_reader :value_dec
    attr_reader :semicolon
  end

  ##
  # A mapping (a sequence of key-value pairs) prefixed with its size.
  class CountPrefixedMapping < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_entries_dec = (@_io.read_bytes_term(58, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      @opening_brace = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([123].pack('C*'), @opening_brace, @_io, "/types/count_prefixed_mapping/seq/1") if not @opening_brace == [123].pack('C*')
      @entries = []
      (num_entries).times { |i|
        @entries << MappingEntry.new(@_io, self, @_root)
      }
      @closing_brace = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([125].pack('C*'), @closing_brace, @_io, "/types/count_prefixed_mapping/seq/3") if not @closing_brace == [125].pack('C*')
      self
    end

    ##
    # The number of key-value pairs in the mapping, parsed as an integer.
    def num_entries
      return @num_entries unless @num_entries.nil?
      @num_entries = num_entries_dec.to_i
      @num_entries
    end

    ##
    # The number of key-value pairs in the mapping, in ASCII decimal.
    attr_reader :num_entries_dec
    attr_reader :opening_brace

    ##
    # The key-value pairs contained in the mapping.
    attr_reader :entries
    attr_reader :closing_brace
  end

  ##
  # The contents of an object value that implements a custom
  # serialized format using `Serializable`.
  class CustomSerializedObjectContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon1 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon1, @_io, "/types/custom_serialized_object_contents/seq/0") if not @colon1 == [58].pack('C*')
      @class_name = LengthPrefixedQuotedString.new(@_io, self, @_root)
      @colon2 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon2, @_io, "/types/custom_serialized_object_contents/seq/2") if not @colon2 == [58].pack('C*')
      @len_data_dec = (@_io.read_bytes_term(58, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      @opening_brace = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([123].pack('C*'), @opening_brace, @_io, "/types/custom_serialized_object_contents/seq/4") if not @opening_brace == [123].pack('C*')
      @data = @_io.read_bytes(len_data)
      @closing_quote = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([125].pack('C*'), @closing_quote, @_io, "/types/custom_serialized_object_contents/seq/6") if not @closing_quote == [125].pack('C*')
      self
    end

    ##
    # The length of the serialized data in bytes, parsed as an integer.
    # The braces are not counted in this length number.
    def len_data
      return @len_data unless @len_data.nil?
      @len_data = len_data_dec.to_i
      @len_data
    end
    attr_reader :colon1

    ##
    # The name of the object's class.
    attr_reader :class_name
    attr_reader :colon2

    ##
    # The length of the serialized data in bytes, in ASCII decimal.
    # The braces are not counted in this size number.
    attr_reader :len_data_dec
    attr_reader :opening_brace

    ##
    # The custom serialized data. The braces are not included.
    # 
    # Although the surrounding braces make it look like a regular
    # serialized object, this field is actually more similar to a string:
    # it can contain arbitrary data that is not required to follow
    # any common structure.
    attr_reader :data
    attr_reader :closing_quote
  end

  ##
  # The contents of a floating-point value.
  class FloatContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/float_contents/seq/0") if not @colon == [58].pack('C*')
      @value_dec = (@_io.read_bytes_term(59, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :colon

    ##
    # The value of the `float`, in ASCII decimal, as generated by PHP's
    # usual double-to-string conversion. In particular, this means that:
    # 
    # * A decimal point may not be included (for integral numbers)
    # * The number may use exponent notation (e. g. `1.0E+16`)
    # * Positive and negative infinity are represented as `INF`
    #   and `-INF`, respectively
    # * Not-a-number is represented as `NAN`
    attr_reader :value_dec
  end

  ##
  # The contents of an integer-like value:
  # either an actual integer (`value_type::int`) or a reference
  # (`value_type::variable_reference`, `value_type::object_reference`).
  class IntContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/int_contents/seq/0") if not @colon == [58].pack('C*')
      @value_dec = (@_io.read_bytes_term(59, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end

    ##
    # The value of the `int`, parsed as an integer.
    def value
      return @value unless @value.nil?
      @value = value_dec.to_i
      @value
    end
    attr_reader :colon

    ##
    # The value of the `int`, in ASCII decimal.
    attr_reader :value_dec
  end

  ##
  # A quoted string prefixed with its length.
  # 
  # Despite the quotes surrounding the string data, it can contain
  # arbitrary bytes, which are never escaped in any way.
  # This does not cause any ambiguities when parsing - the bounds of
  # the string are determined only by the length field, not by the quotes.
  class LengthPrefixedQuotedString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data_dec = (@_io.read_bytes_term(58, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      @opening_quote = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([34].pack('C*'), @opening_quote, @_io, "/types/length_prefixed_quoted_string/seq/1") if not @opening_quote == [34].pack('C*')
      @data = @_io.read_bytes(len_data)
      @closing_quote = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([34].pack('C*'), @closing_quote, @_io, "/types/length_prefixed_quoted_string/seq/3") if not @closing_quote == [34].pack('C*')
      self
    end

    ##
    # The length of the string's contents in bytes, parsed as an integer.
    # The quotes are not counted in this size number.
    def len_data
      return @len_data unless @len_data.nil?
      @len_data = len_data_dec.to_i
      @len_data
    end

    ##
    # The length of the string's data in bytes, in ASCII decimal.
    # The quotes are not counted in this length number.
    attr_reader :len_data_dec
    attr_reader :opening_quote

    ##
    # The data contained in the string. The quotes are not included.
    attr_reader :data
    attr_reader :closing_quote
  end

  ##
  # A mapping entry consisting of a key and a value.
  class MappingEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key = PhpSerializedValue.new(@_io, self, @_root)
      @value = PhpSerializedValue.new(@_io, self, @_root)
      self
    end

    ##
    # The key of the entry.
    attr_reader :key

    ##
    # The value of the entry.
    attr_reader :value
  end

  ##
  # The contents of a null value (`value_type::null`). This structure
  # contains no actual data, since there is only a single `NULL` value.
  class NullContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @semicolon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([59].pack('C*'), @semicolon, @_io, "/types/null_contents/seq/0") if not @semicolon == [59].pack('C*')
      self
    end
    attr_reader :semicolon
  end

  ##
  # The contents of an object value serialized in the default format.
  # Unlike its PHP 3 counterpart, it contains a class name.
  class ObjectContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon1 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon1, @_io, "/types/object_contents/seq/0") if not @colon1 == [58].pack('C*')
      @class_name = LengthPrefixedQuotedString.new(@_io, self, @_root)
      @colon2 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon2, @_io, "/types/object_contents/seq/2") if not @colon2 == [58].pack('C*')
      @properties = CountPrefixedMapping.new(@_io, self, @_root)
      self
    end
    attr_reader :colon1

    ##
    # The name of the object's class.
    attr_reader :class_name
    attr_reader :colon2

    ##
    # The object's properties. Keys ust be of type `string`,
    # values may have any type.
    attr_reader :properties
  end

  ##
  # The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
  # and above, it does not contain a class name.
  class Php3ObjectContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/php_3_object_contents/seq/0") if not @colon == [58].pack('C*')
      @properties = CountPrefixedMapping.new(@_io, self, @_root)
      self
    end
    attr_reader :colon

    ##
    # The object's properties. Keys must be of type `string`,
    # values may have any type.
    attr_reader :properties
  end

  ##
  # The contents of a string value.
  # 
  # Note: PHP strings can contain arbitrary byte sequences.
  # They are not necessarily valid text in any specific encoding.
  class StringContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([58].pack('C*'), @colon, @_io, "/types/string_contents/seq/0") if not @colon == [58].pack('C*')
      @string = LengthPrefixedQuotedString.new(@_io, self, @_root)
      @semicolon = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([59].pack('C*'), @semicolon, @_io, "/types/string_contents/seq/2") if not @semicolon == [59].pack('C*')
      self
    end

    ##
    # The value of the string, as a byte array.
    def value
      return @value unless @value.nil?
      @value = string.data
      @value
    end
    attr_reader :colon
    attr_reader :string
    attr_reader :semicolon
  end

  ##
  # A single-character code indicating the type of the serialized value.
  attr_reader :type

  ##
  # The contents of the serialized value, which vary depending on the type.
  attr_reader :contents
end
