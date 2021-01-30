// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


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
		tmp3, err := this._io.Pos()
		if err != nil {
			return err
		}
		tmp2 := NewUtf8String_Utf8Codepoint(tmp3)
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Codepoints = append(this.Codepoints, tmp2)
	}
	return err
}
type Utf8String_Utf8Codepoint struct {
	Bytes []byte
	Ofs uint64
	_io *kaitai.Stream
	_root *Utf8String
	_parent *Utf8String
	_f_raw1 bool
	raw1 int
	_f_lenBytes bool
	lenBytes int
	_f_raw3 bool
	raw3 int
	_f_valueAsInt bool
	valueAsInt int
	_f_raw0 bool
	raw0 int
	_f_byte0 bool
	byte0 uint8
	_f_raw2 bool
	raw2 int
}
func NewUtf8String_Utf8Codepoint(ofs uint64) *Utf8String_Utf8Codepoint {
	return &Utf8String_Utf8Codepoint{
		Ofs: ofs,
	}
}

func (this *Utf8String_Utf8Codepoint) Read(io *kaitai.Stream, parent *Utf8String, root *Utf8String) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this.LenBytes()
	if err != nil {
		return err
	}
	tmp5, err := this._io.ReadBytes(int(tmp4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Bytes = tmp5
	return err
}
func (this *Utf8String_Utf8Codepoint) Raw1() (v int, err error) {
	if (this._f_raw1) {
		return this.raw1, nil
	}
	tmp6, err := this.LenBytes()
	if err != nil {
		return 0, err
	}
	if (tmp6 >= 2) {
		this.raw1 = int((this.Bytes[1] & 63))
	}
	this._f_raw1 = true
	return this.raw1, nil
}
func (this *Utf8String_Utf8Codepoint) LenBytes() (v int, err error) {
	if (this._f_lenBytes) {
		return this.lenBytes, nil
	}
	var tmp7 int8;
	tmp8, err := this.Byte0()
	if err != nil {
		return 0, err
	}
	if ((tmp8 & 128) == 0) {
		tmp7 = 1
	} else {
		var tmp9 int8;
		tmp10, err := this.Byte0()
		if err != nil {
			return 0, err
		}
		if ((tmp10 & 224) == 192) {
			tmp9 = 2
		} else {
			var tmp11 int8;
			tmp12, err := this.Byte0()
			if err != nil {
				return 0, err
			}
			if ((tmp12 & 240) == 224) {
				tmp11 = 3
			} else {
				var tmp13 int8;
				tmp14, err := this.Byte0()
				if err != nil {
					return 0, err
				}
				if ((tmp14 & 248) == 240) {
					tmp13 = 4
				} else {
					tmp13 = -1
				}
				tmp11 = tmp13
			}
			tmp9 = tmp11
		}
		tmp7 = tmp9
	}
	this.lenBytes = int(tmp7)
	this._f_lenBytes = true
	return this.lenBytes, nil
}
func (this *Utf8String_Utf8Codepoint) Raw3() (v int, err error) {
	if (this._f_raw3) {
		return this.raw3, nil
	}
	tmp15, err := this.LenBytes()
	if err != nil {
		return 0, err
	}
	if (tmp15 >= 4) {
		this.raw3 = int((this.Bytes[3] & 63))
	}
	this._f_raw3 = true
	return this.raw3, nil
}
func (this *Utf8String_Utf8Codepoint) ValueAsInt() (v int, err error) {
	if (this._f_valueAsInt) {
		return this.valueAsInt, nil
	}
	var tmp16 int;
	tmp17, err := this.LenBytes()
	if err != nil {
		return 0, err
	}
	if (tmp17 == 1) {
		tmp18, err := this.Raw0()
		if err != nil {
			return 0, err
		}
		tmp16 = tmp18
	} else {
		var tmp19 int;
		tmp20, err := this.LenBytes()
		if err != nil {
			return 0, err
		}
		if (tmp20 == 2) {
			tmp21, err := this.Raw0()
			if err != nil {
				return 0, err
			}
			tmp22, err := this.Raw1()
			if err != nil {
				return 0, err
			}
			tmp19 = ((tmp21 << 6) | tmp22)
		} else {
			var tmp23 int;
			tmp24, err := this.LenBytes()
			if err != nil {
				return 0, err
			}
			if (tmp24 == 3) {
				tmp25, err := this.Raw0()
				if err != nil {
					return 0, err
				}
				tmp26, err := this.Raw1()
				if err != nil {
					return 0, err
				}
				tmp27, err := this.Raw2()
				if err != nil {
					return 0, err
				}
				tmp23 = (((tmp25 << 12) | (tmp26 << 6)) | tmp27)
			} else {
				var tmp28 int;
				tmp29, err := this.LenBytes()
				if err != nil {
					return 0, err
				}
				if (tmp29 == 4) {
					tmp30, err := this.Raw0()
					if err != nil {
						return 0, err
					}
					tmp31, err := this.Raw1()
					if err != nil {
						return 0, err
					}
					tmp32, err := this.Raw2()
					if err != nil {
						return 0, err
					}
					tmp33, err := this.Raw3()
					if err != nil {
						return 0, err
					}
					tmp28 = ((((tmp30 << 18) | (tmp31 << 12)) | (tmp32 << 6)) | tmp33)
				} else {
					tmp28 = -1
				}
				tmp23 = tmp28
			}
			tmp19 = tmp23
		}
		tmp16 = tmp19
	}
	this.valueAsInt = int(tmp16)
	this._f_valueAsInt = true
	return this.valueAsInt, nil
}
func (this *Utf8String_Utf8Codepoint) Raw0() (v int, err error) {
	if (this._f_raw0) {
		return this.raw0, nil
	}
	var tmp34 int8;
	tmp35, err := this.LenBytes()
	if err != nil {
		return 0, err
	}
	if (tmp35 == 1) {
		tmp34 = 127
	} else {
		var tmp36 int8;
		tmp37, err := this.LenBytes()
		if err != nil {
			return 0, err
		}
		if (tmp37 == 2) {
			tmp36 = 31
		} else {
			var tmp38 int8;
			tmp39, err := this.LenBytes()
			if err != nil {
				return 0, err
			}
			if (tmp39 == 3) {
				tmp38 = 15
			} else {
				var tmp40 int8;
				tmp41, err := this.LenBytes()
				if err != nil {
					return 0, err
				}
				if (tmp41 == 4) {
					tmp40 = 7
				} else {
					tmp40 = 0
				}
				tmp38 = tmp40
			}
			tmp36 = tmp38
		}
		tmp34 = tmp36
	}
	this.raw0 = int((this.Bytes[0] & tmp34))
	this._f_raw0 = true
	return this.raw0, nil
}
func (this *Utf8String_Utf8Codepoint) Byte0() (v uint8, err error) {
	if (this._f_byte0) {
		return this.byte0, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(this.Ofs), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return 0, err
	}
	this.byte0 = tmp42
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_byte0 = true
	this._f_byte0 = true
	return this.byte0, nil
}
func (this *Utf8String_Utf8Codepoint) Raw2() (v int, err error) {
	if (this._f_raw2) {
		return this.raw2, nil
	}
	tmp43, err := this.LenBytes()
	if err != nil {
		return 0, err
	}
	if (tmp43 >= 3) {
		this.raw2 = int((this.Bytes[2] & 63))
	}
	this._f_raw2 = true
	return this.raw2, nil
}
