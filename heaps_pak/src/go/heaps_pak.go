// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx">Source</a>
 */
type HeapsPak struct {
	Header *HeapsPak_Header
	_io *kaitai.Stream
	_root *HeapsPak
	_parent interface{}
}
func NewHeapsPak() *HeapsPak {
	return &HeapsPak{
	}
}

func (this *HeapsPak) Read(io *kaitai.Stream, parent interface{}, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewHeapsPak_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	return err
}
type HeapsPak_Header struct {
	Magic1 []byte
	Version uint8
	LenHeader uint32
	LenData uint32
	RootEntry *HeapsPak_Header_Entry
	Magic2 []byte
	_io *kaitai.Stream
	_root *HeapsPak
	_parent *HeapsPak
	_raw_RootEntry []byte
}
func NewHeapsPak_Header() *HeapsPak_Header {
	return &HeapsPak_Header{
	}
}

func (this *HeapsPak_Header) Read(io *kaitai.Stream, parent *HeapsPak, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Magic1 = tmp2
	if !(bytes.Equal(this.Magic1, []uint8{80, 65, 75})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 65, 75}, this.Magic1, this._io, "/types/header/seq/0")
	}
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp3
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenHeader = uint32(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp5)
	tmp6, err := this._io.ReadBytes(int((this.LenHeader - 16)))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this._raw_RootEntry = tmp6
	_io__raw_RootEntry := kaitai.NewStream(bytes.NewReader(this._raw_RootEntry))
	tmp7 := NewHeapsPak_Header_Entry()
	err = tmp7.Read(_io__raw_RootEntry, this, this._root)
	if err != nil {
		return err
	}
	this.RootEntry = tmp7
	tmp8, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Magic2 = tmp8
	if !(bytes.Equal(this.Magic2, []uint8{68, 65, 84, 65})) {
		return kaitai.NewValidationNotEqualError([]uint8{68, 65, 84, 65}, this.Magic2, this._io, "/types/header/seq/5")
	}
	return err
}

/**
 * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx">Source</a>
 */
type HeapsPak_Header_Entry struct {
	LenName uint8
	Name string
	Flags *HeapsPak_Header_Entry_Flags
	Body interface{}
	_io *kaitai.Stream
	_root *HeapsPak
	_parent interface{}
}
func NewHeapsPak_Header_Entry() *HeapsPak_Header_Entry {
	return &HeapsPak_Header_Entry{
	}
}

func (this *HeapsPak_Header_Entry) Read(io *kaitai.Stream, parent interface{}, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenName = tmp9
	tmp10, err := this._io.ReadBytes(int(this.LenName))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Name = string(tmp10)
	tmp11 := NewHeapsPak_Header_Entry_Flags()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp11
	switch (this.Flags.IsDir) {
	case true:
		tmp12 := NewHeapsPak_Header_Dir()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp12
	case false:
		tmp13 := NewHeapsPak_Header_File()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp13
	}
	return err
}
type HeapsPak_Header_Entry_Flags struct {
	Unused uint64
	IsDir bool
	_io *kaitai.Stream
	_root *HeapsPak
	_parent *HeapsPak_Header_Entry
}
func NewHeapsPak_Header_Entry_Flags() *HeapsPak_Header_Entry_Flags {
	return &HeapsPak_Header_Entry_Flags{
	}
}

func (this *HeapsPak_Header_Entry_Flags) Read(io *kaitai.Stream, parent *HeapsPak_Header_Entry, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.Unused = tmp14
	tmp15, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsDir = tmp15 != 0
	return err
}
type HeapsPak_Header_File struct {
	OfsData uint32
	LenData uint32
	Checksum []byte
	_io *kaitai.Stream
	_root *HeapsPak
	_parent *HeapsPak_Header_Entry
	_f_data bool
	data []byte
}
func NewHeapsPak_Header_File() *HeapsPak_Header_File {
	return &HeapsPak_Header_File{
	}
}

func (this *HeapsPak_Header_File) Read(io *kaitai.Stream, parent *HeapsPak_Header_Entry, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsData = uint32(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp17)
	tmp18, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Checksum = tmp18
	return err
}
func (this *HeapsPak_Header_File) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((this._root.Header.LenHeader + this.OfsData)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp19, err := thisIo.ReadBytes(int(this.LenData))
	if err != nil {
		return nil, err
	}
	tmp19 = tmp19
	this.data = tmp19
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
type HeapsPak_Header_Dir struct {
	NumEntries uint32
	Entries []*HeapsPak_Header_Entry
	_io *kaitai.Stream
	_root *HeapsPak
	_parent *HeapsPak_Header_Entry
}
func NewHeapsPak_Header_Dir() *HeapsPak_Header_Dir {
	return &HeapsPak_Header_Dir{
	}
}

func (this *HeapsPak_Header_Dir) Read(io *kaitai.Stream, parent *HeapsPak_Header_Entry, root *HeapsPak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumEntries = uint32(tmp20)
	this.Entries = make([]*HeapsPak_Header_Entry, this.NumEntries)
	for i := range this.Entries {
		tmp21 := NewHeapsPak_Header_Entry()
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp21
	}
	return err
}
