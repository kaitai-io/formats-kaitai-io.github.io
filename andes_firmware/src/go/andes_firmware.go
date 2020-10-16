// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */
type AndesFirmware struct {
	ImageHeader *AndesFirmware_ImageHeader
	Ilm []byte
	Dlm []byte
	_io *kaitai.Stream
	_root *AndesFirmware
	_parent interface{}
	_raw_ImageHeader []byte
}
func NewAndesFirmware() *AndesFirmware {
	return &AndesFirmware{
	}
}

func (this *AndesFirmware) Read(io *kaitai.Stream, parent interface{}, root *AndesFirmware) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this._raw_ImageHeader = tmp1
	_io__raw_ImageHeader := kaitai.NewStream(bytes.NewReader(this._raw_ImageHeader))
	tmp2 := NewAndesFirmware_ImageHeader()
	err = tmp2.Read(_io__raw_ImageHeader, this, this._root)
	if err != nil {
		return err
	}
	this.ImageHeader = tmp2
	tmp3, err := this._io.ReadBytes(int(this.ImageHeader.IlmLen))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Ilm = tmp3
	tmp4, err := this._io.ReadBytes(int(this.ImageHeader.DlmLen))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Dlm = tmp4
	return err
}
type AndesFirmware_ImageHeader struct {
	IlmLen uint32
	DlmLen uint32
	FwVer uint16
	BuildVer uint16
	Extra uint32
	BuildTime string
	_io *kaitai.Stream
	_root *AndesFirmware
	_parent *AndesFirmware
}
func NewAndesFirmware_ImageHeader() *AndesFirmware_ImageHeader {
	return &AndesFirmware_ImageHeader{
	}
}

func (this *AndesFirmware_ImageHeader) Read(io *kaitai.Stream, parent *AndesFirmware, root *AndesFirmware) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IlmLen = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DlmLen = uint32(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FwVer = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BuildVer = uint16(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Extra = uint32(tmp9)
	tmp10, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.BuildTime = string(tmp10)
	return err
}
