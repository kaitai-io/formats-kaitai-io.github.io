// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)

type GranTurismoVol struct {
	Magic []byte
	NumFiles uint16
	NumEntries uint16
	Reserved []byte
	Offsets []uint32
	_io *kaitai.Stream
	_root *GranTurismoVol
	_parent interface{}
	_f_ofsDir bool
	ofsDir uint32
	_f_files bool
	files []*GranTurismoVol_FileInfo
}
func NewGranTurismoVol() *GranTurismoVol {
	return &GranTurismoVol{
	}
}

func (this *GranTurismoVol) Read(io *kaitai.Stream, parent interface{}, root *GranTurismoVol) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{71, 84, 70, 83, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{71, 84, 70, 83, 0, 0, 0, 0}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumFiles = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumEntries = uint16(tmp3)
	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Reserved = tmp4
	if !(bytes.Equal(this.Reserved, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.Reserved, this._io, "/seq/3")
	}
	this.Offsets = make([]uint32, this.NumFiles)
	for i := range this.Offsets {
		tmp5, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Offsets[i] = tmp5
	}
	return err
}
func (this *GranTurismoVol) OfsDir() (v uint32, err error) {
	if (this._f_ofsDir) {
		return this.ofsDir, nil
	}
	this.ofsDir = uint32(this.Offsets[1])
	this._f_ofsDir = true
	return this.ofsDir, nil
}
func (this *GranTurismoVol) Files() (v []*GranTurismoVol_FileInfo, err error) {
	if (this._f_files) {
		return this.files, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp6, err := this.OfsDir()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp6 & uint32(4294965248))), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.files = make([]*GranTurismoVol_FileInfo, this._root.NumEntries)
	for i := range this.files {
		tmp7 := NewGranTurismoVol_FileInfo()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.files[i] = tmp7
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_files = true
	this._f_files = true
	return this.files, nil
}
type GranTurismoVol_FileInfo struct {
	Timestamp uint32
	OffsetIdx uint16
	Flags uint8
	Name string
	_io *kaitai.Stream
	_root *GranTurismoVol
	_parent *GranTurismoVol
	_f_size bool
	size int
	_f_body bool
	body []byte
	_f_isDir bool
	isDir bool
	_f_isLastEntry bool
	isLastEntry bool
}
func NewGranTurismoVol_FileInfo() *GranTurismoVol_FileInfo {
	return &GranTurismoVol_FileInfo{
	}
}

func (this *GranTurismoVol_FileInfo) Read(io *kaitai.Stream, parent *GranTurismoVol, root *GranTurismoVol) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OffsetIdx = uint16(tmp9)
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp10
	tmp11, err := this._io.ReadBytes(int(25))
	if err != nil {
		return err
	}
	tmp11 = kaitai.BytesTerminate(kaitai.BytesStripRight(tmp11, 0), 0, false)
	this.Name = string(tmp11)
	return err
}
func (this *GranTurismoVol_FileInfo) Size() (v int, err error) {
	if (this._f_size) {
		return this.size, nil
	}
	this.size = int(((this._root.Offsets[(this.OffsetIdx + 1)] & uint32(4294965248)) - this._root.Offsets[this.OffsetIdx]))
	this._f_size = true
	return this.size, nil
}
func (this *GranTurismoVol_FileInfo) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	tmp12, err := this.IsDir()
	if err != nil {
		return nil, err
	}
	if (!(tmp12)) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64((this._root.Offsets[this.OffsetIdx] & uint32(4294965248))), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp13, err := this.Size()
		if err != nil {
			return nil, err
		}
		tmp14, err := this._io.ReadBytes(int(tmp13))
		if err != nil {
			return nil, err
		}
		tmp14 = tmp14
		this.body = tmp14
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}
func (this *GranTurismoVol_FileInfo) IsDir() (v bool, err error) {
	if (this._f_isDir) {
		return this.isDir, nil
	}
	this.isDir = bool((this.Flags & 1) != 0)
	this._f_isDir = true
	return this.isDir, nil
}
func (this *GranTurismoVol_FileInfo) IsLastEntry() (v bool, err error) {
	if (this._f_isLastEntry) {
		return this.isLastEntry, nil
	}
	this.isLastEntry = bool((this.Flags & 128) != 0)
	this._f_isLastEntry = true
	return this.isLastEntry, nil
}
