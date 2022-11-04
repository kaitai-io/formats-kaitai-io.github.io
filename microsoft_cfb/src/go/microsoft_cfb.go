// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
	"golang.org/x/text/encoding/unicode"
)

type MicrosoftCfb struct {
	Header *MicrosoftCfb_CfbHeader
	_io *kaitai.Stream
	_root *MicrosoftCfb
	_parent interface{}
	_raw_fat []byte
	_f_sectorSize bool
	sectorSize int
	_f_fat bool
	fat *MicrosoftCfb_FatEntries
	_f_dir bool
	dir *MicrosoftCfb_DirEntry
}
func NewMicrosoftCfb() *MicrosoftCfb {
	return &MicrosoftCfb{
	}
}

func (this *MicrosoftCfb) Read(io *kaitai.Stream, parent interface{}, root *MicrosoftCfb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewMicrosoftCfb_CfbHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	return err
}
func (this *MicrosoftCfb) SectorSize() (v int, err error) {
	if (this._f_sectorSize) {
		return this.sectorSize, nil
	}
	this.sectorSize = int((1 << this.Header.SectorShift))
	this._f_sectorSize = true
	return this.sectorSize, nil
}
func (this *MicrosoftCfb) Fat() (v *MicrosoftCfb_FatEntries, err error) {
	if (this._f_fat) {
		return this.fat, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp2, err := this.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp2), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp3, err := this.SectorSize()
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadBytes(int((this.Header.SizeFat * tmp3)))
	if err != nil {
		return nil, err
	}
	tmp4 = tmp4
	this._raw_fat = tmp4
	_io__raw_fat := kaitai.NewStream(bytes.NewReader(this._raw_fat))
	tmp5 := NewMicrosoftCfb_FatEntries()
	err = tmp5.Read(_io__raw_fat, this, this._root)
	if err != nil {
		return nil, err
	}
	this.fat = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_fat = true
	this._f_fat = true
	return this.fat, nil
}
func (this *MicrosoftCfb) Dir() (v *MicrosoftCfb_DirEntry, err error) {
	if (this._f_dir) {
		return this.dir, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp6, err := this.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(((this.Header.OfsDir + 1) * tmp6)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7 := NewMicrosoftCfb_DirEntry()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.dir = tmp7
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_dir = true
	this._f_dir = true
	return this.dir, nil
}
type MicrosoftCfb_CfbHeader struct {
	Signature []byte
	Clsid []byte
	VersionMinor uint16
	VersionMajor uint16
	ByteOrder []byte
	SectorShift uint16
	MiniSectorShift uint16
	Reserved1 []byte
	SizeDir int32
	SizeFat int32
	OfsDir int32
	TransactionSeq int32
	MiniStreamCutoffSize int32
	OfsMiniFat int32
	SizeMiniFat int32
	OfsDifat int32
	SizeDifat int32
	Difat []int32
	_io *kaitai.Stream
	_root *MicrosoftCfb
	_parent *MicrosoftCfb
}
func NewMicrosoftCfb_CfbHeader() *MicrosoftCfb_CfbHeader {
	return &MicrosoftCfb_CfbHeader{
	}
}

func (this *MicrosoftCfb_CfbHeader) Read(io *kaitai.Stream, parent *MicrosoftCfb, root *MicrosoftCfb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Signature = tmp8
	if !(bytes.Equal(this.Signature, []uint8{208, 207, 17, 224, 161, 177, 26, 225})) {
		return kaitai.NewValidationNotEqualError([]uint8{208, 207, 17, 224, 161, 177, 26, 225}, this.Signature, this._io, "/types/cfb_header/seq/0")
	}
	tmp9, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Clsid = tmp9
	if !(bytes.Equal(this.Clsid, []uint8{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, this.Clsid, this._io, "/types/cfb_header/seq/1")
	}
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMinor = uint16(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMajor = uint16(tmp11)
	tmp12, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.ByteOrder = tmp12
	if !(bytes.Equal(this.ByteOrder, []uint8{254, 255})) {
		return kaitai.NewValidationNotEqualError([]uint8{254, 255}, this.ByteOrder, this._io, "/types/cfb_header/seq/4")
	}
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectorShift = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MiniSectorShift = uint16(tmp14)
	tmp15, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Reserved1 = tmp15
	tmp16, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SizeDir = int32(tmp16)
	tmp17, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SizeFat = int32(tmp17)
	tmp18, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OfsDir = int32(tmp18)
	tmp19, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.TransactionSeq = int32(tmp19)
	tmp20, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.MiniStreamCutoffSize = int32(tmp20)
	tmp21, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OfsMiniFat = int32(tmp21)
	tmp22, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SizeMiniFat = int32(tmp22)
	tmp23, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OfsDifat = int32(tmp23)
	tmp24, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SizeDifat = int32(tmp24)
	for i := 0; i < int(109); i++ {
		_ = i
		tmp25, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Difat = append(this.Difat, tmp25)
	}
	return err
}

/**
 * Magic bytes that confirm that this is a CFB file
 */

/**
 * Reserved class ID field, must be all 0
 */

/**
 * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
 */

/**
 * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
 */

/**
 * Number of directory sectors in this file. For major version 3, must be 0.
 */

/**
 * Number of FAT sectors in this file.
 */

/**
 * Starting sector number for directory stream.
 */

/**
 * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
 */

/**
 * Starting sector number for mini FAT.
 */

/**
 * Number of mini FAT sectors in this file.
 */

/**
 * Starting sector number for DIFAT.
 */

/**
 * Number of DIFAT sectors in this file.
 */
type MicrosoftCfb_FatEntries struct {
	Entries []int32
	_io *kaitai.Stream
	_root *MicrosoftCfb
	_parent *MicrosoftCfb
}
func NewMicrosoftCfb_FatEntries() *MicrosoftCfb_FatEntries {
	return &MicrosoftCfb_FatEntries{
	}
}

func (this *MicrosoftCfb_FatEntries) Read(io *kaitai.Stream, parent *MicrosoftCfb, root *MicrosoftCfb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp26, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp26 {
			break
		}
		tmp27, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp27)
	}
	return err
}

type MicrosoftCfb_DirEntry_ObjType int
const (
	MicrosoftCfb_DirEntry_ObjType__Unknown MicrosoftCfb_DirEntry_ObjType = 0
	MicrosoftCfb_DirEntry_ObjType__Storage MicrosoftCfb_DirEntry_ObjType = 1
	MicrosoftCfb_DirEntry_ObjType__Stream MicrosoftCfb_DirEntry_ObjType = 2
	MicrosoftCfb_DirEntry_ObjType__RootStorage MicrosoftCfb_DirEntry_ObjType = 5
)

type MicrosoftCfb_DirEntry_RbColor int
const (
	MicrosoftCfb_DirEntry_RbColor__Red MicrosoftCfb_DirEntry_RbColor = 0
	MicrosoftCfb_DirEntry_RbColor__Black MicrosoftCfb_DirEntry_RbColor = 1
)
type MicrosoftCfb_DirEntry struct {
	Name string
	NameLen uint16
	ObjectType MicrosoftCfb_DirEntry_ObjType
	ColorFlag MicrosoftCfb_DirEntry_RbColor
	LeftSiblingId int32
	RightSiblingId int32
	ChildId int32
	Clsid []byte
	State uint32
	TimeCreate uint64
	TimeMod uint64
	Ofs int32
	Size uint64
	_io *kaitai.Stream
	_root *MicrosoftCfb
	_parent interface{}
	_f_miniStream bool
	miniStream []byte
	_f_child bool
	child *MicrosoftCfb_DirEntry
	_f_leftSibling bool
	leftSibling *MicrosoftCfb_DirEntry
	_f_rightSibling bool
	rightSibling *MicrosoftCfb_DirEntry
}
func NewMicrosoftCfb_DirEntry() *MicrosoftCfb_DirEntry {
	return &MicrosoftCfb_DirEntry{
	}
}

func (this *MicrosoftCfb_DirEntry) Read(io *kaitai.Stream, parent interface{}, root *MicrosoftCfb) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	tmp29, err := kaitai.BytesToStr(tmp28, unicode.UTF16(unicode.LittleEndian, unicode.IgnoreBOM).NewDecoder())
	if err != nil {
		return err
	}
	this.Name = tmp29
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NameLen = uint16(tmp30)
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ObjectType = MicrosoftCfb_DirEntry_ObjType(tmp31)
	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorFlag = MicrosoftCfb_DirEntry_RbColor(tmp32)
	tmp33, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.LeftSiblingId = int32(tmp33)
	tmp34, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.RightSiblingId = int32(tmp34)
	tmp35, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.ChildId = int32(tmp35)
	tmp36, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Clsid = tmp36
	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.State = uint32(tmp37)
	tmp38, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TimeCreate = uint64(tmp38)
	tmp39, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TimeMod = uint64(tmp39)
	tmp40, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Ofs = int32(tmp40)
	tmp41, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp41)
	return err
}
func (this *MicrosoftCfb_DirEntry) MiniStream() (v []byte, err error) {
	if (this._f_miniStream) {
		return this.miniStream, nil
	}
	if (this.ObjectType == MicrosoftCfb_DirEntry_ObjType__RootStorage) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp42, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(((this.Ofs + 1) * tmp42)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp43, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp43 = tmp43
		this.miniStream = tmp43
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_miniStream = true
	}
	this._f_miniStream = true
	return this.miniStream, nil
}
func (this *MicrosoftCfb_DirEntry) Child() (v *MicrosoftCfb_DirEntry, err error) {
	if (this._f_child) {
		return this.child, nil
	}
	if (this.ChildId != -1) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp44, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((((this._root.Header.OfsDir + 1) * tmp44) + (this.ChildId * 128))), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp45 := NewMicrosoftCfb_DirEntry()
		err = tmp45.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.child = tmp45
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_child = true
	}
	this._f_child = true
	return this.child, nil
}
func (this *MicrosoftCfb_DirEntry) LeftSibling() (v *MicrosoftCfb_DirEntry, err error) {
	if (this._f_leftSibling) {
		return this.leftSibling, nil
	}
	if (this.LeftSiblingId != -1) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp46, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((((this._root.Header.OfsDir + 1) * tmp46) + (this.LeftSiblingId * 128))), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp47 := NewMicrosoftCfb_DirEntry()
		err = tmp47.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.leftSibling = tmp47
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_leftSibling = true
	}
	this._f_leftSibling = true
	return this.leftSibling, nil
}
func (this *MicrosoftCfb_DirEntry) RightSibling() (v *MicrosoftCfb_DirEntry, err error) {
	if (this._f_rightSibling) {
		return this.rightSibling, nil
	}
	if (this.RightSiblingId != -1) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp48, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((((this._root.Header.OfsDir + 1) * tmp48) + (this.RightSiblingId * 128))), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp49 := NewMicrosoftCfb_DirEntry()
		err = tmp49.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.rightSibling = tmp49
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_rightSibling = true
	}
	this._f_rightSibling = true
	return this.rightSibling, nil
}

/**
 * User-defined flags for storage or root storage objects
 */

/**
 * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
 */

/**
 * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
 */

/**
 * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
 */

/**
 * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
 */