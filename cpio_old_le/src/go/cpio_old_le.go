// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)

type CpioOldLe struct {
	Files []*CpioOldLe_File
	_io *kaitai.Stream
	_root *CpioOldLe
	_parent interface{}
}
func NewCpioOldLe() *CpioOldLe {
	return &CpioOldLe{
	}
}

func (this *CpioOldLe) Read(io *kaitai.Stream, parent interface{}, root *CpioOldLe) (err error) {
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
		tmp2 := NewCpioOldLe_File()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Files = append(this.Files, tmp2)
	}
	return err
}
type CpioOldLe_File struct {
	Header *CpioOldLe_FileHeader
	PathName []byte
	StringTerminator []byte
	PathNamePadding []byte
	FileData []byte
	FileDataPadding []byte
	EndOfFilePadding []byte
	_io *kaitai.Stream
	_root *CpioOldLe
	_parent *CpioOldLe
}
func NewCpioOldLe_File() *CpioOldLe_File {
	return &CpioOldLe_File{
	}
}

func (this *CpioOldLe_File) Read(io *kaitai.Stream, parent *CpioOldLe, root *CpioOldLe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewCpioOldLe_FileHeader()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	tmp4, err := this._io.ReadBytes(int((this.Header.PathNameSize - 1)))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.PathName = tmp4
	tmp5, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.StringTerminator = tmp5
	if !(bytes.Equal(this.StringTerminator, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.StringTerminator, this._io, "/types/file/seq/2")
	}
	tmp6 := this.Header.PathNameSize % 2
	if tmp6 < 0 {
		tmp6 += 2
	}
	if (tmp6 == 1) {
		tmp7, err := this._io.ReadBytes(int(1))
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this.PathNamePadding = tmp7
		if !(bytes.Equal(this.PathNamePadding, []uint8{0})) {
			return kaitai.NewValidationNotEqualError([]uint8{0}, this.PathNamePadding, this._io, "/types/file/seq/3")
		}
	}
	tmp8, err := this.Header.FileSize.Value()
	if err != nil {
		return err
	}
	tmp9, err := this._io.ReadBytes(int(tmp8))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.FileData = tmp9
	tmp11, err := this.Header.FileSize.Value()
	if err != nil {
		return err
	}
	tmp10 := tmp11 % 2
	if tmp10 < 0 {
		tmp10 += 2
	}
	if (tmp10 == 1) {
		tmp12, err := this._io.ReadBytes(int(1))
		if err != nil {
			return err
		}
		tmp12 = tmp12
		this.FileDataPadding = tmp12
		if !(bytes.Equal(this.FileDataPadding, []uint8{0})) {
			return kaitai.NewValidationNotEqualError([]uint8{0}, this.FileDataPadding, this._io, "/types/file/seq/5")
		}
	}
	tmp13, err := this.Header.FileSize.Value()
	if err != nil {
		return err
	}
	if ( ((bytes.Equal(this.PathName, []uint8{84, 82, 65, 73, 76, 69, 82, 33, 33, 33})) && (tmp13 == 0)) ) {
		tmp14, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp14 = tmp14
		this.EndOfFilePadding = tmp14
	}
	return err
}
type CpioOldLe_FileHeader struct {
	Magic []byte
	DeviceNumber uint16
	InodeNumber uint16
	Mode uint16
	UserId uint16
	GroupId uint16
	NumberOfLinks uint16
	RDeviceNumber uint16
	ModificationTime *CpioOldLe_FourByteUnsignedInteger
	PathNameSize uint16
	FileSize *CpioOldLe_FourByteUnsignedInteger
	_io *kaitai.Stream
	_root *CpioOldLe
	_parent *CpioOldLe_File
}
func NewCpioOldLe_FileHeader() *CpioOldLe_FileHeader {
	return &CpioOldLe_FileHeader{
	}
}

func (this *CpioOldLe_FileHeader) Read(io *kaitai.Stream, parent *CpioOldLe_File, root *CpioOldLe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Magic = tmp15
	if !(bytes.Equal(this.Magic, []uint8{199, 113})) {
		return kaitai.NewValidationNotEqualError([]uint8{199, 113}, this.Magic, this._io, "/types/file_header/seq/0")
	}
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DeviceNumber = uint16(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InodeNumber = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Mode = uint16(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.UserId = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.GroupId = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfLinks = uint16(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.RDeviceNumber = uint16(tmp22)
	tmp23 := NewCpioOldLe_FourByteUnsignedInteger()
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ModificationTime = tmp23
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PathNameSize = uint16(tmp24)
	tmp25 := NewCpioOldLe_FourByteUnsignedInteger()
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FileSize = tmp25
	return err
}
type CpioOldLe_FourByteUnsignedInteger struct {
	MostSignificantBits uint16
	LeastSignificantBits uint16
	_io *kaitai.Stream
	_root *CpioOldLe
	_parent *CpioOldLe_FileHeader
	_f_value bool
	value int
}
func NewCpioOldLe_FourByteUnsignedInteger() *CpioOldLe_FourByteUnsignedInteger {
	return &CpioOldLe_FourByteUnsignedInteger{
	}
}

func (this *CpioOldLe_FourByteUnsignedInteger) Read(io *kaitai.Stream, parent *CpioOldLe_FileHeader, root *CpioOldLe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MostSignificantBits = uint16(tmp26)
	tmp27, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LeastSignificantBits = uint16(tmp27)
	return err
}
func (this *CpioOldLe_FourByteUnsignedInteger) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int((this.LeastSignificantBits + (this.MostSignificantBits << 16)))
	this._f_value = true
	return this.value, nil
}
