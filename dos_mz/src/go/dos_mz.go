// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 * @see <a href="http://www.delorie.com/djgpp/doc/exe/">Source</a>
 */
type DosMz struct {
	Header *DosMz_ExeHeader
	Body []byte
	_io *kaitai.Stream
	_root *DosMz
	_parent interface{}
	_f_relocations bool
	relocations []*DosMz_Relocation
}
func NewDosMz() *DosMz {
	return &DosMz{
	}
}

func (this *DosMz) Read(io *kaitai.Stream, parent interface{}, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewDosMz_ExeHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this.Header.LenBody()
	if err != nil {
		return err
	}
	tmp3, err := this._io.ReadBytes(int(tmp2))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Body = tmp3
	return err
}
func (this *DosMz) Relocations() (v []*DosMz_Relocation, err error) {
	if (this._f_relocations) {
		return this.relocations, nil
	}
	if (this.Header.Mz.OfsRelocations != 0) {
		thisIo := this.Header._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Header.Mz.OfsRelocations), io.SeekStart)
		if err != nil {
			return nil, err
		}
		this.relocations = make([]*DosMz_Relocation, this.Header.Mz.NumRelocations)
		for i := range this.relocations {
			tmp4 := NewDosMz_Relocation()
			err = tmp4.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.relocations[i] = tmp4
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_relocations = true
	}
	this._f_relocations = true
	return this.relocations, nil
}
type DosMz_ExeHeader struct {
	Mz *DosMz_MzHeader
	RestOfHeader []byte
	_io *kaitai.Stream
	_root *DosMz
	_parent *DosMz
	_f_lenBody bool
	lenBody int
}
func NewDosMz_ExeHeader() *DosMz_ExeHeader {
	return &DosMz_ExeHeader{
	}
}

func (this *DosMz_ExeHeader) Read(io *kaitai.Stream, parent *DosMz, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5 := NewDosMz_MzHeader()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Mz = tmp5
	tmp6, err := this.Mz.LenHeader()
	if err != nil {
		return err
	}
	tmp7, err := this._io.ReadBytes(int((tmp6 - 28)))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.RestOfHeader = tmp7
	return err
}
func (this *DosMz_ExeHeader) LenBody() (v int, err error) {
	if (this._f_lenBody) {
		return this.lenBody, nil
	}
	var tmp8 int;
	if (this.Mz.LastPageExtraBytes == 0) {
		tmp8 = (this.Mz.NumPages * 512)
	} else {
		tmp8 = (((this.Mz.NumPages - 1) * 512) + this.Mz.LastPageExtraBytes)
	}
	tmp9, err := this.Mz.LenHeader()
	if err != nil {
		return 0, err
	}
	this.lenBody = int((tmp8 - tmp9))
	this._f_lenBody = true
	return this.lenBody, nil
}
type DosMz_MzHeader struct {
	Magic string
	LastPageExtraBytes uint16
	NumPages uint16
	NumRelocations uint16
	HeaderSize uint16
	MinAllocation uint16
	MaxAllocation uint16
	InitialSs uint16
	InitialSp uint16
	Checksum uint16
	InitialIp uint16
	InitialCs uint16
	OfsRelocations uint16
	OverlayId uint16
	_io *kaitai.Stream
	_root *DosMz
	_parent *DosMz_ExeHeader
	_f_lenHeader bool
	lenHeader int
}
func NewDosMz_MzHeader() *DosMz_MzHeader {
	return &DosMz_MzHeader{
	}
}

func (this *DosMz_MzHeader) Read(io *kaitai.Stream, parent *DosMz_ExeHeader, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Magic = string(tmp10)
	if !( ((this.Magic == "MZ") || (this.Magic == "ZM")) ) {
		return kaitai.NewValidationNotAnyOfError(this.Magic, this._io, "/types/mz_header/seq/0")
	}
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LastPageExtraBytes = uint16(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPages = uint16(tmp12)
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumRelocations = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint16(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinAllocation = uint16(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxAllocation = uint16(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialSs = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialSp = uint16(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialIp = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialCs = uint16(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OfsRelocations = uint16(tmp22)
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OverlayId = uint16(tmp23)
	return err
}
func (this *DosMz_MzHeader) LenHeader() (v int, err error) {
	if (this._f_lenHeader) {
		return this.lenHeader, nil
	}
	this.lenHeader = int((this.HeaderSize * 16))
	this._f_lenHeader = true
	return this.lenHeader, nil
}
type DosMz_Relocation struct {
	Ofs uint16
	Seg uint16
	_io *kaitai.Stream
	_root *DosMz
	_parent *DosMz
}
func NewDosMz_Relocation() *DosMz_Relocation {
	return &DosMz_Relocation{
	}
}

func (this *DosMz_Relocation) Read(io *kaitai.Stream, parent *DosMz, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Ofs = uint16(tmp24)
	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Seg = uint16(tmp25)
	return err
}
