// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)

type Dune2Pak struct {
	Dir *Dune2Pak_Files
	_io *kaitai.Stream
	_root *Dune2Pak
	_parent interface{}
	_raw_Dir []byte
	_f_dirSize bool
	dirSize uint32
}
func NewDune2Pak() *Dune2Pak {
	return &Dune2Pak{
	}
}

func (this *Dune2Pak) Read(io *kaitai.Stream, parent interface{}, root *Dune2Pak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this.DirSize()
	if err != nil {
		return err
	}
	tmp2, err := this._io.ReadBytes(int(tmp1))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Dir = tmp2
	_io__raw_Dir := kaitai.NewStream(bytes.NewReader(this._raw_Dir))
	tmp3 := NewDune2Pak_Files()
	err = tmp3.Read(_io__raw_Dir, this, this._root)
	if err != nil {
		return err
	}
	this.Dir = tmp3
	return err
}
func (this *Dune2Pak) DirSize() (v uint32, err error) {
	if (this._f_dirSize) {
		return this.dirSize, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return 0, err
	}
	this.dirSize = tmp4
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_dirSize = true
	this._f_dirSize = true
	return this.dirSize, nil
}
type Dune2Pak_Files struct {
	Files []*Dune2Pak_File
	_io *kaitai.Stream
	_root *Dune2Pak
	_parent *Dune2Pak
}
func NewDune2Pak_Files() *Dune2Pak_Files {
	return &Dune2Pak_Files{
	}
}

func (this *Dune2Pak_Files) Read(io *kaitai.Stream, parent *Dune2Pak, root *Dune2Pak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp5, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp5 {
			break
		}
		tmp6 := NewDune2Pak_File(i)
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Files = append(this.Files, tmp6)
	}
	return err
}
type Dune2Pak_File struct {
	Ofs uint32
	FileName string
	Idx uint32
	_io *kaitai.Stream
	_root *Dune2Pak
	_parent *Dune2Pak_Files
	_f_nextOfs0 bool
	nextOfs0 uint32
	_f_nextOfs bool
	nextOfs int
	_f_body bool
	body []byte
}
func NewDune2Pak_File(idx uint32) *Dune2Pak_File {
	return &Dune2Pak_File{
		Idx: idx,
	}
}

func (this *Dune2Pak_File) Read(io *kaitai.Stream, parent *Dune2Pak_Files, root *Dune2Pak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ofs = uint32(tmp7)
	if (this.Ofs != 0) {
		tmp8, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.FileName = string(tmp8)
	}
	return err
}
func (this *Dune2Pak_File) NextOfs0() (v uint32, err error) {
	if (this._f_nextOfs0) {
		return this.nextOfs0, nil
	}
	if (this.Ofs != 0) {
		this.nextOfs0 = uint32(this._root.Dir.Files[(this.Idx + 1)].Ofs)
	}
	this._f_nextOfs0 = true
	return this.nextOfs0, nil
}
func (this *Dune2Pak_File) NextOfs() (v int, err error) {
	if (this._f_nextOfs) {
		return this.nextOfs, nil
	}
	if (this.Ofs != 0) {
		var tmp9 int;
		tmp10, err := this.NextOfs0()
		if err != nil {
			return 0, err
		}
		if (tmp10 == 0) {
			tmp11, err := this._root._io.Size()
			if err != nil {
				return 0, err
			}
			tmp9 = tmp11
		} else {
			tmp12, err := this.NextOfs0()
			if err != nil {
				return 0, err
			}
			tmp9 = tmp12
		}
		this.nextOfs = int(tmp9)
	}
	this._f_nextOfs = true
	return this.nextOfs, nil
}
func (this *Dune2Pak_File) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	if (this.Ofs != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Ofs), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp13, err := this.NextOfs()
		if err != nil {
			return nil, err
		}
		tmp14, err := thisIo.ReadBytes(int((tmp13 - this.Ofs)))
		if err != nil {
			return nil, err
		}
		tmp14 = tmp14
		this.body = tmp14
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}
