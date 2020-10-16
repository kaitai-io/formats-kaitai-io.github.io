// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * BCD (Binary Coded Decimals) is a common way to encode integer
 * numbers in a way that makes human-readable output somewhat
 * simpler. In this encoding scheme, every decimal digit is encoded as
 * either a single byte (8 bits), or a nibble (half of a byte, 4
 * bits). This obviously wastes a lot of bits, but it makes translation
 * into human-readable string much easier than traditional
 * binary-to-decimal conversion process, which includes lots of
 * divisions by 10.
 * 
 * For example, encoding integer 31337 in 8-digit, 8 bits per digit,
 * big endian order of digits BCD format yields
 * 
 * ```
 * 00 00 00 03 01 03 03 07
 * ```
 * 
 * Encoding the same integer as 8-digit, 4 bits per digit, little
 * endian order BCD format would yield:
 * 
 * ```
 * 73 31 30 00
 * ```
 * 
 * Using this type of encoding in Kaitai Struct is pretty
 * straightforward: one calls for this type, specifying desired
 * encoding parameters, and gets result using either `as_int` or
 * `as_str` attributes.
 */
type Bcd struct {
	Digits []int
	NumDigits uint8
	BitsPerDigit uint8
	IsLe bool
	_io *kaitai.Stream
	_root *Bcd
	_parent interface{}
	_f_asInt bool
	asInt int
	_f_asIntLe bool
	asIntLe int
	_f_lastIdx bool
	lastIdx int
	_f_asIntBe bool
	asIntBe int
}
func NewBcd(numDigits uint8, bitsPerDigit uint8, isLe bool) *Bcd {
	return &Bcd{
		NumDigits: numDigits,
		BitsPerDigit: bitsPerDigit,
		IsLe: isLe,
	}
}

func (this *Bcd) Read(io *kaitai.Stream, parent interface{}, root *Bcd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Digits = make([]int, this.NumDigits)
	for i := range this.Digits {
		switch (this.BitsPerDigit) {
		case 4:
			tmp1, err := this._io.ReadBitsIntBe(4)
			if err != nil {
				return err
			}
			this.Digits[i] = tmp1
		case 8:
			tmp2, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.Digits[i] = tmp2
		}
	}
	return err
}

/**
 * Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
 */
func (this *Bcd) AsInt() (v int, err error) {
	if (this._f_asInt) {
		return this.asInt, nil
	}
	var tmp3 int;
	if (this.IsLe) {
		tmp4, err := this.AsIntLe()
		if err != nil {
			return 0, err
		}
		tmp3 = tmp4
	} else {
		tmp5, err := this.AsIntBe()
		if err != nil {
			return 0, err
		}
		tmp3 = tmp5
	}
	this.asInt = int(tmp3)
	this._f_asInt = true
	return this.asInt, nil
}

/**
 * Value of this BCD number as integer (treating digit order as little-endian).
 */
func (this *Bcd) AsIntLe() (v int, err error) {
	if (this._f_asIntLe) {
		return this.asIntLe, nil
	}
	var tmp6 int8;
	if (this.NumDigits < 2) {
		tmp6 = 0
	} else {
		var tmp7 int8;
		if (this.NumDigits < 3) {
			tmp7 = 0
		} else {
			var tmp8 int8;
			if (this.NumDigits < 4) {
				tmp8 = 0
			} else {
				var tmp9 int8;
				if (this.NumDigits < 5) {
					tmp9 = 0
				} else {
					var tmp10 int8;
					if (this.NumDigits < 6) {
						tmp10 = 0
					} else {
						var tmp11 int8;
						if (this.NumDigits < 7) {
							tmp11 = 0
						} else {
							var tmp12 int8;
							if (this.NumDigits < 8) {
								tmp12 = 0
							} else {
								tmp12 = (this.Digits[7] * 10000000)
							}
							tmp11 = ((this.Digits[6] * 1000000) + tmp12)
						}
						tmp10 = ((this.Digits[5] * 100000) + tmp11)
					}
					tmp9 = ((this.Digits[4] * 10000) + tmp10)
				}
				tmp8 = ((this.Digits[3] * 1000) + tmp9)
			}
			tmp7 = ((this.Digits[2] * 100) + tmp8)
		}
		tmp6 = ((this.Digits[1] * 10) + tmp7)
	}
	this.asIntLe = int((this.Digits[0] + tmp6))
	this._f_asIntLe = true
	return this.asIntLe, nil
}

/**
 * Index of last digit (0-based).
 */
func (this *Bcd) LastIdx() (v int, err error) {
	if (this._f_lastIdx) {
		return this.lastIdx, nil
	}
	this.lastIdx = int((this.NumDigits - 1))
	this._f_lastIdx = true
	return this.lastIdx, nil
}

/**
 * Value of this BCD number as integer (treating digit order as big-endian).
 */
func (this *Bcd) AsIntBe() (v int, err error) {
	if (this._f_asIntBe) {
		return this.asIntBe, nil
	}
	tmp13, err := this.LastIdx()
	if err != nil {
		return 0, err
	}
	var tmp14 int8;
	if (this.NumDigits < 2) {
		tmp14 = 0
	} else {
		tmp15, err := this.LastIdx()
		if err != nil {
			return 0, err
		}
		var tmp16 int8;
		if (this.NumDigits < 3) {
			tmp16 = 0
		} else {
			tmp17, err := this.LastIdx()
			if err != nil {
				return 0, err
			}
			var tmp18 int8;
			if (this.NumDigits < 4) {
				tmp18 = 0
			} else {
				tmp19, err := this.LastIdx()
				if err != nil {
					return 0, err
				}
				var tmp20 int8;
				if (this.NumDigits < 5) {
					tmp20 = 0
				} else {
					tmp21, err := this.LastIdx()
					if err != nil {
						return 0, err
					}
					var tmp22 int8;
					if (this.NumDigits < 6) {
						tmp22 = 0
					} else {
						tmp23, err := this.LastIdx()
						if err != nil {
							return 0, err
						}
						var tmp24 int8;
						if (this.NumDigits < 7) {
							tmp24 = 0
						} else {
							tmp25, err := this.LastIdx()
							if err != nil {
								return 0, err
							}
							var tmp26 int8;
							if (this.NumDigits < 8) {
								tmp26 = 0
							} else {
								tmp27, err := this.LastIdx()
								if err != nil {
									return 0, err
								}
								tmp26 = (this.Digits[(tmp27 - 7)] * 10000000)
							}
							tmp24 = ((this.Digits[(tmp25 - 6)] * 1000000) + tmp26)
						}
						tmp22 = ((this.Digits[(tmp23 - 5)] * 100000) + tmp24)
					}
					tmp20 = ((this.Digits[(tmp21 - 4)] * 10000) + tmp22)
				}
				tmp18 = ((this.Digits[(tmp19 - 3)] * 1000) + tmp20)
			}
			tmp16 = ((this.Digits[(tmp17 - 2)] * 100) + tmp18)
		}
		tmp14 = ((this.Digits[(tmp15 - 1)] * 10) + tmp16)
	}
	this.asIntBe = int((this.Digits[tmp13] + tmp14))
	this._f_asIntBe = true
	return this.asIntBe, nil
}
