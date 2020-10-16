// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * This spec allows to parse files used by Microsoft Windows family of
 * operating systems to store parts of its "registry". "Registry" is a
 * hierarchical database that is used to store system settings (global
 * configuration, per-user, per-application configuration, etc).
 * 
 * Typically, registry files are stored in:
 * 
 * * System-wide: several files in `%SystemRoot%\System32\Config\`
 * * User-wide:
 *   * `%USERPROFILE%\Ntuser.dat`
 *   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
 *   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
 * 
 * Note that one typically can't access files directly on a mounted
 * filesystem with a running Windows OS.
 * @see <a href="https://github.com/libyal/libregf/blob/master/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc">Source</a>
 */
type Regf struct {
	Header *Regf_FileHeader
	HiveBins []*Regf_HiveBin
	_io *kaitai.Stream
	_root *Regf
	_parent interface{}
	_raw_HiveBins [][]byte
}
func NewRegf() *Regf {
	return &Regf{
	}
}

func (this *Regf) Read(io *kaitai.Stream, parent interface{}, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewRegf_FileHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	this._raw_HiveBins = make([][]byte, 0);
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3, err := this._io.ReadBytes(int(4096))
		if err != nil {
			return err
		}
		tmp3 = tmp3
		this._raw_HiveBins = append(this._raw_HiveBins, tmp3)
		_io__raw_HiveBins := kaitai.NewStream(bytes.NewReader(this._raw_HiveBins[len(this._raw_HiveBins) - 1]))
		tmp4 := NewRegf_HiveBin()
		err = tmp4.Read(_io__raw_HiveBins, this, this._root)
		if err != nil {
			return err
		}
		this.HiveBins = append(this.HiveBins, tmp4)
	}
	return err
}
type Regf_Filetime struct {
	Value uint64
	_io *kaitai.Stream
	_root *Regf
	_parent interface{}
}
func NewRegf_Filetime() *Regf_Filetime {
	return &Regf_Filetime{
	}
}

func (this *Regf_Filetime) Read(io *kaitai.Stream, parent interface{}, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Value = uint64(tmp5)
	return err
}
type Regf_HiveBin struct {
	Header *Regf_HiveBinHeader
	Cells []*Regf_HiveBinCell
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf
}
func NewRegf_HiveBin() *Regf_HiveBin {
	return &Regf_HiveBin{
	}
}

func (this *Regf_HiveBin) Read(io *kaitai.Stream, parent *Regf, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6 := NewRegf_HiveBinHeader()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp6
	for i := 1;; i++ {
		tmp7, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp7 {
			break
		}
		tmp8 := NewRegf_HiveBinCell()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Cells = append(this.Cells, tmp8)
	}
	return err
}
type Regf_HiveBinHeader struct {
	Signature []byte
	Offset uint32
	Size uint32
	Unknown1 uint32
	Unknown2 uint32
	Timestamp *Regf_Filetime
	Unknown4 uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBin
}
func NewRegf_HiveBinHeader() *Regf_HiveBinHeader {
	return &Regf_HiveBinHeader{
	}
}

func (this *Regf_HiveBinHeader) Read(io *kaitai.Stream, parent *Regf_HiveBin, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Signature = tmp9
	if !(bytes.Equal(this.Signature, []uint8{104, 98, 105, 110})) {
		return kaitai.NewValidationNotEqualError([]uint8{104, 98, 105, 110}, this.Signature, this._io, "/types/hive_bin_header/seq/0")
	}
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown1 = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown2 = uint32(tmp13)
	tmp14 := NewRegf_Filetime()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Timestamp = tmp14
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown4 = uint32(tmp15)
	return err
}

/**
 * The offset of the hive bin, Value in bytes and relative from
 * the start of the hive bin data
 */

/**
 * Size of the hive bin
 */

/**
 * 0 most of the time, can contain remnant data
 */

/**
 * 0 most of the time, can contain remnant data
 */

/**
 * Only the root (first) hive bin seems to contain a valid FILETIME
 */

/**
 * Contains number of bytes
 */
type Regf_HiveBinCell struct {
	CellSizeRaw int32
	Identifier string
	Data interface{}
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBin
	_raw_Data []byte
	_f_cellSize bool
	cellSize int
	_f_isAllocated bool
	isAllocated bool
}
func NewRegf_HiveBinCell() *Regf_HiveBinCell {
	return &Regf_HiveBinCell{
	}
}

func (this *Regf_HiveBinCell) Read(io *kaitai.Stream, parent *Regf_HiveBin, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.CellSizeRaw = int32(tmp16)
	tmp17, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this.Identifier = string(tmp17)
	switch (this.Identifier) {
	case "li":
		tmp18, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp19, err := this._io.ReadBytes(int(((tmp18 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp19 = tmp19
		this._raw_Data = tmp19
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp20 := NewRegf_HiveBinCell_SubKeyListLi()
		err = tmp20.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp20
	case "vk":
		tmp21, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp22, err := this._io.ReadBytes(int(((tmp21 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this._raw_Data = tmp22
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp23 := NewRegf_HiveBinCell_SubKeyListVk()
		err = tmp23.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp23
	case "lf":
		tmp24, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp25, err := this._io.ReadBytes(int(((tmp24 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Data = tmp25
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp26 := NewRegf_HiveBinCell_SubKeyListLhLf()
		err = tmp26.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp26
	case "ri":
		tmp27, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp28, err := this._io.ReadBytes(int(((tmp27 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this._raw_Data = tmp28
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp29 := NewRegf_HiveBinCell_SubKeyListRi()
		err = tmp29.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp29
	case "lh":
		tmp30, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp31, err := this._io.ReadBytes(int(((tmp30 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Data = tmp31
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp32 := NewRegf_HiveBinCell_SubKeyListLhLf()
		err = tmp32.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp32
	case "nk":
		tmp33, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp34, err := this._io.ReadBytes(int(((tmp33 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Data = tmp34
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp35 := NewRegf_HiveBinCell_NamedKey()
		err = tmp35.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp35
	case "sk":
		tmp36, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp37, err := this._io.ReadBytes(int(((tmp36 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Data = tmp37
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp38 := NewRegf_HiveBinCell_SubKeyListSk()
		err = tmp38.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp38
	default:
		tmp39, err := this.CellSize()
		if err != nil {
			return err
		}
		tmp40, err := this._io.ReadBytes(int(((tmp39 - 2) - 4)))
		if err != nil {
			return err
		}
		tmp40 = tmp40
		this._raw_Data = tmp40
	}
	return err
}
func (this *Regf_HiveBinCell) CellSize() (v int, err error) {
	if (this._f_cellSize) {
		return this.cellSize, nil
	}
	var tmp41 int;
	if (this.CellSizeRaw < 0) {
		tmp41 = -1
	} else {
		tmp41 = 1
	}
	this.cellSize = int((tmp41 * this.CellSizeRaw))
	this._f_cellSize = true
	return this.cellSize, nil
}
func (this *Regf_HiveBinCell) IsAllocated() (v bool, err error) {
	if (this._f_isAllocated) {
		return this.isAllocated, nil
	}
	this.isAllocated = bool(this.CellSizeRaw < 0)
	this._f_isAllocated = true
	return this.isAllocated, nil
}

type Regf_HiveBinCell_SubKeyListVk_DataTypeEnum int
const (
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegNone Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 0
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegSz Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 1
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegExpandSz Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 2
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegBinary Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 3
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegDword Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 4
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegDwordBigEndian Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 5
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegLink Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 6
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegMultiSz Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 7
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegResourceList Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 8
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegFullResourceDescriptor Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 9
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegResourceRequirementsList Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 10
	Regf_HiveBinCell_SubKeyListVk_DataTypeEnum__RegQword Regf_HiveBinCell_SubKeyListVk_DataTypeEnum = 11
)

type Regf_HiveBinCell_SubKeyListVk_VkFlags int
const (
	Regf_HiveBinCell_SubKeyListVk_VkFlags__ValueCompName Regf_HiveBinCell_SubKeyListVk_VkFlags = 1
)
type Regf_HiveBinCell_SubKeyListVk struct {
	ValueNameSize uint16
	DataSize uint32
	DataOffset uint32
	DataType Regf_HiveBinCell_SubKeyListVk_DataTypeEnum
	Flags Regf_HiveBinCell_SubKeyListVk_VkFlags
	Padding uint16
	ValueName string
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_SubKeyListVk() *Regf_HiveBinCell_SubKeyListVk {
	return &Regf_HiveBinCell_SubKeyListVk{
	}
}

func (this *Regf_HiveBinCell_SubKeyListVk) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ValueNameSize = uint16(tmp42)
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp43)
	tmp44, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataOffset = uint32(tmp44)
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataType = Regf_HiveBinCell_SubKeyListVk_DataTypeEnum(tmp45)
	tmp46, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = Regf_HiveBinCell_SubKeyListVk_VkFlags(tmp46)
	tmp47, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Padding = uint16(tmp47)
	if (this.Flags == Regf_HiveBinCell_SubKeyListVk_VkFlags__ValueCompName) {
		tmp48, err := this._io.ReadBytes(int(this.ValueNameSize))
		if err != nil {
			return err
		}
		tmp48 = tmp48
		this.ValueName = string(tmp48)
	}
	return err
}
type Regf_HiveBinCell_SubKeyListLhLf struct {
	Count uint16
	Items []*Regf_HiveBinCell_SubKeyListLhLf_Item
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_SubKeyListLhLf() *Regf_HiveBinCell_SubKeyListLhLf {
	return &Regf_HiveBinCell_SubKeyListLhLf{
	}
}

func (this *Regf_HiveBinCell_SubKeyListLhLf) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Count = uint16(tmp49)
	this.Items = make([]*Regf_HiveBinCell_SubKeyListLhLf_Item, this.Count)
	for i := range this.Items {
		tmp50 := NewRegf_HiveBinCell_SubKeyListLhLf_Item()
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items[i] = tmp50
	}
	return err
}
type Regf_HiveBinCell_SubKeyListLhLf_Item struct {
	NamedKeyOffset uint32
	HashValue uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell_SubKeyListLhLf
}
func NewRegf_HiveBinCell_SubKeyListLhLf_Item() *Regf_HiveBinCell_SubKeyListLhLf_Item {
	return &Regf_HiveBinCell_SubKeyListLhLf_Item{
	}
}

func (this *Regf_HiveBinCell_SubKeyListLhLf_Item) Read(io *kaitai.Stream, parent *Regf_HiveBinCell_SubKeyListLhLf, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NamedKeyOffset = uint32(tmp51)
	tmp52, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HashValue = uint32(tmp52)
	return err
}
type Regf_HiveBinCell_SubKeyListSk struct {
	Unknown1 uint16
	PreviousSecurityKeyOffset uint32
	NextSecurityKeyOffset uint32
	ReferenceCount uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_SubKeyListSk() *Regf_HiveBinCell_SubKeyListSk {
	return &Regf_HiveBinCell_SubKeyListSk{
	}
}

func (this *Regf_HiveBinCell_SubKeyListSk) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp53, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Unknown1 = uint16(tmp53)
	tmp54, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PreviousSecurityKeyOffset = uint32(tmp54)
	tmp55, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NextSecurityKeyOffset = uint32(tmp55)
	tmp56, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ReferenceCount = uint32(tmp56)
	return err
}
type Regf_HiveBinCell_SubKeyListLi struct {
	Count uint16
	Items []*Regf_HiveBinCell_SubKeyListLi_Item
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_SubKeyListLi() *Regf_HiveBinCell_SubKeyListLi {
	return &Regf_HiveBinCell_SubKeyListLi{
	}
}

func (this *Regf_HiveBinCell_SubKeyListLi) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp57, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Count = uint16(tmp57)
	this.Items = make([]*Regf_HiveBinCell_SubKeyListLi_Item, this.Count)
	for i := range this.Items {
		tmp58 := NewRegf_HiveBinCell_SubKeyListLi_Item()
		err = tmp58.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items[i] = tmp58
	}
	return err
}
type Regf_HiveBinCell_SubKeyListLi_Item struct {
	NamedKeyOffset uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell_SubKeyListLi
}
func NewRegf_HiveBinCell_SubKeyListLi_Item() *Regf_HiveBinCell_SubKeyListLi_Item {
	return &Regf_HiveBinCell_SubKeyListLi_Item{
	}
}

func (this *Regf_HiveBinCell_SubKeyListLi_Item) Read(io *kaitai.Stream, parent *Regf_HiveBinCell_SubKeyListLi, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NamedKeyOffset = uint32(tmp59)
	return err
}

type Regf_HiveBinCell_NamedKey_NkFlags int
const (
	Regf_HiveBinCell_NamedKey_NkFlags__KeyIsVolatile Regf_HiveBinCell_NamedKey_NkFlags = 1
	Regf_HiveBinCell_NamedKey_NkFlags__KeyHiveExit Regf_HiveBinCell_NamedKey_NkFlags = 2
	Regf_HiveBinCell_NamedKey_NkFlags__KeyHiveEntry Regf_HiveBinCell_NamedKey_NkFlags = 4
	Regf_HiveBinCell_NamedKey_NkFlags__KeyNoDelete Regf_HiveBinCell_NamedKey_NkFlags = 8
	Regf_HiveBinCell_NamedKey_NkFlags__KeySymLink Regf_HiveBinCell_NamedKey_NkFlags = 16
	Regf_HiveBinCell_NamedKey_NkFlags__KeyCompName Regf_HiveBinCell_NamedKey_NkFlags = 32
	Regf_HiveBinCell_NamedKey_NkFlags__KeyPrefefHandle Regf_HiveBinCell_NamedKey_NkFlags = 64
	Regf_HiveBinCell_NamedKey_NkFlags__KeyVirtMirrored Regf_HiveBinCell_NamedKey_NkFlags = 128
	Regf_HiveBinCell_NamedKey_NkFlags__KeyVirtTarget Regf_HiveBinCell_NamedKey_NkFlags = 256
	Regf_HiveBinCell_NamedKey_NkFlags__KeyVirtualStore Regf_HiveBinCell_NamedKey_NkFlags = 512
	Regf_HiveBinCell_NamedKey_NkFlags__Unknown1 Regf_HiveBinCell_NamedKey_NkFlags = 4096
	Regf_HiveBinCell_NamedKey_NkFlags__Unknown2 Regf_HiveBinCell_NamedKey_NkFlags = 16384
)
type Regf_HiveBinCell_NamedKey struct {
	Flags Regf_HiveBinCell_NamedKey_NkFlags
	LastKeyWrittenDateAndTime *Regf_Filetime
	Unknown1 uint32
	ParentKeyOffset uint32
	NumberOfSubKeys uint32
	NumberOfVolatileSubKeys uint32
	SubKeysListOffset uint32
	NumberOfValues uint32
	ValuesListOffset uint32
	SecurityKeyOffset uint32
	ClassNameOffset uint32
	LargestSubKeyNameSize uint32
	LargestSubKeyClassNameSize uint32
	LargestValueNameSize uint32
	LargestValueDataSize uint32
	Unknown2 uint32
	KeyNameSize uint16
	ClassNameSize uint16
	UnknownStringSize uint32
	UnknownString string
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_NamedKey() *Regf_HiveBinCell_NamedKey {
	return &Regf_HiveBinCell_NamedKey{
	}
}

func (this *Regf_HiveBinCell_NamedKey) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = Regf_HiveBinCell_NamedKey_NkFlags(tmp60)
	tmp61 := NewRegf_Filetime()
	err = tmp61.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LastKeyWrittenDateAndTime = tmp61
	tmp62, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown1 = uint32(tmp62)
	tmp63, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ParentKeyOffset = uint32(tmp63)
	tmp64, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumberOfSubKeys = uint32(tmp64)
	tmp65, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumberOfVolatileSubKeys = uint32(tmp65)
	tmp66, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SubKeysListOffset = uint32(tmp66)
	tmp67, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumberOfValues = uint32(tmp67)
	tmp68, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ValuesListOffset = uint32(tmp68)
	tmp69, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SecurityKeyOffset = uint32(tmp69)
	tmp70, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClassNameOffset = uint32(tmp70)
	tmp71, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LargestSubKeyNameSize = uint32(tmp71)
	tmp72, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LargestSubKeyClassNameSize = uint32(tmp72)
	tmp73, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LargestValueNameSize = uint32(tmp73)
	tmp74, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LargestValueDataSize = uint32(tmp74)
	tmp75, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown2 = uint32(tmp75)
	tmp76, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.KeyNameSize = uint16(tmp76)
	tmp77, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ClassNameSize = uint16(tmp77)
	tmp78, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.UnknownStringSize = uint32(tmp78)
	tmp79, err := this._io.ReadBytes(int(this.UnknownStringSize))
	if err != nil {
		return err
	}
	tmp79 = tmp79
	this.UnknownString = string(tmp79)
	return err
}
type Regf_HiveBinCell_SubKeyListRi struct {
	Count uint16
	Items []*Regf_HiveBinCell_SubKeyListRi_Item
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell
}
func NewRegf_HiveBinCell_SubKeyListRi() *Regf_HiveBinCell_SubKeyListRi {
	return &Regf_HiveBinCell_SubKeyListRi{
	}
}

func (this *Regf_HiveBinCell_SubKeyListRi) Read(io *kaitai.Stream, parent *Regf_HiveBinCell, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp80, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Count = uint16(tmp80)
	this.Items = make([]*Regf_HiveBinCell_SubKeyListRi_Item, this.Count)
	for i := range this.Items {
		tmp81 := NewRegf_HiveBinCell_SubKeyListRi_Item()
		err = tmp81.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items[i] = tmp81
	}
	return err
}
type Regf_HiveBinCell_SubKeyListRi_Item struct {
	SubKeyListOffset uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf_HiveBinCell_SubKeyListRi
}
func NewRegf_HiveBinCell_SubKeyListRi_Item() *Regf_HiveBinCell_SubKeyListRi_Item {
	return &Regf_HiveBinCell_SubKeyListRi_Item{
	}
}

func (this *Regf_HiveBinCell_SubKeyListRi_Item) Read(io *kaitai.Stream, parent *Regf_HiveBinCell_SubKeyListRi, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp82, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SubKeyListOffset = uint32(tmp82)
	return err
}

type Regf_FileHeader_FileType int
const (
	Regf_FileHeader_FileType__Normal Regf_FileHeader_FileType = 0
	Regf_FileHeader_FileType__TransactionLog Regf_FileHeader_FileType = 1
)

type Regf_FileHeader_FileFormat int
const (
	Regf_FileHeader_FileFormat__DirectMemoryLoad Regf_FileHeader_FileFormat = 1
)
type Regf_FileHeader struct {
	Signature []byte
	PrimarySequenceNumber uint32
	SecondarySequenceNumber uint32
	LastModificationDateAndTime *Regf_Filetime
	MajorVersion uint32
	MinorVersion uint32
	Type Regf_FileHeader_FileType
	Format Regf_FileHeader_FileFormat
	RootKeyOffset uint32
	HiveBinsDataSize uint32
	ClusteringFactor uint32
	Unknown1 []byte
	Unknown2 []byte
	Checksum uint32
	Reserved []byte
	BootType uint32
	BootRecover uint32
	_io *kaitai.Stream
	_root *Regf
	_parent *Regf
}
func NewRegf_FileHeader() *Regf_FileHeader {
	return &Regf_FileHeader{
	}
}

func (this *Regf_FileHeader) Read(io *kaitai.Stream, parent *Regf, root *Regf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp83, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp83 = tmp83
	this.Signature = tmp83
	if !(bytes.Equal(this.Signature, []uint8{114, 101, 103, 102})) {
		return kaitai.NewValidationNotEqualError([]uint8{114, 101, 103, 102}, this.Signature, this._io, "/types/file_header/seq/0")
	}
	tmp84, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PrimarySequenceNumber = uint32(tmp84)
	tmp85, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SecondarySequenceNumber = uint32(tmp85)
	tmp86 := NewRegf_Filetime()
	err = tmp86.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LastModificationDateAndTime = tmp86
	tmp87, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MajorVersion = uint32(tmp87)
	tmp88, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MinorVersion = uint32(tmp88)
	tmp89, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = Regf_FileHeader_FileType(tmp89)
	tmp90, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Format = Regf_FileHeader_FileFormat(tmp90)
	tmp91, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RootKeyOffset = uint32(tmp91)
	tmp92, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HiveBinsDataSize = uint32(tmp92)
	tmp93, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ClusteringFactor = uint32(tmp93)
	tmp94, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp94 = tmp94
	this.Unknown1 = tmp94
	tmp95, err := this._io.ReadBytes(int(396))
	if err != nil {
		return err
	}
	tmp95 = tmp95
	this.Unknown2 = tmp95
	tmp96, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp96)
	tmp97, err := this._io.ReadBytes(int(3576))
	if err != nil {
		return err
	}
	tmp97 = tmp97
	this.Reserved = tmp97
	tmp98, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BootType = uint32(tmp98)
	tmp99, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BootRecover = uint32(tmp99)
	return err
}
