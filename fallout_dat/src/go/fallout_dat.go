// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


type FalloutDat_Compression int
const (
	FalloutDat_Compression__None FalloutDat_Compression = 32
	FalloutDat_Compression__Lzss FalloutDat_Compression = 64
)
type FalloutDat struct {
	FolderCount uint32
	Unknown1 uint32
	Unknown2 uint32
	Timestamp uint32
	FolderNames []*FalloutDat_Pstr
	Folders []*FalloutDat_Folder
	_io *kaitai.Stream
	_root *FalloutDat
	_parent interface{}
}
func NewFalloutDat() *FalloutDat {
	return &FalloutDat{
	}
}

func (this *FalloutDat) Read(io *kaitai.Stream, parent interface{}, root *FalloutDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.FolderCount = uint32(tmp1)
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Unknown1 = uint32(tmp2)
	tmp3, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Unknown2 = uint32(tmp3)
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp4)
	for i := 0; i < int(this.FolderCount); i++ {
		_ = i
		tmp5 := NewFalloutDat_Pstr()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.FolderNames = append(this.FolderNames, tmp5)
	}
	for i := 0; i < int(this.FolderCount); i++ {
		_ = i
		tmp6 := NewFalloutDat_Folder()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Folders = append(this.Folders, tmp6)
	}
	return err
}
type FalloutDat_Pstr struct {
	Size uint8
	Str string
	_io *kaitai.Stream
	_root *FalloutDat
	_parent interface{}
}
func NewFalloutDat_Pstr() *FalloutDat_Pstr {
	return &FalloutDat_Pstr{
	}
}

func (this *FalloutDat_Pstr) Read(io *kaitai.Stream, parent interface{}, root *FalloutDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Size = tmp7
	tmp8, err := this._io.ReadBytes(int(this.Size))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Str = string(tmp8)
	return err
}
type FalloutDat_Folder struct {
	FileCount uint32
	Unknown uint32
	Flags uint32
	Timestamp uint32
	Files []*FalloutDat_File
	_io *kaitai.Stream
	_root *FalloutDat
	_parent *FalloutDat
}
func NewFalloutDat_Folder() *FalloutDat_Folder {
	return &FalloutDat_Folder{
	}
}

func (this *FalloutDat_Folder) Read(io *kaitai.Stream, parent *FalloutDat, root *FalloutDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.FileCount = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Unknown = uint32(tmp10)
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp11)
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp12)
	for i := 0; i < int(this.FileCount); i++ {
		_ = i
		tmp13 := NewFalloutDat_File()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Files = append(this.Files, tmp13)
	}
	return err
}
type FalloutDat_File struct {
	Name *FalloutDat_Pstr
	Flags FalloutDat_Compression
	Offset uint32
	SizeUnpacked uint32
	SizePacked uint32
	_io *kaitai.Stream
	_root *FalloutDat
	_parent *FalloutDat_Folder
	_f_contents bool
	contents []byte
}
func NewFalloutDat_File() *FalloutDat_File {
	return &FalloutDat_File{
	}
}

func (this *FalloutDat_File) Read(io *kaitai.Stream, parent *FalloutDat_Folder, root *FalloutDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewFalloutDat_Pstr()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp14
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Flags = FalloutDat_Compression(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp16)
	tmp17, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SizeUnpacked = uint32(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SizePacked = uint32(tmp18)
	return err
}
func (this *FalloutDat_File) Contents() (v []byte, err error) {
	if (this._f_contents) {
		return this.contents, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	var tmp19 uint32;
	if (this.Flags == FalloutDat_Compression__None) {
		tmp19 = this.SizeUnpacked
	} else {
		tmp19 = this.SizePacked
	}
	tmp20, err := thisIo.ReadBytes(int(tmp19))
	if err != nil {
		return nil, err
	}
	tmp20 = tmp20
	this.contents = tmp20
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_contents = true
	this._f_contents = true
	return this.contents, nil
}
