// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * Android OS applications executables are typically stored in its own
 * format, optimized for more efficient execution in Dalvik virtual
 * machine.
 * 
 * This format is loosely similar to Java .class file format and
 * generally holds the similar set of data: i.e. classes, methods,
 * fields, annotations, etc.
 * @see <a href="https://source.android.com/devices/tech/dalvik/dex-format">Source</a>
 */

type Dex_ClassAccessFlags int
const (
	Dex_ClassAccessFlags__Public Dex_ClassAccessFlags = 1
	Dex_ClassAccessFlags__Private Dex_ClassAccessFlags = 2
	Dex_ClassAccessFlags__Protected Dex_ClassAccessFlags = 4
	Dex_ClassAccessFlags__Static Dex_ClassAccessFlags = 8
	Dex_ClassAccessFlags__Final Dex_ClassAccessFlags = 16
	Dex_ClassAccessFlags__Interface Dex_ClassAccessFlags = 512
	Dex_ClassAccessFlags__Abstract Dex_ClassAccessFlags = 1024
	Dex_ClassAccessFlags__Synthetic Dex_ClassAccessFlags = 4096
	Dex_ClassAccessFlags__Annotation Dex_ClassAccessFlags = 8192
	Dex_ClassAccessFlags__Enum Dex_ClassAccessFlags = 16384
)
type Dex struct {
	Header *Dex_HeaderItem
	_io *kaitai.Stream
	_root *Dex
	_parent interface{}
	_f_stringIds bool
	stringIds []*Dex_StringIdItem
	_f_methodIds bool
	methodIds []*Dex_MethodIdItem
	_f_linkData bool
	linkData []byte
	_f_map bool
	map *Dex_MapList
	_f_classDefs bool
	classDefs []*Dex_ClassDefItem
	_f_data bool
	data []byte
	_f_typeIds bool
	typeIds []*Dex_TypeIdItem
	_f_protoIds bool
	protoIds []*Dex_ProtoIdItem
	_f_fieldIds bool
	fieldIds []*Dex_FieldIdItem
}
func NewDex() *Dex {
	return &Dex{
	}
}

func (this *Dex) Read(io *kaitai.Stream, parent interface{}, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewDex_HeaderItem()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	return err
}

/**
 * string identifiers list.
 * 
 * These are identifiers for all the strings used by this file, either for
 * internal naming (e.g., type descriptors) or as constant objects referred to by code.
 * 
 * This list must be sorted by string contents, using UTF-16 code point values
 * (not in a locale-sensitive manner), and it must not contain any duplicate entries.
 */
func (this *Dex) StringIds() (v []*Dex_StringIdItem, err error) {
	if (this._f_stringIds) {
		return this.stringIds, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.StringIdsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.stringIds = make([]*Dex_StringIdItem, this.Header.StringIdsSize)
	for i := range this.stringIds {
		tmp2 := NewDex_StringIdItem()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.stringIds[i] = tmp2
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_stringIds = true
	this._f_stringIds = true
	return this.stringIds, nil
}

/**
 * method identifiers list.
 * 
 * These are identifiers for all methods referred to by this file,
 * whether defined in the file or not.
 * 
 * This list must be sorted, where the defining type (by type_id index
 * is the major order, method name (by string_id index) is the intermediate
 * order, and method prototype (by proto_id index) is the minor order.
 * 
 * The list must not contain any duplicate entries.
 */
func (this *Dex) MethodIds() (v []*Dex_MethodIdItem, err error) {
	if (this._f_methodIds) {
		return this.methodIds, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.MethodIdsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.methodIds = make([]*Dex_MethodIdItem, this.Header.MethodIdsSize)
	for i := range this.methodIds {
		tmp3 := NewDex_MethodIdItem()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.methodIds[i] = tmp3
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_methodIds = true
	this._f_methodIds = true
	return this.methodIds, nil
}

/**
 * data used in statically linked files.
 * 
 * The format of the data in this section is left unspecified by this document.
 * 
 * This section is empty in unlinked files, and runtime implementations may
 * use it as they see fit.
 */
func (this *Dex) LinkData() (v []byte, err error) {
	if (this._f_linkData) {
		return this.linkData, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.LinkOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadBytes(int(this.Header.LinkSize))
	if err != nil {
		return nil, err
	}
	tmp4 = tmp4
	this.linkData = tmp4
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_linkData = true
	this._f_linkData = true
	return this.linkData, nil
}
func (this *Dex) Map() (v *Dex_MapList, err error) {
	if (this._f_map) {
		return this.map, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.MapOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp5 := NewDex_MapList()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.map = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_map = true
	this._f_map = true
	return this.map, nil
}

/**
 * class definitions list.
 * 
 * The classes must be ordered such that a given class's superclass and
 * implemented interfaces appear in the list earlier than the referring class.
 * 
 * Furthermore, it is invalid for a definition for the same-named class to
 * appear more than once in the list.
 */
func (this *Dex) ClassDefs() (v []*Dex_ClassDefItem, err error) {
	if (this._f_classDefs) {
		return this.classDefs, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.ClassDefsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.classDefs = make([]*Dex_ClassDefItem, this.Header.ClassDefsSize)
	for i := range this.classDefs {
		tmp6 := NewDex_ClassDefItem()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.classDefs[i] = tmp6
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_classDefs = true
	this._f_classDefs = true
	return this.classDefs, nil
}

/**
 * data area, containing all the support data for the tables listed above.
 * 
 * Different items have different alignment requirements, and padding bytes
 * are inserted before each item if necessary to achieve proper alignment.
 */
func (this *Dex) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.DataOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7, err := this._io.ReadBytes(int(this.Header.DataSize))
	if err != nil {
		return nil, err
	}
	tmp7 = tmp7
	this.data = tmp7
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}

/**
 * type identifiers list.
 * 
 * These are identifiers for all types (classes, arrays, or primitive types)
 * referred to by this file, whether defined in the file or not.
 * 
 * This list must be sorted by string_id index, and it must not contain any duplicate entries.
 */
func (this *Dex) TypeIds() (v []*Dex_TypeIdItem, err error) {
	if (this._f_typeIds) {
		return this.typeIds, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.TypeIdsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.typeIds = make([]*Dex_TypeIdItem, this.Header.TypeIdsSize)
	for i := range this.typeIds {
		tmp8 := NewDex_TypeIdItem()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.typeIds[i] = tmp8
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_typeIds = true
	this._f_typeIds = true
	return this.typeIds, nil
}

/**
 * method prototype identifiers list.
 * 
 * These are identifiers for all prototypes referred to by this file.
 * 
 * This list must be sorted in return-type (by type_id index) major order,
 * and then by argument list (lexicographic ordering, individual arguments
 * ordered by type_id index). The list must not contain any duplicate entries.
 */
func (this *Dex) ProtoIds() (v []*Dex_ProtoIdItem, err error) {
	if (this._f_protoIds) {
		return this.protoIds, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.ProtoIdsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.protoIds = make([]*Dex_ProtoIdItem, this.Header.ProtoIdsSize)
	for i := range this.protoIds {
		tmp9 := NewDex_ProtoIdItem()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.protoIds[i] = tmp9
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_protoIds = true
	this._f_protoIds = true
	return this.protoIds, nil
}

/**
 * field identifiers list.
 * 
 * These are identifiers for all fields referred to by this file, whether defined in the file or not.
 * 
 * This list must be sorted, where the defining type (by type_id index)
 * is the major order, field name (by string_id index) is the intermediate
 * order, and type (by type_id index) is the minor order.
 * 
 * The list must not contain any duplicate entries.
 */
func (this *Dex) FieldIds() (v []*Dex_FieldIdItem, err error) {
	if (this._f_fieldIds) {
		return this.fieldIds, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.FieldIdsOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.fieldIds = make([]*Dex_FieldIdItem, this.Header.FieldIdsSize)
	for i := range this.fieldIds {
		tmp10 := NewDex_FieldIdItem()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.fieldIds[i] = tmp10
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_fieldIds = true
	this._f_fieldIds = true
	return this.fieldIds, nil
}

type Dex_HeaderItem_EndianConstant int
const (
	Dex_HeaderItem_EndianConstant__EndianConstant Dex_HeaderItem_EndianConstant = 305419896
	Dex_HeaderItem_EndianConstant__ReverseEndianConstant Dex_HeaderItem_EndianConstant = 2018915346
)
type Dex_HeaderItem struct {
	Magic []byte
	VersionStr string
	Checksum uint32
	Signature []byte
	FileSize uint32
	HeaderSize uint32
	EndianTag Dex_HeaderItem_EndianConstant
	LinkSize uint32
	LinkOff uint32
	MapOff uint32
	StringIdsSize uint32
	StringIdsOff uint32
	TypeIdsSize uint32
	TypeIdsOff uint32
	ProtoIdsSize uint32
	ProtoIdsOff uint32
	FieldIdsSize uint32
	FieldIdsOff uint32
	MethodIdsSize uint32
	MethodIdsOff uint32
	ClassDefsSize uint32
	ClassDefsOff uint32
	DataSize uint32
	DataOff uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
}
func NewDex_HeaderItem() *Dex_HeaderItem {
	return &Dex_HeaderItem{
	}
}

func (this *Dex_HeaderItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Magic = tmp11
	if !(bytes.Equal(this.Magic, []uint8{100, 101, 120, 10})) {
		return kaitai.NewValidationNotEqualError([]uint8{100, 101, 120, 10}, this.Magic, this._io, "/types/header_item/seq/0")
	}
	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = kaitai.BytesTerminate(tmp12, 0, false)
	this.VersionStr = string(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp13)
	tmp14, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Signature = tmp14
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSize = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EndianTag = Dex_HeaderItem_EndianConstant(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LinkSize = uint32(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LinkOff = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MapOff = uint32(tmp20)
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StringIdsSize = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StringIdsOff = uint32(tmp22)
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TypeIdsSize = uint32(tmp23)
	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TypeIdsOff = uint32(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProtoIdsSize = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProtoIdsOff = uint32(tmp26)
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FieldIdsSize = uint32(tmp27)
	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FieldIdsOff = uint32(tmp28)
	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MethodIdsSize = uint32(tmp29)
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MethodIdsOff = uint32(tmp30)
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClassDefsSize = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClassDefsOff = uint32(tmp32)
	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataOff = uint32(tmp34)
	return err
}

/**
 * adler32 checksum of the rest of the file (everything but magic and this field);
 * used to detect file corruption
 */

/**
 * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
 * and this field); used to uniquely identify files
 */

/**
 * size of the entire file (including the header), in bytes
 */

/**
 * size of the header (this entire section), in bytes. This allows for at
 * least a limited amount of backwards/forwards compatibility without
 * invalidating the format.
 */

/**
 * size of the link section, or 0 if this file isn't statically linked
 */

/**
 * offset from the start of the file to the link section, or 0 if link_size == 0.
 * The offset, if non-zero, should be to an offset into the link_data section.
 * The format of the data pointed at is left unspecified by this document;
 * this header field (and the previous) are left as hooks for use by runtime implementations.
 */

/**
 * offset from the start of the file to the map item.
 * The offset, which must be non-zero, should be to an offset into the data
 * section, and the data should be in the format specified by "map_list" below.
 */

/**
 * count of strings in the string identifiers list
 */

/**
 * offset from the start of the file to the string identifiers list,
 * or 0 if string_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the string_ids section.
 */

/**
 * count of elements in the type identifiers list, at most 65535
 */

/**
 * offset from the start of the file to the type identifiers list,
 * or 0 if type_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the type_ids section.
 */

/**
 * count of elements in the prototype identifiers list, at most 65535
 */

/**
 * offset from the start of the file to the prototype identifiers list,
 * or 0 if proto_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the proto_ids section.
 */

/**
 * count of elements in the field identifiers list
 */

/**
 * offset from the start of the file to the field identifiers list,
 * or 0 if field_ids_size == 0.
 * The offset, if non-zero, should be to the start of the field_ids section.
 */

/**
 * count of elements in the method identifiers list
 */

/**
 * offset from the start of the file to the method identifiers list,
 * or 0 if method_ids_size == 0.
 * The offset, if non-zero, should be to the start of the method_ids section.
 */

/**
 * count of elements in the class definitions list
 */

/**
 * offset from the start of the file to the class definitions list,
 * or 0 if class_defs_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the class_defs section.
 */

/**
 * Size of data section in bytes. Must be an even multiple of sizeof(uint).
 */

/**
 * offset from the start of the file to the start of the data section.
 */
type Dex_MapList struct {
	Size uint32
	List []*Dex_MapItem
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
}
func NewDex_MapList() *Dex_MapList {
	return &Dex_MapList{
	}
}

func (this *Dex_MapList) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp35)
	this.List = make([]*Dex_MapItem, this.Size)
	for i := range this.List {
		tmp36 := NewDex_MapItem()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.List[i] = tmp36
	}
	return err
}

type Dex_EncodedValue_ValueTypeEnum int
const (
	Dex_EncodedValue_ValueTypeEnum__Byte Dex_EncodedValue_ValueTypeEnum = 0
	Dex_EncodedValue_ValueTypeEnum__Short Dex_EncodedValue_ValueTypeEnum = 2
	Dex_EncodedValue_ValueTypeEnum__Char Dex_EncodedValue_ValueTypeEnum = 3
	Dex_EncodedValue_ValueTypeEnum__Int Dex_EncodedValue_ValueTypeEnum = 4
	Dex_EncodedValue_ValueTypeEnum__Long Dex_EncodedValue_ValueTypeEnum = 6
	Dex_EncodedValue_ValueTypeEnum__Float Dex_EncodedValue_ValueTypeEnum = 16
	Dex_EncodedValue_ValueTypeEnum__Double Dex_EncodedValue_ValueTypeEnum = 17
	Dex_EncodedValue_ValueTypeEnum__MethodType Dex_EncodedValue_ValueTypeEnum = 21
	Dex_EncodedValue_ValueTypeEnum__MethodHandle Dex_EncodedValue_ValueTypeEnum = 22
	Dex_EncodedValue_ValueTypeEnum__String Dex_EncodedValue_ValueTypeEnum = 23
	Dex_EncodedValue_ValueTypeEnum__Type Dex_EncodedValue_ValueTypeEnum = 24
	Dex_EncodedValue_ValueTypeEnum__Field Dex_EncodedValue_ValueTypeEnum = 25
	Dex_EncodedValue_ValueTypeEnum__Method Dex_EncodedValue_ValueTypeEnum = 26
	Dex_EncodedValue_ValueTypeEnum__Enum Dex_EncodedValue_ValueTypeEnum = 27
	Dex_EncodedValue_ValueTypeEnum__Array Dex_EncodedValue_ValueTypeEnum = 28
	Dex_EncodedValue_ValueTypeEnum__Annotation Dex_EncodedValue_ValueTypeEnum = 29
	Dex_EncodedValue_ValueTypeEnum__Null Dex_EncodedValue_ValueTypeEnum = 30
	Dex_EncodedValue_ValueTypeEnum__Boolean Dex_EncodedValue_ValueTypeEnum = 31
)
type Dex_EncodedValue struct {
	ValueArg uint64
	ValueType Dex_EncodedValue_ValueTypeEnum
	Value interface{}
	_io *kaitai.Stream
	_root *Dex
	_parent interface{}
}
func NewDex_EncodedValue() *Dex_EncodedValue {
	return &Dex_EncodedValue{
	}
}

func (this *Dex_EncodedValue) Read(io *kaitai.Stream, parent interface{}, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.ValueArg = tmp37
	tmp38, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.ValueType = Dex_EncodedValue_ValueTypeEnum(tmp38)
	this._io.AlignToByte()
	switch (this.ValueType) {
	case Dex_EncodedValue_ValueTypeEnum__Int:
		tmp39, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Value = tmp39
	case Dex_EncodedValue_ValueTypeEnum__Annotation:
		tmp40 := NewDex_EncodedAnnotation()
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp40
	case Dex_EncodedValue_ValueTypeEnum__Long:
		tmp41, err := this._io.ReadS8le()
		if err != nil {
			return err
		}
		this.Value = tmp41
	case Dex_EncodedValue_ValueTypeEnum__MethodHandle:
		tmp42, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp42
	case Dex_EncodedValue_ValueTypeEnum__Byte:
		tmp43, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Value = tmp43
	case Dex_EncodedValue_ValueTypeEnum__Array:
		tmp44 := NewDex_EncodedArray()
		err = tmp44.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp44
	case Dex_EncodedValue_ValueTypeEnum__MethodType:
		tmp45, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp45
	case Dex_EncodedValue_ValueTypeEnum__Short:
		tmp46, err := this._io.ReadS2le()
		if err != nil {
			return err
		}
		this.Value = tmp46
	case Dex_EncodedValue_ValueTypeEnum__Method:
		tmp47, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp47
	case Dex_EncodedValue_ValueTypeEnum__Double:
		tmp48, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.Value = tmp48
	case Dex_EncodedValue_ValueTypeEnum__Float:
		tmp49, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Value = tmp49
	case Dex_EncodedValue_ValueTypeEnum__Type:
		tmp50, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp50
	case Dex_EncodedValue_ValueTypeEnum__Enum:
		tmp51, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp51
	case Dex_EncodedValue_ValueTypeEnum__Field:
		tmp52, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp52
	case Dex_EncodedValue_ValueTypeEnum__String:
		tmp53, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp53
	case Dex_EncodedValue_ValueTypeEnum__Char:
		tmp54, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Value = tmp54
	}
	return err
}
type Dex_CallSiteIdItem struct {
	CallSiteOff uint32
	_io *kaitai.Stream
	_root *Dex
	_parent interface{}
}
func NewDex_CallSiteIdItem() *Dex_CallSiteIdItem {
	return &Dex_CallSiteIdItem{
	}
}

func (this *Dex_CallSiteIdItem) Read(io *kaitai.Stream, parent interface{}, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp55, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CallSiteOff = uint32(tmp55)
	return err
}

/**
 * offset from the start of the file to call site definition.
 * 
 * The offset should be in the data section, and the data there should
 * be in the format specified by "call_site_item" below.
 */
type Dex_MethodIdItem struct {
	ClassIdx uint16
	ProtoIdx uint16
	NameIdx uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_className bool
	className string
	_f_protoDesc bool
	protoDesc string
	_f_methodName bool
	methodName string
}
func NewDex_MethodIdItem() *Dex_MethodIdItem {
	return &Dex_MethodIdItem{
	}
}

func (this *Dex_MethodIdItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp56, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ClassIdx = uint16(tmp56)
	tmp57, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProtoIdx = uint16(tmp57)
	tmp58, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameIdx = uint32(tmp58)
	return err
}

/**
 * the definer of this method
 */
func (this *Dex_MethodIdItem) ClassName() (v string, err error) {
	if (this._f_className) {
		return this.className, nil
	}
	tmp59, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp60, err := tmp59[this.ClassIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.className = string(tmp60)
	this._f_className = true
	return this.className, nil
}

/**
 * the short-form descriptor of the prototype of this method
 */
func (this *Dex_MethodIdItem) ProtoDesc() (v string, err error) {
	if (this._f_protoDesc) {
		return this.protoDesc, nil
	}
	tmp61, err := this._root.ProtoIds()
	if err != nil {
		return "", err
	}
	tmp62, err := tmp61[this.ProtoIdx].ShortyDesc()
	if err != nil {
		return "", err
	}
	this.protoDesc = string(tmp62)
	this._f_protoDesc = true
	return this.protoDesc, nil
}

/**
 * the name of this method
 */
func (this *Dex_MethodIdItem) MethodName() (v string, err error) {
	if (this._f_methodName) {
		return this.methodName, nil
	}
	tmp63, err := this._root.StringIds()
	if err != nil {
		return "", err
	}
	tmp64, err := tmp63[this.NameIdx].Value()
	if err != nil {
		return "", err
	}
	this.methodName = string(tmp64.Data)
	this._f_methodName = true
	return this.methodName, nil
}

/**
 * index into the type_ids list for the definer of this method.
 * This must be a class or array type, and not a primitive type.
 */

/**
 * index into the proto_ids list for the prototype of this method
 */

/**
 * index into the string_ids list for the name of this method.
 * The string must conform to the syntax for MemberName, defined above.
 */
type Dex_TypeItem struct {
	TypeIdx uint16
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_TypeList
	_f_value bool
	value string
}
func NewDex_TypeItem() *Dex_TypeItem {
	return &Dex_TypeItem{
	}
}

func (this *Dex_TypeItem) Read(io *kaitai.Stream, parent *Dex_TypeList, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp65, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.TypeIdx = uint16(tmp65)
	return err
}
func (this *Dex_TypeItem) Value() (v string, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp66, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp67, err := tmp66[this.TypeIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.value = string(tmp67)
	this._f_value = true
	return this.value, nil
}
type Dex_TypeIdItem struct {
	DescriptorIdx uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_typeName bool
	typeName string
}
func NewDex_TypeIdItem() *Dex_TypeIdItem {
	return &Dex_TypeIdItem{
	}
}

func (this *Dex_TypeIdItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DescriptorIdx = uint32(tmp68)
	return err
}
func (this *Dex_TypeIdItem) TypeName() (v string, err error) {
	if (this._f_typeName) {
		return this.typeName, nil
	}
	tmp69, err := this._root.StringIds()
	if err != nil {
		return "", err
	}
	tmp70, err := tmp69[this.DescriptorIdx].Value()
	if err != nil {
		return "", err
	}
	this.typeName = string(tmp70.Data)
	this._f_typeName = true
	return this.typeName, nil
}

/**
 * index into the string_ids list for the descriptor string of this type.
 * The string must conform to the syntax for TypeDescriptor, defined above.
 */
type Dex_AnnotationElement struct {
	NameIdx *VlqBase128Le
	Value *Dex_EncodedValue
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_EncodedAnnotation
}
func NewDex_AnnotationElement() *Dex_AnnotationElement {
	return &Dex_AnnotationElement{
	}
}

func (this *Dex_AnnotationElement) Read(io *kaitai.Stream, parent *Dex_EncodedAnnotation, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp71 := NewVlqBase128Le()
	err = tmp71.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NameIdx = tmp71
	tmp72 := NewDex_EncodedValue()
	err = tmp72.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Value = tmp72
	return err
}

/**
 * element name, represented as an index into the string_ids section.
 * 
 * The string must conform to the syntax for MemberName, defined above.
 */

/**
 * element value
 */
type Dex_EncodedField struct {
	FieldIdxDiff *VlqBase128Le
	AccessFlags *VlqBase128Le
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_ClassDataItem
}
func NewDex_EncodedField() *Dex_EncodedField {
	return &Dex_EncodedField{
	}
}

func (this *Dex_EncodedField) Read(io *kaitai.Stream, parent *Dex_ClassDataItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp73 := NewVlqBase128Le()
	err = tmp73.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.FieldIdxDiff = tmp73
	tmp74 := NewVlqBase128Le()
	err = tmp74.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.AccessFlags = tmp74
	return err
}

/**
 * index into the field_ids list for the identity of this field
 * (includes the name and descriptor), represented as a difference
 * from the index of previous element in the list.
 * 
 * The index of the first element in a list is represented directly.
 */

/**
 * access flags for the field (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */
type Dex_EncodedArrayItem struct {
	Value *Dex_EncodedArray
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_ClassDefItem
}
func NewDex_EncodedArrayItem() *Dex_EncodedArrayItem {
	return &Dex_EncodedArrayItem{
	}
}

func (this *Dex_EncodedArrayItem) Read(io *kaitai.Stream, parent *Dex_ClassDefItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp75 := NewDex_EncodedArray()
	err = tmp75.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Value = tmp75
	return err
}
type Dex_ClassDataItem struct {
	StaticFieldsSize *VlqBase128Le
	InstanceFieldsSize *VlqBase128Le
	DirectMethodsSize *VlqBase128Le
	VirtualMethodsSize *VlqBase128Le
	StaticFields []*Dex_EncodedField
	InstanceFields []*Dex_EncodedField
	DirectMethods []*Dex_EncodedMethod
	VirtualMethods []*Dex_EncodedMethod
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_ClassDefItem
}
func NewDex_ClassDataItem() *Dex_ClassDataItem {
	return &Dex_ClassDataItem{
	}
}

func (this *Dex_ClassDataItem) Read(io *kaitai.Stream, parent *Dex_ClassDefItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp76 := NewVlqBase128Le()
	err = tmp76.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.StaticFieldsSize = tmp76
	tmp77 := NewVlqBase128Le()
	err = tmp77.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.InstanceFieldsSize = tmp77
	tmp78 := NewVlqBase128Le()
	err = tmp78.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.DirectMethodsSize = tmp78
	tmp79 := NewVlqBase128Le()
	err = tmp79.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.VirtualMethodsSize = tmp79
	tmp80, err := this.StaticFieldsSize.Value()
	if err != nil {
		return err
	}
	this.StaticFields = make([]*Dex_EncodedField, tmp80)
	for i := range this.StaticFields {
		tmp81 := NewDex_EncodedField()
		err = tmp81.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.StaticFields[i] = tmp81
	}
	tmp82, err := this.InstanceFieldsSize.Value()
	if err != nil {
		return err
	}
	this.InstanceFields = make([]*Dex_EncodedField, tmp82)
	for i := range this.InstanceFields {
		tmp83 := NewDex_EncodedField()
		err = tmp83.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.InstanceFields[i] = tmp83
	}
	tmp84, err := this.DirectMethodsSize.Value()
	if err != nil {
		return err
	}
	this.DirectMethods = make([]*Dex_EncodedMethod, tmp84)
	for i := range this.DirectMethods {
		tmp85 := NewDex_EncodedMethod()
		err = tmp85.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.DirectMethods[i] = tmp85
	}
	tmp86, err := this.VirtualMethodsSize.Value()
	if err != nil {
		return err
	}
	this.VirtualMethods = make([]*Dex_EncodedMethod, tmp86)
	for i := range this.VirtualMethods {
		tmp87 := NewDex_EncodedMethod()
		err = tmp87.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.VirtualMethods[i] = tmp87
	}
	return err
}

/**
 * the number of static fields defined in this item
 */

/**
 * the number of instance fields defined in this item
 */

/**
 * the number of direct methods defined in this item
 */

/**
 * the number of virtual methods defined in this item
 */

/**
 * the defined static fields, represented as a sequence of encoded elements.
 * 
 * The fields must be sorted by field_idx in increasing order.
 */

/**
 * the defined instance fields, represented as a sequence of encoded elements.
 * 
 * The fields must be sorted by field_idx in increasing order.
 */

/**
 * the defined direct (any of static, private, or constructor) methods,
 * represented as a sequence of encoded elements.
 * 
 * The methods must be sorted by method_idx in increasing order.
 */

/**
 * the defined virtual (none of static, private, or constructor) methods,
 * represented as a sequence of encoded elements.
 * 
 * This list should not include inherited methods unless overridden by
 * the class that this item represents.
 * 
 * The methods must be sorted by method_idx in increasing order.
 * 
 * The method_idx of a virtual method must not be the same as any direct method.
 */
type Dex_FieldIdItem struct {
	ClassIdx uint16
	TypeIdx uint16
	NameIdx uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_className bool
	className string
	_f_typeName bool
	typeName string
	_f_fieldName bool
	fieldName string
}
func NewDex_FieldIdItem() *Dex_FieldIdItem {
	return &Dex_FieldIdItem{
	}
}

func (this *Dex_FieldIdItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp88, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ClassIdx = uint16(tmp88)
	tmp89, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.TypeIdx = uint16(tmp89)
	tmp90, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameIdx = uint32(tmp90)
	return err
}

/**
 * the definer of this field
 */
func (this *Dex_FieldIdItem) ClassName() (v string, err error) {
	if (this._f_className) {
		return this.className, nil
	}
	tmp91, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp92, err := tmp91[this.ClassIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.className = string(tmp92)
	this._f_className = true
	return this.className, nil
}

/**
 * the type of this field
 */
func (this *Dex_FieldIdItem) TypeName() (v string, err error) {
	if (this._f_typeName) {
		return this.typeName, nil
	}
	tmp93, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp94, err := tmp93[this.TypeIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.typeName = string(tmp94)
	this._f_typeName = true
	return this.typeName, nil
}

/**
 * the name of this field
 */
func (this *Dex_FieldIdItem) FieldName() (v string, err error) {
	if (this._f_fieldName) {
		return this.fieldName, nil
	}
	tmp95, err := this._root.StringIds()
	if err != nil {
		return "", err
	}
	tmp96, err := tmp95[this.NameIdx].Value()
	if err != nil {
		return "", err
	}
	this.fieldName = string(tmp96.Data)
	this._f_fieldName = true
	return this.fieldName, nil
}

/**
 * index into the type_ids list for the definer of this field.
 * This must be a class type, and not an array or primitive type.
 */

/**
 * index into the type_ids list for the type of this field
 */

/**
 * index into the string_ids list for the name of this field.
 * The string must conform to the syntax for MemberName, defined above.
 */
type Dex_EncodedAnnotation struct {
	TypeIdx *VlqBase128Le
	Size *VlqBase128Le
	Elements []*Dex_AnnotationElement
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_EncodedValue
}
func NewDex_EncodedAnnotation() *Dex_EncodedAnnotation {
	return &Dex_EncodedAnnotation{
	}
}

func (this *Dex_EncodedAnnotation) Read(io *kaitai.Stream, parent *Dex_EncodedValue, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp97 := NewVlqBase128Le()
	err = tmp97.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.TypeIdx = tmp97
	tmp98 := NewVlqBase128Le()
	err = tmp98.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Size = tmp98
	tmp99, err := this.Size.Value()
	if err != nil {
		return err
	}
	this.Elements = make([]*Dex_AnnotationElement, tmp99)
	for i := range this.Elements {
		tmp100 := NewDex_AnnotationElement()
		err = tmp100.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Elements[i] = tmp100
	}
	return err
}

/**
 * type of the annotation.
 * 
 * This must be a class (not array or primitive) type.
 */

/**
 * number of name-value mappings in this annotation
 */

/**
 * elements of the annotation, represented directly in-line (not as offsets).
 * 
 * Elements must be sorted in increasing order by string_id index.
 */
type Dex_ClassDefItem struct {
	ClassIdx uint32
	AccessFlags Dex_ClassAccessFlags
	SuperclassIdx uint32
	InterfacesOff uint32
	SourceFileIdx uint32
	AnnotationsOff uint32
	ClassDataOff uint32
	StaticValuesOff uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_typeName bool
	typeName string
	_f_classData bool
	classData *Dex_ClassDataItem
	_f_staticValues bool
	staticValues *Dex_EncodedArrayItem
}
func NewDex_ClassDefItem() *Dex_ClassDefItem {
	return &Dex_ClassDefItem{
	}
}

func (this *Dex_ClassDefItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp101, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClassIdx = uint32(tmp101)
	tmp102, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AccessFlags = Dex_ClassAccessFlags(tmp102)
	tmp103, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SuperclassIdx = uint32(tmp103)
	tmp104, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InterfacesOff = uint32(tmp104)
	tmp105, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SourceFileIdx = uint32(tmp105)
	tmp106, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AnnotationsOff = uint32(tmp106)
	tmp107, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClassDataOff = uint32(tmp107)
	tmp108, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StaticValuesOff = uint32(tmp108)
	return err
}
func (this *Dex_ClassDefItem) TypeName() (v string, err error) {
	if (this._f_typeName) {
		return this.typeName, nil
	}
	tmp109, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp110, err := tmp109[this.ClassIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.typeName = string(tmp110)
	this._f_typeName = true
	return this.typeName, nil
}
func (this *Dex_ClassDefItem) ClassData() (v *Dex_ClassDataItem, err error) {
	if (this._f_classData) {
		return this.classData, nil
	}
	if (this.ClassDataOff != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.ClassDataOff), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp111 := NewDex_ClassDataItem()
		err = tmp111.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.classData = tmp111
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_classData = true
	}
	this._f_classData = true
	return this.classData, nil
}
func (this *Dex_ClassDefItem) StaticValues() (v *Dex_EncodedArrayItem, err error) {
	if (this._f_staticValues) {
		return this.staticValues, nil
	}
	if (this.StaticValuesOff != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.StaticValuesOff), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp112 := NewDex_EncodedArrayItem()
		err = tmp112.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.staticValues = tmp112
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_staticValues = true
	}
	this._f_staticValues = true
	return this.staticValues, nil
}

/**
 * index into the type_ids list for this class.
 * 
 * This must be a class type, and not an array or primitive type.
 */

/**
 * access flags for the class (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */

/**
 * index into the type_ids list for the superclass,
 * or the constant value NO_INDEX if this class has no superclass
 * (i.e., it is a root class such as Object).
 * 
 * If present, this must be a class type, and not an array or primitive type.
 */

/**
 * offset from the start of the file to the list of interfaces, or 0 if there are none.
 * 
 * This offset should be in the data section, and the data there should
 * be in the format specified by "type_list" below. Each of the elements
 * of the list must be a class type (not an array or primitive type),
 * and there must not be any duplicates.
 */

/**
 * index into the string_ids list for the name of the file containing
 * the original source for (at least most of) this class, or the
 * special value NO_INDEX to represent a lack of this information.
 * 
 * The debug_info_item of any given method may override this source file,
 * but the expectation is that most classes will only come from one source file.
 */

/**
 * offset from the start of the file to the annotations structure for
 * this class, or 0 if there are no annotations on this class.
 * 
 * This offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "annotations_directory_item"
 * below,with all items referring to this class as the definer.
 */

/**
 * offset from the start of the file to the associated class data for this
 * item, or 0 if there is no class data for this class.
 * 
 * (This may be the case, for example, if this class is a marker interface.)
 * 
 * The offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "class_data_item" below,
 * with all items referring to this class as the definer.
 */

/**
 * offset from the start of the file to the list of initial values for
 * static fields, or 0 if there are none (and all static fields are to be
 * initialized with 0 or null).
 * 
 * This offset should be in the data section, and the data there should
 * be in the format specified by "encoded_array_item" below.
 * 
 * The size of the array must be no larger than the number of static fields
 * declared by this class, and the elements correspond to the static fields
 * in the same order as declared in the corresponding field_list.
 * 
 * The type of each array element must match the declared type of its
 * corresponding field.
 * 
 * If there are fewer elements in the array than there are static fields,
 * then the leftover fields are initialized with a type-appropriate 0 or null.
 */
type Dex_TypeList struct {
	Size uint32
	List []*Dex_TypeItem
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_ProtoIdItem
}
func NewDex_TypeList() *Dex_TypeList {
	return &Dex_TypeList{
	}
}

func (this *Dex_TypeList) Read(io *kaitai.Stream, parent *Dex_ProtoIdItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp113, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp113)
	this.List = make([]*Dex_TypeItem, this.Size)
	for i := range this.List {
		tmp114 := NewDex_TypeItem()
		err = tmp114.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.List[i] = tmp114
	}
	return err
}
type Dex_StringIdItem struct {
	StringDataOff uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_value bool
	value *Dex_StringIdItem_StringDataItem
}
func NewDex_StringIdItem() *Dex_StringIdItem {
	return &Dex_StringIdItem{
	}
}

func (this *Dex_StringIdItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp115, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StringDataOff = uint32(tmp115)
	return err
}
func (this *Dex_StringIdItem) Value() (v *Dex_StringIdItem_StringDataItem, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.StringDataOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp116 := NewDex_StringIdItem_StringDataItem()
	err = tmp116.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.value = tmp116
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}

/**
 * offset from the start of the file to the string data for this item.
 * The offset should be to a location in the data section, and the data
 * should be in the format specified by "string_data_item" below.
 * There is no alignment requirement for the offset.
 */
type Dex_StringIdItem_StringDataItem struct {
	Utf16Size *VlqBase128Le
	Data string
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_StringIdItem
}
func NewDex_StringIdItem_StringDataItem() *Dex_StringIdItem_StringDataItem {
	return &Dex_StringIdItem_StringDataItem{
	}
}

func (this *Dex_StringIdItem_StringDataItem) Read(io *kaitai.Stream, parent *Dex_StringIdItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp117 := NewVlqBase128Le()
	err = tmp117.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Utf16Size = tmp117
	tmp118, err := this.Utf16Size.Value()
	if err != nil {
		return err
	}
	tmp119, err := this._io.ReadBytes(int(tmp118))
	if err != nil {
		return err
	}
	tmp119 = tmp119
	this.Data = string(tmp119)
	return err
}
type Dex_ProtoIdItem struct {
	ShortyIdx uint32
	ReturnTypeIdx uint32
	ParametersOff uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex
	_f_shortyDesc bool
	shortyDesc string
	_f_paramsTypes bool
	paramsTypes *Dex_TypeList
	_f_returnType bool
	returnType string
}
func NewDex_ProtoIdItem() *Dex_ProtoIdItem {
	return &Dex_ProtoIdItem{
	}
}

func (this *Dex_ProtoIdItem) Read(io *kaitai.Stream, parent *Dex, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp120, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ShortyIdx = uint32(tmp120)
	tmp121, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ReturnTypeIdx = uint32(tmp121)
	tmp122, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ParametersOff = uint32(tmp122)
	return err
}

/**
 * short-form descriptor string of this prototype, as pointed to by shorty_idx
 */
func (this *Dex_ProtoIdItem) ShortyDesc() (v string, err error) {
	if (this._f_shortyDesc) {
		return this.shortyDesc, nil
	}
	tmp123, err := this._root.StringIds()
	if err != nil {
		return "", err
	}
	tmp124, err := tmp123[this.ShortyIdx].Value()
	if err != nil {
		return "", err
	}
	this.shortyDesc = string(tmp124.Data)
	this._f_shortyDesc = true
	return this.shortyDesc, nil
}

/**
 * list of parameter types for this prototype
 */
func (this *Dex_ProtoIdItem) ParamsTypes() (v *Dex_TypeList, err error) {
	if (this._f_paramsTypes) {
		return this.paramsTypes, nil
	}
	if (this.ParametersOff != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.ParametersOff), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp125 := NewDex_TypeList()
		err = tmp125.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.paramsTypes = tmp125
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_paramsTypes = true
	}
	this._f_paramsTypes = true
	return this.paramsTypes, nil
}

/**
 * return type of this prototype
 */
func (this *Dex_ProtoIdItem) ReturnType() (v string, err error) {
	if (this._f_returnType) {
		return this.returnType, nil
	}
	tmp126, err := this._root.TypeIds()
	if err != nil {
		return "", err
	}
	tmp127, err := tmp126[this.ReturnTypeIdx].TypeName()
	if err != nil {
		return "", err
	}
	this.returnType = string(tmp127)
	this._f_returnType = true
	return this.returnType, nil
}

/**
 * index into the string_ids list for the short-form descriptor string of this prototype.
 * The string must conform to the syntax for ShortyDescriptor, defined above,
 * and must correspond to the return type and parameters of this item.
 */

/**
 * index into the type_ids list for the return type of this prototype
 */

/**
 * offset from the start of the file to the list of parameter types for this prototype,
 * or 0 if this prototype has no parameters.
 * This offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "type_list" below.
 * Additionally, there should be no reference to the type void in the list.
 */
type Dex_EncodedMethod struct {
	MethodIdxDiff *VlqBase128Le
	AccessFlags *VlqBase128Le
	CodeOff *VlqBase128Le
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_ClassDataItem
}
func NewDex_EncodedMethod() *Dex_EncodedMethod {
	return &Dex_EncodedMethod{
	}
}

func (this *Dex_EncodedMethod) Read(io *kaitai.Stream, parent *Dex_ClassDataItem, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp128 := NewVlqBase128Le()
	err = tmp128.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.MethodIdxDiff = tmp128
	tmp129 := NewVlqBase128Le()
	err = tmp129.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.AccessFlags = tmp129
	tmp130 := NewVlqBase128Le()
	err = tmp130.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.CodeOff = tmp130
	return err
}

/**
 * index into the method_ids list for the identity of this method
 * (includes the name and descriptor), represented as a difference
 * from the index of previous element in the list.
 * 
 * The index of the first element in a list is represented directly.
 */

/**
 * access flags for the field (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */

/**
 * offset from the start of the file to the code structure for this method,
 * or 0 if this method is either abstract or native.
 * 
 * The offset should be to a location in the data section.
 * 
 * The format of the data is specified by "code_item" below.
 */

type Dex_MapItem_MapItemType int
const (
	Dex_MapItem_MapItemType__HeaderItem Dex_MapItem_MapItemType = 0
	Dex_MapItem_MapItemType__StringIdItem Dex_MapItem_MapItemType = 1
	Dex_MapItem_MapItemType__TypeIdItem Dex_MapItem_MapItemType = 2
	Dex_MapItem_MapItemType__ProtoIdItem Dex_MapItem_MapItemType = 3
	Dex_MapItem_MapItemType__FieldIdItem Dex_MapItem_MapItemType = 4
	Dex_MapItem_MapItemType__MethodIdItem Dex_MapItem_MapItemType = 5
	Dex_MapItem_MapItemType__ClassDefItem Dex_MapItem_MapItemType = 6
	Dex_MapItem_MapItemType__CallSiteIdItem Dex_MapItem_MapItemType = 7
	Dex_MapItem_MapItemType__MethodHandleItem Dex_MapItem_MapItemType = 8
	Dex_MapItem_MapItemType__MapList Dex_MapItem_MapItemType = 4096
	Dex_MapItem_MapItemType__TypeList Dex_MapItem_MapItemType = 4097
	Dex_MapItem_MapItemType__AnnotationSetRefList Dex_MapItem_MapItemType = 4098
	Dex_MapItem_MapItemType__AnnotationSetItem Dex_MapItem_MapItemType = 4099
	Dex_MapItem_MapItemType__ClassDataItem Dex_MapItem_MapItemType = 8192
	Dex_MapItem_MapItemType__CodeItem Dex_MapItem_MapItemType = 8193
	Dex_MapItem_MapItemType__StringDataItem Dex_MapItem_MapItemType = 8194
	Dex_MapItem_MapItemType__DebugInfoItem Dex_MapItem_MapItemType = 8195
	Dex_MapItem_MapItemType__AnnotationItem Dex_MapItem_MapItemType = 8196
	Dex_MapItem_MapItemType__EncodedArrayItem Dex_MapItem_MapItemType = 8197
	Dex_MapItem_MapItemType__AnnotationsDirectoryItem Dex_MapItem_MapItemType = 8198
)
type Dex_MapItem struct {
	Type Dex_MapItem_MapItemType
	Unused uint16
	Size uint32
	Offset uint32
	_io *kaitai.Stream
	_root *Dex
	_parent *Dex_MapList
}
func NewDex_MapItem() *Dex_MapItem {
	return &Dex_MapItem{
	}
}

func (this *Dex_MapItem) Read(io *kaitai.Stream, parent *Dex_MapList, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp131, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = Dex_MapItem_MapItemType(tmp131)
	tmp132, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Unused = uint16(tmp132)
	tmp133, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp133)
	tmp134, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp134)
	return err
}

/**
 * type of the items; see table below
 */

/**
 * (unused)
 */

/**
 * count of the number of items to be found at the indicated offset
 */

/**
 * offset from the start of the file to the items in question
 */
type Dex_EncodedArray struct {
	Size *VlqBase128Le
	Values []*Dex_EncodedValue
	_io *kaitai.Stream
	_root *Dex
	_parent interface{}
}
func NewDex_EncodedArray() *Dex_EncodedArray {
	return &Dex_EncodedArray{
	}
}

func (this *Dex_EncodedArray) Read(io *kaitai.Stream, parent interface{}, root *Dex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp135 := NewVlqBase128Le()
	err = tmp135.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Size = tmp135
	tmp136, err := this.Size.Value()
	if err != nil {
		return err
	}
	this.Values = make([]*Dex_EncodedValue, tmp136)
	for i := range this.Values {
		tmp137 := NewDex_EncodedValue()
		err = tmp137.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Values[i] = tmp137
	}
	return err
}
