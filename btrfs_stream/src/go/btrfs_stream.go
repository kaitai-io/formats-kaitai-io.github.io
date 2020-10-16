// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
 * administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
 * integral multi-device spanning in Linux file systems.
 * Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
 * using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
 * different Btrfs file system. The `btrfs send` command creates a set of data modifications required
 * for converting one subvolume into another.
 * This spec can be used to disassemble the binary diff created by the `btrfs send` command.
 * If you want a text representation you may want to checkout `btrfs receive --dump` instead.
 * @see <a href="https://btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive">Source</a>
 */

type BtrfsStream_Command int
const (
	BtrfsStream_Command__Unspec BtrfsStream_Command = 0
	BtrfsStream_Command__Subvol BtrfsStream_Command = 1
	BtrfsStream_Command__Snapshot BtrfsStream_Command = 2
	BtrfsStream_Command__Mkfile BtrfsStream_Command = 3
	BtrfsStream_Command__Mkdir BtrfsStream_Command = 4
	BtrfsStream_Command__Mknod BtrfsStream_Command = 5
	BtrfsStream_Command__Mkfifo BtrfsStream_Command = 6
	BtrfsStream_Command__Mksock BtrfsStream_Command = 7
	BtrfsStream_Command__Symlink BtrfsStream_Command = 8
	BtrfsStream_Command__Rename BtrfsStream_Command = 9
	BtrfsStream_Command__Link BtrfsStream_Command = 10
	BtrfsStream_Command__Unlink BtrfsStream_Command = 11
	BtrfsStream_Command__Rmdir BtrfsStream_Command = 12
	BtrfsStream_Command__SetXattr BtrfsStream_Command = 13
	BtrfsStream_Command__RemoveXattr BtrfsStream_Command = 14
	BtrfsStream_Command__Write BtrfsStream_Command = 15
	BtrfsStream_Command__Clone BtrfsStream_Command = 16
	BtrfsStream_Command__Truncate BtrfsStream_Command = 17
	BtrfsStream_Command__Chmod BtrfsStream_Command = 18
	BtrfsStream_Command__Chown BtrfsStream_Command = 19
	BtrfsStream_Command__Utimes BtrfsStream_Command = 20
	BtrfsStream_Command__End BtrfsStream_Command = 21
	BtrfsStream_Command__UpdateExtent BtrfsStream_Command = 22
)

type BtrfsStream_Attribute int
const (
	BtrfsStream_Attribute__Unspec BtrfsStream_Attribute = 0
	BtrfsStream_Attribute__Uuid BtrfsStream_Attribute = 1
	BtrfsStream_Attribute__Ctransid BtrfsStream_Attribute = 2
	BtrfsStream_Attribute__Ino BtrfsStream_Attribute = 3
	BtrfsStream_Attribute__Size BtrfsStream_Attribute = 4
	BtrfsStream_Attribute__Mode BtrfsStream_Attribute = 5
	BtrfsStream_Attribute__Uid BtrfsStream_Attribute = 6
	BtrfsStream_Attribute__Gid BtrfsStream_Attribute = 7
	BtrfsStream_Attribute__Rdev BtrfsStream_Attribute = 8
	BtrfsStream_Attribute__Ctime BtrfsStream_Attribute = 9
	BtrfsStream_Attribute__Mtime BtrfsStream_Attribute = 10
	BtrfsStream_Attribute__Atime BtrfsStream_Attribute = 11
	BtrfsStream_Attribute__Otime BtrfsStream_Attribute = 12
	BtrfsStream_Attribute__XattrName BtrfsStream_Attribute = 13
	BtrfsStream_Attribute__XattrData BtrfsStream_Attribute = 14
	BtrfsStream_Attribute__Path BtrfsStream_Attribute = 15
	BtrfsStream_Attribute__PathTo BtrfsStream_Attribute = 16
	BtrfsStream_Attribute__PathLink BtrfsStream_Attribute = 17
	BtrfsStream_Attribute__FileOffset BtrfsStream_Attribute = 18
	BtrfsStream_Attribute__Data BtrfsStream_Attribute = 19
	BtrfsStream_Attribute__CloneUuid BtrfsStream_Attribute = 20
	BtrfsStream_Attribute__CloneCtransid BtrfsStream_Attribute = 21
	BtrfsStream_Attribute__ClonePath BtrfsStream_Attribute = 22
	BtrfsStream_Attribute__CloneOffset BtrfsStream_Attribute = 23
	BtrfsStream_Attribute__CloneLen BtrfsStream_Attribute = 24
)
type BtrfsStream struct {
	Header *BtrfsStream_SendStreamHeader
	Commands []*BtrfsStream_SendCommand
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent interface{}
}
func NewBtrfsStream() *BtrfsStream {
	return &BtrfsStream{
	}
}

func (this *BtrfsStream) Read(io *kaitai.Stream, parent interface{}, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewBtrfsStream_SendStreamHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewBtrfsStream_SendCommand()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Commands = append(this.Commands, tmp3)
	}
	return err
}
type BtrfsStream_SendStreamHeader struct {
	Magic []byte
	Version uint32
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream
}
func NewBtrfsStream_SendStreamHeader() *BtrfsStream_SendStreamHeader {
	return &BtrfsStream_SendStreamHeader{
	}
}

func (this *BtrfsStream_SendStreamHeader) Read(io *kaitai.Stream, parent *BtrfsStream, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(13))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Magic = tmp4
	if !(bytes.Equal(this.Magic, []uint8{98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0}, this.Magic, this._io, "/types/send_stream_header/seq/0")
	}
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp5)
	return err
}
type BtrfsStream_SendCommand struct {
	LenData uint32
	Type BtrfsStream_Command
	Checksum []byte
	Data *BtrfsStream_SendCommand_Tlvs
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream
	_raw_Data []byte
}
func NewBtrfsStream_SendCommand() *BtrfsStream_SendCommand {
	return &BtrfsStream_SendCommand{
	}
}

func (this *BtrfsStream_SendCommand) Read(io *kaitai.Stream, parent *BtrfsStream, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = BtrfsStream_Command(tmp7)
	tmp8, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Checksum = tmp8
	tmp9, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this._raw_Data = tmp9
	_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
	tmp10 := NewBtrfsStream_SendCommand_Tlvs()
	err = tmp10.Read(_io__raw_Data, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp10
	return err
}

/**
 * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
 */
type BtrfsStream_SendCommand_Tlv struct {
	Type BtrfsStream_Attribute
	Length uint16
	Value interface{}
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream_SendCommand_Tlvs
	_raw_Value []byte
}
func NewBtrfsStream_SendCommand_Tlv() *BtrfsStream_SendCommand_Tlv {
	return &BtrfsStream_SendCommand_Tlv{
	}
}

func (this *BtrfsStream_SendCommand_Tlv) Read(io *kaitai.Stream, parent *BtrfsStream_SendCommand_Tlvs, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = BtrfsStream_Attribute(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp12)
	switch (this.Type) {
	case BtrfsStream_Attribute__Ctransid:
		tmp13, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp13
	case BtrfsStream_Attribute__Size:
		tmp14, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp14
	case BtrfsStream_Attribute__CloneUuid:
		tmp15, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this._raw_Value = tmp15
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp16 := NewBtrfsStream_SendCommand_Uuid()
		err = tmp16.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp16
	case BtrfsStream_Attribute__FileOffset:
		tmp17, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp17
	case BtrfsStream_Attribute__Otime:
		tmp18, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp18 = tmp18
		this._raw_Value = tmp18
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp19 := NewBtrfsStream_SendCommand_Timespec()
		err = tmp19.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp19
	case BtrfsStream_Attribute__Uid:
		tmp20, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp20
	case BtrfsStream_Attribute__Atime:
		tmp21, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp21 = tmp21
		this._raw_Value = tmp21
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp22 := NewBtrfsStream_SendCommand_Timespec()
		err = tmp22.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp22
	case BtrfsStream_Attribute__Ctime:
		tmp23, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp23 = tmp23
		this._raw_Value = tmp23
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp24 := NewBtrfsStream_SendCommand_Timespec()
		err = tmp24.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp24
	case BtrfsStream_Attribute__Uuid:
		tmp25, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Value = tmp25
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp26 := NewBtrfsStream_SendCommand_Uuid()
		err = tmp26.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp26
	case BtrfsStream_Attribute__CloneLen:
		tmp27, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp27
	case BtrfsStream_Attribute__XattrName:
		tmp28, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this._raw_Value = tmp28
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp29 := NewBtrfsStream_SendCommand_String()
		err = tmp29.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp29
	case BtrfsStream_Attribute__CloneCtransid:
		tmp30, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp30
	case BtrfsStream_Attribute__Mode:
		tmp31, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp31
	case BtrfsStream_Attribute__Mtime:
		tmp32, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp32 = tmp32
		this._raw_Value = tmp32
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp33 := NewBtrfsStream_SendCommand_Timespec()
		err = tmp33.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp33
	case BtrfsStream_Attribute__PathLink:
		tmp34, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Value = tmp34
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp35 := NewBtrfsStream_SendCommand_String()
		err = tmp35.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp35
	case BtrfsStream_Attribute__Rdev:
		tmp36, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp36
	case BtrfsStream_Attribute__PathTo:
		tmp37, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Value = tmp37
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp38 := NewBtrfsStream_SendCommand_String()
		err = tmp38.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp38
	case BtrfsStream_Attribute__Path:
		tmp39, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp39 = tmp39
		this._raw_Value = tmp39
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp40 := NewBtrfsStream_SendCommand_String()
		err = tmp40.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp40
	case BtrfsStream_Attribute__CloneOffset:
		tmp41, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp41
	case BtrfsStream_Attribute__Gid:
		tmp42, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp42
	case BtrfsStream_Attribute__ClonePath:
		tmp43, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this._raw_Value = tmp43
		_io__raw_Value := kaitai.NewStream(bytes.NewReader(this._raw_Value))
		tmp44 := NewBtrfsStream_SendCommand_String()
		err = tmp44.Read(_io__raw_Value, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp44
	default:
		tmp45, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp45 = tmp45
		this._raw_Value = tmp45
	}
	return err
}
type BtrfsStream_SendCommand_Uuid struct {
	Uuid []byte
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream_SendCommand_Tlv
}
func NewBtrfsStream_SendCommand_Uuid() *BtrfsStream_SendCommand_Uuid {
	return &BtrfsStream_SendCommand_Uuid{
	}
}

func (this *BtrfsStream_SendCommand_Uuid) Read(io *kaitai.Stream, parent *BtrfsStream_SendCommand_Tlv, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this.Uuid = tmp46
	return err
}
type BtrfsStream_SendCommand_Tlvs struct {
	Tlv []*BtrfsStream_SendCommand_Tlv
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream_SendCommand
}
func NewBtrfsStream_SendCommand_Tlvs() *BtrfsStream_SendCommand_Tlvs {
	return &BtrfsStream_SendCommand_Tlvs{
	}
}

func (this *BtrfsStream_SendCommand_Tlvs) Read(io *kaitai.Stream, parent *BtrfsStream_SendCommand, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp47, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp47 {
			break
		}
		tmp48 := NewBtrfsStream_SendCommand_Tlv()
		err = tmp48.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tlv = append(this.Tlv, tmp48)
	}
	return err
}
type BtrfsStream_SendCommand_String struct {
	String string
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream_SendCommand_Tlv
}
func NewBtrfsStream_SendCommand_String() *BtrfsStream_SendCommand_String {
	return &BtrfsStream_SendCommand_String{
	}
}

func (this *BtrfsStream_SendCommand_String) Read(io *kaitai.Stream, parent *BtrfsStream_SendCommand_Tlv, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp49 = tmp49
	this.String = string(tmp49)
	return err
}
type BtrfsStream_SendCommand_Timespec struct {
	TsSec int64
	TsNsec int32
	_io *kaitai.Stream
	_root *BtrfsStream
	_parent *BtrfsStream_SendCommand_Tlv
}
func NewBtrfsStream_SendCommand_Timespec() *BtrfsStream_SendCommand_Timespec {
	return &BtrfsStream_SendCommand_Timespec{
	}
}

func (this *BtrfsStream_SendCommand_Timespec) Read(io *kaitai.Stream, parent *BtrfsStream_SendCommand_Tlv, root *BtrfsStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.TsSec = int64(tmp50)
	tmp51, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.TsNsec = int32(tmp51)
	return err
}
