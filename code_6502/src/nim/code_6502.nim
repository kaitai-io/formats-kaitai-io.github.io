import kaitai_struct_nim_runtime
import options

type
  Code6502* = ref object of KaitaiStruct
    `operations`*: seq[Code6502_Operation]
    `parent`*: KaitaiStruct
  Code6502_Opcode* = enum
    brk_impl = 0
    ora_x_ind = 1
    ora_zpg = 5
    asl_zpg = 6
    php_impl = 8
    ora_imm = 9
    asl_a = 10
    ora_abs = 13
    asl_abs = 14
    bpl_rel = 16
    ora_ind_y = 17
    ora_zpg_x = 21
    asl_zpg_x = 22
    clc_impl = 24
    ora_abs_y = 25
    ora_abs_x = 29
    asl_abs_x = 30
    jsr_abs = 32
    and_x_ind = 33
    bit_zpg = 36
    and_zpg = 37
    rol_zpg = 38
    plp_impl = 40
    and_imm = 41
    rol_a = 42
    bit_abs = 44
    and_abs = 45
    rol_abs = 46
    bmi_rel = 48
    and_ind_y = 49
    and_zpg_x = 53
    rol_zpg_x = 54
    sec_impl = 56
    and_abs_y = 57
    and_abs_x = 61
    rol_abs_x = 62
    rti_impl = 64
    eor_x_ind = 65
    eor_zpg = 69
    lsr_zpg = 70
    pha_impl = 72
    eor_imm = 73
    lsr_a = 74
    jmp_abs = 76
    eor_abs = 77
    lsr_abs = 78
    bvc_rel = 80
    eor_ind_y = 81
    eor_zpg_x = 85
    lsr_zpg_x = 86
    cli_impl = 88
    eor_abs_y = 89
    eor_abs_x = 93
    lsr_abs_x = 94
    rts_impl = 96
    adc_x_ind = 97
    adc_zpg = 101
    ror_zpg = 102
    pla_impl = 104
    adc_imm = 105
    ror_a = 106
    jmp_ind = 108
    adc_abs = 109
    ror_abs = 110
    bvs_rel = 112
    adc_ind_y = 113
    adc_zpg_x = 117
    ror_zpg_x = 118
    sei_impl = 120
    adc_abs_y = 121
    adc_abs_x = 125
    ror_abs_x = 126
    sta_x_ind = 129
    sty_zpg = 132
    sta_zpg = 133
    stx_zpg = 134
    dey_impl = 136
    txa_impl = 138
    sty_abs = 140
    sta_abs = 141
    stx_abs = 142
    bcc_rel = 144
    sta_ind_y = 145
    sty_zpg_x = 148
    sta_zpg_x = 149
    stx_zpg_y = 150
    tya_impl = 152
    sta_abs_y = 153
    txs_impl = 154
    sta_abs_x = 157
    ldy_imm = 160
    lda_x_ind = 161
    ldx_imm = 162
    ldy_zpg = 164
    lda_zpg = 165
    ldx_zpg = 166
    tay_impl = 168
    lda_imm = 169
    tax_impl = 170
    ldy_abs = 172
    lda_abs = 173
    ldx_abs = 174
    bcs_rel = 176
    lda_ind_y = 177
    ldy_zpg_x = 180
    lda_zpg_x = 181
    ldx_zpg_y = 182
    clv_impl = 184
    lda_abs_y = 185
    tsx_impl = 186
    ldy_abs_x = 188
    lda_abs_x = 189
    ldx_abs_y = 190
    cpy_imm = 192
    cmp_x_ind = 193
    cpy_zpg = 196
    cmp_zpg = 197
    dec_zpg = 198
    iny_impl = 200
    cmp_imm = 201
    dex_impl = 202
    cpy_abs = 204
    cmp_abs = 205
    dec_abs = 206
    bne_rel = 208
    cmp_ind_y = 209
    cmp_zpg_x = 213
    dec_zpg_x = 214
    cld_impl = 216
    cmp_abs_y = 217
    cmp_abs_x = 221
    dec_abs_x = 222
    cpx_imm = 224
    sbc_x_ind = 225
    cpx_zpg = 228
    sbc_zpg = 229
    inc_zpg = 230
    inx_impl = 232
    sbc_imm = 233
    nop_impl = 234
    cpx_abs = 236
    sbc_abs = 237
    inc_abs = 238
    beq_rel = 240
    sbc_ind_y = 241
    sbc_zpg_x = 245
    inc_zpg_x = 246
    sed_impl = 248
    sbc_abs_y = 249
    sbc_abs_x = 253
    inc_abs_x = 254
  Code6502_Operation* = ref object of KaitaiStruct
    `code`*: Code6502_Opcode
    `args`*: uint16
    `parent`*: Code6502

proc read*(_: typedesc[Code6502], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Code6502
proc read*(_: typedesc[Code6502_Operation], io: KaitaiStream, root: KaitaiStruct, parent: Code6502): Code6502_Operation



##[
This spec can be used to disassemble raw stream of 6502 CPU machine
code into individual operations. Each operation includes an opcode
and, optionally, an argument. Register arguments are part of the
`opcode` enum.

]##
proc read*(_: typedesc[Code6502], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Code6502 =
  template this: untyped = result
  this = new(Code6502)
  let root = if root == nil: cast[Code6502](this) else: cast[Code6502](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Code6502_Operation.read(this.io, this.root, this)
      this.operations.add(it)
      inc i

proc fromFile*(_: typedesc[Code6502], filename: string): Code6502 =
  Code6502.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Code6502_Operation], io: KaitaiStream, root: KaitaiStruct, parent: Code6502): Code6502_Operation =
  template this: untyped = result
  this = new(Code6502_Operation)
  let root = if root == nil: cast[Code6502](this) else: cast[Code6502](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = Code6502_Opcode(this.io.readU1())
  this.code = codeExpr
  block:
    let on = this.code
    if on == code_6502.adc_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.adc_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.adc_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.adc_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.adc_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.adc_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.adc_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.adc_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.and_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.and_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.and_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.and_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.and_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.and_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.and_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.and_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.asl_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.asl_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.asl_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.asl_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.bcc_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bcs_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.beq_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bit_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.bit_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.bmi_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bne_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bpl_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bvc_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.bvs_rel:
      let argsExpr = uint16(this.io.readS1())
      this.args = argsExpr
    elif on == code_6502.cmp_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.cmp_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.cmp_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.cmp_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cmp_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cmp_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cmp_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cmp_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cpx_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.cpx_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cpx_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cpy_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.cpy_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.cpy_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.dec_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.dec_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.dec_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.dec_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.eor_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.eor_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.eor_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.eor_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.eor_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.eor_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.eor_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.eor_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.inc_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.inc_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.inc_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.inc_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.jmp_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.jmp_ind:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.jsr_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lda_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lda_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lda_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lda_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lda_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lda_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lda_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lda_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldx_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ldx_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ldx_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldx_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldx_zpg_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldy_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ldy_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ldy_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldy_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ldy_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lsr_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lsr_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.lsr_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.lsr_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ora_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ora_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ora_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ora_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ora_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ora_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ora_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ora_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.rol_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.rol_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.rol_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.rol_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ror_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ror_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.ror_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.ror_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sbc_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sbc_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sbc_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sbc_imm:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sbc_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sbc_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sbc_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sbc_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sta_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sta_abs_x:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sta_abs_y:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sta_ind_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sta_x_ind:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sta_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sta_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.stx_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.stx_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.stx_zpg_y:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sty_abs:
      let argsExpr = this.io.readU2le()
      this.args = argsExpr
    elif on == code_6502.sty_zpg:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr
    elif on == code_6502.sty_zpg_x:
      let argsExpr = uint16(this.io.readU1())
      this.args = argsExpr

proc fromFile*(_: typedesc[Code6502_Operation], filename: string): Code6502_Operation =
  Code6502_Operation.read(newKaitaiFileStream(filename), nil, nil)

