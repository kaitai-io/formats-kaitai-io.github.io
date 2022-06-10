// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130">Source</a>
 */
type AndroidNanoappHeader struct {
	HeaderVersion uint32
	Magic []byte
	AppId uint64
	AppVersion uint32
	Flags uint32
	HubType uint64
	ChreApiMajorVersion uint8
	ChreApiMinorVersion uint8
	Reserved []byte
	_io *kaitai.Stream
	_root *AndroidNanoappHeader
	_parent interface{}
	_f_isSigned bool
	isSigned bool
	_f_isEncrypted bool
	isEncrypted bool
	_f_isTcmCapable bool
	isTcmCapable bool
}
func NewAndroidNanoappHeader() *AndroidNanoappHeader {
	return &AndroidNanoappHeader{
	}
}

func (this *AndroidNanoappHeader) Read(io *kaitai.Stream, parent interface{}, root *AndroidNanoappHeader) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderVersion = uint32(tmp1)
	if !(this.HeaderVersion == 1) {
		return kaitai.NewValidationNotEqualError(1, this.HeaderVersion, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Magic = tmp2
	if !(bytes.Equal(this.Magic, []uint8{78, 65, 78, 79})) {
		return kaitai.NewValidationNotEqualError([]uint8{78, 65, 78, 79}, this.Magic, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.AppId = uint64(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AppVersion = uint32(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp5)
	tmp6, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.HubType = uint64(tmp6)
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ChreApiMajorVersion = tmp7
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ChreApiMinorVersion = tmp8
	tmp9, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Reserved = tmp9
	if !(bytes.Equal(this.Reserved, []uint8{0, 0, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0, 0, 0}, this.Reserved, this._io, "/seq/8")
	}
	return err
}
func (this *AndroidNanoappHeader) IsSigned() (v bool, err error) {
	if (this._f_isSigned) {
		return this.isSigned, nil
	}
	this.isSigned = bool((this.Flags & 1) != 0)
	this._f_isSigned = true
	return this.isSigned, nil
}
func (this *AndroidNanoappHeader) IsEncrypted() (v bool, err error) {
	if (this._f_isEncrypted) {
		return this.isEncrypted, nil
	}
	this.isEncrypted = bool((this.Flags & 2) != 0)
	this._f_isEncrypted = true
	return this.isEncrypted, nil
}
func (this *AndroidNanoappHeader) IsTcmCapable() (v bool, err error) {
	if (this._f_isTcmCapable) {
		return this.isTcmCapable, nil
	}
	this.isTcmCapable = bool((this.Flags & 4) != 0)
	this._f_isTcmCapable = true
	return this.isTcmCapable, nil
}
