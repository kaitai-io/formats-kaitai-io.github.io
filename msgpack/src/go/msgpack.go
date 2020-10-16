// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured
 * data into a compact binary stream.
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
 */
type Msgpack struct {
	B1 uint8
	IntExtra int
	Float32Value float32
	Float64Value float64
	StrLen8 uint8
	StrLen16 uint16
	StrLen32 uint32
	StrValue string
	NumArrayElements16 uint16
	NumArrayElements32 uint32
	ArrayElements []*Msgpack
	NumMapElements16 uint16
	NumMapElements32 uint32
	MapElements []*Msgpack_MapTuple
	_io *kaitai.Stream
	_root *Msgpack
	_parent interface{}
	_f_isArray32 bool
	isArray32 bool
	_f_intValue bool
	intValue int
	_f_strLen bool
	strLen int
	_f_isFixArray bool
	isFixArray bool
	_f_isMap bool
	isMap bool
	_f_isArray bool
	isArray bool
	_f_isFloat bool
	isFloat bool
	_f_isStr8 bool
	isStr8 bool
	_f_isFixMap bool
	isFixMap bool
	_f_isInt bool
	isInt bool
	_f_isBool bool
	isBool bool
	_f_isStr16 bool
	isStr16 bool
	_f_isFloat64 bool
	isFloat64 bool
	_f_isMap16 bool
	isMap16 bool
	_f_isNegInt5 bool
	isNegInt5 bool
	_f_posInt7Value bool
	posInt7Value uint8
	_f_isNil bool
	isNil bool
	_f_floatValue bool
	floatValue float64
	_f_numArrayElements bool
	numArrayElements int
	_f_negInt5Value bool
	negInt5Value int
	_f_boolValue bool
	boolValue bool
	_f_isPosInt7 bool
	isPosInt7 bool
	_f_isArray16 bool
	isArray16 bool
	_f_isStr bool
	isStr bool
	_f_isFixStr bool
	isFixStr bool
	_f_isStr32 bool
	isStr32 bool
	_f_numMapElements bool
	numMapElements int
	_f_isFloat32 bool
	isFloat32 bool
	_f_isMap32 bool
	isMap32 bool
}
func NewMsgpack() *Msgpack {
	return &Msgpack{
	}
}

func (this *Msgpack) Read(io *kaitai.Stream, parent interface{}, root *Msgpack) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp1
	switch (this.B1) {
	case 211:
		tmp2, err := this._io.ReadS8be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp2
	case 209:
		tmp3, err := this._io.ReadS2be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp3
	case 210:
		tmp4, err := this._io.ReadS4be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp4
	case 208:
		tmp5, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.IntExtra = tmp5
	case 205:
		tmp6, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp6
	case 207:
		tmp7, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp7
	case 204:
		tmp8, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.IntExtra = tmp8
	case 206:
		tmp9, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.IntExtra = tmp9
	}
	tmp10, err := this.IsFloat32()
	if err != nil {
		return err
	}
	if (tmp10) {
		tmp11, err := this._io.ReadF4be()
		if err != nil {
			return err
		}
		this.Float32Value = float32(tmp11)
	}
	tmp12, err := this.IsFloat64()
	if err != nil {
		return err
	}
	if (tmp12) {
		tmp13, err := this._io.ReadF8be()
		if err != nil {
			return err
		}
		this.Float64Value = float64(tmp13)
	}
	tmp14, err := this.IsStr8()
	if err != nil {
		return err
	}
	if (tmp14) {
		tmp15, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.StrLen8 = tmp15
	}
	tmp16, err := this.IsStr16()
	if err != nil {
		return err
	}
	if (tmp16) {
		tmp17, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.StrLen16 = uint16(tmp17)
	}
	tmp18, err := this.IsStr32()
	if err != nil {
		return err
	}
	if (tmp18) {
		tmp19, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.StrLen32 = uint32(tmp19)
	}
	tmp20, err := this.IsStr()
	if err != nil {
		return err
	}
	if (tmp20) {
		tmp21, err := this.StrLen()
		if err != nil {
			return err
		}
		tmp22, err := this._io.ReadBytes(int(tmp21))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this.StrValue = string(tmp22)
	}
	tmp23, err := this.IsArray16()
	if err != nil {
		return err
	}
	if (tmp23) {
		tmp24, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.NumArrayElements16 = uint16(tmp24)
	}
	tmp25, err := this.IsArray32()
	if err != nil {
		return err
	}
	if (tmp25) {
		tmp26, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.NumArrayElements32 = uint32(tmp26)
	}
	tmp27, err := this.IsArray()
	if err != nil {
		return err
	}
	if (tmp27) {
		tmp28, err := this.NumArrayElements()
		if err != nil {
			return err
		}
		this.ArrayElements = make([]*Msgpack, tmp28)
		for i := range this.ArrayElements {
			tmp29 := NewMsgpack()
			err = tmp29.Read(this._io, this, nil)
			if err != nil {
				return err
			}
			this.ArrayElements[i] = tmp29
		}
	}
	tmp30, err := this.IsMap16()
	if err != nil {
		return err
	}
	if (tmp30) {
		tmp31, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.NumMapElements16 = uint16(tmp31)
	}
	tmp32, err := this.IsMap32()
	if err != nil {
		return err
	}
	if (tmp32) {
		tmp33, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.NumMapElements32 = uint32(tmp33)
	}
	tmp34, err := this.IsMap()
	if err != nil {
		return err
	}
	if (tmp34) {
		tmp35, err := this.NumMapElements()
		if err != nil {
			return err
		}
		this.MapElements = make([]*Msgpack_MapTuple, tmp35)
		for i := range this.MapElements {
			tmp36 := NewMsgpack_MapTuple()
			err = tmp36.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.MapElements[i] = tmp36
		}
	}
	return err
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
 */
func (this *Msgpack) IsArray32() (v bool, err error) {
	if (this._f_isArray32) {
		return this.isArray32, nil
	}
	this.isArray32 = bool(this.B1 == 221)
	this._f_isArray32 = true
	return this.isArray32, nil
}
func (this *Msgpack) IntValue() (v int, err error) {
	if (this._f_intValue) {
		return this.intValue, nil
	}
	tmp37, err := this.IsInt()
	if err != nil {
		return 0, err
	}
	if (tmp37) {
		var tmp38 uint8;
		tmp39, err := this.IsPosInt7()
		if err != nil {
			return 0, err
		}
		if (tmp39) {
			tmp40, err := this.PosInt7Value()
			if err != nil {
				return 0, err
			}
			tmp38 = tmp40
		} else {
			var tmp41 int;
			tmp42, err := this.IsNegInt5()
			if err != nil {
				return 0, err
			}
			if (tmp42) {
				tmp43, err := this.NegInt5Value()
				if err != nil {
					return 0, err
				}
				tmp41 = tmp43
			} else {
				tmp41 = 4919
			}
			tmp38 = tmp41
		}
		this.intValue = int(tmp38)
	}
	this._f_intValue = true
	return this.intValue, nil
}
func (this *Msgpack) StrLen() (v int, err error) {
	if (this._f_strLen) {
		return this.strLen, nil
	}
	tmp44, err := this.IsStr()
	if err != nil {
		return 0, err
	}
	if (tmp44) {
		var tmp45 int;
		tmp46, err := this.IsFixStr()
		if err != nil {
			return 0, err
		}
		if (tmp46) {
			tmp45 = (this.B1 & 31)
		} else {
			var tmp47 uint8;
			tmp48, err := this.IsStr8()
			if err != nil {
				return 0, err
			}
			if (tmp48) {
				tmp47 = this.StrLen8
			} else {
				var tmp49 uint16;
				tmp50, err := this.IsStr16()
				if err != nil {
					return 0, err
				}
				if (tmp50) {
					tmp49 = this.StrLen16
				} else {
					tmp49 = this.StrLen32
				}
				tmp47 = tmp49
			}
			tmp45 = tmp47
		}
		this.strLen = int(tmp45)
	}
	this._f_strLen = true
	return this.strLen, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
 */
func (this *Msgpack) IsFixArray() (v bool, err error) {
	if (this._f_isFixArray) {
		return this.isFixArray, nil
	}
	this.isFixArray = bool((this.B1 & 240) == 144)
	this._f_isFixArray = true
	return this.isFixArray, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
 */
func (this *Msgpack) IsMap() (v bool, err error) {
	if (this._f_isMap) {
		return this.isMap, nil
	}
	tmp51, err := this.IsFixMap()
	if err != nil {
		return false, err
	}
	tmp52, err := this.IsMap16()
	if err != nil {
		return false, err
	}
	tmp53, err := this.IsMap32()
	if err != nil {
		return false, err
	}
	this.isMap = bool( ((tmp51) || (tmp52) || (tmp53)) )
	this._f_isMap = true
	return this.isMap, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
 */
func (this *Msgpack) IsArray() (v bool, err error) {
	if (this._f_isArray) {
		return this.isArray, nil
	}
	tmp54, err := this.IsFixArray()
	if err != nil {
		return false, err
	}
	tmp55, err := this.IsArray16()
	if err != nil {
		return false, err
	}
	tmp56, err := this.IsArray32()
	if err != nil {
		return false, err
	}
	this.isArray = bool( ((tmp54) || (tmp55) || (tmp56)) )
	this._f_isArray = true
	return this.isArray, nil
}
func (this *Msgpack) IsFloat() (v bool, err error) {
	if (this._f_isFloat) {
		return this.isFloat, nil
	}
	tmp57, err := this.IsFloat32()
	if err != nil {
		return false, err
	}
	tmp58, err := this.IsFloat64()
	if err != nil {
		return false, err
	}
	this.isFloat = bool( ((tmp57) || (tmp58)) )
	this._f_isFloat = true
	return this.isFloat, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
 */
func (this *Msgpack) IsStr8() (v bool, err error) {
	if (this._f_isStr8) {
		return this.isStr8, nil
	}
	this.isStr8 = bool(this.B1 == 217)
	this._f_isStr8 = true
	return this.isStr8, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
 */
func (this *Msgpack) IsFixMap() (v bool, err error) {
	if (this._f_isFixMap) {
		return this.isFixMap, nil
	}
	this.isFixMap = bool((this.B1 & 240) == 128)
	this._f_isFixMap = true
	return this.isFixMap, nil
}
func (this *Msgpack) IsInt() (v bool, err error) {
	if (this._f_isInt) {
		return this.isInt, nil
	}
	tmp59, err := this.IsPosInt7()
	if err != nil {
		return false, err
	}
	tmp60, err := this.IsNegInt5()
	if err != nil {
		return false, err
	}
	this.isInt = bool( ((tmp59) || (tmp60)) )
	this._f_isInt = true
	return this.isInt, nil
}
func (this *Msgpack) IsBool() (v bool, err error) {
	if (this._f_isBool) {
		return this.isBool, nil
	}
	this.isBool = bool( ((this.B1 == 194) || (this.B1 == 195)) )
	this._f_isBool = true
	return this.isBool, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
 */
func (this *Msgpack) IsStr16() (v bool, err error) {
	if (this._f_isStr16) {
		return this.isStr16, nil
	}
	this.isStr16 = bool(this.B1 == 218)
	this._f_isStr16 = true
	return this.isStr16, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
 */
func (this *Msgpack) IsFloat64() (v bool, err error) {
	if (this._f_isFloat64) {
		return this.isFloat64, nil
	}
	this.isFloat64 = bool(this.B1 == 203)
	this._f_isFloat64 = true
	return this.isFloat64, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
 */
func (this *Msgpack) IsMap16() (v bool, err error) {
	if (this._f_isMap16) {
		return this.isMap16, nil
	}
	this.isMap16 = bool(this.B1 == 222)
	this._f_isMap16 = true
	return this.isMap16, nil
}
func (this *Msgpack) IsNegInt5() (v bool, err error) {
	if (this._f_isNegInt5) {
		return this.isNegInt5, nil
	}
	this.isNegInt5 = bool((this.B1 & 224) == 224)
	this._f_isNegInt5 = true
	return this.isNegInt5, nil
}
func (this *Msgpack) PosInt7Value() (v uint8, err error) {
	if (this._f_posInt7Value) {
		return this.posInt7Value, nil
	}
	tmp61, err := this.IsPosInt7()
	if err != nil {
		return 0, err
	}
	if (tmp61) {
		this.posInt7Value = uint8(this.B1)
	}
	this._f_posInt7Value = true
	return this.posInt7Value, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
 */
func (this *Msgpack) IsNil() (v bool, err error) {
	if (this._f_isNil) {
		return this.isNil, nil
	}
	this.isNil = bool(this.B1 == 192)
	this._f_isNil = true
	return this.isNil, nil
}
func (this *Msgpack) FloatValue() (v float64, err error) {
	if (this._f_floatValue) {
		return this.floatValue, nil
	}
	tmp62, err := this.IsFloat()
	if err != nil {
		return 0, err
	}
	if (tmp62) {
		var tmp63 float32;
		tmp64, err := this.IsFloat32()
		if err != nil {
			return 0, err
		}
		if (tmp64) {
			tmp63 = this.Float32Value
		} else {
			tmp63 = this.Float64Value
		}
		this.floatValue = float64(tmp63)
	}
	this._f_floatValue = true
	return this.floatValue, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
 */
func (this *Msgpack) NumArrayElements() (v int, err error) {
	if (this._f_numArrayElements) {
		return this.numArrayElements, nil
	}
	tmp65, err := this.IsArray()
	if err != nil {
		return 0, err
	}
	if (tmp65) {
		var tmp66 int;
		tmp67, err := this.IsFixArray()
		if err != nil {
			return 0, err
		}
		if (tmp67) {
			tmp66 = (this.B1 & 15)
		} else {
			var tmp68 uint16;
			tmp69, err := this.IsArray16()
			if err != nil {
				return 0, err
			}
			if (tmp69) {
				tmp68 = this.NumArrayElements16
			} else {
				tmp68 = this.NumArrayElements32
			}
			tmp66 = tmp68
		}
		this.numArrayElements = int(tmp66)
	}
	this._f_numArrayElements = true
	return this.numArrayElements, nil
}
func (this *Msgpack) NegInt5Value() (v int, err error) {
	if (this._f_negInt5Value) {
		return this.negInt5Value, nil
	}
	tmp70, err := this.IsNegInt5()
	if err != nil {
		return 0, err
	}
	if (tmp70) {
		this.negInt5Value = int(-((this.B1 & 31)))
	}
	this._f_negInt5Value = true
	return this.negInt5Value, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
 */
func (this *Msgpack) BoolValue() (v bool, err error) {
	if (this._f_boolValue) {
		return this.boolValue, nil
	}
	tmp71, err := this.IsBool()
	if err != nil {
		return false, err
	}
	if (tmp71) {
		this.boolValue = bool(this.B1 == 195)
	}
	this._f_boolValue = true
	return this.boolValue, nil
}
func (this *Msgpack) IsPosInt7() (v bool, err error) {
	if (this._f_isPosInt7) {
		return this.isPosInt7, nil
	}
	this.isPosInt7 = bool((this.B1 & 128) == 0)
	this._f_isPosInt7 = true
	return this.isPosInt7, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
 */
func (this *Msgpack) IsArray16() (v bool, err error) {
	if (this._f_isArray16) {
		return this.isArray16, nil
	}
	this.isArray16 = bool(this.B1 == 220)
	this._f_isArray16 = true
	return this.isArray16, nil
}
func (this *Msgpack) IsStr() (v bool, err error) {
	if (this._f_isStr) {
		return this.isStr, nil
	}
	tmp72, err := this.IsFixStr()
	if err != nil {
		return false, err
	}
	tmp73, err := this.IsStr8()
	if err != nil {
		return false, err
	}
	tmp74, err := this.IsStr16()
	if err != nil {
		return false, err
	}
	tmp75, err := this.IsStr32()
	if err != nil {
		return false, err
	}
	this.isStr = bool( ((tmp72) || (tmp73) || (tmp74) || (tmp75)) )
	this._f_isStr = true
	return this.isStr, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
 */
func (this *Msgpack) IsFixStr() (v bool, err error) {
	if (this._f_isFixStr) {
		return this.isFixStr, nil
	}
	this.isFixStr = bool((this.B1 & 224) == 160)
	this._f_isFixStr = true
	return this.isFixStr, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
 */
func (this *Msgpack) IsStr32() (v bool, err error) {
	if (this._f_isStr32) {
		return this.isStr32, nil
	}
	this.isStr32 = bool(this.B1 == 219)
	this._f_isStr32 = true
	return this.isStr32, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
 */
func (this *Msgpack) NumMapElements() (v int, err error) {
	if (this._f_numMapElements) {
		return this.numMapElements, nil
	}
	tmp76, err := this.IsMap()
	if err != nil {
		return 0, err
	}
	if (tmp76) {
		var tmp77 int;
		tmp78, err := this.IsFixMap()
		if err != nil {
			return 0, err
		}
		if (tmp78) {
			tmp77 = (this.B1 & 15)
		} else {
			var tmp79 uint16;
			tmp80, err := this.IsMap16()
			if err != nil {
				return 0, err
			}
			if (tmp80) {
				tmp79 = this.NumMapElements16
			} else {
				tmp79 = this.NumMapElements32
			}
			tmp77 = tmp79
		}
		this.numMapElements = int(tmp77)
	}
	this._f_numMapElements = true
	return this.numMapElements, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
 */
func (this *Msgpack) IsFloat32() (v bool, err error) {
	if (this._f_isFloat32) {
		return this.isFloat32, nil
	}
	this.isFloat32 = bool(this.B1 == 202)
	this._f_isFloat32 = true
	return this.isFloat32, nil
}

/**
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
 */
func (this *Msgpack) IsMap32() (v bool, err error) {
	if (this._f_isMap32) {
		return this.isMap32, nil
	}
	this.isMap32 = bool(this.B1 == 223)
	this._f_isMap32 = true
	return this.isMap32, nil
}

/**
 * First byte is msgpack message is either a piece of data by
 * itself or determines types of further, more complex data
 * structures.
 */
type Msgpack_MapTuple struct {
	Key *Msgpack
	Value *Msgpack
	_io *kaitai.Stream
	_root *Msgpack
	_parent *Msgpack
}
func NewMsgpack_MapTuple() *Msgpack_MapTuple {
	return &Msgpack_MapTuple{
	}
}

func (this *Msgpack_MapTuple) Read(io *kaitai.Stream, parent *Msgpack, root *Msgpack) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp81 := NewMsgpack()
	err = tmp81.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Key = tmp81
	tmp82 := NewMsgpack()
	err = tmp82.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Value = tmp82
	return err
}
