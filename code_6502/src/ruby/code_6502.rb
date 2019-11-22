# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This spec can be used to disassemble raw stream of 6502 CPU machine
# code into individual operations. Each operation includes an opcode
# and, optionally, an argument. Register arguments are part of the
# `opcode` enum.
class Code6502 < Kaitai::Struct::Struct

  OPCODE = {
    0 => :opcode_brk_impl,
    1 => :opcode_ora_x_ind,
    5 => :opcode_ora_zpg,
    6 => :opcode_asl_zpg,
    8 => :opcode_php_impl,
    9 => :opcode_ora_imm,
    10 => :opcode_asl_a,
    13 => :opcode_ora_abs,
    14 => :opcode_asl_abs,
    16 => :opcode_bpl_rel,
    17 => :opcode_ora_ind_y,
    21 => :opcode_ora_zpg_x,
    22 => :opcode_asl_zpg_x,
    24 => :opcode_clc_impl,
    25 => :opcode_ora_abs_y,
    29 => :opcode_ora_abs_x,
    30 => :opcode_asl_abs_x,
    32 => :opcode_jsr_abs,
    33 => :opcode_and_x_ind,
    36 => :opcode_bit_zpg,
    37 => :opcode_and_zpg,
    38 => :opcode_rol_zpg,
    40 => :opcode_plp_impl,
    41 => :opcode_and_imm,
    42 => :opcode_rol_a,
    44 => :opcode_bit_abs,
    45 => :opcode_and_abs,
    46 => :opcode_rol_abs,
    48 => :opcode_bmi_rel,
    49 => :opcode_and_ind_y,
    53 => :opcode_and_zpg_x,
    54 => :opcode_rol_zpg_x,
    56 => :opcode_sec_impl,
    57 => :opcode_and_abs_y,
    61 => :opcode_and_abs_x,
    62 => :opcode_rol_abs_x,
    64 => :opcode_rti_impl,
    65 => :opcode_eor_x_ind,
    69 => :opcode_eor_zpg,
    70 => :opcode_lsr_zpg,
    72 => :opcode_pha_impl,
    73 => :opcode_eor_imm,
    74 => :opcode_lsr_a,
    76 => :opcode_jmp_abs,
    77 => :opcode_eor_abs,
    78 => :opcode_lsr_abs,
    80 => :opcode_bvc_rel,
    81 => :opcode_eor_ind_y,
    85 => :opcode_eor_zpg_x,
    86 => :opcode_lsr_zpg_x,
    88 => :opcode_cli_impl,
    89 => :opcode_eor_abs_y,
    93 => :opcode_eor_abs_x,
    94 => :opcode_lsr_abs_x,
    96 => :opcode_rts_impl,
    97 => :opcode_adc_x_ind,
    101 => :opcode_adc_zpg,
    102 => :opcode_ror_zpg,
    104 => :opcode_pla_impl,
    105 => :opcode_adc_imm,
    106 => :opcode_ror_a,
    108 => :opcode_jmp_ind,
    109 => :opcode_adc_abs,
    110 => :opcode_ror_abs,
    112 => :opcode_bvs_rel,
    113 => :opcode_adc_ind_y,
    117 => :opcode_adc_zpg_x,
    118 => :opcode_ror_zpg_x,
    120 => :opcode_sei_impl,
    121 => :opcode_adc_abs_y,
    125 => :opcode_adc_abs_x,
    126 => :opcode_ror_abs_x,
    129 => :opcode_sta_x_ind,
    132 => :opcode_sty_zpg,
    133 => :opcode_sta_zpg,
    134 => :opcode_stx_zpg,
    136 => :opcode_dey_impl,
    138 => :opcode_txa_impl,
    140 => :opcode_sty_abs,
    141 => :opcode_sta_abs,
    142 => :opcode_stx_abs,
    144 => :opcode_bcc_rel,
    145 => :opcode_sta_ind_y,
    148 => :opcode_sty_zpg_x,
    149 => :opcode_sta_zpg_x,
    150 => :opcode_stx_zpg_y,
    152 => :opcode_tya_impl,
    153 => :opcode_sta_abs_y,
    154 => :opcode_txs_impl,
    157 => :opcode_sta_abs_x,
    160 => :opcode_ldy_imm,
    161 => :opcode_lda_x_ind,
    162 => :opcode_ldx_imm,
    164 => :opcode_ldy_zpg,
    165 => :opcode_lda_zpg,
    166 => :opcode_ldx_zpg,
    168 => :opcode_tay_impl,
    169 => :opcode_lda_imm,
    170 => :opcode_tax_impl,
    172 => :opcode_ldy_abs,
    173 => :opcode_lda_abs,
    174 => :opcode_ldx_abs,
    176 => :opcode_bcs_rel,
    177 => :opcode_lda_ind_y,
    180 => :opcode_ldy_zpg_x,
    181 => :opcode_lda_zpg_x,
    182 => :opcode_ldx_zpg_y,
    184 => :opcode_clv_impl,
    185 => :opcode_lda_abs_y,
    186 => :opcode_tsx_impl,
    188 => :opcode_ldy_abs_x,
    189 => :opcode_lda_abs_x,
    190 => :opcode_ldx_abs_y,
    192 => :opcode_cpy_imm,
    193 => :opcode_cmp_x_ind,
    196 => :opcode_cpy_zpg,
    197 => :opcode_cmp_zpg,
    198 => :opcode_dec_zpg,
    200 => :opcode_iny_impl,
    201 => :opcode_cmp_imm,
    202 => :opcode_dex_impl,
    204 => :opcode_cpy_abs,
    205 => :opcode_cmp_abs,
    206 => :opcode_dec_abs,
    208 => :opcode_bne_rel,
    209 => :opcode_cmp_ind_y,
    213 => :opcode_cmp_zpg_x,
    214 => :opcode_dec_zpg_x,
    216 => :opcode_cld_impl,
    217 => :opcode_cmp_abs_y,
    221 => :opcode_cmp_abs_x,
    222 => :opcode_dec_abs_x,
    224 => :opcode_cpx_imm,
    225 => :opcode_sbc_x_ind,
    228 => :opcode_cpx_zpg,
    229 => :opcode_sbc_zpg,
    230 => :opcode_inc_zpg,
    232 => :opcode_inx_impl,
    233 => :opcode_sbc_imm,
    234 => :opcode_nop_impl,
    236 => :opcode_cpx_abs,
    237 => :opcode_sbc_abs,
    238 => :opcode_inc_abs,
    240 => :opcode_beq_rel,
    241 => :opcode_sbc_ind_y,
    245 => :opcode_sbc_zpg_x,
    246 => :opcode_inc_zpg_x,
    248 => :opcode_sed_impl,
    249 => :opcode_sbc_abs_y,
    253 => :opcode_sbc_abs_x,
    254 => :opcode_inc_abs_x,
  }
  I__OPCODE = OPCODE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @operations = []
    i = 0
    while not @_io.eof?
      @operations << Operation.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Operation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(OPCODE, @_io.read_u1)
      case code
      when :opcode_lsr_abs_x
        @args = @_io.read_u2le
      when :opcode_and_abs
        @args = @_io.read_u2le
      when :opcode_bit_zpg
        @args = @_io.read_u1
      when :opcode_asl_zpg
        @args = @_io.read_u1
      when :opcode_ror_abs_x
        @args = @_io.read_u2le
      when :opcode_sty_abs
        @args = @_io.read_u2le
      when :opcode_ora_zpg
        @args = @_io.read_u1
      when :opcode_eor_zpg_x
        @args = @_io.read_u1
      when :opcode_eor_abs
        @args = @_io.read_u2le
      when :opcode_eor_zpg
        @args = @_io.read_u1
      when :opcode_ora_abs_x
        @args = @_io.read_u2le
      when :opcode_adc_abs_y
        @args = @_io.read_u2le
      when :opcode_sty_zpg
        @args = @_io.read_u1
      when :opcode_eor_ind_y
        @args = @_io.read_u1
      when :opcode_rol_abs
        @args = @_io.read_u2le
      when :opcode_eor_imm
        @args = @_io.read_u1
      when :opcode_bmi_rel
        @args = @_io.read_s1
      when :opcode_inc_abs_x
        @args = @_io.read_u2le
      when :opcode_cpy_zpg
        @args = @_io.read_u1
      when :opcode_jsr_abs
        @args = @_io.read_u2le
      when :opcode_and_abs_y
        @args = @_io.read_u2le
      when :opcode_cmp_zpg
        @args = @_io.read_u1
      when :opcode_sbc_ind_y
        @args = @_io.read_u1
      when :opcode_and_x_ind
        @args = @_io.read_u1
      when :opcode_bvc_rel
        @args = @_io.read_s1
      when :opcode_ora_x_ind
        @args = @_io.read_u1
      when :opcode_ora_abs_y
        @args = @_io.read_u2le
      when :opcode_lsr_abs
        @args = @_io.read_u2le
      when :opcode_ldx_zpg_y
        @args = @_io.read_u1
      when :opcode_rol_abs_x
        @args = @_io.read_u2le
      when :opcode_adc_abs
        @args = @_io.read_u2le
      when :opcode_sty_zpg_x
        @args = @_io.read_u1
      when :opcode_ora_zpg_x
        @args = @_io.read_u1
      when :opcode_ldy_abs_x
        @args = @_io.read_u2le
      when :opcode_adc_imm
        @args = @_io.read_u1
      when :opcode_sbc_zpg
        @args = @_io.read_u1
      when :opcode_ldx_imm
        @args = @_io.read_u1
      when :opcode_beq_rel
        @args = @_io.read_s1
      when :opcode_sbc_abs_x
        @args = @_io.read_u2le
      when :opcode_ldx_abs_y
        @args = @_io.read_u2le
      when :opcode_ora_imm
        @args = @_io.read_u1
      when :opcode_bcs_rel
        @args = @_io.read_s1
      when :opcode_sbc_zpg_x
        @args = @_io.read_u1
      when :opcode_sta_zpg
        @args = @_io.read_u1
      when :opcode_bcc_rel
        @args = @_io.read_s1
      when :opcode_and_imm
        @args = @_io.read_u1
      when :opcode_ldy_zpg
        @args = @_io.read_u1
      when :opcode_adc_zpg
        @args = @_io.read_u1
      when :opcode_bne_rel
        @args = @_io.read_s1
      when :opcode_eor_abs_y
        @args = @_io.read_u2le
      when :opcode_cpy_abs
        @args = @_io.read_u2le
      when :opcode_stx_abs
        @args = @_io.read_u2le
      when :opcode_ldy_imm
        @args = @_io.read_u1
      when :opcode_lda_zpg_x
        @args = @_io.read_u1
      when :opcode_cmp_abs_y
        @args = @_io.read_u2le
      when :opcode_lsr_zpg_x
        @args = @_io.read_u1
      when :opcode_eor_abs_x
        @args = @_io.read_u2le
      when :opcode_cmp_abs_x
        @args = @_io.read_u2le
      when :opcode_inc_abs
        @args = @_io.read_u2le
      when :opcode_sta_zpg_x
        @args = @_io.read_u1
      when :opcode_sta_x_ind
        @args = @_io.read_u1
      when :opcode_cmp_imm
        @args = @_io.read_u1
      when :opcode_eor_x_ind
        @args = @_io.read_u1
      when :opcode_cmp_ind_y
        @args = @_io.read_u1
      when :opcode_cmp_x_ind
        @args = @_io.read_u1
      when :opcode_asl_abs_x
        @args = @_io.read_u2le
      when :opcode_dec_zpg_x
        @args = @_io.read_u1
      when :opcode_sbc_abs_y
        @args = @_io.read_u2le
      when :opcode_stx_zpg
        @args = @_io.read_u1
      when :opcode_lda_abs_x
        @args = @_io.read_u2le
      when :opcode_and_zpg
        @args = @_io.read_u1
      when :opcode_sbc_x_ind
        @args = @_io.read_u1
      when :opcode_lda_zpg
        @args = @_io.read_u1
      when :opcode_jmp_ind
        @args = @_io.read_u2le
      when :opcode_sta_abs_y
        @args = @_io.read_u2le
      when :opcode_asl_abs
        @args = @_io.read_u2le
      when :opcode_cmp_zpg_x
        @args = @_io.read_u1
      when :opcode_ldx_abs
        @args = @_io.read_u2le
      when :opcode_adc_zpg_x
        @args = @_io.read_u1
      when :opcode_ror_zpg_x
        @args = @_io.read_u1
      when :opcode_and_abs_x
        @args = @_io.read_u2le
      when :opcode_sta_abs
        @args = @_io.read_u2le
      when :opcode_adc_abs_x
        @args = @_io.read_u2le
      when :opcode_bit_abs
        @args = @_io.read_u2le
      when :opcode_dec_abs_x
        @args = @_io.read_u2le
      when :opcode_stx_zpg_y
        @args = @_io.read_u1
      when :opcode_lda_abs_y
        @args = @_io.read_u2le
      when :opcode_lda_x_ind
        @args = @_io.read_u1
      when :opcode_cpy_imm
        @args = @_io.read_u1
      when :opcode_ora_ind_y
        @args = @_io.read_u1
      when :opcode_asl_zpg_x
        @args = @_io.read_u1
      when :opcode_and_ind_y
        @args = @_io.read_u1
      when :opcode_sta_ind_y
        @args = @_io.read_u1
      when :opcode_ror_abs
        @args = @_io.read_u2le
      when :opcode_ldx_zpg
        @args = @_io.read_u1
      when :opcode_and_zpg_x
        @args = @_io.read_u1
      when :opcode_cpx_imm
        @args = @_io.read_u1
      when :opcode_bvs_rel
        @args = @_io.read_s1
      when :opcode_ldy_abs
        @args = @_io.read_u2le
      when :opcode_inc_zpg
        @args = @_io.read_u1
      when :opcode_sbc_abs
        @args = @_io.read_u2le
      when :opcode_rol_zpg_x
        @args = @_io.read_u1
      when :opcode_sbc_imm
        @args = @_io.read_u1
      when :opcode_adc_x_ind
        @args = @_io.read_u1
      when :opcode_sta_abs_x
        @args = @_io.read_u2le
      when :opcode_cpx_abs
        @args = @_io.read_u2le
      when :opcode_cmp_abs
        @args = @_io.read_u2le
      when :opcode_lda_abs
        @args = @_io.read_u2le
      when :opcode_rol_zpg
        @args = @_io.read_u1
      when :opcode_inc_zpg_x
        @args = @_io.read_u1
      when :opcode_lda_imm
        @args = @_io.read_u1
      when :opcode_dec_zpg
        @args = @_io.read_u1
      when :opcode_adc_ind_y
        @args = @_io.read_u1
      when :opcode_lda_ind_y
        @args = @_io.read_u1
      when :opcode_bpl_rel
        @args = @_io.read_s1
      when :opcode_lsr_zpg
        @args = @_io.read_u1
      when :opcode_jmp_abs
        @args = @_io.read_u2le
      when :opcode_dec_abs
        @args = @_io.read_u2le
      when :opcode_ora_abs
        @args = @_io.read_u2le
      when :opcode_ror_zpg
        @args = @_io.read_u1
      when :opcode_ldy_zpg_x
        @args = @_io.read_u1
      when :opcode_cpx_zpg
        @args = @_io.read_u1
      end
      self
    end
    attr_reader :code
    attr_reader :args
  end
  attr_reader :operations
end
