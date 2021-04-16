// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Ruby's Marshal module allows serialization and deserialization of
 * many standard and arbitrary Ruby objects in a compact binary
 * format. It is relatively fast, available in stdlibs standard and
 * allows conservation of language-specific properties (such as symbols
 * or encoding-aware strings).
 * 
 * Feature-wise, it is comparable to other language-specific
 * implementations, such as:
 * 
 * * Java's
 *   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
 * * .NET
 *   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format">Source</a>
 */

type RubyMarshal_Codes int
const (
	RubyMarshal_Codes__RubyString RubyMarshal_Codes = 34
	RubyMarshal_Codes__ConstNil RubyMarshal_Codes = 48
	RubyMarshal_Codes__RubySymbol RubyMarshal_Codes = 58
	RubyMarshal_Codes__RubySymbolLink RubyMarshal_Codes = 59
	RubyMarshal_Codes__RubyObjectLink RubyMarshal_Codes = 64
	RubyMarshal_Codes__ConstFalse RubyMarshal_Codes = 70
	RubyMarshal_Codes__InstanceVar RubyMarshal_Codes = 73
	RubyMarshal_Codes__RubyStruct RubyMarshal_Codes = 83
	RubyMarshal_Codes__ConstTrue RubyMarshal_Codes = 84
	RubyMarshal_Codes__RubyArray RubyMarshal_Codes = 91
	RubyMarshal_Codes__PackedInt RubyMarshal_Codes = 105
	RubyMarshal_Codes__Bignum RubyMarshal_Codes = 108
	RubyMarshal_Codes__RubyHash RubyMarshal_Codes = 123
)
type RubyMarshal struct {
	Version []byte
	Records *RubyMarshal_Record
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent interface{}
}
func NewRubyMarshal() *RubyMarshal {
	return &RubyMarshal{
	}
}

func (this *RubyMarshal) Read(io *kaitai.Stream, parent interface{}, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Version = tmp1
	if !(bytes.Equal(this.Version, []uint8{4, 8})) {
		return kaitai.NewValidationNotEqualError([]uint8{4, 8}, this.Version, this._io, "/seq/0")
	}
	tmp2 := NewRubyMarshal_Record()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Records = tmp2
	return err
}
type RubyMarshal_RubyArray struct {
	NumElements *RubyMarshal_PackedInt
	Elements []*RubyMarshal_Record
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_RubyArray() *RubyMarshal_RubyArray {
	return &RubyMarshal_RubyArray{
	}
}

func (this *RubyMarshal_RubyArray) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewRubyMarshal_PackedInt()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.NumElements = tmp3
	tmp4, err := this.NumElements.Value()
	if err != nil {
		return err
	}
	this.Elements = make([]*RubyMarshal_Record, tmp4)
	for i := range this.Elements {
		tmp5 := NewRubyMarshal_Record()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Elements[i] = tmp5
	}
	return err
}

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum">Source</a>
 */
type RubyMarshal_Bignum struct {
	Sign uint8
	LenDiv2 *RubyMarshal_PackedInt
	Body []byte
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_Bignum() *RubyMarshal_Bignum {
	return &RubyMarshal_Bignum{
	}
}

func (this *RubyMarshal_Bignum) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Sign = tmp6
	tmp7 := NewRubyMarshal_PackedInt()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LenDiv2 = tmp7
	tmp8, err := this.LenDiv2.Value()
	if err != nil {
		return err
	}
	tmp9, err := this._io.ReadBytes(int((tmp8 * 2)))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Body = tmp9
	return err
}

/**
 * A single byte containing `+` for a positive value or `-` for a negative value.
 */

/**
 * Length of bignum body, divided by 2.
 */

/**
 * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
 */

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct">Source</a>
 */
type RubyMarshal_RubyStruct struct {
	Name *RubyMarshal_Record
	NumMembers *RubyMarshal_PackedInt
	Members []*RubyMarshal_Pair
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_RubyStruct() *RubyMarshal_RubyStruct {
	return &RubyMarshal_RubyStruct{
	}
}

func (this *RubyMarshal_RubyStruct) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10 := NewRubyMarshal_Record()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp10
	tmp11 := NewRubyMarshal_PackedInt()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.NumMembers = tmp11
	tmp12, err := this.NumMembers.Value()
	if err != nil {
		return err
	}
	this.Members = make([]*RubyMarshal_Pair, tmp12)
	for i := range this.Members {
		tmp13 := NewRubyMarshal_Pair()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Members[i] = tmp13
	}
	return err
}

/**
 * Symbol containing the name of the struct.
 */

/**
 * Number of members in a struct
 */

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence">Source</a>
 */
type RubyMarshal_RubySymbol struct {
	Len *RubyMarshal_PackedInt
	Name string
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_RubySymbol() *RubyMarshal_RubySymbol {
	return &RubyMarshal_RubySymbol{
	}
}

func (this *RubyMarshal_RubySymbol) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewRubyMarshal_PackedInt()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Len = tmp14
	tmp15, err := this.Len.Value()
	if err != nil {
		return err
	}
	tmp16, err := this._io.ReadBytes(int(tmp15))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Name = string(tmp16)
	return err
}

/**
 * Ruby uses sophisticated system to pack integers: first `code`
 * byte either determines packing scheme or carries encoded
 * immediate value (thus allowing smaller values from -123 to 122
 * (inclusive) to take only one byte. There are 11 encoding schemes
 * in total:
 * 
 * * 0 is encoded specially (as 0)
 * * 1..122 are encoded as immediate value with a shift
 * * 123..255 are encoded with code of 0x01 and 1 extra byte
 * * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
 * * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
 *   bytes
 * * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
 *   extra bytes
 * * -123..-1 are encoded as immediate value with another shift
 * * -256..-124 are encoded with code of 0xff and 1 extra byte
 * * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
 * * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
 *    bytes
 * * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
 *    extra bytes
 * 
 * Values beyond that are serialized as bignum (even if they
 * technically might be not Bignum class in Ruby implementation,
 * i.e. if they fit into 64 bits on a 64-bit platform).
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long">Source</a>
 */
type RubyMarshal_PackedInt struct {
	Code uint8
	Encoded uint32
	Encoded2 uint8
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent interface{}
	_f_isImmediate bool
	isImmediate bool
	_f_value bool
	value int
}
func NewRubyMarshal_PackedInt() *RubyMarshal_PackedInt {
	return &RubyMarshal_PackedInt{
	}
}

func (this *RubyMarshal_PackedInt) Read(io *kaitai.Stream, parent interface{}, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = tmp17
	switch (this.Code) {
	case 4:
		tmp18, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp18)
	case 1:
		tmp19, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp19)
	case 252:
		tmp20, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp20)
	case 253:
		tmp21, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp21)
	case 3:
		tmp22, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp22)
	case 2:
		tmp23, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp23)
	case 255:
		tmp24, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp24)
	case 254:
		tmp25, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Encoded = uint32(tmp25)
	}
	switch (this.Code) {
	case 3:
		tmp26, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Encoded2 = tmp26
	case 253:
		tmp27, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Encoded2 = tmp27
	}
	return err
}
func (this *RubyMarshal_PackedInt) IsImmediate() (v bool, err error) {
	if (this._f_isImmediate) {
		return this.isImmediate, nil
	}
	this.isImmediate = bool( ((this.Code > 4) && (this.Code < 252)) )
	this._f_isImmediate = true
	return this.isImmediate, nil
}
func (this *RubyMarshal_PackedInt) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	var tmp28 int;
	tmp29, err := this.IsImmediate()
	if err != nil {
		return 0, err
	}
	if (tmp29) {
		var tmp30 int;
		if (this.Code < 128) {
			tmp30 = (this.Code - 5)
		} else {
			tmp30 = (4 - (^(this.Code) & 127))
		}
		tmp28 = tmp30
	} else {
		var tmp31 int8;
		if (this.Code == 0) {
			tmp31 = 0
		} else {
			var tmp32 int;
			if (this.Code == 255) {
				tmp32 = (this.Encoded - 256)
			} else {
				var tmp33 int;
				if (this.Code == 254) {
					tmp33 = (this.Encoded - 65536)
				} else {
					var tmp34 int;
					if (this.Code == 253) {
						tmp34 = (((this.Encoded2 << 16) | this.Encoded) - 16777216)
					} else {
						var tmp35 int;
						if (this.Code == 3) {
							tmp35 = ((this.Encoded2 << 16) | this.Encoded)
						} else {
							tmp35 = this.Encoded
						}
						tmp34 = tmp35
					}
					tmp33 = tmp34
				}
				tmp32 = tmp33
			}
			tmp31 = tmp32
		}
		tmp28 = tmp31
	}
	this.value = int(tmp28)
	this._f_value = true
	return this.value, nil
}

/**
 * One extra byte for 3-byte integers (0x03 and 0xfd), as
 * there is no standard `u3` type in KS.
 */
type RubyMarshal_Pair struct {
	Key *RubyMarshal_Record
	Value *RubyMarshal_Record
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent interface{}
}
func NewRubyMarshal_Pair() *RubyMarshal_Pair {
	return &RubyMarshal_Pair{
	}
}

func (this *RubyMarshal_Pair) Read(io *kaitai.Stream, parent interface{}, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36 := NewRubyMarshal_Record()
	err = tmp36.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Key = tmp36
	tmp37 := NewRubyMarshal_Record()
	err = tmp37.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Value = tmp37
	return err
}

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables">Source</a>
 */
type RubyMarshal_InstanceVar struct {
	Obj *RubyMarshal_Record
	NumVars *RubyMarshal_PackedInt
	Vars []*RubyMarshal_Pair
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_InstanceVar() *RubyMarshal_InstanceVar {
	return &RubyMarshal_InstanceVar{
	}
}

func (this *RubyMarshal_InstanceVar) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38 := NewRubyMarshal_Record()
	err = tmp38.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Obj = tmp38
	tmp39 := NewRubyMarshal_PackedInt()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.NumVars = tmp39
	tmp40, err := this.NumVars.Value()
	if err != nil {
		return err
	}
	this.Vars = make([]*RubyMarshal_Pair, tmp40)
	for i := range this.Vars {
		tmp41 := NewRubyMarshal_Pair()
		err = tmp41.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vars[i] = tmp41
	}
	return err
}

/**
 * Each record starts with a single byte that determines its type
 * (`code`) and contents. If necessary, additional info as parsed
 * as `body`, to be determined by `code`.
 */
type RubyMarshal_Record struct {
	Code RubyMarshal_Codes
	Body interface{}
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent interface{}
}
func NewRubyMarshal_Record() *RubyMarshal_Record {
	return &RubyMarshal_Record{
	}
}

func (this *RubyMarshal_Record) Read(io *kaitai.Stream, parent interface{}, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = RubyMarshal_Codes(tmp42)
	switch (this.Code) {
	case RubyMarshal_Codes__PackedInt:
		tmp43 := NewRubyMarshal_PackedInt()
		err = tmp43.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp43
	case RubyMarshal_Codes__Bignum:
		tmp44 := NewRubyMarshal_Bignum()
		err = tmp44.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp44
	case RubyMarshal_Codes__RubyArray:
		tmp45 := NewRubyMarshal_RubyArray()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp45
	case RubyMarshal_Codes__RubySymbolLink:
		tmp46 := NewRubyMarshal_PackedInt()
		err = tmp46.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp46
	case RubyMarshal_Codes__RubyStruct:
		tmp47 := NewRubyMarshal_RubyStruct()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	case RubyMarshal_Codes__RubyString:
		tmp48 := NewRubyMarshal_RubyString()
		err = tmp48.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp48
	case RubyMarshal_Codes__InstanceVar:
		tmp49 := NewRubyMarshal_InstanceVar()
		err = tmp49.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp49
	case RubyMarshal_Codes__RubyHash:
		tmp50 := NewRubyMarshal_RubyHash()
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp50
	case RubyMarshal_Codes__RubySymbol:
		tmp51 := NewRubyMarshal_RubySymbol()
		err = tmp51.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp51
	case RubyMarshal_Codes__RubyObjectLink:
		tmp52 := NewRubyMarshal_PackedInt()
		err = tmp52.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp52
	}
	return err
}

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value">Source</a>
 */
type RubyMarshal_RubyHash struct {
	NumPairs *RubyMarshal_PackedInt
	Pairs []*RubyMarshal_Pair
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_RubyHash() *RubyMarshal_RubyHash {
	return &RubyMarshal_RubyHash{
	}
}

func (this *RubyMarshal_RubyHash) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp53 := NewRubyMarshal_PackedInt()
	err = tmp53.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.NumPairs = tmp53
	tmp54, err := this.NumPairs.Value()
	if err != nil {
		return err
	}
	this.Pairs = make([]*RubyMarshal_Pair, tmp54)
	for i := range this.Pairs {
		tmp55 := NewRubyMarshal_Pair()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Pairs[i] = tmp55
	}
	return err
}

/**
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String">Source</a>
 */
type RubyMarshal_RubyString struct {
	Len *RubyMarshal_PackedInt
	Body []byte
	_io *kaitai.Stream
	_root *RubyMarshal
	_parent *RubyMarshal_Record
}
func NewRubyMarshal_RubyString() *RubyMarshal_RubyString {
	return &RubyMarshal_RubyString{
	}
}

func (this *RubyMarshal_RubyString) Read(io *kaitai.Stream, parent *RubyMarshal_Record, root *RubyMarshal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp56 := NewRubyMarshal_PackedInt()
	err = tmp56.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Len = tmp56
	tmp57, err := this.Len.Value()
	if err != nil {
		return err
	}
	tmp58, err := this._io.ReadBytes(int(tmp57))
	if err != nil {
		return err
	}
	tmp58 = tmp58
	this.Body = tmp58
	return err
}
