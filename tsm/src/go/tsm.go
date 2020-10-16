// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */
type Tsm struct {
	Header *Tsm_Header
	_io *kaitai.Stream
	_root *Tsm
	_parent interface{}
	_f_index bool
	index *Tsm_Index
}
func NewTsm() *Tsm {
	return &Tsm{
	}
}

func (this *Tsm) Read(io *kaitai.Stream, parent interface{}, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewTsm_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	return err
}
func (this *Tsm) Index() (v *Tsm_Index, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp2, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp2 - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp3 := NewTsm_Index()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.index = tmp3
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_index = true
	this._f_index = true
	return this.index, nil
}
type Tsm_Header struct {
	Magic []byte
	Version uint8
	_io *kaitai.Stream
	_root *Tsm
	_parent *Tsm
}
func NewTsm_Header() *Tsm_Header {
	return &Tsm_Header{
	}
}

func (this *Tsm_Header) Read(io *kaitai.Stream, parent *Tsm, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Magic = tmp4
	if !(bytes.Equal(this.Magic, []uint8{22, 209, 22, 209})) {
		return kaitai.NewValidationNotEqualError([]uint8{22, 209, 22, 209}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp5
	return err
}
type Tsm_Index struct {
	Offset uint64
	_io *kaitai.Stream
	_root *Tsm
	_parent *Tsm
	_f_entries bool
	entries []*Tsm_Index_IndexHeader
}
func NewTsm_Index() *Tsm_Index {
	return &Tsm_Index{
	}
}

func (this *Tsm_Index) Read(io *kaitai.Stream, parent *Tsm, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp6)
	return err
}
func (this *Tsm_Index) Entries() (v []*Tsm_Index_IndexHeader, err error) {
	if (this._f_entries) {
		return this.entries, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 1;; i++ {
		tmp7 := NewTsm_Index_IndexHeader()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		_it := tmp7
		this.entries = append(this.entries, _it)
		tmp8, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		tmp9, err := this._io.Size()
		if err != nil {
			return nil, err
		}
		if tmp8 == (tmp9 - 8) {
			break
		}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_entries = true
	this._f_entries = true
	return this.entries, nil
}
type Tsm_Index_IndexHeader struct {
	KeyLen uint16
	Key string
	Type uint8
	EntryCount uint16
	IndexEntries []*Tsm_Index_IndexHeader_IndexEntry
	_io *kaitai.Stream
	_root *Tsm
	_parent *Tsm_Index
}
func NewTsm_Index_IndexHeader() *Tsm_Index_IndexHeader {
	return &Tsm_Index_IndexHeader{
	}
}

func (this *Tsm_Index_IndexHeader) Read(io *kaitai.Stream, parent *Tsm_Index, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.KeyLen = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int(this.KeyLen))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Key = string(tmp11)
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp12
	tmp13, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.EntryCount = uint16(tmp13)
	this.IndexEntries = make([]*Tsm_Index_IndexHeader_IndexEntry, this.EntryCount)
	for i := range this.IndexEntries {
		tmp14 := NewTsm_Index_IndexHeader_IndexEntry()
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.IndexEntries[i] = tmp14
	}
	return err
}
type Tsm_Index_IndexHeader_IndexEntry struct {
	MinTime uint64
	MaxTime uint64
	BlockOffset uint64
	BlockSize uint32
	_io *kaitai.Stream
	_root *Tsm
	_parent *Tsm_Index_IndexHeader
	_f_block bool
	block *Tsm_Index_IndexHeader_IndexEntry_BlockEntry
}
func NewTsm_Index_IndexHeader_IndexEntry() *Tsm_Index_IndexHeader_IndexEntry {
	return &Tsm_Index_IndexHeader_IndexEntry{
	}
}

func (this *Tsm_Index_IndexHeader_IndexEntry) Read(io *kaitai.Stream, parent *Tsm_Index_IndexHeader, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.MinTime = uint64(tmp15)
	tmp16, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.MaxTime = uint64(tmp16)
	tmp17, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.BlockOffset = uint64(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BlockSize = uint32(tmp18)
	return err
}
func (this *Tsm_Index_IndexHeader_IndexEntry) Block() (v *Tsm_Index_IndexHeader_IndexEntry_BlockEntry, err error) {
	if (this._f_block) {
		return this.block, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.BlockOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp19 := NewTsm_Index_IndexHeader_IndexEntry_BlockEntry()
	err = tmp19.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.block = tmp19
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_block = true
	this._f_block = true
	return this.block, nil
}
type Tsm_Index_IndexHeader_IndexEntry_BlockEntry struct {
	Crc32 uint32
	Data []byte
	_io *kaitai.Stream
	_root *Tsm
	_parent *Tsm_Index_IndexHeader_IndexEntry
}
func NewTsm_Index_IndexHeader_IndexEntry_BlockEntry() *Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
	return &Tsm_Index_IndexHeader_IndexEntry_BlockEntry{
	}
}

func (this *Tsm_Index_IndexHeader_IndexEntry_BlockEntry) Read(io *kaitai.Stream, parent *Tsm_Index_IndexHeader_IndexEntry, root *Tsm) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp20)
	tmp21, err := this._io.ReadBytes(int((this._parent.BlockSize - 4)))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.Data = tmp21
	return err
}
