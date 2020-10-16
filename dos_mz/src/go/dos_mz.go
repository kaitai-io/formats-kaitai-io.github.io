// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 */
type DosMz struct {
	Hdr *DosMz_MzHeader
	MzHeader2 []byte
	Relocations []*DosMz_Relocation
	Body []byte
	_io *kaitai.Stream
	_root *DosMz
	_parent interface{}
}
func NewDosMz() *DosMz {
	return &DosMz{
	}
}

func (this *DosMz) Read(io *kaitai.Stream, parent interface{}, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewDosMz_MzHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp1
	tmp2, err := this._io.ReadBytes(int((this.Hdr.OfsRelocations - 28)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.MzHeader2 = tmp2
	this.Relocations = make([]*DosMz_Relocation, this.Hdr.NumRelocations)
	for i := range this.Relocations {
		tmp3 := NewDosMz_Relocation()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Relocations[i] = tmp3
	}
	tmp4, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Body = tmp4
	return err
}
type DosMz_MzHeader struct {
	Magic []byte
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
	_parent *DosMz
}
func NewDosMz_MzHeader() *DosMz_MzHeader {
	return &DosMz_MzHeader{
	}
}

func (this *DosMz_MzHeader) Read(io *kaitai.Stream, parent *DosMz, root *DosMz) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic = tmp5
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LastPageExtraBytes = uint16(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPages = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumRelocations = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint16(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinAllocation = uint16(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxAllocation = uint16(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialSs = uint16(tmp12)
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialSp = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialIp = uint16(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InitialCs = uint16(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OfsRelocations = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OverlayId = uint16(tmp18)
	return err
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

	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Ofs = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Seg = uint16(tmp20)
	return err
}
