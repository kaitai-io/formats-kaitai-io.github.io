// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)

type FtlDat struct {
	NumFiles uint32
	Files []*FtlDat_File
	_io *kaitai.Stream
	_root *FtlDat
	_parent interface{}
}
func NewFtlDat() *FtlDat {
	return &FtlDat{
	}
}

func (this *FtlDat) Read(io *kaitai.Stream, parent interface{}, root *FtlDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumFiles = uint32(tmp1)
	this.Files = make([]*FtlDat_File, this.NumFiles)
	for i := range this.Files {
		tmp2 := NewFtlDat_File()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Files[i] = tmp2
	}
	return err
}

/**
 * Number of files in the archive
 */
type FtlDat_File struct {
	OfsMeta uint32
	_io *kaitai.Stream
	_root *FtlDat
	_parent *FtlDat
	_f_meta bool
	meta *FtlDat_Meta
}
func NewFtlDat_File() *FtlDat_File {
	return &FtlDat_File{
	}
}

func (this *FtlDat_File) Read(io *kaitai.Stream, parent *FtlDat, root *FtlDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsMeta = uint32(tmp3)
	return err
}
func (this *FtlDat_File) Meta() (v *FtlDat_Meta, err error) {
	if (this._f_meta) {
		return this.meta, nil
	}
	if (this.OfsMeta != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.OfsMeta), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp4 := NewFtlDat_Meta()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.meta = tmp4
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_meta = true
	}
	this._f_meta = true
	return this.meta, nil
}
type FtlDat_Meta struct {
	LenFile uint32
	LenFilename uint32
	Filename string
	Body []byte
	_io *kaitai.Stream
	_root *FtlDat
	_parent *FtlDat_File
}
func NewFtlDat_Meta() *FtlDat_Meta {
	return &FtlDat_Meta{
	}
}

func (this *FtlDat_Meta) Read(io *kaitai.Stream, parent *FtlDat_File, root *FtlDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFile = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFilename = uint32(tmp6)
	tmp7, err := this._io.ReadBytes(int(this.LenFilename))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Filename = string(tmp7)
	tmp8, err := this._io.ReadBytes(int(this.LenFile))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Body = tmp8
	return err
}
