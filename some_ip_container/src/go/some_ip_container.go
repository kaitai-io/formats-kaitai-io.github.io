// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"

type SomeIpContainer struct {
	SomeIpPackages []*SomeIp
	_io *kaitai.Stream
	_root *SomeIpContainer
	_parent interface{}
}
func NewSomeIpContainer() *SomeIpContainer {
	return &SomeIpContainer{
	}
}

func (this *SomeIpContainer) Read(io *kaitai.Stream, parent interface{}, root *SomeIpContainer) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewSomeIp()
		err = tmp2.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.SomeIpPackages = append(this.SomeIpPackages, tmp2)
	}
	return err
}
