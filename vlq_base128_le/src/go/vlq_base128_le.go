// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   http://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   https://developers.google.com/protocol-buffers/docs/encoding?csw=1#varints
 * * Apache Lucene, where it's called "VInt"
 *   https://lucene.apache.org/core/3_5_0/fileformats.html#VInt
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   https://avro.apache.org/docs/current/spec.html#binary_encode_primitive
 * 
 * More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */
type VlqBase128Le struct {
	Groups []*VlqBase128Le_Group
	_io *kaitai.Stream
	_root *VlqBase128Le
	_parent interface{}
	_f_len bool
	len int
	_f_value bool
	value int
	_f_signBit bool
	signBit int
	_f_valueSigned bool
	valueSigned int
}
func NewVlqBase128Le() *VlqBase128Le {
	return &VlqBase128Le{
	}
}

func (this *VlqBase128Le) Read(io *kaitai.Stream, parent interface{}, root *VlqBase128Le) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewVlqBase128Le_Group()
		err = tmp1.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp1
		this.Groups = append(this.Groups, _it)
		tmp2, err := _it.HasNext()
		if err != nil {
			return err
		}
		if !(tmp2) {
			break
		}
	}
	return err
}
func (this *VlqBase128Le) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	this.len = int(len(this.Groups))
	this._f_len = true
	return this.len, nil
}

/**
 * Resulting unsigned value as normal integer
 */
func (this *VlqBase128Le) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp3, err := this.Groups[0].Value()
	if err != nil {
		return 0, err
	}
	var tmp4 int;
	tmp5, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp5 >= 2) {
		tmp6, err := this.Groups[1].Value()
		if err != nil {
			return 0, err
		}
		tmp4 = (tmp6 << 7)
	} else {
		tmp4 = 0
	}
	var tmp7 int;
	tmp8, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp8 >= 3) {
		tmp9, err := this.Groups[2].Value()
		if err != nil {
			return 0, err
		}
		tmp7 = (tmp9 << 14)
	} else {
		tmp7 = 0
	}
	var tmp10 int;
	tmp11, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp11 >= 4) {
		tmp12, err := this.Groups[3].Value()
		if err != nil {
			return 0, err
		}
		tmp10 = (tmp12 << 21)
	} else {
		tmp10 = 0
	}
	var tmp13 int;
	tmp14, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp14 >= 5) {
		tmp15, err := this.Groups[4].Value()
		if err != nil {
			return 0, err
		}
		tmp13 = (tmp15 << 28)
	} else {
		tmp13 = 0
	}
	var tmp16 int;
	tmp17, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp17 >= 6) {
		tmp18, err := this.Groups[5].Value()
		if err != nil {
			return 0, err
		}
		tmp16 = (tmp18 << 35)
	} else {
		tmp16 = 0
	}
	var tmp19 int;
	tmp20, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp20 >= 7) {
		tmp21, err := this.Groups[6].Value()
		if err != nil {
			return 0, err
		}
		tmp19 = (tmp21 << 42)
	} else {
		tmp19 = 0
	}
	var tmp22 int;
	tmp23, err := this.Len()
	if err != nil {
		return 0, err
	}
	if (tmp23 >= 8) {
		tmp24, err := this.Groups[7].Value()
		if err != nil {
			return 0, err
		}
		tmp22 = (tmp24 << 49)
	} else {
		tmp22 = 0
	}
	this.value = int((((((((tmp3 + tmp4) + tmp7) + tmp10) + tmp13) + tmp16) + tmp19) + tmp22))
	this._f_value = true
	return this.value, nil
}
func (this *VlqBase128Le) SignBit() (v int, err error) {
	if (this._f_signBit) {
		return this.signBit, nil
	}
	tmp25, err := this.Len()
	if err != nil {
		return 0, err
	}
	this.signBit = int((1 << ((7 * tmp25) - 1)))
	this._f_signBit = true
	return this.signBit, nil
}

/**
 * @see <a href="https://graphics.stanford.edu/~seander/bithacks.html#VariableSignExtend">Source</a>
 */
func (this *VlqBase128Le) ValueSigned() (v int, err error) {
	if (this._f_valueSigned) {
		return this.valueSigned, nil
	}
	tmp26, err := this.Value()
	if err != nil {
		return 0, err
	}
	tmp27, err := this.SignBit()
	if err != nil {
		return 0, err
	}
	tmp28, err := this.SignBit()
	if err != nil {
		return 0, err
	}
	this.valueSigned = int(((tmp26 ^ tmp27) - tmp28))
	this._f_valueSigned = true
	return this.valueSigned, nil
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */
type VlqBase128Le_Group struct {
	B uint8
	_io *kaitai.Stream
	_root *VlqBase128Le
	_parent *VlqBase128Le
	_f_hasNext bool
	hasNext bool
	_f_value bool
	value int
}
func NewVlqBase128Le_Group() *VlqBase128Le_Group {
	return &VlqBase128Le_Group{
	}
}

func (this *VlqBase128Le_Group) Read(io *kaitai.Stream, parent *VlqBase128Le, root *VlqBase128Le) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp29
	return err
}

/**
 * If true, then we have more bytes to read
 */
func (this *VlqBase128Le_Group) HasNext() (v bool, err error) {
	if (this._f_hasNext) {
		return this.hasNext, nil
	}
	this.hasNext = bool((this.B & 128) != 0)
	this._f_hasNext = true
	return this.hasNext, nil
}

/**
 * The 7-bit (base128) numeric value chunk of this group
 */
func (this *VlqBase128Le_Group) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int((this.B & 127))
	this._f_value = true
	return this.value, nil
}
