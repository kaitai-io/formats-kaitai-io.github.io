// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */

type Code6502_Opcode int
const (
	Code6502_Opcode__BrkImpl Code6502_Opcode = 0
	Code6502_Opcode__OraXInd Code6502_Opcode = 1
	Code6502_Opcode__OraZpg Code6502_Opcode = 5
	Code6502_Opcode__AslZpg Code6502_Opcode = 6
	Code6502_Opcode__PhpImpl Code6502_Opcode = 8
	Code6502_Opcode__OraImm Code6502_Opcode = 9
	Code6502_Opcode__AslA Code6502_Opcode = 10
	Code6502_Opcode__OraAbs Code6502_Opcode = 13
	Code6502_Opcode__AslAbs Code6502_Opcode = 14
	Code6502_Opcode__BplRel Code6502_Opcode = 16
	Code6502_Opcode__OraIndY Code6502_Opcode = 17
	Code6502_Opcode__OraZpgX Code6502_Opcode = 21
	Code6502_Opcode__AslZpgX Code6502_Opcode = 22
	Code6502_Opcode__ClcImpl Code6502_Opcode = 24
	Code6502_Opcode__OraAbsY Code6502_Opcode = 25
	Code6502_Opcode__OraAbsX Code6502_Opcode = 29
	Code6502_Opcode__AslAbsX Code6502_Opcode = 30
	Code6502_Opcode__JsrAbs Code6502_Opcode = 32
	Code6502_Opcode__AndXInd Code6502_Opcode = 33
	Code6502_Opcode__BitZpg Code6502_Opcode = 36
	Code6502_Opcode__AndZpg Code6502_Opcode = 37
	Code6502_Opcode__RolZpg Code6502_Opcode = 38
	Code6502_Opcode__PlpImpl Code6502_Opcode = 40
	Code6502_Opcode__AndImm Code6502_Opcode = 41
	Code6502_Opcode__RolA Code6502_Opcode = 42
	Code6502_Opcode__BitAbs Code6502_Opcode = 44
	Code6502_Opcode__AndAbs Code6502_Opcode = 45
	Code6502_Opcode__RolAbs Code6502_Opcode = 46
	Code6502_Opcode__BmiRel Code6502_Opcode = 48
	Code6502_Opcode__AndIndY Code6502_Opcode = 49
	Code6502_Opcode__AndZpgX Code6502_Opcode = 53
	Code6502_Opcode__RolZpgX Code6502_Opcode = 54
	Code6502_Opcode__SecImpl Code6502_Opcode = 56
	Code6502_Opcode__AndAbsY Code6502_Opcode = 57
	Code6502_Opcode__AndAbsX Code6502_Opcode = 61
	Code6502_Opcode__RolAbsX Code6502_Opcode = 62
	Code6502_Opcode__RtiImpl Code6502_Opcode = 64
	Code6502_Opcode__EorXInd Code6502_Opcode = 65
	Code6502_Opcode__EorZpg Code6502_Opcode = 69
	Code6502_Opcode__LsrZpg Code6502_Opcode = 70
	Code6502_Opcode__PhaImpl Code6502_Opcode = 72
	Code6502_Opcode__EorImm Code6502_Opcode = 73
	Code6502_Opcode__LsrA Code6502_Opcode = 74
	Code6502_Opcode__JmpAbs Code6502_Opcode = 76
	Code6502_Opcode__EorAbs Code6502_Opcode = 77
	Code6502_Opcode__LsrAbs Code6502_Opcode = 78
	Code6502_Opcode__BvcRel Code6502_Opcode = 80
	Code6502_Opcode__EorIndY Code6502_Opcode = 81
	Code6502_Opcode__EorZpgX Code6502_Opcode = 85
	Code6502_Opcode__LsrZpgX Code6502_Opcode = 86
	Code6502_Opcode__CliImpl Code6502_Opcode = 88
	Code6502_Opcode__EorAbsY Code6502_Opcode = 89
	Code6502_Opcode__EorAbsX Code6502_Opcode = 93
	Code6502_Opcode__LsrAbsX Code6502_Opcode = 94
	Code6502_Opcode__RtsImpl Code6502_Opcode = 96
	Code6502_Opcode__AdcXInd Code6502_Opcode = 97
	Code6502_Opcode__AdcZpg Code6502_Opcode = 101
	Code6502_Opcode__RorZpg Code6502_Opcode = 102
	Code6502_Opcode__PlaImpl Code6502_Opcode = 104
	Code6502_Opcode__AdcImm Code6502_Opcode = 105
	Code6502_Opcode__RorA Code6502_Opcode = 106
	Code6502_Opcode__JmpInd Code6502_Opcode = 108
	Code6502_Opcode__AdcAbs Code6502_Opcode = 109
	Code6502_Opcode__RorAbs Code6502_Opcode = 110
	Code6502_Opcode__BvsRel Code6502_Opcode = 112
	Code6502_Opcode__AdcIndY Code6502_Opcode = 113
	Code6502_Opcode__AdcZpgX Code6502_Opcode = 117
	Code6502_Opcode__RorZpgX Code6502_Opcode = 118
	Code6502_Opcode__SeiImpl Code6502_Opcode = 120
	Code6502_Opcode__AdcAbsY Code6502_Opcode = 121
	Code6502_Opcode__AdcAbsX Code6502_Opcode = 125
	Code6502_Opcode__RorAbsX Code6502_Opcode = 126
	Code6502_Opcode__StaXInd Code6502_Opcode = 129
	Code6502_Opcode__StyZpg Code6502_Opcode = 132
	Code6502_Opcode__StaZpg Code6502_Opcode = 133
	Code6502_Opcode__StxZpg Code6502_Opcode = 134
	Code6502_Opcode__DeyImpl Code6502_Opcode = 136
	Code6502_Opcode__TxaImpl Code6502_Opcode = 138
	Code6502_Opcode__StyAbs Code6502_Opcode = 140
	Code6502_Opcode__StaAbs Code6502_Opcode = 141
	Code6502_Opcode__StxAbs Code6502_Opcode = 142
	Code6502_Opcode__BccRel Code6502_Opcode = 144
	Code6502_Opcode__StaIndY Code6502_Opcode = 145
	Code6502_Opcode__StyZpgX Code6502_Opcode = 148
	Code6502_Opcode__StaZpgX Code6502_Opcode = 149
	Code6502_Opcode__StxZpgY Code6502_Opcode = 150
	Code6502_Opcode__TyaImpl Code6502_Opcode = 152
	Code6502_Opcode__StaAbsY Code6502_Opcode = 153
	Code6502_Opcode__TxsImpl Code6502_Opcode = 154
	Code6502_Opcode__StaAbsX Code6502_Opcode = 157
	Code6502_Opcode__LdyImm Code6502_Opcode = 160
	Code6502_Opcode__LdaXInd Code6502_Opcode = 161
	Code6502_Opcode__LdxImm Code6502_Opcode = 162
	Code6502_Opcode__LdyZpg Code6502_Opcode = 164
	Code6502_Opcode__LdaZpg Code6502_Opcode = 165
	Code6502_Opcode__LdxZpg Code6502_Opcode = 166
	Code6502_Opcode__TayImpl Code6502_Opcode = 168
	Code6502_Opcode__LdaImm Code6502_Opcode = 169
	Code6502_Opcode__TaxImpl Code6502_Opcode = 170
	Code6502_Opcode__LdyAbs Code6502_Opcode = 172
	Code6502_Opcode__LdaAbs Code6502_Opcode = 173
	Code6502_Opcode__LdxAbs Code6502_Opcode = 174
	Code6502_Opcode__BcsRel Code6502_Opcode = 176
	Code6502_Opcode__LdaIndY Code6502_Opcode = 177
	Code6502_Opcode__LdyZpgX Code6502_Opcode = 180
	Code6502_Opcode__LdaZpgX Code6502_Opcode = 181
	Code6502_Opcode__LdxZpgY Code6502_Opcode = 182
	Code6502_Opcode__ClvImpl Code6502_Opcode = 184
	Code6502_Opcode__LdaAbsY Code6502_Opcode = 185
	Code6502_Opcode__TsxImpl Code6502_Opcode = 186
	Code6502_Opcode__LdyAbsX Code6502_Opcode = 188
	Code6502_Opcode__LdaAbsX Code6502_Opcode = 189
	Code6502_Opcode__LdxAbsY Code6502_Opcode = 190
	Code6502_Opcode__CpyImm Code6502_Opcode = 192
	Code6502_Opcode__CmpXInd Code6502_Opcode = 193
	Code6502_Opcode__CpyZpg Code6502_Opcode = 196
	Code6502_Opcode__CmpZpg Code6502_Opcode = 197
	Code6502_Opcode__DecZpg Code6502_Opcode = 198
	Code6502_Opcode__InyImpl Code6502_Opcode = 200
	Code6502_Opcode__CmpImm Code6502_Opcode = 201
	Code6502_Opcode__DexImpl Code6502_Opcode = 202
	Code6502_Opcode__CpyAbs Code6502_Opcode = 204
	Code6502_Opcode__CmpAbs Code6502_Opcode = 205
	Code6502_Opcode__DecAbs Code6502_Opcode = 206
	Code6502_Opcode__BneRel Code6502_Opcode = 208
	Code6502_Opcode__CmpIndY Code6502_Opcode = 209
	Code6502_Opcode__CmpZpgX Code6502_Opcode = 213
	Code6502_Opcode__DecZpgX Code6502_Opcode = 214
	Code6502_Opcode__CldImpl Code6502_Opcode = 216
	Code6502_Opcode__CmpAbsY Code6502_Opcode = 217
	Code6502_Opcode__CmpAbsX Code6502_Opcode = 221
	Code6502_Opcode__DecAbsX Code6502_Opcode = 222
	Code6502_Opcode__CpxImm Code6502_Opcode = 224
	Code6502_Opcode__SbcXInd Code6502_Opcode = 225
	Code6502_Opcode__CpxZpg Code6502_Opcode = 228
	Code6502_Opcode__SbcZpg Code6502_Opcode = 229
	Code6502_Opcode__IncZpg Code6502_Opcode = 230
	Code6502_Opcode__InxImpl Code6502_Opcode = 232
	Code6502_Opcode__SbcImm Code6502_Opcode = 233
	Code6502_Opcode__NopImpl Code6502_Opcode = 234
	Code6502_Opcode__CpxAbs Code6502_Opcode = 236
	Code6502_Opcode__SbcAbs Code6502_Opcode = 237
	Code6502_Opcode__IncAbs Code6502_Opcode = 238
	Code6502_Opcode__BeqRel Code6502_Opcode = 240
	Code6502_Opcode__SbcIndY Code6502_Opcode = 241
	Code6502_Opcode__SbcZpgX Code6502_Opcode = 245
	Code6502_Opcode__IncZpgX Code6502_Opcode = 246
	Code6502_Opcode__SedImpl Code6502_Opcode = 248
	Code6502_Opcode__SbcAbsY Code6502_Opcode = 249
	Code6502_Opcode__SbcAbsX Code6502_Opcode = 253
	Code6502_Opcode__IncAbsX Code6502_Opcode = 254
)
type Code6502 struct {
	Operations []*Code6502_Operation
	_io *kaitai.Stream
	_root *Code6502
	_parent interface{}
}
func NewCode6502() *Code6502 {
	return &Code6502{
	}
}

func (this *Code6502) Read(io *kaitai.Stream, parent interface{}, root *Code6502) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewCode6502_Operation()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Operations = append(this.Operations, tmp2)
	}
	return err
}
type Code6502_Operation struct {
	Code Code6502_Opcode
	Args uint16
	_io *kaitai.Stream
	_root *Code6502
	_parent *Code6502
}
func NewCode6502_Operation() *Code6502_Operation {
	return &Code6502_Operation{
	}
}

func (this *Code6502_Operation) Read(io *kaitai.Stream, parent *Code6502, root *Code6502) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = Code6502_Opcode(tmp3)
	switch (this.Code) {
	case Code6502_Opcode__BccRel:
		tmp4, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp4)
	case Code6502_Opcode__OraIndY:
		tmp5, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp5)
	case Code6502_Opcode__LdaIndY:
		tmp6, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp6)
	case Code6502_Opcode__CpxZpg:
		tmp7, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp7)
	case Code6502_Opcode__StaZpgX:
		tmp8, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp8)
	case Code6502_Opcode__StaZpg:
		tmp9, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp9)
	case Code6502_Opcode__BcsRel:
		tmp10, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp10)
	case Code6502_Opcode__LdyZpgX:
		tmp11, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp11)
	case Code6502_Opcode__LsrAbsX:
		tmp12, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp12)
	case Code6502_Opcode__AndAbsX:
		tmp13, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp13)
	case Code6502_Opcode__AdcAbs:
		tmp14, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp14)
	case Code6502_Opcode__StaAbs:
		tmp15, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp15)
	case Code6502_Opcode__BneRel:
		tmp16, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp16)
	case Code6502_Opcode__LdaImm:
		tmp17, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp17)
	case Code6502_Opcode__AdcImm:
		tmp18, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp18)
	case Code6502_Opcode__LsrAbs:
		tmp19, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp19)
	case Code6502_Opcode__AdcAbsX:
		tmp20, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp20)
	case Code6502_Opcode__StaAbsX:
		tmp21, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp21)
	case Code6502_Opcode__CpxImm:
		tmp22, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp22)
	case Code6502_Opcode__JmpInd:
		tmp23, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp23)
	case Code6502_Opcode__AdcZpg:
		tmp24, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp24)
	case Code6502_Opcode__EorImm:
		tmp25, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp25)
	case Code6502_Opcode__EorAbsX:
		tmp26, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp26)
	case Code6502_Opcode__StaXInd:
		tmp27, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp27)
	case Code6502_Opcode__SbcImm:
		tmp28, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp28)
	case Code6502_Opcode__CpyAbs:
		tmp29, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp29)
	case Code6502_Opcode__LdxAbsY:
		tmp30, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp30)
	case Code6502_Opcode__AdcZpgX:
		tmp31, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp31)
	case Code6502_Opcode__BplRel:
		tmp32, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp32)
	case Code6502_Opcode__OraImm:
		tmp33, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp33)
	case Code6502_Opcode__RorAbsX:
		tmp34, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp34)
	case Code6502_Opcode__AdcIndY:
		tmp35, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp35)
	case Code6502_Opcode__EorIndY:
		tmp36, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp36)
	case Code6502_Opcode__LdaAbs:
		tmp37, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp37)
	case Code6502_Opcode__BitZpg:
		tmp38, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp38)
	case Code6502_Opcode__RolZpg:
		tmp39, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp39)
	case Code6502_Opcode__StyZpg:
		tmp40, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp40)
	case Code6502_Opcode__JsrAbs:
		tmp41, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp41)
	case Code6502_Opcode__EorZpg:
		tmp42, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp42)
	case Code6502_Opcode__EorAbs:
		tmp43, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp43)
	case Code6502_Opcode__LdaAbsY:
		tmp44, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp44)
	case Code6502_Opcode__LdaZpgX:
		tmp45, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp45)
	case Code6502_Opcode__BmiRel:
		tmp46, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp46)
	case Code6502_Opcode__StyZpgX:
		tmp47, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp47)
	case Code6502_Opcode__AdcXInd:
		tmp48, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp48)
	case Code6502_Opcode__RolAbsX:
		tmp49, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp49)
	case Code6502_Opcode__StxZpg:
		tmp50, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp50)
	case Code6502_Opcode__AslAbsX:
		tmp51, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp51)
	case Code6502_Opcode__LsrZpgX:
		tmp52, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp52)
	case Code6502_Opcode__OraZpgX:
		tmp53, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp53)
	case Code6502_Opcode__AdcAbsY:
		tmp54, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp54)
	case Code6502_Opcode__LdyAbs:
		tmp55, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp55)
	case Code6502_Opcode__CmpAbsX:
		tmp56, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp56)
	case Code6502_Opcode__LdaAbsX:
		tmp57, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp57)
	case Code6502_Opcode__BvsRel:
		tmp58, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp58)
	case Code6502_Opcode__LdaXInd:
		tmp59, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp59)
	case Code6502_Opcode__CmpImm:
		tmp60, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp60)
	case Code6502_Opcode__IncZpgX:
		tmp61, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp61)
	case Code6502_Opcode__AslZpg:
		tmp62, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp62)
	case Code6502_Opcode__AndAbsY:
		tmp63, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp63)
	case Code6502_Opcode__LdxImm:
		tmp64, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp64)
	case Code6502_Opcode__AndZpg:
		tmp65, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp65)
	case Code6502_Opcode__CpxAbs:
		tmp66, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp66)
	case Code6502_Opcode__DecZpg:
		tmp67, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp67)
	case Code6502_Opcode__RorZpgX:
		tmp68, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp68)
	case Code6502_Opcode__LdxZpg:
		tmp69, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp69)
	case Code6502_Opcode__DecZpgX:
		tmp70, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp70)
	case Code6502_Opcode__SbcZpg:
		tmp71, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp71)
	case Code6502_Opcode__CmpAbs:
		tmp72, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp72)
	case Code6502_Opcode__RorZpg:
		tmp73, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp73)
	case Code6502_Opcode__IncAbs:
		tmp74, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp74)
	case Code6502_Opcode__AndXInd:
		tmp75, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp75)
	case Code6502_Opcode__SbcAbsX:
		tmp76, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp76)
	case Code6502_Opcode__AslAbs:
		tmp77, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp77)
	case Code6502_Opcode__EorXInd:
		tmp78, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp78)
	case Code6502_Opcode__OraAbsX:
		tmp79, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp79)
	case Code6502_Opcode__LdyAbsX:
		tmp80, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp80)
	case Code6502_Opcode__SbcXInd:
		tmp81, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp81)
	case Code6502_Opcode__AslZpgX:
		tmp82, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp82)
	case Code6502_Opcode__SbcAbsY:
		tmp83, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp83)
	case Code6502_Opcode__RolAbs:
		tmp84, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp84)
	case Code6502_Opcode__LsrZpg:
		tmp85, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp85)
	case Code6502_Opcode__StxZpgY:
		tmp86, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp86)
	case Code6502_Opcode__OraAbsY:
		tmp87, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp87)
	case Code6502_Opcode__EorAbsY:
		tmp88, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp88)
	case Code6502_Opcode__BitAbs:
		tmp89, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp89)
	case Code6502_Opcode__LdxAbs:
		tmp90, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp90)
	case Code6502_Opcode__LdyImm:
		tmp91, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp91)
	case Code6502_Opcode__JmpAbs:
		tmp92, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp92)
	case Code6502_Opcode__BeqRel:
		tmp93, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp93)
	case Code6502_Opcode__DecAbsX:
		tmp94, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp94)
	case Code6502_Opcode__AndIndY:
		tmp95, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp95)
	case Code6502_Opcode__AndZpgX:
		tmp96, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp96)
	case Code6502_Opcode__CmpZpgX:
		tmp97, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp97)
	case Code6502_Opcode__EorZpgX:
		tmp98, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp98)
	case Code6502_Opcode__SbcAbs:
		tmp99, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp99)
	case Code6502_Opcode__CmpAbsY:
		tmp100, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp100)
	case Code6502_Opcode__SbcIndY:
		tmp101, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp101)
	case Code6502_Opcode__CmpZpg:
		tmp102, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp102)
	case Code6502_Opcode__StxAbs:
		tmp103, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp103)
	case Code6502_Opcode__StyAbs:
		tmp104, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp104)
	case Code6502_Opcode__CpyZpg:
		tmp105, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp105)
	case Code6502_Opcode__DecAbs:
		tmp106, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp106)
	case Code6502_Opcode__RorAbs:
		tmp107, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp107)
	case Code6502_Opcode__StaAbsY:
		tmp108, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp108)
	case Code6502_Opcode__IncAbsX:
		tmp109, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp109)
	case Code6502_Opcode__LdaZpg:
		tmp110, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp110)
	case Code6502_Opcode__CmpIndY:
		tmp111, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp111)
	case Code6502_Opcode__CpyImm:
		tmp112, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp112)
	case Code6502_Opcode__LdxZpgY:
		tmp113, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp113)
	case Code6502_Opcode__SbcZpgX:
		tmp114, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp114)
	case Code6502_Opcode__OraXInd:
		tmp115, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp115)
	case Code6502_Opcode__RolZpgX:
		tmp116, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp116)
	case Code6502_Opcode__OraAbs:
		tmp117, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp117)
	case Code6502_Opcode__StaIndY:
		tmp118, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp118)
	case Code6502_Opcode__AndAbs:
		tmp119, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp119)
	case Code6502_Opcode__AndImm:
		tmp120, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp120)
	case Code6502_Opcode__CmpXInd:
		tmp121, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp121)
	case Code6502_Opcode__LdyZpg:
		tmp122, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp122)
	case Code6502_Opcode__IncZpg:
		tmp123, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp123)
	case Code6502_Opcode__BvcRel:
		tmp124, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp124)
	case Code6502_Opcode__OraZpg:
		tmp125, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Args = uint16(tmp125)
	}
	return err
}
