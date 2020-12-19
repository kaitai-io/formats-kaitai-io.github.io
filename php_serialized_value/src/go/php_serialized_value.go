// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"strconv"
)


/**
 * A serialized PHP value, in the format used by PHP's built-in `serialize` and
 * `unserialize` functions. This format closely mirrors PHP's data model:
 * it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
 * associative arrays, objects, and recursive data structures using references.
 * The only PHP values not supported by this format are *resources*,
 * which usually correspond to native file or connection handles and cannot be
 * meaningfully serialized.
 * 
 * There is no official documentation for this data format;
 * this spec was created based on the PHP source code and the behavior of
 * `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
 * serialized data between PHP versions, but in practice, the format has
 * remained fully backwards-compatible - values serialized by an older
 * PHP version can be unserialized on any newer PHP version.
 * This spec supports serialized values from PHP 7.3 or any earlier version.
 * @see <a href="https://www.php.net/manual/en/function.serialize.php">Source</a>
 * @see <a href="https://www.php.net/manual/en/function.serialize.php#66147">Source</a>
 * @see <a href="https://www.php.net/manual/en/function.unserialize.php">Source</a>
 * @see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re">Source</a>
 * @see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822">Source</a>
 */

type PhpSerializedValue_ValueType int
const (
	PhpSerializedValue_ValueType__CustomSerializedObject PhpSerializedValue_ValueType = 67
	PhpSerializedValue_ValueType__Null PhpSerializedValue_ValueType = 78
	PhpSerializedValue_ValueType__Object PhpSerializedValue_ValueType = 79
	PhpSerializedValue_ValueType__VariableReference PhpSerializedValue_ValueType = 82
	PhpSerializedValue_ValueType__Php6String PhpSerializedValue_ValueType = 83
	PhpSerializedValue_ValueType__Array PhpSerializedValue_ValueType = 97
	PhpSerializedValue_ValueType__Bool PhpSerializedValue_ValueType = 98
	PhpSerializedValue_ValueType__Float PhpSerializedValue_ValueType = 100
	PhpSerializedValue_ValueType__Int PhpSerializedValue_ValueType = 105
	PhpSerializedValue_ValueType__Php3Object PhpSerializedValue_ValueType = 111
	PhpSerializedValue_ValueType__ObjectReference PhpSerializedValue_ValueType = 114
	PhpSerializedValue_ValueType__String PhpSerializedValue_ValueType = 115
)

type PhpSerializedValue_BoolValue int
const (
	PhpSerializedValue_BoolValue__False PhpSerializedValue_BoolValue = 48
	PhpSerializedValue_BoolValue__True PhpSerializedValue_BoolValue = 49
)
type PhpSerializedValue struct {
	Type PhpSerializedValue_ValueType
	Contents interface{}
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent interface{}
}
func NewPhpSerializedValue() *PhpSerializedValue {
	return &PhpSerializedValue{
	}
}

func (this *PhpSerializedValue) Read(io *kaitai.Stream, parent interface{}, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = PhpSerializedValue_ValueType(tmp1)
	switch (this.Type) {
	case PhpSerializedValue_ValueType__CustomSerializedObject:
		tmp2 := NewPhpSerializedValue_CustomSerializedObjectContents()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp2
	case PhpSerializedValue_ValueType__Php3Object:
		tmp3 := NewPhpSerializedValue_Php3ObjectContents()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp3
	case PhpSerializedValue_ValueType__Object:
		tmp4 := NewPhpSerializedValue_ObjectContents()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp4
	case PhpSerializedValue_ValueType__VariableReference:
		tmp5 := NewPhpSerializedValue_IntContents()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp5
	case PhpSerializedValue_ValueType__Php6String:
		tmp6 := NewPhpSerializedValue_StringContents()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp6
	case PhpSerializedValue_ValueType__Float:
		tmp7 := NewPhpSerializedValue_FloatContents()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp7
	case PhpSerializedValue_ValueType__ObjectReference:
		tmp8 := NewPhpSerializedValue_IntContents()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp8
	case PhpSerializedValue_ValueType__Null:
		tmp9 := NewPhpSerializedValue_NullContents()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp9
	case PhpSerializedValue_ValueType__Bool:
		tmp10 := NewPhpSerializedValue_BoolContents()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp10
	case PhpSerializedValue_ValueType__Int:
		tmp11 := NewPhpSerializedValue_IntContents()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp11
	case PhpSerializedValue_ValueType__Array:
		tmp12 := NewPhpSerializedValue_ArrayContents()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp12
	case PhpSerializedValue_ValueType__String:
		tmp13 := NewPhpSerializedValue_StringContents()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp13
	}
	return err
}

/**
 * A single-character code indicating the type of the serialized value.
 */

/**
 * The contents of the serialized value, which vary depending on the type.
 */

/**
 * A mapping (a sequence of key-value pairs) prefixed with its size.
 */
type PhpSerializedValue_CountPrefixedMapping struct {
	NumEntriesDec string
	OpeningBrace []byte
	Entries []*PhpSerializedValue_MappingEntry
	ClosingBrace []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent interface{}
	_f_numEntries bool
	numEntries int
}
func NewPhpSerializedValue_CountPrefixedMapping() *PhpSerializedValue_CountPrefixedMapping {
	return &PhpSerializedValue_CountPrefixedMapping{
	}
}

func (this *PhpSerializedValue_CountPrefixedMapping) Read(io *kaitai.Stream, parent interface{}, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytesTerm(58, false, true, true)
	if err != nil {
		return err
	}
	this.NumEntriesDec = string(tmp14)
	tmp15, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.OpeningBrace = tmp15
	if !(bytes.Equal(this.OpeningBrace, []uint8{123})) {
		return kaitai.NewValidationNotEqualError([]uint8{123}, this.OpeningBrace, this._io, "/types/count_prefixed_mapping/seq/1")
	}
	tmp16, err := this.NumEntries()
	if err != nil {
		return err
	}
	this.Entries = make([]*PhpSerializedValue_MappingEntry, tmp16)
	for i := range this.Entries {
		tmp17 := NewPhpSerializedValue_MappingEntry()
		err = tmp17.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp17
	}
	tmp18, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.ClosingBrace = tmp18
	if !(bytes.Equal(this.ClosingBrace, []uint8{125})) {
		return kaitai.NewValidationNotEqualError([]uint8{125}, this.ClosingBrace, this._io, "/types/count_prefixed_mapping/seq/3")
	}
	return err
}

/**
 * The number of key-value pairs in the mapping, parsed as an integer.
 */
func (this *PhpSerializedValue_CountPrefixedMapping) NumEntries() (v int, err error) {
	if (this._f_numEntries) {
		return this.numEntries, nil
	}
	tmp19, err := strconv.ParseInt(this.NumEntriesDec, 10, 0)
	if err != nil {
		return 0, err
	}
	this.numEntries = int(tmp19)
	this._f_numEntries = true
	return this.numEntries, nil
}

/**
 * The number of key-value pairs in the mapping, in ASCII decimal.
 */

/**
 * The key-value pairs contained in the mapping.
 */

/**
 * The contents of a floating-point value.
 */
type PhpSerializedValue_FloatContents struct {
	Colon []byte
	ValueDec string
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
}
func NewPhpSerializedValue_FloatContents() *PhpSerializedValue_FloatContents {
	return &PhpSerializedValue_FloatContents{
	}
}

func (this *PhpSerializedValue_FloatContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Colon = tmp20
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/float_contents/seq/0")
	}
	tmp21, err := this._io.ReadBytesTerm(59, false, true, true)
	if err != nil {
		return err
	}
	this.ValueDec = string(tmp21)
	return err
}

/**
 * The value of the `float`, in ASCII decimal, as generated by PHP's
 * usual double-to-string conversion. In particular, this means that:
 * 
 * * A decimal point may not be included (for integral numbers)
 * * The number may use exponent notation (e. g. `1.0E+16`)
 * * Positive and negative infinity are represented as `INF`
 *   and `-INF`, respectively
 * * Not-a-number is represented as `NAN`
 */

/**
 * A quoted string prefixed with its length.
 * 
 * Despite the quotes surrounding the string data, it can contain
 * arbitrary bytes, which are never escaped in any way.
 * This does not cause any ambiguities when parsing - the bounds of
 * the string are determined only by the length field, not by the quotes.
 */
type PhpSerializedValue_LengthPrefixedQuotedString struct {
	LenDataDec string
	OpeningQuote []byte
	Data []byte
	ClosingQuote []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent interface{}
	_f_lenData bool
	lenData int
}
func NewPhpSerializedValue_LengthPrefixedQuotedString() *PhpSerializedValue_LengthPrefixedQuotedString {
	return &PhpSerializedValue_LengthPrefixedQuotedString{
	}
}

func (this *PhpSerializedValue_LengthPrefixedQuotedString) Read(io *kaitai.Stream, parent interface{}, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadBytesTerm(58, false, true, true)
	if err != nil {
		return err
	}
	this.LenDataDec = string(tmp22)
	tmp23, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.OpeningQuote = tmp23
	if !(bytes.Equal(this.OpeningQuote, []uint8{34})) {
		return kaitai.NewValidationNotEqualError([]uint8{34}, this.OpeningQuote, this._io, "/types/length_prefixed_quoted_string/seq/1")
	}
	tmp24, err := this.LenData()
	if err != nil {
		return err
	}
	tmp25, err := this._io.ReadBytes(int(tmp24))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Data = tmp25
	tmp26, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.ClosingQuote = tmp26
	if !(bytes.Equal(this.ClosingQuote, []uint8{34})) {
		return kaitai.NewValidationNotEqualError([]uint8{34}, this.ClosingQuote, this._io, "/types/length_prefixed_quoted_string/seq/3")
	}
	return err
}

/**
 * The length of the string's contents in bytes, parsed as an integer.
 * The quotes are not counted in this size number.
 */
func (this *PhpSerializedValue_LengthPrefixedQuotedString) LenData() (v int, err error) {
	if (this._f_lenData) {
		return this.lenData, nil
	}
	tmp27, err := strconv.ParseInt(this.LenDataDec, 10, 0)
	if err != nil {
		return 0, err
	}
	this.lenData = int(tmp27)
	this._f_lenData = true
	return this.lenData, nil
}

/**
 * The length of the string's data in bytes, in ASCII decimal.
 * The quotes are not counted in this length number.
 */

/**
 * The data contained in the string. The quotes are not included.
 */

/**
 * The contents of an object value serialized in the default format.
 * Unlike its PHP 3 counterpart, it contains a class name.
 */
type PhpSerializedValue_ObjectContents struct {
	Colon1 []byte
	ClassName *PhpSerializedValue_LengthPrefixedQuotedString
	Colon2 []byte
	Properties *PhpSerializedValue_CountPrefixedMapping
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
}
func NewPhpSerializedValue_ObjectContents() *PhpSerializedValue_ObjectContents {
	return &PhpSerializedValue_ObjectContents{
	}
}

func (this *PhpSerializedValue_ObjectContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Colon1 = tmp28
	if !(bytes.Equal(this.Colon1, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon1, this._io, "/types/object_contents/seq/0")
	}
	tmp29 := NewPhpSerializedValue_LengthPrefixedQuotedString()
	err = tmp29.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ClassName = tmp29
	tmp30, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp30 = tmp30
	this.Colon2 = tmp30
	if !(bytes.Equal(this.Colon2, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon2, this._io, "/types/object_contents/seq/2")
	}
	tmp31 := NewPhpSerializedValue_CountPrefixedMapping()
	err = tmp31.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Properties = tmp31
	return err
}

/**
 * The name of the object's class.
 */

/**
 * The object's properties. Keys ust be of type `string`,
 * values may have any type.
 */

/**
 * The contents of an array value.
 */
type PhpSerializedValue_ArrayContents struct {
	Colon []byte
	Elements *PhpSerializedValue_CountPrefixedMapping
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
}
func NewPhpSerializedValue_ArrayContents() *PhpSerializedValue_ArrayContents {
	return &PhpSerializedValue_ArrayContents{
	}
}

func (this *PhpSerializedValue_ArrayContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp32 = tmp32
	this.Colon = tmp32
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/array_contents/seq/0")
	}
	tmp33 := NewPhpSerializedValue_CountPrefixedMapping()
	err = tmp33.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Elements = tmp33
	return err
}

/**
 * The array's elements. Keys must be of type `int` or `string`,
 * values may have any type.
 */

/**
 * The contents of an object value that implements a custom
 * serialized format using `Serializable`.
 */
type PhpSerializedValue_CustomSerializedObjectContents struct {
	Colon1 []byte
	ClassName *PhpSerializedValue_LengthPrefixedQuotedString
	Colon2 []byte
	LenDataDec string
	OpeningBrace []byte
	Data []byte
	ClosingQuote []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
	_f_lenData bool
	lenData int
}
func NewPhpSerializedValue_CustomSerializedObjectContents() *PhpSerializedValue_CustomSerializedObjectContents {
	return &PhpSerializedValue_CustomSerializedObjectContents{
	}
}

func (this *PhpSerializedValue_CustomSerializedObjectContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.Colon1 = tmp34
	if !(bytes.Equal(this.Colon1, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon1, this._io, "/types/custom_serialized_object_contents/seq/0")
	}
	tmp35 := NewPhpSerializedValue_LengthPrefixedQuotedString()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ClassName = tmp35
	tmp36, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Colon2 = tmp36
	if !(bytes.Equal(this.Colon2, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon2, this._io, "/types/custom_serialized_object_contents/seq/2")
	}
	tmp37, err := this._io.ReadBytesTerm(58, false, true, true)
	if err != nil {
		return err
	}
	this.LenDataDec = string(tmp37)
	tmp38, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.OpeningBrace = tmp38
	if !(bytes.Equal(this.OpeningBrace, []uint8{123})) {
		return kaitai.NewValidationNotEqualError([]uint8{123}, this.OpeningBrace, this._io, "/types/custom_serialized_object_contents/seq/4")
	}
	tmp39, err := this.LenData()
	if err != nil {
		return err
	}
	tmp40, err := this._io.ReadBytes(int(tmp39))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Data = tmp40
	tmp41, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.ClosingQuote = tmp41
	if !(bytes.Equal(this.ClosingQuote, []uint8{125})) {
		return kaitai.NewValidationNotEqualError([]uint8{125}, this.ClosingQuote, this._io, "/types/custom_serialized_object_contents/seq/6")
	}
	return err
}

/**
 * The length of the serialized data in bytes, parsed as an integer.
 * The braces are not counted in this length number.
 */
func (this *PhpSerializedValue_CustomSerializedObjectContents) LenData() (v int, err error) {
	if (this._f_lenData) {
		return this.lenData, nil
	}
	tmp42, err := strconv.ParseInt(this.LenDataDec, 10, 0)
	if err != nil {
		return 0, err
	}
	this.lenData = int(tmp42)
	this._f_lenData = true
	return this.lenData, nil
}

/**
 * The name of the object's class.
 */

/**
 * The length of the serialized data in bytes, in ASCII decimal.
 * The braces are not counted in this size number.
 */

/**
 * The custom serialized data. The braces are not included.
 * 
 * Although the surrounding braces make it look like a regular
 * serialized object, this field is actually more similar to a string:
 * it can contain arbitrary data that is not required to follow
 * any common structure.
 */

/**
 * The contents of a null value (`value_type::null`). This structure
 * contains no actual data, since there is only a single `NULL` value.
 */
type PhpSerializedValue_NullContents struct {
	Semicolon []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
}
func NewPhpSerializedValue_NullContents() *PhpSerializedValue_NullContents {
	return &PhpSerializedValue_NullContents{
	}
}

func (this *PhpSerializedValue_NullContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.Semicolon = tmp43
	if !(bytes.Equal(this.Semicolon, []uint8{59})) {
		return kaitai.NewValidationNotEqualError([]uint8{59}, this.Semicolon, this._io, "/types/null_contents/seq/0")
	}
	return err
}

/**
 * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
 * and above, it does not contain a class name.
 */
type PhpSerializedValue_Php3ObjectContents struct {
	Colon []byte
	Properties *PhpSerializedValue_CountPrefixedMapping
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
}
func NewPhpSerializedValue_Php3ObjectContents() *PhpSerializedValue_Php3ObjectContents {
	return &PhpSerializedValue_Php3ObjectContents{
	}
}

func (this *PhpSerializedValue_Php3ObjectContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Colon = tmp44
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/php_3_object_contents/seq/0")
	}
	tmp45 := NewPhpSerializedValue_CountPrefixedMapping()
	err = tmp45.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Properties = tmp45
	return err
}

/**
 * The object's properties. Keys must be of type `string`,
 * values may have any type.
 */

/**
 * The contents of a boolean value (`value_type::bool`).
 */
type PhpSerializedValue_BoolContents struct {
	Colon []byte
	ValueDec PhpSerializedValue_BoolValue
	Semicolon []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
	_f_value bool
	value bool
}
func NewPhpSerializedValue_BoolContents() *PhpSerializedValue_BoolContents {
	return &PhpSerializedValue_BoolContents{
	}
}

func (this *PhpSerializedValue_BoolContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this.Colon = tmp46
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/bool_contents/seq/0")
	}
	tmp47, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ValueDec = PhpSerializedValue_BoolValue(tmp47)
	tmp48, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp48 = tmp48
	this.Semicolon = tmp48
	if !(bytes.Equal(this.Semicolon, []uint8{59})) {
		return kaitai.NewValidationNotEqualError([]uint8{59}, this.Semicolon, this._io, "/types/bool_contents/seq/2")
	}
	return err
}

/**
 * The value of the `bool`, parsed as a boolean.
 */
func (this *PhpSerializedValue_BoolContents) Value() (v bool, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = bool(this.ValueDec == PhpSerializedValue_BoolValue__True)
	this._f_value = true
	return this.value, nil
}

/**
 * The value of the `bool`: `0` for `false` or `1` for `true`.
 */

/**
 * The contents of a string value.
 * 
 * Note: PHP strings can contain arbitrary byte sequences.
 * They are not necessarily valid text in any specific encoding.
 */
type PhpSerializedValue_StringContents struct {
	Colon []byte
	String *PhpSerializedValue_LengthPrefixedQuotedString
	Semicolon []byte
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
	_f_value bool
	value []byte
}
func NewPhpSerializedValue_StringContents() *PhpSerializedValue_StringContents {
	return &PhpSerializedValue_StringContents{
	}
}

func (this *PhpSerializedValue_StringContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp49 = tmp49
	this.Colon = tmp49
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/string_contents/seq/0")
	}
	tmp50 := NewPhpSerializedValue_LengthPrefixedQuotedString()
	err = tmp50.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.String = tmp50
	tmp51, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp51 = tmp51
	this.Semicolon = tmp51
	if !(bytes.Equal(this.Semicolon, []uint8{59})) {
		return kaitai.NewValidationNotEqualError([]uint8{59}, this.Semicolon, this._io, "/types/string_contents/seq/2")
	}
	return err
}

/**
 * The value of the string, as a byte array.
 */
func (this *PhpSerializedValue_StringContents) Value() (v []byte, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = []byte(this.String.Data)
	this._f_value = true
	return this.value, nil
}

/**
 * The contents of an integer-like value:
 * either an actual integer (`value_type::int`) or a reference
 * (`value_type::variable_reference`, `value_type::object_reference`).
 */
type PhpSerializedValue_IntContents struct {
	Colon []byte
	ValueDec string
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue
	_f_value bool
	value int
}
func NewPhpSerializedValue_IntContents() *PhpSerializedValue_IntContents {
	return &PhpSerializedValue_IntContents{
	}
}

func (this *PhpSerializedValue_IntContents) Read(io *kaitai.Stream, parent *PhpSerializedValue, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp52 = tmp52
	this.Colon = tmp52
	if !(bytes.Equal(this.Colon, []uint8{58})) {
		return kaitai.NewValidationNotEqualError([]uint8{58}, this.Colon, this._io, "/types/int_contents/seq/0")
	}
	tmp53, err := this._io.ReadBytesTerm(59, false, true, true)
	if err != nil {
		return err
	}
	this.ValueDec = string(tmp53)
	return err
}

/**
 * The value of the `int`, parsed as an integer.
 */
func (this *PhpSerializedValue_IntContents) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp54, err := strconv.ParseInt(this.ValueDec, 10, 0)
	if err != nil {
		return 0, err
	}
	this.value = int(tmp54)
	this._f_value = true
	return this.value, nil
}

/**
 * The value of the `int`, in ASCII decimal.
 */

/**
 * A mapping entry consisting of a key and a value.
 */
type PhpSerializedValue_MappingEntry struct {
	Key *PhpSerializedValue
	Value *PhpSerializedValue
	_io *kaitai.Stream
	_root *PhpSerializedValue
	_parent *PhpSerializedValue_CountPrefixedMapping
}
func NewPhpSerializedValue_MappingEntry() *PhpSerializedValue_MappingEntry {
	return &PhpSerializedValue_MappingEntry{
	}
}

func (this *PhpSerializedValue_MappingEntry) Read(io *kaitai.Stream, parent *PhpSerializedValue_CountPrefixedMapping, root *PhpSerializedValue) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp55 := NewPhpSerializedValue()
	err = tmp55.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Key = tmp55
	tmp56 := NewPhpSerializedValue()
	err = tmp56.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Value = tmp56
	return err
}

/**
 * The key of the entry.
 */

/**
 * The value of the entry.
 */