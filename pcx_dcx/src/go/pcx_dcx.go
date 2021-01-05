// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */
type PcxDcx struct {
	Magic []byte
	Files []*PcxDcx_PcxOffset
	_io *kaitai.Stream
	_root *PcxDcx
	_parent interface{}
}
func NewPcxDcx() *PcxDcx {
	return &PcxDcx{
	}
}

func (this *PcxDcx) Read(io *kaitai.Stream, parent interface{}, root *PcxDcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{177, 104, 222, 58})) {
		return kaitai.NewValidationNotEqualError([]uint8{177, 104, 222, 58}, this.Magic, this._io, "/seq/0")
	}
	for i := 1;; i++ {
		tmp2 := NewPcxDcx_PcxOffset()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp2
		this.Files = append(this.Files, _it)
		if _it.OfsBody == 0 {
			break
		}
	}
	return err
}
type PcxDcx_PcxOffset struct {
	OfsBody uint32
	_io *kaitai.Stream
	_root *PcxDcx
	_parent *PcxDcx
	_f_body bool
	body *Pcx
}
func NewPcxDcx_PcxOffset() *PcxDcx_PcxOffset {
	return &PcxDcx_PcxOffset{
	}
}

func (this *PcxDcx_PcxOffset) Read(io *kaitai.Stream, parent *PcxDcx, root *PcxDcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp3)
	return err
}
func (this *PcxDcx_PcxOffset) Body() (v *Pcx, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	if (this.OfsBody != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.OfsBody), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp4 := NewPcx()
		err = tmp4.Read(this._io, this, nil)
		if err != nil {
			return nil, err
		}
		this.body = tmp4
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}
