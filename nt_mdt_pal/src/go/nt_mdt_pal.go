// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"golang.org/x/text/encoding/unicode"
)


/**
 * It is a color scheme for visualising SPM scans.
 */
type NtMdtPal struct {
	Signature []byte
	Count uint32
	Meta []*NtMdtPal_Meta
	Something2 []byte
	Tables []*NtMdtPal_ColTable
	_io *kaitai.Stream
	_root *NtMdtPal
	_parent interface{}
}
func NewNtMdtPal() *NtMdtPal {
	return &NtMdtPal{
	}
}

func (this *NtMdtPal) Read(io *kaitai.Stream, parent interface{}, root *NtMdtPal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(26))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Signature = tmp1
	if !(bytes.Equal(this.Signature, []uint8{78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33})) {
		return kaitai.NewValidationNotEqualError([]uint8{78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33}, this.Signature, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Count = uint32(tmp2)
	for i := 0; i < int(this.Count); i++ {
		_ = i
		tmp3 := NewNtMdtPal_Meta()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Meta = append(this.Meta, tmp3)
	}
	tmp4, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Something2 = tmp4
	for i := 0; i < int(this.Count); i++ {
		_ = i
		tmp5 := NewNtMdtPal_ColTable(i)
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tables = append(this.Tables, tmp5)
	}
	return err
}
type NtMdtPal_Meta struct {
	Unkn00 []byte
	Unkn01 []byte
	Unkn02 []byte
	Unkn03 []byte
	ColorsCount uint16
	Unkn10 []byte
	Unkn11 []byte
	Unkn12 []byte
	NameSize uint16
	_io *kaitai.Stream
	_root *NtMdtPal
	_parent *NtMdtPal
}
func NewNtMdtPal_Meta() *NtMdtPal_Meta {
	return &NtMdtPal_Meta{
	}
}

func (this *NtMdtPal_Meta) Read(io *kaitai.Stream, parent *NtMdtPal, root *NtMdtPal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Unkn00 = tmp6
	tmp7, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Unkn01 = tmp7
	tmp8, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Unkn02 = tmp8
	tmp9, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Unkn03 = tmp9
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ColorsCount = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Unkn10 = tmp11
	tmp12, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Unkn11 = tmp12
	tmp13, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Unkn12 = tmp13
	tmp14, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NameSize = uint16(tmp14)
	return err
}

/**
 * usually 0s
 */

/**
 * usually 0s
 */

/**
 * usually 0s
 */

/**
 * usually 4
 */

/**
 * usually 0s
 */
type NtMdtPal_Color struct {
	Red uint8
	Unkn uint8
	Blue uint8
	Green uint8
	_io *kaitai.Stream
	_root *NtMdtPal
	_parent *NtMdtPal_ColTable
}
func NewNtMdtPal_Color() *NtMdtPal_Color {
	return &NtMdtPal_Color{
	}
}

func (this *NtMdtPal_Color) Read(io *kaitai.Stream, parent *NtMdtPal_ColTable, root *NtMdtPal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Red = tmp15
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unkn = tmp16
	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Blue = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Green = tmp18
	return err
}
type NtMdtPal_ColTable struct {
	Size1 uint8
	Unkn uint8
	Title string
	Unkn1 uint16
	Colors []*NtMdtPal_Color
	Index uint16
	_io *kaitai.Stream
	_root *NtMdtPal
	_parent *NtMdtPal
}
func NewNtMdtPal_ColTable(index uint16) *NtMdtPal_ColTable {
	return &NtMdtPal_ColTable{
		Index: index,
	}
}

func (this *NtMdtPal_ColTable) Read(io *kaitai.Stream, parent *NtMdtPal, root *NtMdtPal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Size1 = tmp19
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unkn = tmp20
	tmp21, err := this._io.ReadBytes(int(this._root.Meta[this.Index].NameSize))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	tmp22, err := kaitai.BytesToStr(tmp21, unicode.UTF16(unicode.LittleEndian, unicode.IgnoreBOM).NewDecoder())
	if err != nil {
		return err
	}
	this.Title = tmp22
	tmp23, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Unkn1 = uint16(tmp23)
	for i := 0; i < int((this._root.Meta[this.Index].ColorsCount - 1)); i++ {
		_ = i
		tmp24 := NewNtMdtPal_Color()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Colors = append(this.Colors, tmp24)
	}
	return err
}
