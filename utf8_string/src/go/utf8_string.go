// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * UTF-8 is a popular character encoding scheme that allows to
 * represent strings as sequence of code points defined in Unicode
 * standard. Its features are:
 * 
 * * variable width (i.e. one code point might be represented by 1 to 4
 *   bytes)
 * * backward compatiblity with ASCII
 * * basic validity checking (and thus distinguishing from other legacy
 *   8-bit encodings)
 * * maintaining sort order of codepoints if sorted as a byte array
 * 
 * WARNING: For the vast majority of practical purposes of format
 * definitions in Kaitai Struct, you'd likely NOT want to use this and
 * rather just use `type: str` with `encoding: utf-8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
 */
type Utf8String struct {
	Codepoints []*Utf8String_Utf8Codepoint
	_io *kaitai.Stream
	_root *Utf8String
	_parent interface{}
}
func NewUtf8String() *Utf8String {
	return &Utf8String{
	}
}

func (this *Utf8String) Read(io *kaitai.Stream, parent interface{}, root *Utf8String) (err error) {
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
		tmp2 := NewUtf8String_Utf8Codepoint()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Codepoints = append(this.Codepoints, tmp2)
	}
	return err
}
type Utf8String_Utf8Codepoint struct {
	Byte1 uint8
	Byte2 uint8
	Byte3 uint8
	Byte4 uint8
	_io *kaitai.Stream
	_root *Utf8String
	_parent *Utf8String
	_f_raw1 bool
	raw1 int
	_f_raw4 bool
	raw4 int
	_f_raw3 bool
	raw3 int
	_f_valueAsInt bool
	valueAsInt int
	_f_raw2 bool
	raw2 int
	_f_len bool
	len int
}
func NewUtf8String_Utf8Codepoint() *Utf8String_Utf8Codepoint {
	return &Utf8String_Utf8Codepoint{
	}
}

func (this *Utf8String_Utf8Codepoint) Read(io *kaitai.Stream, parent *Utf8String, root *Utf8String) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Byte1 = tmp3
	tmp4, err := this.Len()
	if err != nil {
		return err
	}
	if (tmp4 >= 2) {
		tmp5, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Byte2 = tmp5
	}
	tmp6, err := this.Len()
	if err != nil {
		return err
	}
	if (tmp6 >= 3) {
		tmp7, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Byte3 = tmp7
	}
	tmp8, err := this.Len()
	if err != nil {
		return err
	}
	if (tmp8 >= 4) {
		tmp9, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Byte4 = tmp9
	}
	return err
}
func (this *Utf8String_Utf8Codepoint) Raw1() (v int, err error) {
	if (this._f_raw1) {
		return this.raw1, nil
	}
	var tmp10 int8;
	tmp11, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp11 == 1) {
		tmp10 = 127
	} else {
		var tmp12 int8;
		tmp13, err := this.Len()
		if err != nil {
			return 0, err
		}
		if (tmp13 == 2) {
			tmp12 = 31
		} else {
			var tmp14 int8;
			tmp15, err := this.Len()
			if err != nil {
				return 0, err
			}
			if (tmp15 == 3) {
				tmp14 = 15
			} else {
				var tmp16 int8;
				tmp17, err := this.Len()
				if err != nil {
					return 0, err
				}
				if (tmp17 == 4) {
					tmp16 = 7
				} else {
					tmp16 = 0
				}
				tmp14 = tmp16
			}
			tmp12 = tmp14
		}
		tmp10 = tmp12
	}
	this.raw1 = int((this.Byte1 & tmp10))
	this._f_raw1 = true
	return this.raw1, nil
}
func (this *Utf8String_Utf8Codepoint) Raw4() (v int, err error) {
	if (this._f_raw4) {
		return this.raw4, nil
	}
	tmp18, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp18 >= 4) {
		this.raw4 = int((this.Byte4 & 63))
	}
	this._f_raw4 = true
	return this.raw4, nil
}
func (this *Utf8String_Utf8Codepoint) Raw3() (v int, err error) {
	if (this._f_raw3) {
		return this.raw3, nil
	}
	tmp19, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp19 >= 3) {
		this.raw3 = int((this.Byte3 & 63))
	}
	this._f_raw3 = true
	return this.raw3, nil
}
func (this *Utf8String_Utf8Codepoint) ValueAsInt() (v int, err error) {
	if (this._f_valueAsInt) {
		return this.valueAsInt, nil
	}
	var tmp20 int;
	tmp21, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp21 == 1) {
		tmp22, err := this.Raw1()
		if err != nil {
			return 0, err
		}
		tmp20 = tmp22
	} else {
		var tmp23 int;
		tmp24, err := this.Len()
		if err != nil {
			return 0, err
		}
		if (tmp24 == 2) {
			tmp25, err := this.Raw1()
			if err != nil {
				return 0, err
			}
			tmp26, err := this.Raw2()
			if err != nil {
				return 0, err
			}
			tmp23 = ((tmp25 << 6) | tmp26)
		} else {
			var tmp27 int;
			tmp28, err := this.Len()
			if err != nil {
				return 0, err
			}
			if (tmp28 == 3) {
				tmp29, err := this.Raw1()
				if err != nil {
					return 0, err
				}
				tmp30, err := this.Raw2()
				if err != nil {
					return 0, err
				}
				tmp31, err := this.Raw3()
				if err != nil {
					return 0, err
				}
				tmp27 = (((tmp29 << 12) | (tmp30 << 6)) | tmp31)
			} else {
				var tmp32 int;
				tmp33, err := this.Len()
				if err != nil {
					return 0, err
				}
				if (tmp33 == 4) {
					tmp34, err := this.Raw1()
					if err != nil {
						return 0, err
					}
					tmp35, err := this.Raw2()
					if err != nil {
						return 0, err
					}
					tmp36, err := this.Raw3()
					if err != nil {
						return 0, err
					}
					tmp37, err := this.Raw4()
					if err != nil {
						return 0, err
					}
					tmp32 = ((((tmp34 << 18) | (tmp35 << 12)) | (tmp36 << 6)) | tmp37)
				} else {
					tmp32 = -1
				}
				tmp27 = tmp32
			}
			tmp23 = tmp27
		}
		tmp20 = tmp23
	}
	this.valueAsInt = int(tmp20)
	this._f_valueAsInt = true
	return this.valueAsInt, nil
}
func (this *Utf8String_Utf8Codepoint) Raw2() (v int, err error) {
	if (this._f_raw2) {
		return this.raw2, nil
	}
	tmp38, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp38 >= 2) {
		this.raw2 = int((this.Byte2 & 63))
	}
	this._f_raw2 = true
	return this.raw2, nil
}
func (this *Utf8String_Utf8Codepoint) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	var tmp39 int8;
	if ((this.Byte1 & 128) == 0) {
		tmp39 = 1
	} else {
		var tmp40 int8;
		if ((this.Byte1 & 224) == 192) {
			tmp40 = 2
		} else {
			var tmp41 int8;
			if ((this.Byte1 & 240) == 224) {
				tmp41 = 3
			} else {
				var tmp42 int8;
				if ((this.Byte1 & 248) == 240) {
					tmp42 = 4
				} else {
					tmp42 = -1
				}
				tmp41 = tmp42
			}
			tmp40 = tmp41
		}
		tmp39 = tmp40
	}
	this.len = int(tmp39)
	this._f_len = true
	return this.len, nil
}
