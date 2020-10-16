// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


type Fallout2Dat_Compression int
const (
	Fallout2Dat_Compression__None Fallout2Dat_Compression = 0
	Fallout2Dat_Compression__Zlib Fallout2Dat_Compression = 1
)
type Fallout2Dat struct {
	_io *kaitai.Stream
	_root *Fallout2Dat
	_parent interface{}
	_f_footer bool
	footer *Fallout2Dat_Footer
	_f_index bool
	index *Fallout2Dat_Index
}
func NewFallout2Dat() *Fallout2Dat {
	return &Fallout2Dat{
	}
}

func (this *Fallout2Dat) Read(io *kaitai.Stream, parent interface{}, root *Fallout2Dat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Fallout2Dat) Footer() (v *Fallout2Dat_Footer, err error) {
	if (this._f_footer) {
		return this.footer, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp1, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp1 - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2 := NewFallout2Dat_Footer()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.footer = tmp2
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_footer = true
	this._f_footer = true
	return this.footer, nil
}
func (this *Fallout2Dat) Index() (v *Fallout2Dat_Index, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp3, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	tmp4, err := this.Footer()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(((tmp3 - 8) - tmp4.IndexSize)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp5 := NewFallout2Dat_Index()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.index = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_index = true
	this._f_index = true
	return this.index, nil
}
type Fallout2Dat_Pstr struct {
	Size uint32
	Str string
	_io *kaitai.Stream
	_root *Fallout2Dat
	_parent *Fallout2Dat_File
}
func NewFallout2Dat_Pstr() *Fallout2Dat_Pstr {
	return &Fallout2Dat_Pstr{
	}
}

func (this *Fallout2Dat_Pstr) Read(io *kaitai.Stream, parent *Fallout2Dat_File, root *Fallout2Dat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp6)
	tmp7, err := this._io.ReadBytes(int(this.Size))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Str = string(tmp7)
	return err
}
type Fallout2Dat_Footer struct {
	IndexSize uint32
	FileSize uint32
	_io *kaitai.Stream
	_root *Fallout2Dat
	_parent *Fallout2Dat
}
func NewFallout2Dat_Footer() *Fallout2Dat_Footer {
	return &Fallout2Dat_Footer{
	}
}

func (this *Fallout2Dat_Footer) Read(io *kaitai.Stream, parent *Fallout2Dat, root *Fallout2Dat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IndexSize = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSize = uint32(tmp9)
	return err
}
type Fallout2Dat_Index struct {
	FileCount uint32
	Files []*Fallout2Dat_File
	_io *kaitai.Stream
	_root *Fallout2Dat
	_parent *Fallout2Dat
}
func NewFallout2Dat_Index() *Fallout2Dat_Index {
	return &Fallout2Dat_Index{
	}
}

func (this *Fallout2Dat_Index) Read(io *kaitai.Stream, parent *Fallout2Dat, root *Fallout2Dat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileCount = uint32(tmp10)
	this.Files = make([]*Fallout2Dat_File, this.FileCount)
	for i := range this.Files {
		tmp11 := NewFallout2Dat_File()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Files[i] = tmp11
	}
	return err
}
type Fallout2Dat_File struct {
	Name *Fallout2Dat_Pstr
	Flags Fallout2Dat_Compression
	SizeUnpacked uint32
	SizePacked uint32
	Offset uint32
	_io *kaitai.Stream
	_root *Fallout2Dat
	_parent *Fallout2Dat_Index
	_raw_contentsZlib []byte
	_f_contentsRaw bool
	contentsRaw []byte
	_f_contentsZlib bool
	contentsZlib []byte
	_f_contents bool
	contents []byte
}
func NewFallout2Dat_File() *Fallout2Dat_File {
	return &Fallout2Dat_File{
	}
}

func (this *Fallout2Dat_File) Read(io *kaitai.Stream, parent *Fallout2Dat_Index, root *Fallout2Dat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12 := NewFallout2Dat_Pstr()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = Fallout2Dat_Compression(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeUnpacked = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizePacked = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp16)
	return err
}
func (this *Fallout2Dat_File) ContentsRaw() (v []byte, err error) {
	if (this._f_contentsRaw) {
		return this.contentsRaw, nil
	}
	if (this.Flags == Fallout2Dat_Compression__None) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp17, err := thisIo.ReadBytes(int(this.SizeUnpacked))
		if err != nil {
			return nil, err
		}
		tmp17 = tmp17
		this.contentsRaw = tmp17
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_contentsRaw = true
	}
	this._f_contentsRaw = true
	return this.contentsRaw, nil
}
func (this *Fallout2Dat_File) ContentsZlib() (v []byte, err error) {
	if (this._f_contentsZlib) {
		return this.contentsZlib, nil
	}
	if (this.Flags == Fallout2Dat_Compression__Zlib) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp18, err := thisIo.ReadBytes(int(this.SizePacked))
		if err != nil {
			return nil, err
		}
		tmp18 = tmp18
		this._raw_contentsZlib = tmp18
		tmp19, err := kaitai.ProcessZlib(this._raw_contentsZlib)
		if err != nil {
			return nil, err
		}
		this.contentsZlib = tmp19
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_contentsZlib = true
	}
	this._f_contentsZlib = true
	return this.contentsZlib, nil
}
func (this *Fallout2Dat_File) Contents() (v []byte, err error) {
	if (this._f_contents) {
		return this.contents, nil
	}
	if ( ((this.Flags == Fallout2Dat_Compression__Zlib) || (this.Flags == Fallout2Dat_Compression__None)) ) {
		var tmp20 []byte;
		if (this.Flags == Fallout2Dat_Compression__Zlib) {
			tmp21, err := this.ContentsZlib()
			if err != nil {
				return nil, err
			}
			tmp20 = tmp21
		} else {
			tmp22, err := this.ContentsRaw()
			if err != nil {
				return nil, err
			}
			tmp20 = tmp22
		}
		this.contents = []byte(tmp20)
	}
	this._f_contents = true
	return this.contents, nil
}
