// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"

type HeroesOfMightAndMagicBmp struct {
	Magic uint16
	Width uint16
	Height uint16
	Data []byte
	_io *kaitai.Stream
	_root *HeroesOfMightAndMagicBmp
	_parent interface{}
}
func NewHeroesOfMightAndMagicBmp() *HeroesOfMightAndMagicBmp {
	return &HeroesOfMightAndMagicBmp{
	}
}

func (this *HeroesOfMightAndMagicBmp) Read(io *kaitai.Stream, parent interface{}, root *HeroesOfMightAndMagicBmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Magic = uint16(tmp1)
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp3)
	tmp4, err := this._io.ReadBytes(int((this.Width * this.Height)))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Data = tmp4
	return err
}
