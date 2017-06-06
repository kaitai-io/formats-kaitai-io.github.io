# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Python interpreter runs .py files in 2 step process: first, it
# produces bytecode, which it then executes. Translation of .py source
# into bytecode is time-consuming, so Python dumps compiled bytecode
# into .pyc files, to be reused from cache at later time if possible.
# 
# .pyc file is essentially a raw dump of `py_object` (see `body`) with
# a simple header prepended.
class PythonPyc27 < Kaitai::Struct::Struct

  VERSION = {
    20121 => :version_v15,
    50428 => :version_v16,
    50823 => :version_v20,
    60202 => :version_v21,
    60717 => :version_v22,
    62011 => :version_v23_a0,
    62021 => :version_v23_a0b,
    62041 => :version_v24_a0,
    62051 => :version_v24_a3,
    62061 => :version_v24_b1,
    62071 => :version_v25_a0,
    62081 => :version_v25_a0b,
    62091 => :version_v25_a0c,
    62092 => :version_v25_a0d,
    62101 => :version_v25_b3,
    62111 => :version_v25_b3b,
    62121 => :version_v25_c1,
    62131 => :version_v25_c2,
    62151 => :version_v26_a0,
    62161 => :version_v26_a1,
    62171 => :version_v27_a0,
    62181 => :version_v27_a0b,
    62191 => :version_v27_a0c,
    62201 => :version_v27_a0d,
    62211 => :version_v27_a0e,
  }
  I__VERSION = VERSION.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @version_magic = Kaitai::Struct::Stream::resolve_enum(VERSION, @_io.read_u2le)
    @crlf = @_io.read_u2le
    @modification_timestamp = @_io.read_u4le
    @body = PyObject.new(@_io, self, @_root)
  end
  class CodeObject < Kaitai::Struct::Struct

    FLAGS_ENUM = {
      4 => :flags_enum_has_args,
      8 => :flags_enum_has_kwargs,
      32 => :flags_enum_generator,
    }
    I__FLAGS_ENUM = FLAGS_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @arg_count = @_io.read_u4le
      @local_count = @_io.read_u4le
      @stack_size = @_io.read_u4le
      @flags = Kaitai::Struct::Stream::resolve_enum(FLAGS_ENUM, @_io.read_u4le)
      @code = Assembly.new(@_io, self, @_root)
      @consts = PyObject.new(@_io, self, @_root)
      @names = PyObject.new(@_io, self, @_root)
      @var_names = PyObject.new(@_io, self, @_root)
      @free_vars = PyObject.new(@_io, self, @_root)
      @cell_vars = PyObject.new(@_io, self, @_root)
      @filename = PyObject.new(@_io, self, @_root)
      @name = PyObject.new(@_io, self, @_root)
      @first_line_no = @_io.read_u4le
      @lnotab = PyObject.new(@_io, self, @_root)
    end
    attr_reader :arg_count
    attr_reader :local_count
    attr_reader :stack_size
    attr_reader :flags
    attr_reader :code
    attr_reader :consts
    attr_reader :names
    attr_reader :var_names
    attr_reader :free_vars
    attr_reader :cell_vars
    attr_reader :filename
    attr_reader :name
    attr_reader :first_line_no
    attr_reader :lnotab
  end
  class Assembly < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @string_magic = @_io.ensure_fixed_contents([115].pack('C*'))
      @length = @_io.read_u4le
      @_raw_items = @_io.read_bytes(length)
      io = Kaitai::Struct::Stream.new(@_raw_items)
      @items = OpArgs.new(io, self, @_root)
    end
    attr_reader :string_magic
    attr_reader :length
    attr_reader :items
    attr_reader :_raw_items
  end
  class OpArg < Kaitai::Struct::Struct

    OP_CODE_ENUM = {
      0 => :op_code_enum_stop_code,
      1 => :op_code_enum_pop_top,
      2 => :op_code_enum_rot_two,
      3 => :op_code_enum_rot_three,
      4 => :op_code_enum_dup_top,
      5 => :op_code_enum_rot_four,
      9 => :op_code_enum_nop,
      10 => :op_code_enum_unary_positive,
      11 => :op_code_enum_unary_negative,
      12 => :op_code_enum_unary_not,
      13 => :op_code_enum_unary_convert,
      15 => :op_code_enum_unary_invert,
      19 => :op_code_enum_binary_power,
      20 => :op_code_enum_binary_multiply,
      21 => :op_code_enum_binary_divide,
      22 => :op_code_enum_binary_modulo,
      23 => :op_code_enum_binary_add,
      24 => :op_code_enum_binary_subtract,
      25 => :op_code_enum_binary_subscr,
      26 => :op_code_enum_binary_floor_divide,
      27 => :op_code_enum_binary_true_divide,
      28 => :op_code_enum_inplace_floor_divide,
      29 => :op_code_enum_inplace_true_divide,
      30 => :op_code_enum_slice_0,
      31 => :op_code_enum_slice_1,
      32 => :op_code_enum_slice_2,
      33 => :op_code_enum_slice_3,
      40 => :op_code_enum_store_slice_0,
      41 => :op_code_enum_store_slice_1,
      42 => :op_code_enum_store_slice_2,
      43 => :op_code_enum_store_slice_3,
      50 => :op_code_enum_delete_slice_0,
      51 => :op_code_enum_delete_slice_1,
      52 => :op_code_enum_delete_slice_2,
      53 => :op_code_enum_delete_slice_3,
      54 => :op_code_enum_store_map,
      55 => :op_code_enum_inplace_add,
      56 => :op_code_enum_inplace_subtract,
      57 => :op_code_enum_inplace_multiply,
      58 => :op_code_enum_inplace_divide,
      59 => :op_code_enum_inplace_modulo,
      60 => :op_code_enum_store_subscr,
      61 => :op_code_enum_delete_subscr,
      62 => :op_code_enum_binary_lshift,
      63 => :op_code_enum_binary_rshift,
      64 => :op_code_enum_binary_and,
      65 => :op_code_enum_binary_xor,
      66 => :op_code_enum_binary_or,
      67 => :op_code_enum_inplace_power,
      68 => :op_code_enum_get_iter,
      70 => :op_code_enum_print_expr,
      71 => :op_code_enum_print_item,
      72 => :op_code_enum_print_newline,
      73 => :op_code_enum_print_item_to,
      74 => :op_code_enum_print_newline_to,
      75 => :op_code_enum_inplace_lshift,
      76 => :op_code_enum_inplace_rshift,
      77 => :op_code_enum_inplace_and,
      78 => :op_code_enum_inplace_xor,
      79 => :op_code_enum_inplace_or,
      80 => :op_code_enum_break_loop,
      81 => :op_code_enum_with_cleanup,
      82 => :op_code_enum_load_locals,
      83 => :op_code_enum_return_value,
      84 => :op_code_enum_import_star,
      85 => :op_code_enum_exec_stmt,
      86 => :op_code_enum_yield_value,
      87 => :op_code_enum_pop_block,
      88 => :op_code_enum_end_finally,
      89 => :op_code_enum_build_class,
      90 => :op_code_enum_store_name,
      91 => :op_code_enum_delete_name,
      92 => :op_code_enum_unpack_sequence,
      93 => :op_code_enum_for_iter,
      94 => :op_code_enum_list_append,
      95 => :op_code_enum_store_attr,
      96 => :op_code_enum_delete_attr,
      97 => :op_code_enum_store_global,
      98 => :op_code_enum_delete_global,
      99 => :op_code_enum_dup_topx,
      100 => :op_code_enum_load_const,
      101 => :op_code_enum_load_name,
      102 => :op_code_enum_build_tuple,
      103 => :op_code_enum_build_list,
      104 => :op_code_enum_build_set,
      105 => :op_code_enum_build_map,
      106 => :op_code_enum_load_attr,
      107 => :op_code_enum_compare_op,
      108 => :op_code_enum_import_name,
      109 => :op_code_enum_import_from,
      110 => :op_code_enum_jump_forward,
      111 => :op_code_enum_jump_if_false_or_pop,
      112 => :op_code_enum_jump_if_true_or_pop,
      113 => :op_code_enum_jump_absolute,
      114 => :op_code_enum_pop_jump_if_false,
      115 => :op_code_enum_pop_jump_if_true,
      116 => :op_code_enum_load_global,
      119 => :op_code_enum_continue_loop,
      120 => :op_code_enum_setup_loop,
      121 => :op_code_enum_setup_except,
      122 => :op_code_enum_setup_finally,
      124 => :op_code_enum_load_fast,
      125 => :op_code_enum_store_fast,
      126 => :op_code_enum_delete_fast,
      130 => :op_code_enum_raise_varargs,
      131 => :op_code_enum_call_function,
      132 => :op_code_enum_make_function,
      133 => :op_code_enum_build_slice,
      134 => :op_code_enum_make_closure,
      135 => :op_code_enum_load_closure,
      136 => :op_code_enum_load_deref,
      137 => :op_code_enum_store_deref,
      140 => :op_code_enum_call_function_var,
      141 => :op_code_enum_call_function_kw,
      142 => :op_code_enum_call_function_var_kw,
      143 => :op_code_enum_setup_with,
      145 => :op_code_enum_extended_arg,
      146 => :op_code_enum_set_add,
      147 => :op_code_enum_map_add,
    }
    I__OP_CODE_ENUM = OP_CODE_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @op_code = Kaitai::Struct::Stream::resolve_enum(OP_CODE_ENUM, @_io.read_u1)
      if I__OP_CODE_ENUM[op_code] >= I__OP_CODE_ENUM[:op_code_enum_store_name]
        @arg = @_io.read_u2le
      end
    end
    attr_reader :op_code
    attr_reader :arg
  end
  class PyObject < Kaitai::Struct::Struct

    OBJECT_TYPE = {
      40 => :object_type_tuple,
      70 => :object_type_py_false,
      78 => :object_type_none,
      82 => :object_type_string_ref,
      84 => :object_type_py_true,
      99 => :object_type_code_object,
      105 => :object_type_int,
      115 => :object_type_string,
      116 => :object_type_interned,
      117 => :object_type_unicode_string,
    }
    I__OBJECT_TYPE = OBJECT_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(OBJECT_TYPE, @_io.read_u1)
      case type
      when :object_type_none
        @value = PyNone.new(@_io, self, @_root)
      when :object_type_code_object
        @value = CodeObject.new(@_io, self, @_root)
      when :object_type_int
        @value = @_io.read_u4le
      when :object_type_string_ref
        @value = StringRef.new(@_io, self, @_root)
      when :object_type_string
        @value = PyString.new(@_io, self, @_root)
      when :object_type_py_false
        @value = PyFalse.new(@_io, self, @_root)
      when :object_type_interned
        @value = InternedString.new(@_io, self, @_root)
      when :object_type_tuple
        @value = Tuple.new(@_io, self, @_root)
      when :object_type_py_true
        @value = PyTrue.new(@_io, self, @_root)
      end
    end
    class PyNone < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
      end
    end
    class PyFalse < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
      end
    end
    class StringRef < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @interned_list_index = @_io.read_u4le
      end
      attr_reader :interned_list_index
    end
    class PyTrue < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
      end
    end
    class Tuple < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @count = @_io.read_u4le
        @items = Array.new(count)
        (count).times { |i|
          @items[i] = PyObject.new(@_io, self, @_root)
        }
      end
      attr_reader :count
      attr_reader :items
    end
    class UnicodeString < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @length = @_io.read_u4le
        @data = (@_io.read_bytes(length)).force_encoding("utf-8")
      end
      attr_reader :length
      attr_reader :data
    end
    class InternedString < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @length = @_io.read_u4le
        @data = (@_io.read_bytes(length)).force_encoding("utf-8")
      end
      attr_reader :length
      attr_reader :data
    end
    class PyString < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @length = @_io.read_u4le
        @data = @_io.read_bytes(length)
      end
      attr_reader :length
      attr_reader :data
    end
    attr_reader :type
    attr_reader :value
  end
  class OpArgs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @items = []
      while not @_io.eof?
        @items << OpArg.new(@_io, self, @_root)
      end
    end
    attr_reader :items
  end
  attr_reader :version_magic
  attr_reader :crlf
  attr_reader :modification_timestamp
  attr_reader :body
end
