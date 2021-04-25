// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "most significant group first", i.e. in "big-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * Standard MIDI file format
 * * ASN.1 BER encoding
 * * RAR 5.0 file format
 * 
 * More information on this encoding is available at
 * https://en.wikipedia.org/wiki/Variable-length_quantity
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */
type VlqBase128Be struct {
	Groups []*VlqBase128Be_Group
	_io *kaitai.Stream
	_root *VlqBase128Be
	_parent interface{}
	_f_last bool
	last int
	_f_value bool
	value int
}
func NewVlqBase128Be() *VlqBase128Be {
	return &VlqBase128Be{
	}
}

func (this *VlqBase128Be) Read(io *kaitai.Stream, parent interface{}, root *VlqBase128Be) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewVlqBase128Be_Group()
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
func (this *VlqBase128Be) Last() (v int, err error) {
	if (this._f_last) {
		return this.last, nil
	}
	this.last = int((len(this.Groups) - 1))
	this._f_last = true
	return this.last, nil
}

/**
 * Resulting value as normal integer
 */
func (this *VlqBase128Be) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp3, err := this.Last()
	if err != nil {
		return 0, err
	}
	tmp4, err := this.Groups[tmp3].Value()
	if err != nil {
		return 0, err
	}
	var tmp5 int;
	tmp6, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp6 >= 1) {
		tmp7, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp8, err := this.Groups[(tmp7 - 1)].Value()
		if err != nil {
			return 0, err
		}
		tmp5 = (tmp8 << 7)
	} else {
		tmp5 = 0
	}
	var tmp9 int;
	tmp10, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp10 >= 2) {
		tmp11, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp12, err := this.Groups[(tmp11 - 2)].Value()
		if err != nil {
			return 0, err
		}
		tmp9 = (tmp12 << 14)
	} else {
		tmp9 = 0
	}
	var tmp13 int;
	tmp14, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp14 >= 3) {
		tmp15, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp16, err := this.Groups[(tmp15 - 3)].Value()
		if err != nil {
			return 0, err
		}
		tmp13 = (tmp16 << 21)
	} else {
		tmp13 = 0
	}
	var tmp17 int;
	tmp18, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp18 >= 4) {
		tmp19, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp20, err := this.Groups[(tmp19 - 4)].Value()
		if err != nil {
			return 0, err
		}
		tmp17 = (tmp20 << 28)
	} else {
		tmp17 = 0
	}
	var tmp21 int;
	tmp22, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp22 >= 5) {
		tmp23, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp24, err := this.Groups[(tmp23 - 5)].Value()
		if err != nil {
			return 0, err
		}
		tmp21 = (tmp24 << 35)
	} else {
		tmp21 = 0
	}
	var tmp25 int;
	tmp26, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp26 >= 6) {
		tmp27, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp28, err := this.Groups[(tmp27 - 6)].Value()
		if err != nil {
			return 0, err
		}
		tmp25 = (tmp28 << 42)
	} else {
		tmp25 = 0
	}
	var tmp29 int;
	tmp30, err := this.Last()
	if err != nil {
		return 0, err
	}
	if (tmp30 >= 7) {
		tmp31, err := this.Last()
		if err != nil {
			return 0, err
		}
		tmp32, err := this.Groups[(tmp31 - 7)].Value()
		if err != nil {
			return 0, err
		}
		tmp29 = (tmp32 << 49)
	} else {
		tmp29 = 0
	}
	this.value = int((((((((tmp4 + tmp5) + tmp9) + tmp13) + tmp17) + tmp21) + tmp25) + tmp29))
	this._f_value = true
	return this.value, nil
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */
type VlqBase128Be_Group struct {
	B uint8
	_io *kaitai.Stream
	_root *VlqBase128Be
	_parent *VlqBase128Be
	_f_hasNext bool
	hasNext bool
	_f_value bool
	value int
}
func NewVlqBase128Be_Group() *VlqBase128Be_Group {
	return &VlqBase128Be_Group{
	}
}

func (this *VlqBase128Be_Group) Read(io *kaitai.Stream, parent *VlqBase128Be, root *VlqBase128Be) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp33
	return err
}

/**
 * If true, then we have more bytes to read
 */
func (this *VlqBase128Be_Group) HasNext() (v bool, err error) {
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
func (this *VlqBase128Be_Group) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int((this.B & 127))
	this._f_value = true
	return this.value, nil
}
