// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6ee003b094bf4fc570832f90190260d795b/src/rsrcfork/compress/common.py">Source</a>
 */
type DcmpVariableLengthInteger struct {
	First uint8
	More int32
	_io *kaitai.Stream
	_root *DcmpVariableLengthInteger
	_parent interface{}
	_f_value bool
	value int
}
func NewDcmpVariableLengthInteger() *DcmpVariableLengthInteger {
	return &DcmpVariableLengthInteger{
	}
}

func (this *DcmpVariableLengthInteger) Read(io *kaitai.Stream, parent interface{}, root *DcmpVariableLengthInteger) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.First = tmp1
	if (this.First >= 128) {
		switch (this.First) {
		case 255:
			tmp2, err := this._io.ReadS4be()
			if err != nil {
				return err
			}
			this.More = int32(tmp2)
		default:
			tmp3, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.More = int32(tmp3)
		}
	}
	return err
}

/**
 * The decoded value of the variable-length integer.
 */
func (this *DcmpVariableLengthInteger) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	var tmp4 int32;
	if (this.First == 255) {
		tmp4 = this.More
	} else {
		var tmp5 int;
		if (this.First >= 128) {
			tmp5 = (((this.First << 8) | this.More) - 49152)
		} else {
			tmp5 = this.First
		}
		tmp4 = tmp5
	}
	this.value = int(tmp4)
	this._f_value = true
	return this.value, nil
}

/**
 * The first byte of the variable-length integer.
 * This determines which storage format is used.
 * 
 * * For the 1-byte format,
 *   this encodes the entire value of the value.
 * * For the 2-byte format,
 *   this encodes the high 7 bits of the value,
 *   minus `0xc0`.
 *   The highest bit of the value,
 *   i. e. the second-highest bit of this field,
 *   is the sign bit.
 * * For the 5-byte format,
 *   this is always `0xff`.
 */

/**
 * The remaining bytes of the variable-length integer.
 * 
 * * For the 1-byte format,
 *   this is not present.
 * * For the 2-byte format,
 *   this encodes the low 8 bits of the value.
 * * For the 5-byte format,
 *   this encodes the entire value.
 */
