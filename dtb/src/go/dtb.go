// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name–value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 * @see <a href="https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html">Source</a>
 * @see <a href="https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf">Source</a>
 */

type Dtb_Fdt int
const (
	Dtb_Fdt__BeginNode Dtb_Fdt = 1
	Dtb_Fdt__EndNode Dtb_Fdt = 2
	Dtb_Fdt__Prop Dtb_Fdt = 3
	Dtb_Fdt__Nop Dtb_Fdt = 4
	Dtb_Fdt__End Dtb_Fdt = 9
)
type Dtb struct {
	Magic []byte
	TotalSize uint32
	OfsStructureBlock uint32
	OfsStringsBlock uint32
	OfsMemoryReservationBlock uint32
	Version uint32
	MinCompatibleVersion uint32
	BootCpuidPhys uint32
	LenStringsBlock uint32
	LenStructureBlock uint32
	_io *kaitai.Stream
	_root *Dtb
	_parent interface{}
	_raw_memoryReservationBlock []byte
	_raw_structureBlock []byte
	_raw_stringsBlock []byte
	_f_memoryReservationBlock bool
	memoryReservationBlock *Dtb_MemoryBlock
	_f_structureBlock bool
	structureBlock *Dtb_FdtBlock
	_f_stringsBlock bool
	stringsBlock *Dtb_Strings
}
func NewDtb() *Dtb {
	return &Dtb{
	}
}

func (this *Dtb) Read(io *kaitai.Stream, parent interface{}, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{208, 13, 254, 237})) {
		return kaitai.NewValidationNotEqualError([]uint8{208, 13, 254, 237}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TotalSize = uint32(tmp2)
	tmp3, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsStructureBlock = uint32(tmp3)
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsStringsBlock = uint32(tmp4)
	tmp5, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsMemoryReservationBlock = uint32(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MinCompatibleVersion = uint32(tmp7)
	if !(this.MinCompatibleVersion <= this.Version) {
		return kaitai.NewValidationGreaterThanError(this.Version, this.MinCompatibleVersion, this._io, "/seq/6")
	}
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootCpuidPhys = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenStringsBlock = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenStructureBlock = uint32(tmp10)
	return err
}
func (this *Dtb) MemoryReservationBlock() (v *Dtb_MemoryBlock, err error) {
	if (this._f_memoryReservationBlock) {
		return this.memoryReservationBlock, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsMemoryReservationBlock), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp11, err := this._io.ReadBytes(int((this.OfsStructureBlock - this.OfsMemoryReservationBlock)))
	if err != nil {
		return nil, err
	}
	tmp11 = tmp11
	this._raw_memoryReservationBlock = tmp11
	_io__raw_memoryReservationBlock := kaitai.NewStream(bytes.NewReader(this._raw_memoryReservationBlock))
	tmp12 := NewDtb_MemoryBlock()
	err = tmp12.Read(_io__raw_memoryReservationBlock, this, this._root)
	if err != nil {
		return nil, err
	}
	this.memoryReservationBlock = tmp12
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_memoryReservationBlock = true
	this._f_memoryReservationBlock = true
	return this.memoryReservationBlock, nil
}
func (this *Dtb) StructureBlock() (v *Dtb_FdtBlock, err error) {
	if (this._f_structureBlock) {
		return this.structureBlock, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsStructureBlock), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp13, err := this._io.ReadBytes(int(this.LenStructureBlock))
	if err != nil {
		return nil, err
	}
	tmp13 = tmp13
	this._raw_structureBlock = tmp13
	_io__raw_structureBlock := kaitai.NewStream(bytes.NewReader(this._raw_structureBlock))
	tmp14 := NewDtb_FdtBlock()
	err = tmp14.Read(_io__raw_structureBlock, this, this._root)
	if err != nil {
		return nil, err
	}
	this.structureBlock = tmp14
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_structureBlock = true
	this._f_structureBlock = true
	return this.structureBlock, nil
}
func (this *Dtb) StringsBlock() (v *Dtb_Strings, err error) {
	if (this._f_stringsBlock) {
		return this.stringsBlock, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsStringsBlock), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp15, err := this._io.ReadBytes(int(this.LenStringsBlock))
	if err != nil {
		return nil, err
	}
	tmp15 = tmp15
	this._raw_stringsBlock = tmp15
	_io__raw_stringsBlock := kaitai.NewStream(bytes.NewReader(this._raw_stringsBlock))
	tmp16 := NewDtb_Strings()
	err = tmp16.Read(_io__raw_stringsBlock, this, this._root)
	if err != nil {
		return nil, err
	}
	this.stringsBlock = tmp16
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_stringsBlock = true
	this._f_stringsBlock = true
	return this.stringsBlock, nil
}
type Dtb_MemoryBlock struct {
	Entries []*Dtb_MemoryBlockEntry
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb
}
func NewDtb_MemoryBlock() *Dtb_MemoryBlock {
	return &Dtb_MemoryBlock{
	}
}

func (this *Dtb_MemoryBlock) Read(io *kaitai.Stream, parent *Dtb, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp17, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp17 {
			break
		}
		tmp18 := NewDtb_MemoryBlockEntry()
		err = tmp18.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp18)
	}
	return err
}
type Dtb_FdtBlock struct {
	Nodes []*Dtb_FdtNode
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb
}
func NewDtb_FdtBlock() *Dtb_FdtBlock {
	return &Dtb_FdtBlock{
	}
}

func (this *Dtb_FdtBlock) Read(io *kaitai.Stream, parent *Dtb, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp19 := NewDtb_FdtNode()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp19
		this.Nodes = append(this.Nodes, _it)
		if _it.Type == Dtb_Fdt__End {
			break
		}
	}
	return err
}
type Dtb_MemoryBlockEntry struct {
	Address uint64
	Size uint64
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb_MemoryBlock
}
func NewDtb_MemoryBlockEntry() *Dtb_MemoryBlockEntry {
	return &Dtb_MemoryBlockEntry{
	}
}

func (this *Dtb_MemoryBlockEntry) Read(io *kaitai.Stream, parent *Dtb_MemoryBlock, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Address = uint64(tmp20)
	tmp21, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp21)
	return err
}

/**
 * physical address of a reserved memory region
 */

/**
 * size of a reserved memory region
 */
type Dtb_Strings struct {
	Strings []string
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb
}
func NewDtb_Strings() *Dtb_Strings {
	return &Dtb_Strings{
	}
}

func (this *Dtb_Strings) Read(io *kaitai.Stream, parent *Dtb, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp22, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp22 {
			break
		}
		tmp23, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Strings = append(this.Strings, string(tmp23))
	}
	return err
}
type Dtb_FdtProp struct {
	LenProperty uint32
	OfsName uint32
	Property []byte
	Padding []byte
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb_FdtNode
	_f_name bool
	name string
}
func NewDtb_FdtProp() *Dtb_FdtProp {
	return &Dtb_FdtProp{
	}
}

func (this *Dtb_FdtProp) Read(io *kaitai.Stream, parent *Dtb_FdtNode, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenProperty = uint32(tmp24)
	tmp25, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsName = uint32(tmp25)
	tmp26, err := this._io.ReadBytes(int(this.LenProperty))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Property = tmp26
	tmp28, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp27 := -(tmp28) % 4
	if tmp27 < 0 {
		tmp27 += 4
	}
	tmp29, err := this._io.ReadBytes(int(tmp27))
	if err != nil {
		return err
	}
	tmp29 = tmp29
	this.Padding = tmp29
	return err
}
func (this *Dtb_FdtProp) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	tmp30, err := this._root.StringsBlock()
	if err != nil {
		return "", err
	}
	thisIo := tmp30._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.OfsName), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp31, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.name = string(tmp31)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_name = true
	this._f_name = true
	return this.name, nil
}
type Dtb_FdtNode struct {
	Type Dtb_Fdt
	Body interface{}
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb_FdtBlock
}
func NewDtb_FdtNode() *Dtb_FdtNode {
	return &Dtb_FdtNode{
	}
}

func (this *Dtb_FdtNode) Read(io *kaitai.Stream, parent *Dtb_FdtBlock, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = Dtb_Fdt(tmp32)
	switch (this.Type) {
	case Dtb_Fdt__BeginNode:
		tmp33 := NewDtb_FdtBeginNode()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp33
	case Dtb_Fdt__Prop:
		tmp34 := NewDtb_FdtProp()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp34
	}
	return err
}
type Dtb_FdtBeginNode struct {
	Name string
	Padding []byte
	_io *kaitai.Stream
	_root *Dtb
	_parent *Dtb_FdtNode
}
func NewDtb_FdtBeginNode() *Dtb_FdtBeginNode {
	return &Dtb_FdtBeginNode{
	}
}

func (this *Dtb_FdtBeginNode) Read(io *kaitai.Stream, parent *Dtb_FdtNode, root *Dtb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Name = string(tmp35)
	tmp37, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp36 := -(tmp37) % 4
	if tmp36 < 0 {
		tmp36 += 4
	}
	tmp38, err := this._io.ReadBytes(int(tmp36))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.Padding = tmp38
	return err
}
