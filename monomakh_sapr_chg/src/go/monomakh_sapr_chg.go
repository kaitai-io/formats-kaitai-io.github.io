// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/index.php), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */
type MonomakhSaprChg struct {
	Title string
	Ent []*MonomakhSaprChg_Block
	_io *kaitai.Stream
	_root *MonomakhSaprChg
	_parent interface{}
}
func NewMonomakhSaprChg() *MonomakhSaprChg {
	return &MonomakhSaprChg{
	}
}

func (this *MonomakhSaprChg) Read(io *kaitai.Stream, parent interface{}, root *MonomakhSaprChg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Title = string(tmp1)
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewMonomakhSaprChg_Block()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Ent = append(this.Ent, tmp3)
	}
	return err
}
type MonomakhSaprChg_Block struct {
	Header string
	FileSize uint64
	File []byte
	_io *kaitai.Stream
	_root *MonomakhSaprChg
	_parent *MonomakhSaprChg
}
func NewMonomakhSaprChg_Block() *MonomakhSaprChg_Block {
	return &MonomakhSaprChg_Block{
	}
}

func (this *MonomakhSaprChg_Block) Read(io *kaitai.Stream, parent *MonomakhSaprChg, root *MonomakhSaprChg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(13))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Header = string(tmp4)
	tmp5, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.FileSize = uint64(tmp5)
	tmp6, err := this._io.ReadBytes(int(this.FileSize))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.File = tmp6
	return err
}
