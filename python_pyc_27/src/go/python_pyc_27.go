// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */

type PythonPyc27_Version int
const (
	PythonPyc27_Version__V15 PythonPyc27_Version = 20121
	PythonPyc27_Version__V16 PythonPyc27_Version = 50428
	PythonPyc27_Version__V20 PythonPyc27_Version = 50823
	PythonPyc27_Version__V21 PythonPyc27_Version = 60202
	PythonPyc27_Version__V22 PythonPyc27_Version = 60717
	PythonPyc27_Version__V23A0 PythonPyc27_Version = 62011
	PythonPyc27_Version__V23A0b PythonPyc27_Version = 62021
	PythonPyc27_Version__V24A0 PythonPyc27_Version = 62041
	PythonPyc27_Version__V24A3 PythonPyc27_Version = 62051
	PythonPyc27_Version__V24B1 PythonPyc27_Version = 62061
	PythonPyc27_Version__V25A0 PythonPyc27_Version = 62071
	PythonPyc27_Version__V25A0b PythonPyc27_Version = 62081
	PythonPyc27_Version__V25A0c PythonPyc27_Version = 62091
	PythonPyc27_Version__V25A0d PythonPyc27_Version = 62092
	PythonPyc27_Version__V25B3 PythonPyc27_Version = 62101
	PythonPyc27_Version__V25B3b PythonPyc27_Version = 62111
	PythonPyc27_Version__V25C1 PythonPyc27_Version = 62121
	PythonPyc27_Version__V25C2 PythonPyc27_Version = 62131
	PythonPyc27_Version__V26A0 PythonPyc27_Version = 62151
	PythonPyc27_Version__V26A1 PythonPyc27_Version = 62161
	PythonPyc27_Version__V27A0 PythonPyc27_Version = 62171
	PythonPyc27_Version__V27A0b PythonPyc27_Version = 62181
	PythonPyc27_Version__V27A0c PythonPyc27_Version = 62191
	PythonPyc27_Version__V27A0d PythonPyc27_Version = 62201
	PythonPyc27_Version__V27A0e PythonPyc27_Version = 62211
)
type PythonPyc27 struct {
	VersionMagic PythonPyc27_Version
	Crlf uint16
	ModificationTimestamp uint32
	Body *PythonPyc27_PyObject
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent interface{}
}
func NewPythonPyc27() *PythonPyc27 {
	return &PythonPyc27{
	}
}

func (this *PythonPyc27) Read(io *kaitai.Stream, parent interface{}, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMagic = PythonPyc27_Version(tmp1)
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Crlf = uint16(tmp2)
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ModificationTimestamp = uint32(tmp3)
	tmp4 := NewPythonPyc27_PyObject()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Body = tmp4
	return err
}

type PythonPyc27_CodeObject_FlagsEnum int
const (
	PythonPyc27_CodeObject_FlagsEnum__HasArgs PythonPyc27_CodeObject_FlagsEnum = 4
	PythonPyc27_CodeObject_FlagsEnum__HasKwargs PythonPyc27_CodeObject_FlagsEnum = 8
	PythonPyc27_CodeObject_FlagsEnum__Generator PythonPyc27_CodeObject_FlagsEnum = 32
)
type PythonPyc27_CodeObject struct {
	ArgCount uint32
	LocalCount uint32
	StackSize uint32
	Flags PythonPyc27_CodeObject_FlagsEnum
	Code *PythonPyc27_Assembly
	Consts *PythonPyc27_PyObject
	Names *PythonPyc27_PyObject
	VarNames *PythonPyc27_PyObject
	FreeVars *PythonPyc27_PyObject
	CellVars *PythonPyc27_PyObject
	Filename *PythonPyc27_PyObject
	Name *PythonPyc27_PyObject
	FirstLineNo uint32
	Lnotab *PythonPyc27_PyObject
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_CodeObject() *PythonPyc27_CodeObject {
	return &PythonPyc27_CodeObject{
	}
}

func (this *PythonPyc27_CodeObject) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ArgCount = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LocalCount = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StackSize = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = PythonPyc27_CodeObject_FlagsEnum(tmp8)
	tmp9 := NewPythonPyc27_Assembly()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Code = tmp9
	tmp10 := NewPythonPyc27_PyObject()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Consts = tmp10
	tmp11 := NewPythonPyc27_PyObject()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Names = tmp11
	tmp12 := NewPythonPyc27_PyObject()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VarNames = tmp12
	tmp13 := NewPythonPyc27_PyObject()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FreeVars = tmp13
	tmp14 := NewPythonPyc27_PyObject()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CellVars = tmp14
	tmp15 := NewPythonPyc27_PyObject()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Filename = tmp15
	tmp16 := NewPythonPyc27_PyObject()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp16
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FirstLineNo = uint32(tmp17)
	tmp18 := NewPythonPyc27_PyObject()
	err = tmp18.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Lnotab = tmp18
	return err
}
type PythonPyc27_Assembly struct {
	StringMagic []byte
	Length uint32
	Items *PythonPyc27_OpArgs
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_CodeObject
	_raw_Items []byte
}
func NewPythonPyc27_Assembly() *PythonPyc27_Assembly {
	return &PythonPyc27_Assembly{
	}
}

func (this *PythonPyc27_Assembly) Read(io *kaitai.Stream, parent *PythonPyc27_CodeObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.StringMagic = tmp19
	if !(bytes.Equal(this.StringMagic, []uint8{115})) {
		return kaitai.NewValidationNotEqualError([]uint8{115}, this.StringMagic, this._io, "/types/assembly/seq/0")
	}
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp20)
	tmp21, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this._raw_Items = tmp21
	_io__raw_Items := kaitai.NewStream(bytes.NewReader(this._raw_Items))
	tmp22 := NewPythonPyc27_OpArgs()
	err = tmp22.Read(_io__raw_Items, this, this._root)
	if err != nil {
		return err
	}
	this.Items = tmp22
	return err
}

type PythonPyc27_OpArg_OpCodeEnum int
const (
	PythonPyc27_OpArg_OpCodeEnum__StopCode PythonPyc27_OpArg_OpCodeEnum = 0
	PythonPyc27_OpArg_OpCodeEnum__PopTop PythonPyc27_OpArg_OpCodeEnum = 1
	PythonPyc27_OpArg_OpCodeEnum__RotTwo PythonPyc27_OpArg_OpCodeEnum = 2
	PythonPyc27_OpArg_OpCodeEnum__RotThree PythonPyc27_OpArg_OpCodeEnum = 3
	PythonPyc27_OpArg_OpCodeEnum__DupTop PythonPyc27_OpArg_OpCodeEnum = 4
	PythonPyc27_OpArg_OpCodeEnum__RotFour PythonPyc27_OpArg_OpCodeEnum = 5
	PythonPyc27_OpArg_OpCodeEnum__Nop PythonPyc27_OpArg_OpCodeEnum = 9
	PythonPyc27_OpArg_OpCodeEnum__UnaryPositive PythonPyc27_OpArg_OpCodeEnum = 10
	PythonPyc27_OpArg_OpCodeEnum__UnaryNegative PythonPyc27_OpArg_OpCodeEnum = 11
	PythonPyc27_OpArg_OpCodeEnum__UnaryNot PythonPyc27_OpArg_OpCodeEnum = 12
	PythonPyc27_OpArg_OpCodeEnum__UnaryConvert PythonPyc27_OpArg_OpCodeEnum = 13
	PythonPyc27_OpArg_OpCodeEnum__UnaryInvert PythonPyc27_OpArg_OpCodeEnum = 15
	PythonPyc27_OpArg_OpCodeEnum__BinaryPower PythonPyc27_OpArg_OpCodeEnum = 19
	PythonPyc27_OpArg_OpCodeEnum__BinaryMultiply PythonPyc27_OpArg_OpCodeEnum = 20
	PythonPyc27_OpArg_OpCodeEnum__BinaryDivide PythonPyc27_OpArg_OpCodeEnum = 21
	PythonPyc27_OpArg_OpCodeEnum__BinaryModulo PythonPyc27_OpArg_OpCodeEnum = 22
	PythonPyc27_OpArg_OpCodeEnum__BinaryAdd PythonPyc27_OpArg_OpCodeEnum = 23
	PythonPyc27_OpArg_OpCodeEnum__BinarySubtract PythonPyc27_OpArg_OpCodeEnum = 24
	PythonPyc27_OpArg_OpCodeEnum__BinarySubscr PythonPyc27_OpArg_OpCodeEnum = 25
	PythonPyc27_OpArg_OpCodeEnum__BinaryFloorDivide PythonPyc27_OpArg_OpCodeEnum = 26
	PythonPyc27_OpArg_OpCodeEnum__BinaryTrueDivide PythonPyc27_OpArg_OpCodeEnum = 27
	PythonPyc27_OpArg_OpCodeEnum__InplaceFloorDivide PythonPyc27_OpArg_OpCodeEnum = 28
	PythonPyc27_OpArg_OpCodeEnum__InplaceTrueDivide PythonPyc27_OpArg_OpCodeEnum = 29
	PythonPyc27_OpArg_OpCodeEnum__Slice0 PythonPyc27_OpArg_OpCodeEnum = 30
	PythonPyc27_OpArg_OpCodeEnum__Slice1 PythonPyc27_OpArg_OpCodeEnum = 31
	PythonPyc27_OpArg_OpCodeEnum__Slice2 PythonPyc27_OpArg_OpCodeEnum = 32
	PythonPyc27_OpArg_OpCodeEnum__Slice3 PythonPyc27_OpArg_OpCodeEnum = 33
	PythonPyc27_OpArg_OpCodeEnum__StoreSlice0 PythonPyc27_OpArg_OpCodeEnum = 40
	PythonPyc27_OpArg_OpCodeEnum__StoreSlice1 PythonPyc27_OpArg_OpCodeEnum = 41
	PythonPyc27_OpArg_OpCodeEnum__StoreSlice2 PythonPyc27_OpArg_OpCodeEnum = 42
	PythonPyc27_OpArg_OpCodeEnum__StoreSlice3 PythonPyc27_OpArg_OpCodeEnum = 43
	PythonPyc27_OpArg_OpCodeEnum__DeleteSlice0 PythonPyc27_OpArg_OpCodeEnum = 50
	PythonPyc27_OpArg_OpCodeEnum__DeleteSlice1 PythonPyc27_OpArg_OpCodeEnum = 51
	PythonPyc27_OpArg_OpCodeEnum__DeleteSlice2 PythonPyc27_OpArg_OpCodeEnum = 52
	PythonPyc27_OpArg_OpCodeEnum__DeleteSlice3 PythonPyc27_OpArg_OpCodeEnum = 53
	PythonPyc27_OpArg_OpCodeEnum__StoreMap PythonPyc27_OpArg_OpCodeEnum = 54
	PythonPyc27_OpArg_OpCodeEnum__InplaceAdd PythonPyc27_OpArg_OpCodeEnum = 55
	PythonPyc27_OpArg_OpCodeEnum__InplaceSubtract PythonPyc27_OpArg_OpCodeEnum = 56
	PythonPyc27_OpArg_OpCodeEnum__InplaceMultiply PythonPyc27_OpArg_OpCodeEnum = 57
	PythonPyc27_OpArg_OpCodeEnum__InplaceDivide PythonPyc27_OpArg_OpCodeEnum = 58
	PythonPyc27_OpArg_OpCodeEnum__InplaceModulo PythonPyc27_OpArg_OpCodeEnum = 59
	PythonPyc27_OpArg_OpCodeEnum__StoreSubscr PythonPyc27_OpArg_OpCodeEnum = 60
	PythonPyc27_OpArg_OpCodeEnum__DeleteSubscr PythonPyc27_OpArg_OpCodeEnum = 61
	PythonPyc27_OpArg_OpCodeEnum__BinaryLshift PythonPyc27_OpArg_OpCodeEnum = 62
	PythonPyc27_OpArg_OpCodeEnum__BinaryRshift PythonPyc27_OpArg_OpCodeEnum = 63
	PythonPyc27_OpArg_OpCodeEnum__BinaryAnd PythonPyc27_OpArg_OpCodeEnum = 64
	PythonPyc27_OpArg_OpCodeEnum__BinaryXor PythonPyc27_OpArg_OpCodeEnum = 65
	PythonPyc27_OpArg_OpCodeEnum__BinaryOr PythonPyc27_OpArg_OpCodeEnum = 66
	PythonPyc27_OpArg_OpCodeEnum__InplacePower PythonPyc27_OpArg_OpCodeEnum = 67
	PythonPyc27_OpArg_OpCodeEnum__GetIter PythonPyc27_OpArg_OpCodeEnum = 68
	PythonPyc27_OpArg_OpCodeEnum__PrintExpr PythonPyc27_OpArg_OpCodeEnum = 70
	PythonPyc27_OpArg_OpCodeEnum__PrintItem PythonPyc27_OpArg_OpCodeEnum = 71
	PythonPyc27_OpArg_OpCodeEnum__PrintNewline PythonPyc27_OpArg_OpCodeEnum = 72
	PythonPyc27_OpArg_OpCodeEnum__PrintItemTo PythonPyc27_OpArg_OpCodeEnum = 73
	PythonPyc27_OpArg_OpCodeEnum__PrintNewlineTo PythonPyc27_OpArg_OpCodeEnum = 74
	PythonPyc27_OpArg_OpCodeEnum__InplaceLshift PythonPyc27_OpArg_OpCodeEnum = 75
	PythonPyc27_OpArg_OpCodeEnum__InplaceRshift PythonPyc27_OpArg_OpCodeEnum = 76
	PythonPyc27_OpArg_OpCodeEnum__InplaceAnd PythonPyc27_OpArg_OpCodeEnum = 77
	PythonPyc27_OpArg_OpCodeEnum__InplaceXor PythonPyc27_OpArg_OpCodeEnum = 78
	PythonPyc27_OpArg_OpCodeEnum__InplaceOr PythonPyc27_OpArg_OpCodeEnum = 79
	PythonPyc27_OpArg_OpCodeEnum__BreakLoop PythonPyc27_OpArg_OpCodeEnum = 80
	PythonPyc27_OpArg_OpCodeEnum__WithCleanup PythonPyc27_OpArg_OpCodeEnum = 81
	PythonPyc27_OpArg_OpCodeEnum__LoadLocals PythonPyc27_OpArg_OpCodeEnum = 82
	PythonPyc27_OpArg_OpCodeEnum__ReturnValue PythonPyc27_OpArg_OpCodeEnum = 83
	PythonPyc27_OpArg_OpCodeEnum__ImportStar PythonPyc27_OpArg_OpCodeEnum = 84
	PythonPyc27_OpArg_OpCodeEnum__ExecStmt PythonPyc27_OpArg_OpCodeEnum = 85
	PythonPyc27_OpArg_OpCodeEnum__YieldValue PythonPyc27_OpArg_OpCodeEnum = 86
	PythonPyc27_OpArg_OpCodeEnum__PopBlock PythonPyc27_OpArg_OpCodeEnum = 87
	PythonPyc27_OpArg_OpCodeEnum__EndFinally PythonPyc27_OpArg_OpCodeEnum = 88
	PythonPyc27_OpArg_OpCodeEnum__BuildClass PythonPyc27_OpArg_OpCodeEnum = 89
	PythonPyc27_OpArg_OpCodeEnum__StoreName PythonPyc27_OpArg_OpCodeEnum = 90
	PythonPyc27_OpArg_OpCodeEnum__DeleteName PythonPyc27_OpArg_OpCodeEnum = 91
	PythonPyc27_OpArg_OpCodeEnum__UnpackSequence PythonPyc27_OpArg_OpCodeEnum = 92
	PythonPyc27_OpArg_OpCodeEnum__ForIter PythonPyc27_OpArg_OpCodeEnum = 93
	PythonPyc27_OpArg_OpCodeEnum__ListAppend PythonPyc27_OpArg_OpCodeEnum = 94
	PythonPyc27_OpArg_OpCodeEnum__StoreAttr PythonPyc27_OpArg_OpCodeEnum = 95
	PythonPyc27_OpArg_OpCodeEnum__DeleteAttr PythonPyc27_OpArg_OpCodeEnum = 96
	PythonPyc27_OpArg_OpCodeEnum__StoreGlobal PythonPyc27_OpArg_OpCodeEnum = 97
	PythonPyc27_OpArg_OpCodeEnum__DeleteGlobal PythonPyc27_OpArg_OpCodeEnum = 98
	PythonPyc27_OpArg_OpCodeEnum__DupTopx PythonPyc27_OpArg_OpCodeEnum = 99
	PythonPyc27_OpArg_OpCodeEnum__LoadConst PythonPyc27_OpArg_OpCodeEnum = 100
	PythonPyc27_OpArg_OpCodeEnum__LoadName PythonPyc27_OpArg_OpCodeEnum = 101
	PythonPyc27_OpArg_OpCodeEnum__BuildTuple PythonPyc27_OpArg_OpCodeEnum = 102
	PythonPyc27_OpArg_OpCodeEnum__BuildList PythonPyc27_OpArg_OpCodeEnum = 103
	PythonPyc27_OpArg_OpCodeEnum__BuildSet PythonPyc27_OpArg_OpCodeEnum = 104
	PythonPyc27_OpArg_OpCodeEnum__BuildMap PythonPyc27_OpArg_OpCodeEnum = 105
	PythonPyc27_OpArg_OpCodeEnum__LoadAttr PythonPyc27_OpArg_OpCodeEnum = 106
	PythonPyc27_OpArg_OpCodeEnum__CompareOp PythonPyc27_OpArg_OpCodeEnum = 107
	PythonPyc27_OpArg_OpCodeEnum__ImportName PythonPyc27_OpArg_OpCodeEnum = 108
	PythonPyc27_OpArg_OpCodeEnum__ImportFrom PythonPyc27_OpArg_OpCodeEnum = 109
	PythonPyc27_OpArg_OpCodeEnum__JumpForward PythonPyc27_OpArg_OpCodeEnum = 110
	PythonPyc27_OpArg_OpCodeEnum__JumpIfFalseOrPop PythonPyc27_OpArg_OpCodeEnum = 111
	PythonPyc27_OpArg_OpCodeEnum__JumpIfTrueOrPop PythonPyc27_OpArg_OpCodeEnum = 112
	PythonPyc27_OpArg_OpCodeEnum__JumpAbsolute PythonPyc27_OpArg_OpCodeEnum = 113
	PythonPyc27_OpArg_OpCodeEnum__PopJumpIfFalse PythonPyc27_OpArg_OpCodeEnum = 114
	PythonPyc27_OpArg_OpCodeEnum__PopJumpIfTrue PythonPyc27_OpArg_OpCodeEnum = 115
	PythonPyc27_OpArg_OpCodeEnum__LoadGlobal PythonPyc27_OpArg_OpCodeEnum = 116
	PythonPyc27_OpArg_OpCodeEnum__ContinueLoop PythonPyc27_OpArg_OpCodeEnum = 119
	PythonPyc27_OpArg_OpCodeEnum__SetupLoop PythonPyc27_OpArg_OpCodeEnum = 120
	PythonPyc27_OpArg_OpCodeEnum__SetupExcept PythonPyc27_OpArg_OpCodeEnum = 121
	PythonPyc27_OpArg_OpCodeEnum__SetupFinally PythonPyc27_OpArg_OpCodeEnum = 122
	PythonPyc27_OpArg_OpCodeEnum__LoadFast PythonPyc27_OpArg_OpCodeEnum = 124
	PythonPyc27_OpArg_OpCodeEnum__StoreFast PythonPyc27_OpArg_OpCodeEnum = 125
	PythonPyc27_OpArg_OpCodeEnum__DeleteFast PythonPyc27_OpArg_OpCodeEnum = 126
	PythonPyc27_OpArg_OpCodeEnum__RaiseVarargs PythonPyc27_OpArg_OpCodeEnum = 130
	PythonPyc27_OpArg_OpCodeEnum__CallFunction PythonPyc27_OpArg_OpCodeEnum = 131
	PythonPyc27_OpArg_OpCodeEnum__MakeFunction PythonPyc27_OpArg_OpCodeEnum = 132
	PythonPyc27_OpArg_OpCodeEnum__BuildSlice PythonPyc27_OpArg_OpCodeEnum = 133
	PythonPyc27_OpArg_OpCodeEnum__MakeClosure PythonPyc27_OpArg_OpCodeEnum = 134
	PythonPyc27_OpArg_OpCodeEnum__LoadClosure PythonPyc27_OpArg_OpCodeEnum = 135
	PythonPyc27_OpArg_OpCodeEnum__LoadDeref PythonPyc27_OpArg_OpCodeEnum = 136
	PythonPyc27_OpArg_OpCodeEnum__StoreDeref PythonPyc27_OpArg_OpCodeEnum = 137
	PythonPyc27_OpArg_OpCodeEnum__CallFunctionVar PythonPyc27_OpArg_OpCodeEnum = 140
	PythonPyc27_OpArg_OpCodeEnum__CallFunctionKw PythonPyc27_OpArg_OpCodeEnum = 141
	PythonPyc27_OpArg_OpCodeEnum__CallFunctionVarKw PythonPyc27_OpArg_OpCodeEnum = 142
	PythonPyc27_OpArg_OpCodeEnum__SetupWith PythonPyc27_OpArg_OpCodeEnum = 143
	PythonPyc27_OpArg_OpCodeEnum__ExtendedArg PythonPyc27_OpArg_OpCodeEnum = 145
	PythonPyc27_OpArg_OpCodeEnum__SetAdd PythonPyc27_OpArg_OpCodeEnum = 146
	PythonPyc27_OpArg_OpCodeEnum__MapAdd PythonPyc27_OpArg_OpCodeEnum = 147
)
type PythonPyc27_OpArg struct {
	OpCode PythonPyc27_OpArg_OpCodeEnum
	Arg uint16
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_OpArgs
}
func NewPythonPyc27_OpArg() *PythonPyc27_OpArg {
	return &PythonPyc27_OpArg{
	}
}

func (this *PythonPyc27_OpArg) Read(io *kaitai.Stream, parent *PythonPyc27_OpArgs, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.OpCode = PythonPyc27_OpArg_OpCodeEnum(tmp23)
	if (this.OpCode >= PythonPyc27_OpArg_OpCodeEnum__StoreName) {
		tmp24, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Arg = uint16(tmp24)
	}
	return err
}

type PythonPyc27_PyObject_ObjectType int
const (
	PythonPyc27_PyObject_ObjectType__Tuple PythonPyc27_PyObject_ObjectType = 40
	PythonPyc27_PyObject_ObjectType__PyFalse PythonPyc27_PyObject_ObjectType = 70
	PythonPyc27_PyObject_ObjectType__None PythonPyc27_PyObject_ObjectType = 78
	PythonPyc27_PyObject_ObjectType__StringRef PythonPyc27_PyObject_ObjectType = 82
	PythonPyc27_PyObject_ObjectType__PyTrue PythonPyc27_PyObject_ObjectType = 84
	PythonPyc27_PyObject_ObjectType__CodeObject PythonPyc27_PyObject_ObjectType = 99
	PythonPyc27_PyObject_ObjectType__Int PythonPyc27_PyObject_ObjectType = 105
	PythonPyc27_PyObject_ObjectType__String PythonPyc27_PyObject_ObjectType = 115
	PythonPyc27_PyObject_ObjectType__Interned PythonPyc27_PyObject_ObjectType = 116
	PythonPyc27_PyObject_ObjectType__UnicodeString PythonPyc27_PyObject_ObjectType = 117
)
type PythonPyc27_PyObject struct {
	Type PythonPyc27_PyObject_ObjectType
	Value interface{}
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent interface{}
}
func NewPythonPyc27_PyObject() *PythonPyc27_PyObject {
	return &PythonPyc27_PyObject{
	}
}

func (this *PythonPyc27_PyObject) Read(io *kaitai.Stream, parent interface{}, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = PythonPyc27_PyObject_ObjectType(tmp25)
	switch (this.Type) {
	case PythonPyc27_PyObject_ObjectType__String:
		tmp26 := NewPythonPyc27_PyObject_PyString()
		err = tmp26.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp26
	case PythonPyc27_PyObject_ObjectType__Tuple:
		tmp27 := NewPythonPyc27_PyObject_Tuple()
		err = tmp27.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp27
	case PythonPyc27_PyObject_ObjectType__Int:
		tmp28, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp28
	case PythonPyc27_PyObject_ObjectType__PyTrue:
		tmp29 := NewPythonPyc27_PyObject_PyTrue()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp29
	case PythonPyc27_PyObject_ObjectType__PyFalse:
		tmp30 := NewPythonPyc27_PyObject_PyFalse()
		err = tmp30.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp30
	case PythonPyc27_PyObject_ObjectType__None:
		tmp31 := NewPythonPyc27_PyObject_PyNone()
		err = tmp31.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp31
	case PythonPyc27_PyObject_ObjectType__StringRef:
		tmp32 := NewPythonPyc27_PyObject_StringRef()
		err = tmp32.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp32
	case PythonPyc27_PyObject_ObjectType__CodeObject:
		tmp33 := NewPythonPyc27_CodeObject()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp33
	case PythonPyc27_PyObject_ObjectType__Interned:
		tmp34 := NewPythonPyc27_PyObject_InternedString()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp34
	}
	return err
}
type PythonPyc27_PyObject_PyNone struct {
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_PyNone() *PythonPyc27_PyObject_PyNone {
	return &PythonPyc27_PyObject_PyNone{
	}
}

func (this *PythonPyc27_PyObject_PyNone) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
type PythonPyc27_PyObject_PyFalse struct {
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_PyFalse() *PythonPyc27_PyObject_PyFalse {
	return &PythonPyc27_PyObject_PyFalse{
	}
}

func (this *PythonPyc27_PyObject_PyFalse) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
type PythonPyc27_PyObject_StringRef struct {
	InternedListIndex uint32
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_StringRef() *PythonPyc27_PyObject_StringRef {
	return &PythonPyc27_PyObject_StringRef{
	}
}

func (this *PythonPyc27_PyObject_StringRef) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InternedListIndex = uint32(tmp35)
	return err
}
type PythonPyc27_PyObject_PyTrue struct {
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_PyTrue() *PythonPyc27_PyObject_PyTrue {
	return &PythonPyc27_PyObject_PyTrue{
	}
}

func (this *PythonPyc27_PyObject_PyTrue) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
type PythonPyc27_PyObject_Tuple struct {
	Count uint32
	Items []*PythonPyc27_PyObject
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_Tuple() *PythonPyc27_PyObject_Tuple {
	return &PythonPyc27_PyObject_Tuple{
	}
}

func (this *PythonPyc27_PyObject_Tuple) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Count = uint32(tmp36)
	this.Items = make([]*PythonPyc27_PyObject, this.Count)
	for i := range this.Items {
		tmp37 := NewPythonPyc27_PyObject()
		err = tmp37.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items[i] = tmp37
	}
	return err
}
type PythonPyc27_PyObject_UnicodeString struct {
	Length uint32
	Data string
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent interface{}
}
func NewPythonPyc27_PyObject_UnicodeString() *PythonPyc27_PyObject_UnicodeString {
	return &PythonPyc27_PyObject_UnicodeString{
	}
}

func (this *PythonPyc27_PyObject_UnicodeString) Read(io *kaitai.Stream, parent interface{}, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp38)
	tmp39, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp39 = tmp39
	this.Data = string(tmp39)
	return err
}
type PythonPyc27_PyObject_InternedString struct {
	Length uint32
	Data string
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_InternedString() *PythonPyc27_PyObject_InternedString {
	return &PythonPyc27_PyObject_InternedString{
	}
}

func (this *PythonPyc27_PyObject_InternedString) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp40)
	tmp41, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.Data = string(tmp41)
	return err
}
type PythonPyc27_PyObject_PyString struct {
	Length uint32
	Data []byte
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_PyObject
}
func NewPythonPyc27_PyObject_PyString() *PythonPyc27_PyObject_PyString {
	return &PythonPyc27_PyObject_PyString{
	}
}

func (this *PythonPyc27_PyObject_PyString) Read(io *kaitai.Stream, parent *PythonPyc27_PyObject, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp42)
	tmp43, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.Data = tmp43
	return err
}
type PythonPyc27_OpArgs struct {
	Items []*PythonPyc27_OpArg
	_io *kaitai.Stream
	_root *PythonPyc27
	_parent *PythonPyc27_Assembly
}
func NewPythonPyc27_OpArgs() *PythonPyc27_OpArgs {
	return &PythonPyc27_OpArgs{
	}
}

func (this *PythonPyc27_OpArgs) Read(io *kaitai.Stream, parent *PythonPyc27_Assembly, root *PythonPyc27) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp44, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp44 {
			break
		}
		tmp45 := NewPythonPyc27_OpArg()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp45)
	}
	return err
}
