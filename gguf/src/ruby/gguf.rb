# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
# tensor library for storing machine learning models, used for example by
# [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
# replaced the older GGML, GGMF and GGJT formats.
# 
# A GGUF file consists of a header with metadata as key-value pairs (model
# architecture, hyperparameters, tokenizer, etc.), a description of each
# tensor (name, dimensions, type and offset), and finally the tensor data.
# @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md Git tag "v0.27.0"
class Gguf < Kaitai::Struct::Struct

  GGML_TYPE = {
    0 => :ggml_type_f32,
    1 => :ggml_type_f16,
    2 => :ggml_type_q4_0,
    3 => :ggml_type_q4_1,
    4 => :ggml_type_q4_2,
    5 => :ggml_type_q4_3,
    6 => :ggml_type_q5_0,
    7 => :ggml_type_q5_1,
    8 => :ggml_type_q8_0,
    9 => :ggml_type_q8_1,
    10 => :ggml_type_q2_k,
    11 => :ggml_type_q3_k,
    12 => :ggml_type_q4_k,
    13 => :ggml_type_q5_k,
    14 => :ggml_type_q6_k,
    15 => :ggml_type_q8_k,
    16 => :ggml_type_iq2_xxs,
    17 => :ggml_type_iq2_xs,
    18 => :ggml_type_iq3_xxs,
    19 => :ggml_type_iq1_s,
    20 => :ggml_type_iq4_nl,
    21 => :ggml_type_iq3_s,
    22 => :ggml_type_iq2_s,
    23 => :ggml_type_iq4_xs,
    24 => :ggml_type_i8,
    25 => :ggml_type_i16,
    26 => :ggml_type_i32,
    27 => :ggml_type_i64,
    28 => :ggml_type_f64,
    29 => :ggml_type_iq1_m,
    30 => :ggml_type_bf16,
    31 => :ggml_type_q4_0_4_4,
    32 => :ggml_type_q4_0_4_8,
    33 => :ggml_type_q4_0_8_8,
    34 => :ggml_type_tq1_0,
    35 => :ggml_type_tq2_0,
    36 => :ggml_type_iq4_nl_4_4,
    37 => :ggml_type_iq4_nl_4_8,
    38 => :ggml_type_iq4_nl_8_8,
    39 => :ggml_type_mxfp4,
    40 => :ggml_type_nvfp4,
    41 => :ggml_type_q1_0,
    42 => :ggml_type_q2_0,
  }
  I__GGML_TYPE = GGML_TYPE.invert

  GGUF_TYPE = {
    0 => :gguf_type_uint8,
    1 => :gguf_type_int8,
    2 => :gguf_type_uint16,
    3 => :gguf_type_int16,
    4 => :gguf_type_uint32,
    5 => :gguf_type_int32,
    6 => :gguf_type_float32,
    7 => :gguf_type_bool,
    8 => :gguf_type_string,
    9 => :gguf_type_array,
    10 => :gguf_type_uint64,
    11 => :gguf_type_int64,
    12 => :gguf_type_float64,
  }
  I__GGUF_TYPE = GGUF_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([71, 71, 85, 70].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [71, 71, 85, 70].pack('C*')
    @body = GgufBody.new(@_io, self, @_root)
    self
  end
  class GgufBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.is_big_endian
      when true
        @_is_le = false
      when false
        @_is_le = true
      end

      if @_is_le == true
        _read_le
      elsif @_is_le == false
        _read_be
      else
        raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body")
      end
      self
    end

    def _read_le
      @version = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(2, @version, @_io, "/types/gguf_body/seq/0") if not @version >= 2
      raise Kaitai::Struct::ValidationGreaterThanError.new(3, @version, @_io, "/types/gguf_body/seq/0") if not @version <= 3
      @num_tensor_infos = @_io.read_u8le
      @num_kv_pairs = @_io.read_u8le
      @kv_pairs = []
      (num_kv_pairs).times { |i|
        @kv_pairs << GgufKv.new(@_io, self, @_root, @_is_le, (i != 0 ? kv_pairs[i - 1].alignment : 32))
      }
      @tensor_infos = []
      (num_tensor_infos).times { |i|
        @tensor_infos << GgufTensorInfo.new(@_io, self, @_root, @_is_le, (i != 0 ? tensor_infos[i - 1].expected_next_offset : 0))
      }
      if num_tensor_infos != 0
        @padding = @_io.read_bytes((alignment - _io.pos % alignment) % alignment)
      end
      if ofs_tensor_data < 0
        @_unnamed6 = @_io.read_bytes(0)
      end
      self
    end

    def _read_be
      @version = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(2, @version, @_io, "/types/gguf_body/seq/0") if not @version >= 2
      raise Kaitai::Struct::ValidationGreaterThanError.new(3, @version, @_io, "/types/gguf_body/seq/0") if not @version <= 3
      @num_tensor_infos = @_io.read_u8be
      @num_kv_pairs = @_io.read_u8be
      @kv_pairs = []
      (num_kv_pairs).times { |i|
        @kv_pairs << GgufKv.new(@_io, self, @_root, @_is_le, (i != 0 ? kv_pairs[i - 1].alignment : 32))
      }
      @tensor_infos = []
      (num_tensor_infos).times { |i|
        @tensor_infos << GgufTensorInfo.new(@_io, self, @_root, @_is_le, (i != 0 ? tensor_infos[i - 1].expected_next_offset : 0))
      }
      if num_tensor_infos != 0
        @padding = @_io.read_bytes((alignment - _io.pos % alignment) % alignment)
      end
      if ofs_tensor_data < 0
        @_unnamed6 = @_io.read_bytes(0)
      end
      self
    end

    ##
    # Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
    # they are explicitly allowed by `gguf.md` - see
    # <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
    class GgufArray < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_array")
        end
        self
      end

      def _read_le
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGUF_TYPE, @_io.read_u4le)
        raise Kaitai::Struct::ValidationNotInEnumError.new(@type, @_io, "/types/gguf_body/types/gguf_array/seq/0") if not Gguf::I__GGUF_TYPE.key?(@type)
        @num_elems = @_io.read_u8le
        @elems = []
        (num_elems).times { |i|
          @elems << GgufValue.new(@_io, self, @_root, @_is_le, type)
        }
        self
      end

      def _read_be
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGUF_TYPE, @_io.read_u4be)
        raise Kaitai::Struct::ValidationNotInEnumError.new(@type, @_io, "/types/gguf_body/types/gguf_array/seq/0") if not Gguf::I__GGUF_TYPE.key?(@type)
        @num_elems = @_io.read_u8be
        @elems = []
        (num_elems).times { |i|
          @elems << GgufValue.new(@_io, self, @_root, @_is_le, type)
        }
        self
      end
      attr_reader :type
      attr_reader :num_elems
      attr_reader :elems
    end
    class GgufBool < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_bool")
        end
        self
      end

      def _read_le
        @value_raw = @_io.read_u1
        raise Kaitai::Struct::ValidationGreaterThanError.new(1, @value_raw, @_io, "/types/gguf_body/types/gguf_bool/seq/0") if not @value_raw <= 1
        self
      end

      def _read_be
        @value_raw = @_io.read_u1
        raise Kaitai::Struct::ValidationGreaterThanError.new(1, @value_raw, @_io, "/types/gguf_body/types/gguf_bool/seq/0") if not @value_raw <= 1
        self
      end

      ##
      # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321 Git tag "v0.27.0"
      def value
        return @value unless @value.nil?
        @value = value_raw != 0
        @value
      end
      attr_reader :value_raw
    end
    class GgufFloat32 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_float32")
        end
        self
      end

      def _read_le
        @value = @_io.read_f4le
        self
      end

      def _read_be
        @value = @_io.read_f4be
        self
      end
      attr_reader :value
    end
    class GgufFloat64 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_float64")
        end
        self
      end

      def _read_le
        @value = @_io.read_f8le
        self
      end

      def _read_be
        @value = @_io.read_f8be
        self
      end
      attr_reader :value
    end
    class GgufInt16 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_int16")
        end
        self
      end

      def _read_le
        @value = @_io.read_s2le
        self
      end

      def _read_be
        @value = @_io.read_s2be
        self
      end
      attr_reader :value
    end
    class GgufInt32 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_int32")
        end
        self
      end

      def _read_le
        @value = @_io.read_s4le
        self
      end

      def _read_be
        @value = @_io.read_s4be
        self
      end
      attr_reader :value
    end
    class GgufInt64 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_int64")
        end
        self
      end

      def _read_le
        @value = @_io.read_s8le
        self
      end

      def _read_be
        @value = @_io.read_s8be
        self
      end
      attr_reader :value
    end
    class GgufInt8 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_int8")
        end
        self
      end

      def _read_le
        @value = @_io.read_s1
        self
      end

      def _read_be
        @value = @_io.read_s1
        self
      end
      attr_reader :value
    end

    ##
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275 Git tag "v0.27.0"
    class GgufKv < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil, prev_alignment)
        super(_io, _parent, _root)
        @_is_le = _is_le
        @prev_alignment = prev_alignment
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_kv")
        end
        self
      end

      def _read_le
        @key = GgufStr.new(@_io, self, @_root, @_is_le)
        _ = @key
        raise Kaitai::Struct::ValidationExprError.new(@key, @_io, "/types/gguf_body/types/gguf_kv/seq/0") if not _.len_value != 0
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGUF_TYPE, @_io.read_u4le)
        raise Kaitai::Struct::ValidationNotInEnumError.new(@type, @_io, "/types/gguf_body/types/gguf_kv/seq/1") if not Gguf::I__GGUF_TYPE.key?(@type)
        @value = GgufValue.new(@_io, self, @_root, @_is_le, type)
        _ = @value
        raise Kaitai::Struct::ValidationExprError.new(@value, @_io, "/types/gguf_body/types/gguf_kv/seq/2") if not (key.value == "general.alignment" ?  ((type == :gguf_type_uint32) && (_.value.value != 0) && (_.value.value & _.value.value - 1 == 0))  : true)
        self
      end

      def _read_be
        @key = GgufStr.new(@_io, self, @_root, @_is_le)
        _ = @key
        raise Kaitai::Struct::ValidationExprError.new(@key, @_io, "/types/gguf_body/types/gguf_kv/seq/0") if not _.len_value != 0
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGUF_TYPE, @_io.read_u4be)
        raise Kaitai::Struct::ValidationNotInEnumError.new(@type, @_io, "/types/gguf_body/types/gguf_kv/seq/1") if not Gguf::I__GGUF_TYPE.key?(@type)
        @value = GgufValue.new(@_io, self, @_root, @_is_le, type)
        _ = @value
        raise Kaitai::Struct::ValidationExprError.new(@value, @_io, "/types/gguf_body/types/gguf_kv/seq/2") if not (key.value == "general.alignment" ?  ((type == :gguf_type_uint32) && (_.value.value != 0) && (_.value.value & _.value.value - 1 == 0))  : true)
        self
      end
      def alignment
        return @alignment unless @alignment.nil?
        @alignment = (key.value == "general.alignment" ? value.value.value : prev_alignment)
        @alignment
      end
      attr_reader :key
      attr_reader :type
      attr_reader :value
      attr_reader :prev_alignment
    end

    ##
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237 Git tag "v0.27.0"
    class GgufStr < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_str")
        end
        self
      end

      def _read_le
        @len_value = @_io.read_u8le
        @value = (@_io.read_bytes(len_value)).force_encoding("UTF-8")
        self
      end

      def _read_be
        @len_value = @_io.read_u8be
        @value = (@_io.read_bytes(len_value)).force_encoding("UTF-8")
        self
      end
      attr_reader :len_value
      attr_reader :value
    end

    ##
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325 Git tag "v0.27.0"
    class GgufTensorInfo < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil, expected_offset)
        super(_io, _parent, _root)
        @_is_le = _is_le
        @expected_offset = expected_offset
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_tensor_info")
        end
        self
      end

      def _read_le
        @name = GgufStr.new(@_io, self, @_root, @_is_le)
        _ = @name
        raise Kaitai::Struct::ValidationExprError.new(@name, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/0") if not _.len_value < 64
        @num_dims = @_io.read_u4le
        raise Kaitai::Struct::ValidationGreaterThanError.new(4, @num_dims, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/1") if not @num_dims <= 4
        @dims = []
        (num_dims).times { |i|
          @dims << @_io.read_s8le
          raise Kaitai::Struct::ValidationLessThanError.new(0, @dims[i], @_io, "/types/gguf_body/types/gguf_tensor_info/seq/2") if not @dims[i] >= 0
        }
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGML_TYPE, @_io.read_u4le)
        _ = @type
        raise Kaitai::Struct::ValidationExprError.new(@type, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/3") if not  (((Gguf::I__GGML_TYPE[_] || _) < 43) && (num_elements_per_block != 0) && ((num_dims > 0 ? dims[0] : 1) % num_elements_per_block == 0)) 
        @offset = @_io.read_u8le
        raise Kaitai::Struct::ValidationNotEqualError.new(expected_offset, @offset, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/4") if not @offset == expected_offset
        self
      end

      def _read_be
        @name = GgufStr.new(@_io, self, @_root, @_is_le)
        _ = @name
        raise Kaitai::Struct::ValidationExprError.new(@name, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/0") if not _.len_value < 64
        @num_dims = @_io.read_u4be
        raise Kaitai::Struct::ValidationGreaterThanError.new(4, @num_dims, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/1") if not @num_dims <= 4
        @dims = []
        (num_dims).times { |i|
          @dims << @_io.read_s8be
          raise Kaitai::Struct::ValidationLessThanError.new(0, @dims[i], @_io, "/types/gguf_body/types/gguf_tensor_info/seq/2") if not @dims[i] >= 0
        }
        @type = Kaitai::Struct::Stream::resolve_enum(Gguf::GGML_TYPE, @_io.read_u4be)
        _ = @type
        raise Kaitai::Struct::ValidationExprError.new(@type, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/3") if not  (((Gguf::I__GGML_TYPE[_] || _) < 43) && (num_elements_per_block != 0) && ((num_dims > 0 ? dims[0] : 1) % num_elements_per_block == 0)) 
        @offset = @_io.read_u8be
        raise Kaitai::Struct::ValidationNotEqualError.new(expected_offset, @offset, @_io, "/types/gguf_body/types/gguf_tensor_info/seq/4") if not @offset == expected_offset
        self
      end
      def data
        return @data unless @data.nil?
        _pos = @_io.pos
        @_io.seek(_parent.ofs_tensor_data + offset)
        if @_is_le
          @data = @_io.read_bytes(len_data)
        else
          @data = @_io.read_bytes(len_data)
        end
        @_io.seek(_pos)
        @data
      end

      ##
      # `dims` joined with the string `" x "`. This is necessary for
      # `-webide-representation`, which cannot format `dims` directly -
      # see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
      def dump_dims
        return @dump_dims unless @dump_dims.nil?
        @dump_dims = (((num_dims > 0 ? dims[0].to_s : "") + (num_dims > 1 ? " x " + dims[1].to_s : "")) + (num_dims > 2 ? " x " + dims[2].to_s : "")) + (num_dims > 3 ? " x " + dims[3].to_s : "")
        @dump_dims
      end

      ##
      # `offset` that the next tensor must have
      def expected_next_offset
        return @expected_next_offset unless @expected_next_offset.nil?
        @expected_next_offset = ((offset + len_data) + len_padding)
        @expected_next_offset
      end

      ##
      # Size of a block in bytes
      def len_block
        return @len_block unless @len_block.nil?
        @len_block = [4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18][(Gguf::I__GGML_TYPE[type] || type)]
        @len_block
      end
      def len_data
        return @len_data unless @len_data.nil?
        @len_data = (len_block * num_blocks)
        @len_data
      end

      ##
      # Number of padding bytes after the data
      def len_padding
        return @len_padding unless @len_padding.nil?
        @len_padding = (_parent.alignment - len_data % _parent.alignment) % _parent.alignment
        @len_padding
      end
      def num_blocks
        return @num_blocks unless @num_blocks.nil?
        @num_blocks = (num_elements / num_elements_per_block)
        @num_blocks
      end
      def num_elements
        return @num_elements unless @num_elements.nil?
        @num_elements = ((((num_dims > 0 ? dims[0] : 1) * (num_dims > 1 ? dims[1] : 1)) * (num_dims > 2 ? dims[2] : 1)) * (num_dims > 3 ? dims[3] : 1))
        @num_elements
      end

      ##
      # Number of elements in a block
      def num_elements_per_block
        return @num_elements_per_block unless @num_elements_per_block.nil?
        @num_elements_per_block = [1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64][(Gguf::I__GGML_TYPE[type] || type)]
        @num_elements_per_block
      end

      ##
      # Padding after the data. ggml requires it even after the last tensor
      # when reading the tensor data.
      # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893 Git tag "v0.27.0"
      def padding
        return @padding unless @padding.nil?
        _pos = @_io.pos
        @_io.seek((_parent.ofs_tensor_data + offset) + len_data)
        if @_is_le
          @padding = @_io.read_bytes(len_padding)
        else
          @padding = @_io.read_bytes(len_padding)
        end
        @_io.seek(_pos)
        @padding
      end
      attr_reader :name
      attr_reader :num_dims
      attr_reader :dims
      attr_reader :type

      ##
      # Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
      attr_reader :offset
      attr_reader :expected_offset
    end
    class GgufUint16 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_uint16")
        end
        self
      end

      def _read_le
        @value = @_io.read_u2le
        self
      end

      def _read_be
        @value = @_io.read_u2be
        self
      end
      attr_reader :value
    end
    class GgufUint32 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_uint32")
        end
        self
      end

      def _read_le
        @value = @_io.read_u4le
        self
      end

      def _read_be
        @value = @_io.read_u4be
        self
      end
      attr_reader :value
    end
    class GgufUint64 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_uint64")
        end
        self
      end

      def _read_le
        @value = @_io.read_u8le
        self
      end

      def _read_be
        @value = @_io.read_u8be
        self
      end
      attr_reader :value
    end
    class GgufUint8 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_uint8")
        end
        self
      end

      def _read_le
        @value = @_io.read_u1
        self
      end

      def _read_be
        @value = @_io.read_u1
        self
      end
      attr_reader :value
    end

    ##
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260 Git tag "v0.27.0"
    class GgufValue < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil, type)
        super(_io, _parent, _root)
        @_is_le = _is_le
        @type = type
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/gguf_body/types/gguf_value")
        end
        self
      end

      def _read_le
        case type
        when :gguf_type_array
          @value = GgufArray.new(@_io, self, @_root, @_is_le)
        when :gguf_type_bool
          @value = GgufBool.new(@_io, self, @_root, @_is_le)
        when :gguf_type_float32
          @value = GgufFloat32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_float64
          @value = GgufFloat64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int16
          @value = GgufInt16.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int32
          @value = GgufInt32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int64
          @value = GgufInt64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int8
          @value = GgufInt8.new(@_io, self, @_root, @_is_le)
        when :gguf_type_string
          @value = GgufStr.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint16
          @value = GgufUint16.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint32
          @value = GgufUint32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint64
          @value = GgufUint64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint8
          @value = GgufUint8.new(@_io, self, @_root, @_is_le)
        end
        self
      end

      def _read_be
        case type
        when :gguf_type_array
          @value = GgufArray.new(@_io, self, @_root, @_is_le)
        when :gguf_type_bool
          @value = GgufBool.new(@_io, self, @_root, @_is_le)
        when :gguf_type_float32
          @value = GgufFloat32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_float64
          @value = GgufFloat64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int16
          @value = GgufInt16.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int32
          @value = GgufInt32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int64
          @value = GgufInt64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_int8
          @value = GgufInt8.new(@_io, self, @_root, @_is_le)
        when :gguf_type_string
          @value = GgufStr.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint16
          @value = GgufUint16.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint32
          @value = GgufUint32.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint64
          @value = GgufUint64.new(@_io, self, @_root, @_is_le)
        when :gguf_type_uint8
          @value = GgufUint8.new(@_io, self, @_root, @_is_le)
        end
        self
      end
      attr_reader :value
      attr_reader :type
    end

    ##
    # Global alignment - from the `general.alignment` key, or 32 if there's no
    # such key.
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630 Git tag "v0.27.0"
    def alignment
      return @alignment unless @alignment.nil?
      @alignment = (kv_pairs.length != 0 ? kv_pairs.last.alignment : 32)
      @alignment
    end

    ##
    # Offset of the tensor data. Each tensor's `offset` is relative to this
    # position.
    def ofs_tensor_data
      return @ofs_tensor_data unless @ofs_tensor_data.nil?
      @ofs_tensor_data = _io.pos
      @ofs_tensor_data
    end

    ##
    # File format version. Version 1 used 32-bit counts and lengths, which
    # this Kaitai Struct implementation doesn't support, and neither does
    # ggml.
    attr_reader :version

    ##
    # The number of tensors in the file
    attr_reader :num_tensor_infos

    ##
    # The number of key-value pairs in the file header
    attr_reader :num_kv_pairs

    ##
    # Key-value pairs. ggml (v0.27.0)
    # [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
    # duplicate keys, but this Kaitai Struct implementation can't detect
    # them. If there are multiple `general.alignment` keys, the last one is
    # used for the `alignment` value instance.
    attr_reader :kv_pairs

    ##
    # Tensor metadata. ggml (v0.27.0)
    # [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
    # duplicate tensor names, but this Kaitai Struct implementation can't
    # detect them.
    attr_reader :tensor_infos

    ##
    # @see https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785 Git tag "v0.27.0"
    attr_reader :padding
    attr_reader :_unnamed6
  end
  def is_big_endian
    return @is_big_endian unless @is_big_endian.nil?
    @is_big_endian = version_le & 65535 == 0
    @is_big_endian
  end

  ##
  # Length of the file (computed from the header), including the padding after
  # the last tensor's data.
  # 
  # This Kaitai Struct implementation stops parsing where the tensor data
  # starts (which is read lazily, i.e. only on demand). Without reading the
  # tensor data, you can use this expected file size to check whether the file
  # has been truncated, to carve the file out of a larger one, etc.
  def len_file
    return @len_file unless @len_file.nil?
    @len_file = (body.ofs_tensor_data + (body.num_tensor_infos != 0 ? body.tensor_infos.last.expected_next_offset : 0))
    @len_file
  end
  def version_le
    return @version_le unless @version_le.nil?
    _pos = @_io.pos
    @_io.seek(4)
    @version_le = @_io.read_u4le
    @_io.seek(_pos)
    @version_le
  end

  ##
  # GGUF file magic
  attr_reader :magic
  attr_reader :body
end
