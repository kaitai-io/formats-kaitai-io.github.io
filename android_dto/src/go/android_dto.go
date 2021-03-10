// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 * @see <a href="https://source.android.com/devices/architecture/dto/partitions">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47">Source</a>
 */
type AndroidDto struct {
	Header *AndroidDto_DtTableHeader
	Entries []*AndroidDto_DtTableEntry
	_io *kaitai.Stream
	_root *AndroidDto
	_parent interface{}
}
func NewAndroidDto() *AndroidDto {
	return &AndroidDto{
	}
}

func (this *AndroidDto) Read(io *kaitai.Stream, parent interface{}, root *AndroidDto) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewAndroidDto_DtTableHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	this.Entries = make([]*AndroidDto_DtTableEntry, this.Header.DtEntryCount)
	for i := range this.Entries {
		tmp2 := NewAndroidDto_DtTableEntry()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp2
	}
	return err
}
type AndroidDto_DtTableHeader struct {
	Magic []byte
	TotalSize uint32
	HeaderSize uint32
	DtEntrySize uint32
	DtEntryCount uint32
	DtEntriesOffset uint32
	PageSize uint32
	Version uint32
	_io *kaitai.Stream
	_root *AndroidDto
	_parent *AndroidDto
}
func NewAndroidDto_DtTableHeader() *AndroidDto_DtTableHeader {
	return &AndroidDto_DtTableHeader{
	}
}

func (this *AndroidDto_DtTableHeader) Read(io *kaitai.Stream, parent *AndroidDto, root *AndroidDto) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{215, 183, 171, 30})) {
		return kaitai.NewValidationNotEqualError([]uint8{215, 183, 171, 30}, this.Magic, this._io, "/types/dt_table_header/seq/0")
	}
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TotalSize = uint32(tmp4)
	tmp5, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DtEntrySize = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DtEntryCount = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DtEntriesOffset = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PageSize = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp10)
	return err
}

/**
 * includes dt_table_header + all dt_table_entry and all dtb/dtbo
 */

/**
 * sizeof(dt_table_header)
 */

/**
 * sizeof(dt_table_entry)
 */

/**
 * number of dt_table_entry
 */

/**
 * offset to the first dt_table_entry from head of dt_table_header
 */

/**
 * flash page size
 */

/**
 * DTBO image version
 */
type AndroidDto_DtTableEntry struct {
	DtSize uint32
	DtOffset uint32
	Id uint32
	Rev uint32
	Custom []uint32
	_io *kaitai.Stream
	_root *AndroidDto
	_parent *AndroidDto
	_f_body bool
	body []byte
}
func NewAndroidDto_DtTableEntry() *AndroidDto_DtTableEntry {
	return &AndroidDto_DtTableEntry{
	}
}

func (this *AndroidDto_DtTableEntry) Read(io *kaitai.Stream, parent *AndroidDto, root *AndroidDto) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DtSize = uint32(tmp11)
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DtOffset = uint32(tmp12)
	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Id = uint32(tmp13)
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Rev = uint32(tmp14)
	this.Custom = make([]uint32, 4)
	for i := range this.Custom {
		tmp15, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Custom[i] = tmp15
	}
	return err
}

/**
 * DTB/DTBO file
 */
func (this *AndroidDto_DtTableEntry) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.DtOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp16, err := thisIo.ReadBytes(int(this.DtSize))
	if err != nil {
		return nil, err
	}
	tmp16 = tmp16
	this.body = tmp16
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

/**
 * size of this entry
 */

/**
 * offset from head of dt_table_header
 */

/**
 * optional, must be zero if unused
 */

/**
 * optional, must be zero if unused
 */

/**
 * optional, must be zero if unused
 */
