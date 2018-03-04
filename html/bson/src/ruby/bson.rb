# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
#   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
#   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
#   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
class Bson < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @len = @_io.read_s4le
    @_raw_fields = @_io.read_bytes((len - 5))
    io = Kaitai::Struct::Stream.new(@_raw_fields)
    @fields = ElementsList.new(io, self, @_root)
    @terminator = @_io.ensure_fixed_contents([0].pack('C*'))
    self
  end

  ##
  # Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
  class Timestamp < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @increment = @_io.read_u4le
      @timestamp = @_io.read_u4le
      self
    end
    attr_reader :increment
    attr_reader :timestamp
  end

  ##
  # The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
  class BinData < Kaitai::Struct::Struct

    SUBTYPE = {
      0 => :subtype_generic,
      1 => :subtype_function,
      2 => :subtype_byte_array_deprecated,
      3 => :subtype_uuid_deprecated,
      4 => :subtype_uuid,
      5 => :subtype_md5,
      128 => :subtype_custom,
    }
    I__SUBTYPE = SUBTYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_s4le
      @subtype = Kaitai::Struct::Stream::resolve_enum(SUBTYPE, @_io.read_u1)
      case subtype
      when :subtype_byte_array_deprecated
        @_raw_content = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_content)
        @content = ByteArrayDeprecated.new(io, self, @_root)
      else
        @content = @_io.read_bytes(len)
      end
      self
    end

    ##
    # The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
    class ByteArrayDeprecated < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len = @_io.read_s4le
        @content = @_io.read_bytes(len)
        self
      end
      attr_reader :len
      attr_reader :content
    end
    attr_reader :len
    attr_reader :subtype
    attr_reader :content
    attr_reader :_raw_content
  end
  class ElementsList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @elements = []
      i = 0
      while not @_io.eof?
        @elements << Element.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :elements
  end
  class Cstring < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      self
    end

    ##
    # MUST NOT contain '\x00', hence it is not full UTF-8.
    attr_reader :str
  end
  class String < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_s4le
      @str = (@_io.read_bytes((len - 1))).force_encoding("UTF-8")
      @terminator = @_io.ensure_fixed_contents([0].pack('C*'))
      self
    end
    attr_reader :len
    attr_reader :str
    attr_reader :terminator
  end
  class Element < Kaitai::Struct::Struct

    BSON_TYPE = {
      -1 => :bson_type_min_key,
      0 => :bson_type_end_of_object,
      1 => :bson_type_number_double,
      2 => :bson_type_string,
      3 => :bson_type_document,
      4 => :bson_type_array,
      5 => :bson_type_bin_data,
      6 => :bson_type_undefined,
      7 => :bson_type_object_id,
      8 => :bson_type_boolean,
      9 => :bson_type_utc_datetime,
      10 => :bson_type_jst_null,
      11 => :bson_type_reg_ex,
      12 => :bson_type_db_pointer,
      13 => :bson_type_javascript,
      14 => :bson_type_symbol,
      15 => :bson_type_code_with_scope,
      16 => :bson_type_number_int,
      17 => :bson_type_timestamp,
      18 => :bson_type_number_long,
      19 => :bson_type_number_decimal,
      127 => :bson_type_max_key,
    }
    I__BSON_TYPE = BSON_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type_byte = Kaitai::Struct::Stream::resolve_enum(BSON_TYPE, @_io.read_u1)
      @name = Cstring.new(@_io, self, @_root)
      case type_byte
      when :bson_type_number_double
        @content = @_io.read_f8le
      when :bson_type_code_with_scope
        @content = CodeWithScope.new(@_io, self, @_root)
      when :bson_type_object_id
        @content = ObjectId.new(@_io, self, @_root)
      when :bson_type_string
        @content = String.new(@_io, self, @_root)
      when :bson_type_reg_ex
        @content = RegEx.new(@_io, self, @_root)
      when :bson_type_number_decimal
        @content = F16.new(@_io, self, @_root)
      when :bson_type_utc_datetime
        @content = @_io.read_s8le
      when :bson_type_number_long
        @content = @_io.read_s8le
      when :bson_type_timestamp
        @content = Timestamp.new(@_io, self, @_root)
      when :bson_type_db_pointer
        @content = DbPointer.new(@_io, self, @_root)
      when :bson_type_array
        @content = Bson.new(@_io)
      when :bson_type_javascript
        @content = String.new(@_io, self, @_root)
      when :bson_type_boolean
        @content = @_io.read_u1
      when :bson_type_document
        @content = Bson.new(@_io)
      when :bson_type_symbol
        @content = String.new(@_io, self, @_root)
      when :bson_type_number_int
        @content = @_io.read_s4le
      when :bson_type_bin_data
        @content = BinData.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :type_byte
    attr_reader :name
    attr_reader :content
  end
  class DbPointer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @namespace = String.new(@_io, self, @_root)
      @id = ObjectId.new(@_io, self, @_root)
      self
    end
    attr_reader :namespace
    attr_reader :id
  end

  ##
  # Implements unsigned 24-bit (3 byte) integer.
  class U3 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      @b2 = @_io.read_u1
      @b3 = @_io.read_u1
      self
    end
    def value
      return @value unless @value.nil?
      @value = ((b1 | (b2 << 8)) | (b3 << 16))
      @value
    end
    attr_reader :b1
    attr_reader :b2
    attr_reader :b3
  end
  class CodeWithScope < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_s4le
      @source = String.new(@_io, self, @_root)
      @scope = Bson.new(@_io)
      self
    end
    attr_reader :id
    attr_reader :source

    ##
    # mapping from identifiers to values, representing the scope in which the string should be evaluated.
    attr_reader :scope
  end

  ##
  # 128-bit IEEE 754-2008 decimal floating point
  class F16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str = @_io.read_bits_int(1) != 0
      @exponent = @_io.read_bits_int(15)
      @significand_hi = @_io.read_bits_int(49)
      @_io.align_to_byte
      @significand_lo = @_io.read_u8le
      self
    end
    attr_reader :str
    attr_reader :exponent
    attr_reader :significand_hi
    attr_reader :significand_lo
  end

  ##
  # https://docs.mongodb.com/manual/reference/method/ObjectId/
  class ObjectId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @epoch_time = @_io.read_u4le
      @machine_id = U3.new(@_io, self, @_root)
      @process_id = @_io.read_u2le
      @counter = U3.new(@_io, self, @_root)
      self
    end

    ##
    # seconds since the Unix epoch
    attr_reader :epoch_time
    attr_reader :machine_id
    attr_reader :process_id

    ##
    # counter, starting with a random value.
    attr_reader :counter
  end
  class RegEx < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pattern = Cstring.new(@_io, self, @_root)
      @options = Cstring.new(@_io, self, @_root)
      self
    end
    attr_reader :pattern
    attr_reader :options
  end

  ##
  # Total number of bytes comprising the document.
  attr_reader :len
  attr_reader :fields
  attr_reader :terminator
  attr_reader :_raw_fields
end
