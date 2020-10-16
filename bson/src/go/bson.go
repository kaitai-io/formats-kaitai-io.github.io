// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
 *   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
 *   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
 *   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
 */
type Bson struct {
	Len int32
	Fields *Bson_ElementsList
	Terminator []byte
	_io *kaitai.Stream
	_root *Bson
	_parent interface{}
	_raw_Fields []byte
}
func NewBson() *Bson {
	return &Bson{
	}
}

func (this *Bson) Read(io *kaitai.Stream, parent interface{}, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Len = int32(tmp1)
	tmp2, err := this._io.ReadBytes(int((this.Len - 5)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Fields = tmp2
	_io__raw_Fields := kaitai.NewStream(bytes.NewReader(this._raw_Fields))
	tmp3 := NewBson_ElementsList()
	err = tmp3.Read(_io__raw_Fields, this, this._root)
	if err != nil {
		return err
	}
	this.Fields = tmp3
	tmp4, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Terminator = tmp4
	if !(bytes.Equal(this.Terminator, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Terminator, this._io, "/seq/2")
	}
	return err
}

/**
 * Total number of bytes comprising the document.
 */

/**
 * Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
 */
type Bson_Timestamp struct {
	Increment uint32
	Timestamp uint32
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
}
func NewBson_Timestamp() *Bson_Timestamp {
	return &Bson_Timestamp{
	}
}

func (this *Bson_Timestamp) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Increment = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp6)
	return err
}

/**
 * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
 */

type Bson_BinData_Subtype int
const (
	Bson_BinData_Subtype__Generic Bson_BinData_Subtype = 0
	Bson_BinData_Subtype__Function Bson_BinData_Subtype = 1
	Bson_BinData_Subtype__ByteArrayDeprecated Bson_BinData_Subtype = 2
	Bson_BinData_Subtype__UuidDeprecated Bson_BinData_Subtype = 3
	Bson_BinData_Subtype__Uuid Bson_BinData_Subtype = 4
	Bson_BinData_Subtype__Md5 Bson_BinData_Subtype = 5
	Bson_BinData_Subtype__Custom Bson_BinData_Subtype = 128
)
type Bson_BinData struct {
	Len int32
	Subtype Bson_BinData_Subtype
	Content interface{}
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
	_raw_Content []byte
}
func NewBson_BinData() *Bson_BinData {
	return &Bson_BinData{
	}
}

func (this *Bson_BinData) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Len = int32(tmp7)
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Subtype = Bson_BinData_Subtype(tmp8)
	switch (this.Subtype) {
	case Bson_BinData_Subtype__ByteArrayDeprecated:
		tmp9, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp9 = tmp9
		this._raw_Content = tmp9
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp10 := NewBson_BinData_ByteArrayDeprecated()
		err = tmp10.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp10
	default:
		tmp11, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp11 = tmp11
		this._raw_Content = tmp11
	}
	return err
}

/**
 * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
 */
type Bson_BinData_ByteArrayDeprecated struct {
	Len int32
	Content []byte
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_BinData
}
func NewBson_BinData_ByteArrayDeprecated() *Bson_BinData_ByteArrayDeprecated {
	return &Bson_BinData_ByteArrayDeprecated{
	}
}

func (this *Bson_BinData_ByteArrayDeprecated) Read(io *kaitai.Stream, parent *Bson_BinData, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Len = int32(tmp12)
	tmp13, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Content = tmp13
	return err
}
type Bson_ElementsList struct {
	Elements []*Bson_Element
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson
}
func NewBson_ElementsList() *Bson_ElementsList {
	return &Bson_ElementsList{
	}
}

func (this *Bson_ElementsList) Read(io *kaitai.Stream, parent *Bson, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp14, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp14 {
			break
		}
		tmp15 := NewBson_Element()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Elements = append(this.Elements, tmp15)
	}
	return err
}
type Bson_Cstring struct {
	Str string
	_io *kaitai.Stream
	_root *Bson
	_parent interface{}
}
func NewBson_Cstring() *Bson_Cstring {
	return &Bson_Cstring{
	}
}

func (this *Bson_Cstring) Read(io *kaitai.Stream, parent interface{}, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Str = string(tmp16)
	return err
}

/**
 * MUST NOT contain '\x00', hence it is not full UTF-8.
 */
type Bson_String struct {
	Len int32
	Str string
	Terminator []byte
	_io *kaitai.Stream
	_root *Bson
	_parent interface{}
}
func NewBson_String() *Bson_String {
	return &Bson_String{
	}
}

func (this *Bson_String) Read(io *kaitai.Stream, parent interface{}, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Len = int32(tmp17)
	tmp18, err := this._io.ReadBytes(int((this.Len - 1)))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Str = string(tmp18)
	tmp19, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Terminator = tmp19
	if !(bytes.Equal(this.Terminator, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Terminator, this._io, "/types/string/seq/2")
	}
	return err
}

type Bson_Element_BsonType int
const (
	Bson_Element_BsonType__MinKey Bson_Element_BsonType = -1
	Bson_Element_BsonType__EndOfObject Bson_Element_BsonType = 0
	Bson_Element_BsonType__NumberDouble Bson_Element_BsonType = 1
	Bson_Element_BsonType__String Bson_Element_BsonType = 2
	Bson_Element_BsonType__Document Bson_Element_BsonType = 3
	Bson_Element_BsonType__Array Bson_Element_BsonType = 4
	Bson_Element_BsonType__BinData Bson_Element_BsonType = 5
	Bson_Element_BsonType__Undefined Bson_Element_BsonType = 6
	Bson_Element_BsonType__ObjectId Bson_Element_BsonType = 7
	Bson_Element_BsonType__Boolean Bson_Element_BsonType = 8
	Bson_Element_BsonType__UtcDatetime Bson_Element_BsonType = 9
	Bson_Element_BsonType__JstNull Bson_Element_BsonType = 10
	Bson_Element_BsonType__RegEx Bson_Element_BsonType = 11
	Bson_Element_BsonType__DbPointer Bson_Element_BsonType = 12
	Bson_Element_BsonType__Javascript Bson_Element_BsonType = 13
	Bson_Element_BsonType__Symbol Bson_Element_BsonType = 14
	Bson_Element_BsonType__CodeWithScope Bson_Element_BsonType = 15
	Bson_Element_BsonType__NumberInt Bson_Element_BsonType = 16
	Bson_Element_BsonType__Timestamp Bson_Element_BsonType = 17
	Bson_Element_BsonType__NumberLong Bson_Element_BsonType = 18
	Bson_Element_BsonType__NumberDecimal Bson_Element_BsonType = 19
	Bson_Element_BsonType__MaxKey Bson_Element_BsonType = 127
)
type Bson_Element struct {
	TypeByte Bson_Element_BsonType
	Name *Bson_Cstring
	Content interface{}
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_ElementsList
}
func NewBson_Element() *Bson_Element {
	return &Bson_Element{
	}
}

func (this *Bson_Element) Read(io *kaitai.Stream, parent *Bson_ElementsList, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.TypeByte = Bson_Element_BsonType(tmp20)
	tmp21 := NewBson_Cstring()
	err = tmp21.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp21
	switch (this.TypeByte) {
	case Bson_Element_BsonType__CodeWithScope:
		tmp22 := NewBson_CodeWithScope()
		err = tmp22.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp22
	case Bson_Element_BsonType__RegEx:
		tmp23 := NewBson_RegEx()
		err = tmp23.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp23
	case Bson_Element_BsonType__NumberDouble:
		tmp24, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.Content = tmp24
	case Bson_Element_BsonType__Symbol:
		tmp25 := NewBson_String()
		err = tmp25.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp25
	case Bson_Element_BsonType__Timestamp:
		tmp26 := NewBson_Timestamp()
		err = tmp26.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp26
	case Bson_Element_BsonType__NumberInt:
		tmp27, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Content = tmp27
	case Bson_Element_BsonType__Document:
		tmp28 := NewBson()
		err = tmp28.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Content = tmp28
	case Bson_Element_BsonType__ObjectId:
		tmp29 := NewBson_ObjectId()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp29
	case Bson_Element_BsonType__Javascript:
		tmp30 := NewBson_String()
		err = tmp30.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp30
	case Bson_Element_BsonType__UtcDatetime:
		tmp31, err := this._io.ReadS8le()
		if err != nil {
			return err
		}
		this.Content = tmp31
	case Bson_Element_BsonType__Boolean:
		tmp32, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Content = tmp32
	case Bson_Element_BsonType__NumberLong:
		tmp33, err := this._io.ReadS8le()
		if err != nil {
			return err
		}
		this.Content = tmp33
	case Bson_Element_BsonType__BinData:
		tmp34 := NewBson_BinData()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp34
	case Bson_Element_BsonType__String:
		tmp35 := NewBson_String()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp35
	case Bson_Element_BsonType__DbPointer:
		tmp36 := NewBson_DbPointer()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp36
	case Bson_Element_BsonType__Array:
		tmp37 := NewBson()
		err = tmp37.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Content = tmp37
	case Bson_Element_BsonType__NumberDecimal:
		tmp38 := NewBson_F16()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp38
	}
	return err
}
type Bson_DbPointer struct {
	Namespace *Bson_String
	Id *Bson_ObjectId
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
}
func NewBson_DbPointer() *Bson_DbPointer {
	return &Bson_DbPointer{
	}
}

func (this *Bson_DbPointer) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39 := NewBson_String()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Namespace = tmp39
	tmp40 := NewBson_ObjectId()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Id = tmp40
	return err
}

/**
 * Implements unsigned 24-bit (3 byte) integer.
 */
type Bson_U3 struct {
	B1 uint8
	B2 uint8
	B3 uint8
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_ObjectId
	_f_value bool
	value int
}
func NewBson_U3() *Bson_U3 {
	return &Bson_U3{
	}
}

func (this *Bson_U3) Read(io *kaitai.Stream, parent *Bson_ObjectId, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp41
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B2 = tmp42
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B3 = tmp43
	return err
}
func (this *Bson_U3) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int(((this.B1 | (this.B2 << 8)) | (this.B3 << 16)))
	this._f_value = true
	return this.value, nil
}
type Bson_CodeWithScope struct {
	Id int32
	Source *Bson_String
	Scope *Bson
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
}
func NewBson_CodeWithScope() *Bson_CodeWithScope {
	return &Bson_CodeWithScope{
	}
}

func (this *Bson_CodeWithScope) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Id = int32(tmp44)
	tmp45 := NewBson_String()
	err = tmp45.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Source = tmp45
	tmp46 := NewBson()
	err = tmp46.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Scope = tmp46
	return err
}

/**
 * mapping from identifiers to values, representing the scope in which the string should be evaluated.
 */

/**
 * 128-bit IEEE 754-2008 decimal floating point
 */
type Bson_F16 struct {
	Str bool
	Exponent uint64
	SignificandHi uint64
	SignificandLo uint64
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
}
func NewBson_F16() *Bson_F16 {
	return &Bson_F16{
	}
}

func (this *Bson_F16) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp47, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Str = tmp47 != 0
	tmp48, err := this._io.ReadBitsIntBe(15)
	if err != nil {
		return err
	}
	this.Exponent = tmp48
	tmp49, err := this._io.ReadBitsIntBe(49)
	if err != nil {
		return err
	}
	this.SignificandHi = tmp49
	this._io.AlignToByte()
	tmp50, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.SignificandLo = uint64(tmp50)
	return err
}

/**
 * https://docs.mongodb.com/manual/reference/method/ObjectId/
 */
type Bson_ObjectId struct {
	EpochTime uint32
	MachineId *Bson_U3
	ProcessId uint16
	Counter *Bson_U3
	_io *kaitai.Stream
	_root *Bson
	_parent interface{}
}
func NewBson_ObjectId() *Bson_ObjectId {
	return &Bson_ObjectId{
	}
}

func (this *Bson_ObjectId) Read(io *kaitai.Stream, parent interface{}, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EpochTime = uint32(tmp51)
	tmp52 := NewBson_U3()
	err = tmp52.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MachineId = tmp52
	tmp53, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProcessId = uint16(tmp53)
	tmp54 := NewBson_U3()
	err = tmp54.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Counter = tmp54
	return err
}

/**
 * seconds since the Unix epoch
 */

/**
 * counter, starting with a random value.
 */
type Bson_RegEx struct {
	Pattern *Bson_Cstring
	Options *Bson_Cstring
	_io *kaitai.Stream
	_root *Bson
	_parent *Bson_Element
}
func NewBson_RegEx() *Bson_RegEx {
	return &Bson_RegEx{
	}
}

func (this *Bson_RegEx) Read(io *kaitai.Stream, parent *Bson_Element, root *Bson) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp55 := NewBson_Cstring()
	err = tmp55.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Pattern = tmp55
	tmp56 := NewBson_Cstring()
	err = tmp56.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Options = tmp56
	return err
}
