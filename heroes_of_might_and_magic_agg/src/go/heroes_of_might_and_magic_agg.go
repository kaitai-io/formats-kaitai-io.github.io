// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * @see <a href="https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)">Source</a>
 */
type HeroesOfMightAndMagicAgg struct {
	NumFiles uint16
	Entries []*HeroesOfMightAndMagicAgg_Entry
	_io *kaitai.Stream
	_root *HeroesOfMightAndMagicAgg
	_parent interface{}
	_raw_filenames [][]byte
	_f_filenames bool
	filenames []*HeroesOfMightAndMagicAgg_Filename
}
func NewHeroesOfMightAndMagicAgg() *HeroesOfMightAndMagicAgg {
	return &HeroesOfMightAndMagicAgg{
	}
}

func (this *HeroesOfMightAndMagicAgg) Read(io *kaitai.Stream, parent interface{}, root *HeroesOfMightAndMagicAgg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumFiles = uint16(tmp1)
	this.Entries = make([]*HeroesOfMightAndMagicAgg_Entry, this.NumFiles)
	for i := range this.Entries {
		tmp2 := NewHeroesOfMightAndMagicAgg_Entry()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp2
	}
	return err
}
func (this *HeroesOfMightAndMagicAgg) Filenames() (v []*HeroesOfMightAndMagicAgg_Filename, err error) {
	if (this._f_filenames) {
		return this.filenames, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp3 := this.Entries
	tmp4 := this.Entries
	_, err = this._io.Seek(int64((tmp3[len(tmp3) - 1].Offset + tmp4[len(tmp4) - 1].Size)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._raw_filenames = make([][]byte, this.NumFiles)
	this.filenames = make([]*HeroesOfMightAndMagicAgg_Filename, this.NumFiles)
	for i := range this.filenames {
		tmp5, err := this._io.ReadBytes(int(15))
		if err != nil {
			return nil, err
		}
		tmp5 = tmp5
		this._raw_filenames[i] = tmp5
		_io__raw_filenames := kaitai.NewStream(bytes.NewReader(this._raw_filenames[i]))
		tmp6 := NewHeroesOfMightAndMagicAgg_Filename()
		err = tmp6.Read(_io__raw_filenames, this, this._root)
		if err != nil {
			return nil, err
		}
		this.filenames[i] = tmp6
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_filenames = true
	this._f_filenames = true
	return this.filenames, nil
}
type HeroesOfMightAndMagicAgg_Entry struct {
	Hash uint16
	Offset uint32
	Size uint32
	Size2 uint32
	_io *kaitai.Stream
	_root *HeroesOfMightAndMagicAgg
	_parent *HeroesOfMightAndMagicAgg
	_f_body bool
	body []byte
}
func NewHeroesOfMightAndMagicAgg_Entry() *HeroesOfMightAndMagicAgg_Entry {
	return &HeroesOfMightAndMagicAgg_Entry{
	}
}

func (this *HeroesOfMightAndMagicAgg_Entry) Read(io *kaitai.Stream, parent *HeroesOfMightAndMagicAgg, root *HeroesOfMightAndMagicAgg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Hash = uint16(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size2 = uint32(tmp10)
	return err
}
func (this *HeroesOfMightAndMagicAgg_Entry) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp11, err := this._io.ReadBytes(int(this.Size))
	if err != nil {
		return nil, err
	}
	tmp11 = tmp11
	this.body = tmp11
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type HeroesOfMightAndMagicAgg_Filename struct {
	Str string
	_io *kaitai.Stream
	_root *HeroesOfMightAndMagicAgg
	_parent *HeroesOfMightAndMagicAgg
}
func NewHeroesOfMightAndMagicAgg_Filename() *HeroesOfMightAndMagicAgg_Filename {
	return &HeroesOfMightAndMagicAgg_Filename{
	}
}

func (this *HeroesOfMightAndMagicAgg_Filename) Read(io *kaitai.Stream, parent *HeroesOfMightAndMagicAgg, root *HeroesOfMightAndMagicAgg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Str = string(tmp12)
	return err
}
