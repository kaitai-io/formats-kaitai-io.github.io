// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * @see <a href="https://quakewiki.org/wiki/.pak#Format_specification">Source</a>
 */
type QuakePak struct {
	Magic []byte
	OfsIndex uint32
	LenIndex uint32
	_io *kaitai.Stream
	_root *QuakePak
	_parent interface{}
	_raw_index []byte
	_f_index bool
	index *QuakePak_IndexStruct
}
func NewQuakePak() *QuakePak {
	return &QuakePak{
	}
}

func (this *QuakePak) Read(io *kaitai.Stream, parent interface{}, root *QuakePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{80, 65, 67, 75})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 65, 67, 75}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsIndex = uint32(tmp2)
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenIndex = uint32(tmp3)
	return err
}
func (this *QuakePak) Index() (v *QuakePak_IndexStruct, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsIndex), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadBytes(int(this.LenIndex))
	if err != nil {
		return nil, err
	}
	tmp4 = tmp4
	this._raw_index = tmp4
	_io__raw_index := kaitai.NewStream(bytes.NewReader(this._raw_index))
	tmp5 := NewQuakePak_IndexStruct()
	err = tmp5.Read(_io__raw_index, this, this._root)
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
type QuakePak_IndexStruct struct {
	Entries []*QuakePak_IndexEntry
	_io *kaitai.Stream
	_root *QuakePak
	_parent *QuakePak
}
func NewQuakePak_IndexStruct() *QuakePak_IndexStruct {
	return &QuakePak_IndexStruct{
	}
}

func (this *QuakePak_IndexStruct) Read(io *kaitai.Stream, parent *QuakePak, root *QuakePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp6, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp6 {
			break
		}
		tmp7 := NewQuakePak_IndexEntry()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp7)
	}
	return err
}
type QuakePak_IndexEntry struct {
	Name string
	Ofs uint32
	Size uint32
	_io *kaitai.Stream
	_root *QuakePak
	_parent *QuakePak_IndexStruct
	_f_body bool
	body []byte
}
func NewQuakePak_IndexEntry() *QuakePak_IndexEntry {
	return &QuakePak_IndexEntry{
	}
}

func (this *QuakePak_IndexEntry) Read(io *kaitai.Stream, parent *QuakePak_IndexStruct, root *QuakePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(56))
	if err != nil {
		return err
	}
	tmp8 = kaitai.BytesTerminate(kaitai.BytesStripRight(tmp8, 0), 0, false)
	this.Name = string(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ofs = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp10)
	return err
}
func (this *QuakePak_IndexEntry) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Ofs), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp11, err := thisIo.ReadBytes(int(this.Size))
	if err != nil {
		return nil, err
	}
	tmp11 = tmp11
	this.body = tmp11
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
