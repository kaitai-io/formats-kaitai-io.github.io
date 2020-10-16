// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */
type Lzh struct {
	Entries []*Lzh_Record
	_io *kaitai.Stream
	_root *Lzh
	_parent interface{}
}
func NewLzh() *Lzh {
	return &Lzh{
	}
}

func (this *Lzh) Read(io *kaitai.Stream, parent interface{}, root *Lzh) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewLzh_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp2)
	}
	return err
}
type Lzh_Record struct {
	HeaderLen uint8
	FileRecord *Lzh_FileRecord
	_io *kaitai.Stream
	_root *Lzh
	_parent *Lzh
}
func NewLzh_Record() *Lzh_Record {
	return &Lzh_Record{
	}
}

func (this *Lzh_Record) Read(io *kaitai.Stream, parent *Lzh, root *Lzh) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HeaderLen = tmp3
	if (this.HeaderLen > 0) {
		tmp4 := NewLzh_FileRecord()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.FileRecord = tmp4
	}
	return err
}
type Lzh_FileRecord struct {
	Header *Lzh_Header
	FileUncomprCrc16 uint16
	Body []byte
	_io *kaitai.Stream
	_root *Lzh
	_parent *Lzh_Record
	_raw_Header []byte
}
func NewLzh_FileRecord() *Lzh_FileRecord {
	return &Lzh_FileRecord{
	}
}

func (this *Lzh_FileRecord) Read(io *kaitai.Stream, parent *Lzh_Record, root *Lzh) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int((this._parent.HeaderLen - 1)))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this._raw_Header = tmp5
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp6 := NewLzh_Header()
	err = tmp6.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp6
	if (this.Header.Header1.LhaLevel == 0) {
		tmp7, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.FileUncomprCrc16 = uint16(tmp7)
	}
	tmp8, err := this._io.ReadBytes(int(this.Header.Header1.FileSizeCompr))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Body = tmp8
	return err
}
type Lzh_Header struct {
	Header1 *Lzh_Header1
	FilenameLen uint8
	Filename string
	FileUncomprCrc16 uint16
	Os uint8
	ExtHeaderSize uint16
	_io *kaitai.Stream
	_root *Lzh
	_parent *Lzh_FileRecord
}
func NewLzh_Header() *Lzh_Header {
	return &Lzh_Header{
	}
}

func (this *Lzh_Header) Read(io *kaitai.Stream, parent *Lzh_FileRecord, root *Lzh) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9 := NewLzh_Header1()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header1 = tmp9
	if (this.Header1.LhaLevel == 0) {
		tmp10, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.FilenameLen = tmp10
	}
	if (this.Header1.LhaLevel == 0) {
		tmp11, err := this._io.ReadBytes(int(this.FilenameLen))
		if err != nil {
			return err
		}
		tmp11 = tmp11
		this.Filename = string(tmp11)
	}
	if (this.Header1.LhaLevel == 2) {
		tmp12, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.FileUncomprCrc16 = uint16(tmp12)
	}
	if (this.Header1.LhaLevel == 2) {
		tmp13, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Os = tmp13
	}
	if (this.Header1.LhaLevel == 2) {
		tmp14, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.ExtHeaderSize = uint16(tmp14)
	}
	return err
}

/**
 * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
 */
type Lzh_Header1 struct {
	HeaderChecksum uint8
	MethodId string
	FileSizeCompr uint32
	FileSizeUncompr uint32
	FileTimestamp uint32
	Attr uint8
	LhaLevel uint8
	_io *kaitai.Stream
	_root *Lzh
	_parent *Lzh_Header
}
func NewLzh_Header1() *Lzh_Header1 {
	return &Lzh_Header1{
	}
}

func (this *Lzh_Header1) Read(io *kaitai.Stream, parent *Lzh_Header, root *Lzh) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HeaderChecksum = tmp15
	tmp16, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.MethodId = string(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSizeCompr = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSizeUncompr = uint32(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileTimestamp = uint32(tmp19)
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Attr = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LhaLevel = tmp21
	return err
}

/**
 * Compressed file size
 */

/**
 * Uncompressed file size
 */

/**
 * Original file date/time
 */

/**
 * File or directory attribute
 */
