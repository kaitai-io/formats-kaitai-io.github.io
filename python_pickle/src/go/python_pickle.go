// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Python Pickle format serializes Python objects to a byte stream, as a sequence
 * of operations to run on the Pickle Virtual Machine.
 * 
 * The format is mostly implementation defined, there is no formal specification.
 * Pickle data types are closely coupled to the Python object model.
 * Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
 * are serialised using dedicated Pickle opcodes.
 * Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
 * serialised by encoding the name of a constructor callable.
 * They are deserialised by importing that constructor, and calling it.
 * So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
 * can cause arbitrary code execution.
 * 
 * Pickle format has evolved with Python, later protocols add opcodes & types.
 * Later Python releases can pickle to or unpickle from any earlier protocol.
 * 
 * * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
 * * Protocol 1: Binary, no explicit version, first length prefixed types.
 * * Protocol 2 ([PEP 307](https://peps.python.org/pep-0307/)): Python 2.3+.
 *   Explicit versioning, more length prefixed types.
 * * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
 * * Protocol 4 ([PEP 3154](https://peps.python.org/pep-3154/)): Python 3.4+.
 *   Opcodes for 64 bit strings, framing, `set`.
 * * Protocol 5 ([PEP 574](https://peps.python.org/pep-0574/)): Python 3.8+:
 * Opcodes for `bytearray` and out of band data
 * @see <a href="https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py">Source</a>
 */

type PythonPickle_Opcode int
const (
	PythonPickle_Opcode__Mark PythonPickle_Opcode = 40
	PythonPickle_Opcode__EmptyTuple PythonPickle_Opcode = 41
	PythonPickle_Opcode__Stop PythonPickle_Opcode = 46
	PythonPickle_Opcode__Pop PythonPickle_Opcode = 48
	PythonPickle_Opcode__PopMark PythonPickle_Opcode = 49
	PythonPickle_Opcode__Dup PythonPickle_Opcode = 50
	PythonPickle_Opcode__Binbytes PythonPickle_Opcode = 66
	PythonPickle_Opcode__ShortBinbytes PythonPickle_Opcode = 67
	PythonPickle_Opcode__Float PythonPickle_Opcode = 70
	PythonPickle_Opcode__Binfloat PythonPickle_Opcode = 71
	PythonPickle_Opcode__Int PythonPickle_Opcode = 73
	PythonPickle_Opcode__Binint PythonPickle_Opcode = 74
	PythonPickle_Opcode__Binint1 PythonPickle_Opcode = 75
	PythonPickle_Opcode__Long PythonPickle_Opcode = 76
	PythonPickle_Opcode__Binint2 PythonPickle_Opcode = 77
	PythonPickle_Opcode__None PythonPickle_Opcode = 78
	PythonPickle_Opcode__Persid PythonPickle_Opcode = 80
	PythonPickle_Opcode__Binpersid PythonPickle_Opcode = 81
	PythonPickle_Opcode__Reduce PythonPickle_Opcode = 82
	PythonPickle_Opcode__String PythonPickle_Opcode = 83
	PythonPickle_Opcode__Binstring PythonPickle_Opcode = 84
	PythonPickle_Opcode__ShortBinstring PythonPickle_Opcode = 85
	PythonPickle_Opcode__Unicode PythonPickle_Opcode = 86
	PythonPickle_Opcode__Binunicode PythonPickle_Opcode = 88
	PythonPickle_Opcode__EmptyList PythonPickle_Opcode = 93
	PythonPickle_Opcode__Append PythonPickle_Opcode = 97
	PythonPickle_Opcode__Build PythonPickle_Opcode = 98
	PythonPickle_Opcode__GlobalOpcode PythonPickle_Opcode = 99
	PythonPickle_Opcode__Dict PythonPickle_Opcode = 100
	PythonPickle_Opcode__Appends PythonPickle_Opcode = 101
	PythonPickle_Opcode__Get PythonPickle_Opcode = 103
	PythonPickle_Opcode__Binget PythonPickle_Opcode = 104
	PythonPickle_Opcode__Inst PythonPickle_Opcode = 105
	PythonPickle_Opcode__LongBinget PythonPickle_Opcode = 106
	PythonPickle_Opcode__List PythonPickle_Opcode = 108
	PythonPickle_Opcode__Obj PythonPickle_Opcode = 111
	PythonPickle_Opcode__Put PythonPickle_Opcode = 112
	PythonPickle_Opcode__Binput PythonPickle_Opcode = 113
	PythonPickle_Opcode__LongBinput PythonPickle_Opcode = 114
	PythonPickle_Opcode__Setitem PythonPickle_Opcode = 115
	PythonPickle_Opcode__Tuple PythonPickle_Opcode = 116
	PythonPickle_Opcode__Setitems PythonPickle_Opcode = 117
	PythonPickle_Opcode__EmptyDict PythonPickle_Opcode = 125
	PythonPickle_Opcode__Proto PythonPickle_Opcode = 128
	PythonPickle_Opcode__Newobj PythonPickle_Opcode = 129
	PythonPickle_Opcode__Ext1 PythonPickle_Opcode = 130
	PythonPickle_Opcode__Ext2 PythonPickle_Opcode = 131
	PythonPickle_Opcode__Ext4 PythonPickle_Opcode = 132
	PythonPickle_Opcode__Tuple1 PythonPickle_Opcode = 133
	PythonPickle_Opcode__Tuple2 PythonPickle_Opcode = 134
	PythonPickle_Opcode__Tuple3 PythonPickle_Opcode = 135
	PythonPickle_Opcode__Newtrue PythonPickle_Opcode = 136
	PythonPickle_Opcode__Newfalse PythonPickle_Opcode = 137
	PythonPickle_Opcode__Long1 PythonPickle_Opcode = 138
	PythonPickle_Opcode__Long4 PythonPickle_Opcode = 139
	PythonPickle_Opcode__ShortBinunicode PythonPickle_Opcode = 140
	PythonPickle_Opcode__Binunicode8 PythonPickle_Opcode = 141
	PythonPickle_Opcode__Binbytes8 PythonPickle_Opcode = 142
	PythonPickle_Opcode__EmptySet PythonPickle_Opcode = 143
	PythonPickle_Opcode__Additems PythonPickle_Opcode = 144
	PythonPickle_Opcode__Frozenset PythonPickle_Opcode = 145
	PythonPickle_Opcode__NewobjEx PythonPickle_Opcode = 146
	PythonPickle_Opcode__StackGlobal PythonPickle_Opcode = 147
	PythonPickle_Opcode__Memoize PythonPickle_Opcode = 148
	PythonPickle_Opcode__Frame PythonPickle_Opcode = 149
	PythonPickle_Opcode__Bytearray8 PythonPickle_Opcode = 150
	PythonPickle_Opcode__NextBuffer PythonPickle_Opcode = 151
	PythonPickle_Opcode__ReadonlyBuffer PythonPickle_Opcode = 152
)
type PythonPickle struct {
	Ops []*PythonPickle_Op
	_io *kaitai.Stream
	_root *PythonPickle
	_parent interface{}
}
func NewPythonPickle() *PythonPickle {
	return &PythonPickle{
	}
}

func (this *PythonPickle) Read(io *kaitai.Stream, parent interface{}, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewPythonPickle_Op()
		err = tmp1.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp1
		this.Ops = append(this.Ops, _it)
		if _it.Code == PythonPickle_Opcode__Stop {
			break
		}
	}
	return err
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */
type PythonPickle_Unicodestring8 struct {
	Len uint64
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Unicodestring8() *PythonPickle_Unicodestring8 {
	return &PythonPickle_Unicodestring8{
	}
}

func (this *PythonPickle_Unicodestring8) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Len = uint64(tmp2)
	tmp3, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Val = string(tmp3)
	return err
}

/**
 * Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
 * encoded as two's complement.
 */
type PythonPickle_Long1 struct {
	Len uint8
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Long1() *PythonPickle_Long1 {
	return &PythonPickle_Long1{
	}
}

func (this *PythonPickle_Long1) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp4
	tmp5, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Val = tmp5
	return err
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */
type PythonPickle_Bytes8 struct {
	Len uint64
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Bytes8() *PythonPickle_Bytes8 {
	return &PythonPickle_Bytes8{
	}
}

func (this *PythonPickle_Bytes8) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Len = uint64(tmp6)
	tmp7, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Val = tmp7
	return err
}

/**
 * Length prefixed byte string, between 0 and 255 bytes long.
 */
type PythonPickle_Bytes1 struct {
	Len uint8
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Bytes1() *PythonPickle_Bytes1 {
	return &PythonPickle_Bytes1{
	}
}

func (this *PythonPickle_Bytes1) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp8
	tmp9, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Val = tmp9
	return err
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */
type PythonPickle_Bytes4 struct {
	Len uint32
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Bytes4() *PythonPickle_Bytes4 {
	return &PythonPickle_Bytes4{
	}
}

func (this *PythonPickle_Bytes4) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp10)
	tmp11, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Val = tmp11
	return err
}

/**
 * Some opcodes take no argument, this empty type is used for them.
 */
type PythonPickle_NoArg struct {
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_NoArg() *PythonPickle_NoArg {
	return &PythonPickle_NoArg{
	}
}

func (this *PythonPickle_NoArg) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * Unquoted string, does not contain string escapes.
 */
type PythonPickle_StringnlNoescape struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent interface{}
}
func NewPythonPickle_StringnlNoescape() *PythonPickle_StringnlNoescape {
	return &PythonPickle_StringnlNoescape{
	}
}

func (this *PythonPickle_StringnlNoescape) Read(io *kaitai.Stream, parent interface{}, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp12)
	return err
}

/**
 * Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
 */
type PythonPickle_DecimalnlLong struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_DecimalnlLong() *PythonPickle_DecimalnlLong {
	return &PythonPickle_DecimalnlLong{
	}
}

func (this *PythonPickle_DecimalnlLong) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp13)
	return err
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */
type PythonPickle_Unicodestring4 struct {
	Len uint32
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Unicodestring4() *PythonPickle_Unicodestring4 {
	return &PythonPickle_Unicodestring4{
	}
}

func (this *PythonPickle_Unicodestring4) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp14)
	tmp15, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Val = string(tmp15)
	return err
}

/**
 * Unquoted string, containing Python Unicode escapes.
 */
type PythonPickle_Unicodestringnl struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Unicodestringnl() *PythonPickle_Unicodestringnl {
	return &PythonPickle_Unicodestringnl{
	}
}

func (this *PythonPickle_Unicodestringnl) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp16)
	return err
}

/**
 * Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
 * encoded as two's complement.
 */
type PythonPickle_Long4 struct {
	Len uint32
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Long4() *PythonPickle_Long4 {
	return &PythonPickle_Long4{
	}
}

func (this *PythonPickle_Long4) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp17)
	tmp18, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Val = tmp18
	return err
}

/**
 * Length prefixed string, between 0 and 255 bytes long. Encoding is
 * unspecified.
 * 
 * The default Python 2.x string type (`str`) is a sequence of bytes.
 * These are pickled as `string1` or `string4`, when protocol == 2.
 * The bytes are written directly, no explicit encoding is performed.
 * 
 * Python 3.x will not pickle an object as `string1` or `string4`.
 * Instead, opcodes and types with a known encoding are used.
 * When unpickling
 * 
 * - `pickle.Unpickler` objects default to ASCII, which can be overriden
 * - `pickletools.dis` uses latin1, and cannot be overriden
 * @see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
 */
type PythonPickle_String1 struct {
	Len uint8
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_String1() *PythonPickle_String1 {
	return &PythonPickle_String1{
	}
}

func (this *PythonPickle_String1) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp19
	tmp20, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Val = tmp20
	return err
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * The contents are deserilised into a `bytearray` object.
 */
type PythonPickle_Bytearray8 struct {
	Len uint64
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Bytearray8() *PythonPickle_Bytearray8 {
	return &PythonPickle_Bytearray8{
	}
}

func (this *PythonPickle_Bytearray8) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Len = uint64(tmp21)
	tmp22, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Val = tmp22
	return err
}

/**
 * Integer or boolean, encoded with the ASCII characters [0-9-].
 * 
 * The values '00' and '01' encode the Python values `False` and `True`.
 * Normally a value would not contain leading '0' characters.
 */
type PythonPickle_DecimalnlShort struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_DecimalnlShort() *PythonPickle_DecimalnlShort {
	return &PythonPickle_DecimalnlShort{
	}
}

func (this *PythonPickle_DecimalnlShort) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp23)
	return err
}

/**
 * Length prefixed string, between 0 and 255 bytes long
 */
type PythonPickle_Unicodestring1 struct {
	Len uint8
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Unicodestring1() *PythonPickle_Unicodestring1 {
	return &PythonPickle_Unicodestring1{
	}
}

func (this *PythonPickle_Unicodestring1) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp24
	tmp25, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Val = string(tmp25)
	return err
}

/**
 * Quoted string, possibly containing Python string escapes.
 */
type PythonPickle_Stringnl struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Stringnl() *PythonPickle_Stringnl {
	return &PythonPickle_Stringnl{
	}
}

func (this *PythonPickle_Stringnl) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp26)
	return err
}

/**
 * Pair of unquoted, unescaped strings.
 */
type PythonPickle_StringnlNoescapePair struct {
	Val1 *PythonPickle_StringnlNoescape
	Val2 *PythonPickle_StringnlNoescape
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_StringnlNoescapePair() *PythonPickle_StringnlNoescapePair {
	return &PythonPickle_StringnlNoescapePair{
	}
}

func (this *PythonPickle_StringnlNoescapePair) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27 := NewPythonPickle_StringnlNoescape()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Val1 = tmp27
	tmp28 := NewPythonPickle_StringnlNoescape()
	err = tmp28.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Val2 = tmp28
	return err
}

/**
 * Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
 * unspecified.
 * 
 * Although the len field is signed, any length < 0 will raise an exception
 * during unpickling.
 * 
 * See the documentation for `string1` for further detail about encodings.
 * @see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
 */
type PythonPickle_String4 struct {
	Len int32
	Val []byte
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_String4() *PythonPickle_String4 {
	return &PythonPickle_String4{
	}
}

func (this *PythonPickle_String4) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Len = int32(tmp29)
	tmp30, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp30 = tmp30
	this.Val = tmp30
	return err
}
type PythonPickle_Op struct {
	Code PythonPickle_Opcode
	Arg interface{}
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle
}
func NewPythonPickle_Op() *PythonPickle_Op {
	return &PythonPickle_Op{
	}
}

func (this *PythonPickle_Op) Read(io *kaitai.Stream, parent *PythonPickle, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = PythonPickle_Opcode(tmp31)
	switch (this.Code) {
	case PythonPickle_Opcode__Ext4:
		tmp32, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Arg = tmp32
	case PythonPickle_Opcode__Tuple1:
		tmp33 := NewPythonPickle_NoArg()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp33
	case PythonPickle_Opcode__Setitem:
		tmp34 := NewPythonPickle_NoArg()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp34
	case PythonPickle_Opcode__ReadonlyBuffer:
		tmp35 := NewPythonPickle_NoArg()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp35
	case PythonPickle_Opcode__Stop:
		tmp36 := NewPythonPickle_NoArg()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp36
	case PythonPickle_Opcode__Ext2:
		tmp37, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Arg = tmp37
	case PythonPickle_Opcode__EmptyTuple:
		tmp38 := NewPythonPickle_NoArg()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp38
	case PythonPickle_Opcode__Newtrue:
		tmp39 := NewPythonPickle_NoArg()
		err = tmp39.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp39
	case PythonPickle_Opcode__Long:
		tmp40 := NewPythonPickle_DecimalnlLong()
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp40
	case PythonPickle_Opcode__Newobj:
		tmp41 := NewPythonPickle_NoArg()
		err = tmp41.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp41
	case PythonPickle_Opcode__Bytearray8:
		tmp42 := NewPythonPickle_Bytearray8()
		err = tmp42.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp42
	case PythonPickle_Opcode__Put:
		tmp43 := NewPythonPickle_DecimalnlShort()
		err = tmp43.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp43
	case PythonPickle_Opcode__StackGlobal:
		tmp44 := NewPythonPickle_NoArg()
		err = tmp44.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp44
	case PythonPickle_Opcode__PopMark:
		tmp45 := NewPythonPickle_NoArg()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp45
	case PythonPickle_Opcode__Append:
		tmp46 := NewPythonPickle_NoArg()
		err = tmp46.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp46
	case PythonPickle_Opcode__Newfalse:
		tmp47 := NewPythonPickle_NoArg()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp47
	case PythonPickle_Opcode__Binpersid:
		tmp48 := NewPythonPickle_NoArg()
		err = tmp48.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp48
	case PythonPickle_Opcode__Build:
		tmp49 := NewPythonPickle_NoArg()
		err = tmp49.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp49
	case PythonPickle_Opcode__EmptyDict:
		tmp50 := NewPythonPickle_NoArg()
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp50
	case PythonPickle_Opcode__Tuple2:
		tmp51 := NewPythonPickle_NoArg()
		err = tmp51.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp51
	case PythonPickle_Opcode__Long4:
		tmp52 := NewPythonPickle_Long4()
		err = tmp52.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp52
	case PythonPickle_Opcode__NextBuffer:
		tmp53 := NewPythonPickle_NoArg()
		err = tmp53.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp53
	case PythonPickle_Opcode__Appends:
		tmp54 := NewPythonPickle_NoArg()
		err = tmp54.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp54
	case PythonPickle_Opcode__Binbytes:
		tmp55 := NewPythonPickle_Bytes4()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp55
	case PythonPickle_Opcode__Dup:
		tmp56 := NewPythonPickle_NoArg()
		err = tmp56.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp56
	case PythonPickle_Opcode__List:
		tmp57 := NewPythonPickle_NoArg()
		err = tmp57.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp57
	case PythonPickle_Opcode__Proto:
		tmp58, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Arg = tmp58
	case PythonPickle_Opcode__Pop:
		tmp59 := NewPythonPickle_NoArg()
		err = tmp59.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp59
	case PythonPickle_Opcode__Frame:
		tmp60, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Arg = tmp60
	case PythonPickle_Opcode__String:
		tmp61 := NewPythonPickle_Stringnl()
		err = tmp61.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp61
	case PythonPickle_Opcode__Binunicode:
		tmp62 := NewPythonPickle_Unicodestring4()
		err = tmp62.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp62
	case PythonPickle_Opcode__Float:
		tmp63 := NewPythonPickle_Floatnl()
		err = tmp63.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp63
	case PythonPickle_Opcode__Reduce:
		tmp64 := NewPythonPickle_NoArg()
		err = tmp64.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp64
	case PythonPickle_Opcode__GlobalOpcode:
		tmp65 := NewPythonPickle_StringnlNoescapePair()
		err = tmp65.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp65
	case PythonPickle_Opcode__Binput:
		tmp66, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Arg = tmp66
	case PythonPickle_Opcode__Memoize:
		tmp67 := NewPythonPickle_NoArg()
		err = tmp67.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp67
	case PythonPickle_Opcode__Persid:
		tmp68 := NewPythonPickle_StringnlNoescape()
		err = tmp68.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp68
	case PythonPickle_Opcode__Ext1:
		tmp69, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Arg = tmp69
	case PythonPickle_Opcode__None:
		tmp70 := NewPythonPickle_NoArg()
		err = tmp70.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp70
	case PythonPickle_Opcode__ShortBinunicode:
		tmp71 := NewPythonPickle_Unicodestring1()
		err = tmp71.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp71
	case PythonPickle_Opcode__Obj:
		tmp72 := NewPythonPickle_NoArg()
		err = tmp72.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp72
	case PythonPickle_Opcode__Binfloat:
		tmp73, err := this._io.ReadF8be()
		if err != nil {
			return err
		}
		this.Arg = tmp73
	case PythonPickle_Opcode__NewobjEx:
		tmp74 := NewPythonPickle_NoArg()
		err = tmp74.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp74
	case PythonPickle_Opcode__EmptyList:
		tmp75 := NewPythonPickle_NoArg()
		err = tmp75.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp75
	case PythonPickle_Opcode__Tuple:
		tmp76 := NewPythonPickle_NoArg()
		err = tmp76.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp76
	case PythonPickle_Opcode__Binunicode8:
		tmp77 := NewPythonPickle_Unicodestring8()
		err = tmp77.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp77
	case PythonPickle_Opcode__Binget:
		tmp78, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Arg = tmp78
	case PythonPickle_Opcode__Dict:
		tmp79 := NewPythonPickle_NoArg()
		err = tmp79.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp79
	case PythonPickle_Opcode__Binstring:
		tmp80 := NewPythonPickle_String4()
		err = tmp80.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp80
	case PythonPickle_Opcode__Setitems:
		tmp81 := NewPythonPickle_NoArg()
		err = tmp81.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp81
	case PythonPickle_Opcode__Binint2:
		tmp82, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Arg = tmp82
	case PythonPickle_Opcode__Binbytes8:
		tmp83 := NewPythonPickle_Bytes8()
		err = tmp83.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp83
	case PythonPickle_Opcode__Binint1:
		tmp84, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Arg = tmp84
	case PythonPickle_Opcode__Inst:
		tmp85 := NewPythonPickle_StringnlNoescapePair()
		err = tmp85.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp85
	case PythonPickle_Opcode__LongBinget:
		tmp86, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Arg = tmp86
	case PythonPickle_Opcode__LongBinput:
		tmp87, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Arg = tmp87
	case PythonPickle_Opcode__Int:
		tmp88 := NewPythonPickle_DecimalnlShort()
		err = tmp88.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp88
	case PythonPickle_Opcode__Binint:
		tmp89, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Arg = tmp89
	case PythonPickle_Opcode__Unicode:
		tmp90 := NewPythonPickle_Unicodestringnl()
		err = tmp90.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp90
	case PythonPickle_Opcode__Long1:
		tmp91 := NewPythonPickle_Long1()
		err = tmp91.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp91
	case PythonPickle_Opcode__ShortBinstring:
		tmp92 := NewPythonPickle_String1()
		err = tmp92.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp92
	case PythonPickle_Opcode__Mark:
		tmp93 := NewPythonPickle_NoArg()
		err = tmp93.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp93
	case PythonPickle_Opcode__Frozenset:
		tmp94 := NewPythonPickle_NoArg()
		err = tmp94.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp94
	case PythonPickle_Opcode__Tuple3:
		tmp95 := NewPythonPickle_NoArg()
		err = tmp95.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp95
	case PythonPickle_Opcode__Additems:
		tmp96 := NewPythonPickle_NoArg()
		err = tmp96.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp96
	case PythonPickle_Opcode__Get:
		tmp97 := NewPythonPickle_DecimalnlShort()
		err = tmp97.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp97
	case PythonPickle_Opcode__EmptySet:
		tmp98 := NewPythonPickle_NoArg()
		err = tmp98.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp98
	case PythonPickle_Opcode__ShortBinbytes:
		tmp99 := NewPythonPickle_Bytes1()
		err = tmp99.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Arg = tmp99
	}
	return err
}

/**
 * Operation code that determines which action should be
 * performed next by the Pickle Virtual Machine. Some opcodes
 * are only available in later versions of the Pickle protocol.
 */

/**
 * Optional argument for the operation. Data type and length
 * are determined by the value of the opcode.
 */

/**
 * Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
 * or 'nan'.
 */
type PythonPickle_Floatnl struct {
	Val string
	_io *kaitai.Stream
	_root *PythonPickle
	_parent *PythonPickle_Op
}
func NewPythonPickle_Floatnl() *PythonPickle_Floatnl {
	return &PythonPickle_Floatnl{
	}
}

func (this *PythonPickle_Floatnl) Read(io *kaitai.Stream, parent *PythonPickle_Op, root *PythonPickle) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp100, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Val = string(tmp100)
	return err
}
