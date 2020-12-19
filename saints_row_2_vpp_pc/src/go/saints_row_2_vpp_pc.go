// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)

type SaintsRow2VppPc struct {
	Magic []byte
	Pad1 []byte
	NumFiles int32
	ContainerSize int32
	LenOffsets int32
	LenFilenames int32
	LenExtensions int32
	Smth5 int32
	Smth6 int32
	Smth7 int32
	Smth8 int32
	Smth9 int32
	_io *kaitai.Stream
	_root *SaintsRow2VppPc
	_parent interface{}
	_raw_filenames []byte
	_raw_files []byte
	_raw_extensions []byte
	_f_filenames bool
	filenames *SaintsRow2VppPc_Strings
	_f_ofsExtensions bool
	ofsExtensions int
	_f_files bool
	files *SaintsRow2VppPc_Offsets
	_f_dataStart bool
	dataStart int
	_f_extensions bool
	extensions *SaintsRow2VppPc_Strings
	_f_ofsFilenames bool
	ofsFilenames int
}
func NewSaintsRow2VppPc() *SaintsRow2VppPc {
	return &SaintsRow2VppPc{
	}
}

func (this *SaintsRow2VppPc) Read(io *kaitai.Stream, parent interface{}, root *SaintsRow2VppPc) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{206, 10, 137, 81, 4})) {
		return kaitai.NewValidationNotEqualError([]uint8{206, 10, 137, 81, 4}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadBytes(int(335))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Pad1 = tmp2
	tmp3, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumFiles = int32(tmp3)
	tmp4, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.ContainerSize = int32(tmp4)
	tmp5, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.LenOffsets = int32(tmp5)
	tmp6, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.LenFilenames = int32(tmp6)
	tmp7, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.LenExtensions = int32(tmp7)
	tmp8, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth5 = int32(tmp8)
	tmp9, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth6 = int32(tmp9)
	tmp10, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth7 = int32(tmp10)
	tmp11, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth8 = int32(tmp11)
	tmp12, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth9 = int32(tmp12)
	return err
}
func (this *SaintsRow2VppPc) Filenames() (v *SaintsRow2VppPc_Strings, err error) {
	if (this._f_filenames) {
		return this.filenames, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp13, err := this.OfsFilenames()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp13), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp14, err := this._io.ReadBytes(int(this.LenFilenames))
	if err != nil {
		return nil, err
	}
	tmp14 = tmp14
	this._raw_filenames = tmp14
	_io__raw_filenames := kaitai.NewStream(bytes.NewReader(this._raw_filenames))
	tmp15 := NewSaintsRow2VppPc_Strings()
	err = tmp15.Read(_io__raw_filenames, this, this._root)
	if err != nil {
		return nil, err
	}
	this.filenames = tmp15
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_filenames = true
	this._f_filenames = true
	return this.filenames, nil
}
func (this *SaintsRow2VppPc) OfsExtensions() (v int, err error) {
	if (this._f_ofsExtensions) {
		return this.ofsExtensions, nil
	}
	tmp16, err := this.OfsFilenames()
	if err != nil {
		return 0, err
	}
	this.ofsExtensions = int((((tmp16 + this.LenFilenames) & uint32(4294965248)) + 2048))
	this._f_ofsExtensions = true
	return this.ofsExtensions, nil
}
func (this *SaintsRow2VppPc) Files() (v *SaintsRow2VppPc_Offsets, err error) {
	if (this._f_files) {
		return this.files, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(2048), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp17, err := this._io.ReadBytes(int(this.LenOffsets))
	if err != nil {
		return nil, err
	}
	tmp17 = tmp17
	this._raw_files = tmp17
	_io__raw_files := kaitai.NewStream(bytes.NewReader(this._raw_files))
	tmp18 := NewSaintsRow2VppPc_Offsets()
	err = tmp18.Read(_io__raw_files, this, this._root)
	if err != nil {
		return nil, err
	}
	this.files = tmp18
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_files = true
	this._f_files = true
	return this.files, nil
}
func (this *SaintsRow2VppPc) DataStart() (v int, err error) {
	if (this._f_dataStart) {
		return this.dataStart, nil
	}
	tmp19, err := this.OfsExtensions()
	if err != nil {
		return 0, err
	}
	this.dataStart = int((((tmp19 + this.LenExtensions) & uint32(4294965248)) + 2048))
	this._f_dataStart = true
	return this.dataStart, nil
}
func (this *SaintsRow2VppPc) Extensions() (v *SaintsRow2VppPc_Strings, err error) {
	if (this._f_extensions) {
		return this.extensions, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp20, err := this.OfsExtensions()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp20), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp21, err := this._io.ReadBytes(int(this.LenExtensions))
	if err != nil {
		return nil, err
	}
	tmp21 = tmp21
	this._raw_extensions = tmp21
	_io__raw_extensions := kaitai.NewStream(bytes.NewReader(this._raw_extensions))
	tmp22 := NewSaintsRow2VppPc_Strings()
	err = tmp22.Read(_io__raw_extensions, this, this._root)
	if err != nil {
		return nil, err
	}
	this.extensions = tmp22
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_extensions = true
	this._f_extensions = true
	return this.extensions, nil
}
func (this *SaintsRow2VppPc) OfsFilenames() (v int, err error) {
	if (this._f_ofsFilenames) {
		return this.ofsFilenames, nil
	}
	this.ofsFilenames = int((((2048 + this.LenOffsets) & uint32(4294965248)) + 2048))
	this._f_ofsFilenames = true
	return this.ofsFilenames, nil
}
type SaintsRow2VppPc_Offsets struct {
	Entries []*SaintsRow2VppPc_Offsets_Offset
	_io *kaitai.Stream
	_root *SaintsRow2VppPc
	_parent *SaintsRow2VppPc
}
func NewSaintsRow2VppPc_Offsets() *SaintsRow2VppPc_Offsets {
	return &SaintsRow2VppPc_Offsets{
	}
}

func (this *SaintsRow2VppPc_Offsets) Read(io *kaitai.Stream, parent *SaintsRow2VppPc, root *SaintsRow2VppPc) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp23, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp23 {
			break
		}
		tmp24 := NewSaintsRow2VppPc_Offsets_Offset()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp24)
	}
	return err
}
type SaintsRow2VppPc_Offsets_Offset struct {
	NameOfs uint32
	ExtOfs uint32
	Smth2 int32
	OfsBody int32
	LenBody int32
	AlwaysMinus1 int32
	AlwaysZero int32
	_io *kaitai.Stream
	_root *SaintsRow2VppPc
	_parent *SaintsRow2VppPc_Offsets
	_f_filename bool
	filename string
	_f_ext bool
	ext string
	_f_body bool
	body []byte
}
func NewSaintsRow2VppPc_Offsets_Offset() *SaintsRow2VppPc_Offsets_Offset {
	return &SaintsRow2VppPc_Offsets_Offset{
	}
}

func (this *SaintsRow2VppPc_Offsets_Offset) Read(io *kaitai.Stream, parent *SaintsRow2VppPc_Offsets, root *SaintsRow2VppPc) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameOfs = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExtOfs = uint32(tmp26)
	tmp27, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Smth2 = int32(tmp27)
	tmp28, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OfsBody = int32(tmp28)
	tmp29, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.LenBody = int32(tmp29)
	tmp30, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.AlwaysMinus1 = int32(tmp30)
	tmp31, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.AlwaysZero = int32(tmp31)
	return err
}
func (this *SaintsRow2VppPc_Offsets_Offset) Filename() (v string, err error) {
	if (this._f_filename) {
		return this.filename, nil
	}
	tmp32, err := this._root.Filenames()
	if err != nil {
		return "", err
	}
	thisIo := tmp32._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.NameOfs), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp33, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.filename = string(tmp33)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_filename = true
	this._f_filename = true
	return this.filename, nil
}
func (this *SaintsRow2VppPc_Offsets_Offset) Ext() (v string, err error) {
	if (this._f_ext) {
		return this.ext, nil
	}
	tmp34, err := this._root.Extensions()
	if err != nil {
		return "", err
	}
	thisIo := tmp34._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.ExtOfs), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp35, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.ext = string(tmp35)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_ext = true
	this._f_ext = true
	return this.ext, nil
}
func (this *SaintsRow2VppPc_Offsets_Offset) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp36, err := this._root.DataStart()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((tmp36 + this.OfsBody)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp37, err := thisIo.ReadBytes(int(this.LenBody))
	if err != nil {
		return nil, err
	}
	tmp37 = tmp37
	this.body = tmp37
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type SaintsRow2VppPc_Strings struct {
	Entries []string
	_io *kaitai.Stream
	_root *SaintsRow2VppPc
	_parent *SaintsRow2VppPc
}
func NewSaintsRow2VppPc_Strings() *SaintsRow2VppPc_Strings {
	return &SaintsRow2VppPc_Strings{
	}
}

func (this *SaintsRow2VppPc_Strings) Read(io *kaitai.Stream, parent *SaintsRow2VppPc, root *SaintsRow2VppPc) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp38, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp38 {
			break
		}
		tmp39, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, string(tmp39))
	}
	return err
}