# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html Source
class JavaBytecode < Kaitai::Struct::Struct

  OPCODES = {
    0 => :opcodes_nop,
    1 => :opcodes_aconst_null,
    2 => :opcodes_iconst_m1,
    3 => :opcodes_iconst_0,
    4 => :opcodes_iconst_1,
    5 => :opcodes_iconst_2,
    6 => :opcodes_iconst_3,
    7 => :opcodes_iconst_4,
    8 => :opcodes_iconst_5,
    9 => :opcodes_lconst_0,
    10 => :opcodes_lconst_1,
    11 => :opcodes_fconst_0,
    12 => :opcodes_fconst_1,
    13 => :opcodes_fconst_2,
    14 => :opcodes_dconst_0,
    15 => :opcodes_dconst_1,
    16 => :opcodes_bipush,
    17 => :opcodes_sipush,
    18 => :opcodes_ldc,
    19 => :opcodes_ldc_w,
    20 => :opcodes_ldc2_w,
    21 => :opcodes_iload,
    22 => :opcodes_lload,
    23 => :opcodes_fload,
    24 => :opcodes_dload,
    25 => :opcodes_aload,
    26 => :opcodes_iload_0,
    27 => :opcodes_iload_1,
    28 => :opcodes_iload_2,
    29 => :opcodes_iload_3,
    30 => :opcodes_lload_0,
    31 => :opcodes_lload_1,
    32 => :opcodes_lload_2,
    33 => :opcodes_lload_3,
    34 => :opcodes_fload_0,
    35 => :opcodes_fload_1,
    36 => :opcodes_fload_2,
    37 => :opcodes_fload_3,
    38 => :opcodes_dload_0,
    39 => :opcodes_dload_1,
    40 => :opcodes_dload_2,
    41 => :opcodes_dload_3,
    42 => :opcodes_aload_0,
    43 => :opcodes_aload_1,
    44 => :opcodes_aload_2,
    45 => :opcodes_aload_3,
    46 => :opcodes_iaload,
    47 => :opcodes_laload,
    48 => :opcodes_faload,
    49 => :opcodes_daload,
    50 => :opcodes_aaload,
    51 => :opcodes_baload,
    52 => :opcodes_caload,
    53 => :opcodes_saload,
    54 => :opcodes_istore,
    55 => :opcodes_lstore,
    56 => :opcodes_fstore,
    57 => :opcodes_dstore,
    58 => :opcodes_astore,
    59 => :opcodes_istore_0,
    60 => :opcodes_istore_1,
    61 => :opcodes_istore_2,
    62 => :opcodes_istore_3,
    63 => :opcodes_lstore_0,
    64 => :opcodes_lstore_1,
    65 => :opcodes_lstore_2,
    66 => :opcodes_lstore_3,
    67 => :opcodes_fstore_0,
    68 => :opcodes_fstore_1,
    69 => :opcodes_fstore_2,
    70 => :opcodes_fstore_3,
    71 => :opcodes_dstore_0,
    72 => :opcodes_dstore_1,
    73 => :opcodes_dstore_2,
    74 => :opcodes_dstore_3,
    75 => :opcodes_astore_0,
    76 => :opcodes_astore_1,
    77 => :opcodes_astore_2,
    78 => :opcodes_astore_3,
    79 => :opcodes_iastore,
    80 => :opcodes_lastore,
    81 => :opcodes_fastore,
    82 => :opcodes_dastore,
    83 => :opcodes_aastore,
    84 => :opcodes_bastore,
    85 => :opcodes_castore,
    86 => :opcodes_sastore,
    87 => :opcodes_pop,
    88 => :opcodes_pop2,
    89 => :opcodes_dup,
    90 => :opcodes_dup_x1,
    91 => :opcodes_dup_x2,
    92 => :opcodes_dup2,
    93 => :opcodes_dup2_x1,
    94 => :opcodes_dup2_x2,
    95 => :opcodes_swap,
    96 => :opcodes_iadd,
    97 => :opcodes_ladd,
    98 => :opcodes_fadd,
    99 => :opcodes_dadd,
    100 => :opcodes_isub,
    101 => :opcodes_lsub,
    102 => :opcodes_fsub,
    103 => :opcodes_dsub,
    104 => :opcodes_imul,
    105 => :opcodes_lmul,
    106 => :opcodes_fmul,
    107 => :opcodes_dmul,
    108 => :opcodes_idiv,
    109 => :opcodes_ldiv,
    110 => :opcodes_fdiv,
    111 => :opcodes_ddiv,
    112 => :opcodes_irem,
    113 => :opcodes_lrem,
    114 => :opcodes_frem,
    115 => :opcodes_drem,
    116 => :opcodes_ineg,
    117 => :opcodes_lneg,
    118 => :opcodes_fneg,
    119 => :opcodes_dneg,
    120 => :opcodes_ishl,
    121 => :opcodes_lshl,
    122 => :opcodes_ishr,
    123 => :opcodes_lshr,
    124 => :opcodes_iushr,
    125 => :opcodes_lushr,
    126 => :opcodes_iand,
    127 => :opcodes_land,
    128 => :opcodes_ior,
    129 => :opcodes_lor,
    130 => :opcodes_ixor,
    131 => :opcodes_lxor,
    132 => :opcodes_iinc,
    133 => :opcodes_i2l,
    134 => :opcodes_i2f,
    135 => :opcodes_i2d,
    136 => :opcodes_l2i,
    137 => :opcodes_l2f,
    138 => :opcodes_l2d,
    139 => :opcodes_f2i,
    140 => :opcodes_f2l,
    141 => :opcodes_f2d,
    142 => :opcodes_d2i,
    143 => :opcodes_d2l,
    144 => :opcodes_d2f,
    145 => :opcodes_i2b,
    146 => :opcodes_i2c,
    147 => :opcodes_i2s,
    148 => :opcodes_lcmp,
    149 => :opcodes_fcmpl,
    150 => :opcodes_fcmpg,
    151 => :opcodes_dcmpl,
    152 => :opcodes_dcmpg,
    153 => :opcodes_ifeq,
    154 => :opcodes_ifne,
    155 => :opcodes_iflt,
    156 => :opcodes_ifge,
    157 => :opcodes_ifgt,
    158 => :opcodes_ifle,
    159 => :opcodes_if_icmpeq,
    160 => :opcodes_if_icmpne,
    161 => :opcodes_if_icmplt,
    162 => :opcodes_if_icmpge,
    163 => :opcodes_if_icmpgt,
    164 => :opcodes_if_icmple,
    165 => :opcodes_if_acmpeq,
    166 => :opcodes_if_acmpne,
    167 => :opcodes_goto,
    168 => :opcodes_jsr,
    169 => :opcodes_ret,
    170 => :opcodes_tableswitch,
    171 => :opcodes_lookupswitch,
    172 => :opcodes_ireturn,
    173 => :opcodes_lreturn,
    174 => :opcodes_freturn,
    175 => :opcodes_dreturn,
    176 => :opcodes_areturn,
    177 => :opcodes_return,
    178 => :opcodes_getstatic,
    179 => :opcodes_putstatic,
    180 => :opcodes_getfield,
    181 => :opcodes_putfield,
    182 => :opcodes_invokevirtual,
    183 => :opcodes_invokespecial,
    184 => :opcodes_invokestatic,
    185 => :opcodes_invokeinterface,
    186 => :opcodes_invokedynamic,
    187 => :opcodes_new,
    188 => :opcodes_newarray,
    189 => :opcodes_anewarray,
    190 => :opcodes_arraylength,
    191 => :opcodes_athrow,
    192 => :opcodes_checkcast,
    193 => :opcodes_instanceof,
    194 => :opcodes_monitorenter,
    195 => :opcodes_monitorexit,
    196 => :opcodes_wide,
    197 => :opcodes_multianewarray,
    198 => :opcodes_ifnull,
    199 => :opcodes_ifnonnull,
    200 => :opcodes_goto_w,
    201 => :opcodes_jsr_w,
    202 => :opcodes_breakpoint,
    254 => :opcodes_impdep1,
    255 => :opcodes_impdep2,
  }
  I__OPCODES = OPCODES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @instructions = []
    i = 0
    while not @_io.eof?
      @instructions << Inst.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Inst < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @opcode = Kaitai::Struct::Stream::resolve_enum(JavaBytecode::OPCODES, @_io.read_u1)
      case opcode
      when :opcodes_fload
        @arg = @_io.read_u1
      when :opcodes_ldc
        @arg = @_io.read_u1
      when :opcodes_lload
        @arg = @_io.read_u1
      when :opcodes_new
        @arg = @_io.read_u2be
      when :opcodes_jsr
        @arg = @_io.read_s2be
      when :opcodes_getstatic
        @arg = @_io.read_u2be
      when :opcodes_iload
        @arg = @_io.read_u1
      when :opcodes_ldc2_w
        @arg = @_io.read_u2be
      when :opcodes_dload
        @arg = @_io.read_u1
      when :opcodes_goto
        @arg = @_io.read_s2be
      when :opcodes_ldc_w
        @arg = @_io.read_u2be
      when :opcodes_invokevirtual
        @arg = @_io.read_u2be
      when :opcodes_sipush
        @arg = @_io.read_s2be
      when :opcodes_newarray
        @arg = ArgNewarray.new(@_io, self, @_root)
      when :opcodes_invokestatic
        @arg = @_io.read_u2be
      when :opcodes_invokeinterface
        @arg = ArgInvokeinterface.new(@_io, self, @_root)
      when :opcodes_bipush
        @arg = @_io.read_s1
      when :opcodes_invokespecial
        @arg = @_io.read_u2be
      when :opcodes_jsr_w
        @arg = @_io.read_s4be
      when :opcodes_goto_w
        @arg = @_io.read_s4be
      end
      self
    end
    attr_reader :opcode
    attr_reader :arg
  end
  class ArgInvokeinterface < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @method_index = @_io.read_u2be
      @count = @_io.read_u1
      @reserved = @_io.ensure_fixed_contents([0].pack('C*'))
      self
    end
    attr_reader :method_index
    attr_reader :count
    attr_reader :reserved
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5.newarray Source
  class ArgNewarray < Kaitai::Struct::Struct

    PRIM_TYPES = {
      4 => :prim_types_t_boolean,
      5 => :prim_types_t_char,
      6 => :prim_types_t_float,
      7 => :prim_types_t_double,
      8 => :prim_types_t_byte,
      9 => :prim_types_t_short,
      10 => :prim_types_t_int,
      11 => :prim_types_t_long,
    }
    I__PRIM_TYPES = PRIM_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @atype = Kaitai::Struct::Stream::resolve_enum(PRIM_TYPES, @_io.read_u1)
      self
    end
    attr_reader :atype
  end
  attr_reader :instructions
end
