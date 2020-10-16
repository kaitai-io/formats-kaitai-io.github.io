// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type PsxTim_BppType int
const (
	PsxTim_BppType__Bpp4 PsxTim_BppType = 0
	PsxTim_BppType__Bpp8 PsxTim_BppType = 1
	PsxTim_BppType__Bpp16 PsxTim_BppType = 2
	PsxTim_BppType__Bpp24 PsxTim_BppType = 3
)
type PsxTim struct {
	Magic []byte
	Flags uint32
	Clut *PsxTim_Bitmap
	Img *PsxTim_Bitmap
	_io *kaitai.Stream
	_root *PsxTim
	_parent interface{}
	_f_hasClut bool
	hasClut bool
	_f_bpp bool
	bpp int
}
func NewPsxTim() *PsxTim {
	return &PsxTim{
	}
}

func (this *PsxTim) Read(io *kaitai.Stream, parent interface{}, root *PsxTim) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{16, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{16, 0, 0, 0}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp2)
	tmp3, err := this.HasClut()
	if err != nil {
		return err
	}
	if (tmp3) {
		tmp4 := NewPsxTim_Bitmap()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Clut = tmp4
	}
	tmp5 := NewPsxTim_Bitmap()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Img = tmp5
	return err
}
func (this *PsxTim) HasClut() (v bool, err error) {
	if (this._f_hasClut) {
		return this.hasClut, nil
	}
	this.hasClut = bool((this.Flags & 8) != 0)
	this._f_hasClut = true
	return this.hasClut, nil
}
func (this *PsxTim) Bpp() (v int, err error) {
	if (this._f_bpp) {
		return this.bpp, nil
	}
	this.bpp = int((this.Flags & 3))
	this._f_bpp = true
	return this.bpp, nil
}

/**
 * Encodes bits-per-pixel and whether CLUT is present in a file or not
 */

/**
 * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
 */
type PsxTim_Bitmap struct {
	Len uint32
	OriginX uint16
	OriginY uint16
	Width uint16
	Height uint16
	Body []byte
	_io *kaitai.Stream
	_root *PsxTim
	_parent *PsxTim
}
func NewPsxTim_Bitmap() *PsxTim_Bitmap {
	return &PsxTim_Bitmap{
	}
}

func (this *PsxTim_Bitmap) Read(io *kaitai.Stream, parent *PsxTim, root *PsxTim) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OriginX = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OriginY = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int((this.Len - 12)))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Body = tmp11
	return err
}
