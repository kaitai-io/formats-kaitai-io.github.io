// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * RAR is a archive format used by popular proprietary RAR archiver,
 * created by Eugene Roshal. There are two major versions of format
 * (v1.5-4.0 and RAR v5+).
 * 
 * File format essentially consists of a linear sequence of
 * blocks. Each block has fixed header and custom body (that depends on
 * block type), so it's possible to skip block even if one doesn't know
 * how to process a certain block type.
 * @see <a href="http://acritum.com/winrar/rar-format">Source</a>
 */

type Rar_BlockTypes int
const (
	Rar_BlockTypes__Marker Rar_BlockTypes = 114
	Rar_BlockTypes__ArchiveHeader Rar_BlockTypes = 115
	Rar_BlockTypes__FileHeader Rar_BlockTypes = 116
	Rar_BlockTypes__OldStyleCommentHeader Rar_BlockTypes = 117
	Rar_BlockTypes__OldStyleAuthenticityInfo76 Rar_BlockTypes = 118
	Rar_BlockTypes__OldStyleSubblock Rar_BlockTypes = 119
	Rar_BlockTypes__OldStyleRecoveryRecord Rar_BlockTypes = 120
	Rar_BlockTypes__OldStyleAuthenticityInfo79 Rar_BlockTypes = 121
	Rar_BlockTypes__Subblock Rar_BlockTypes = 122
	Rar_BlockTypes__Terminator Rar_BlockTypes = 123
)

type Rar_Oses int
const (
	Rar_Oses__MsDos Rar_Oses = 0
	Rar_Oses__Os2 Rar_Oses = 1
	Rar_Oses__Windows Rar_Oses = 2
	Rar_Oses__Unix Rar_Oses = 3
	Rar_Oses__MacOs Rar_Oses = 4
	Rar_Oses__Beos Rar_Oses = 5
)

type Rar_Methods int
const (
	Rar_Methods__Store Rar_Methods = 48
	Rar_Methods__Fastest Rar_Methods = 49
	Rar_Methods__Fast Rar_Methods = 50
	Rar_Methods__Normal Rar_Methods = 51
	Rar_Methods__Good Rar_Methods = 52
	Rar_Methods__Best Rar_Methods = 53
)
type Rar struct {
	Magic *Rar_MagicSignature
	Blocks []interface{}
	_io *kaitai.Stream
	_root *Rar
	_parent interface{}
}
func NewRar() *Rar {
	return &Rar{
	}
}

func (this *Rar) Read(io *kaitai.Stream, parent interface{}, root *Rar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewRar_MagicSignature()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Magic = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		switch (this.Magic.Version) {
		case 0:
			tmp3 := NewRar_Block()
			err = tmp3.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Blocks = append(this.Blocks, tmp3)
		case 1:
			tmp4 := NewRar_BlockV5()
			err = tmp4.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Blocks = append(this.Blocks, tmp4)
		}
	}
	return err
}

/**
 * File format signature to validate that it is indeed a RAR archive
 */

/**
 * Sequence of blocks that constitute the RAR file
 */

/**
 * RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
 * 8-byte magic (and pretty different block format) for v5+. This
 * type would parse and validate both versions of signature. Note
 * that actually this signature is a valid RAR "block": in theory,
 * one can omit signature reading at all, and read this normally,
 * as a block, if exact RAR version is known (and thus it's
 * possible to choose correct block format).
 */
type Rar_MagicSignature struct {
	Magic1 []byte
	Version uint8
	Magic3 []byte
	_io *kaitai.Stream
	_root *Rar
	_parent *Rar
}
func NewRar_MagicSignature() *Rar_MagicSignature {
	return &Rar_MagicSignature{
	}
}

func (this *Rar_MagicSignature) Read(io *kaitai.Stream, parent *Rar, root *Rar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic1 = tmp5
	if !(bytes.Equal(this.Magic1, []uint8{82, 97, 114, 33, 26, 7})) {
		return kaitai.NewValidationNotEqualError([]uint8{82, 97, 114, 33, 26, 7}, this.Magic1, this._io, "/types/magic_signature/seq/0")
	}
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp6
	if (this.Version == 1) {
		tmp7, err := this._io.ReadBytes(int(1))
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this.Magic3 = tmp7
		if !(bytes.Equal(this.Magic3, []uint8{0})) {
			return kaitai.NewValidationNotEqualError([]uint8{0}, this.Magic3, this._io, "/types/magic_signature/seq/2")
		}
	}
	return err
}

/**
 * Fixed part of file's magic signature that doesn't change with RAR version
 */

/**
 * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
 * format, 1 means new (RAR 5+) format
 */

/**
 * New format (RAR 5+) magic contains extra byte
 */

/**
 * Basic block that RAR files consist of. There are several block
 * types (see `block_type`), which have different `body` and
 * `add_body`.
 */
type Rar_Block struct {
	Crc16 uint16
	BlockType Rar_BlockTypes
	Flags uint16
	BlockSize uint16
	AddSize uint32
	Body interface{}
	AddBody []byte
	_io *kaitai.Stream
	_root *Rar
	_parent *Rar
	_raw_Body []byte
	_f_hasAdd bool
	hasAdd bool
	_f_headerSize bool
	headerSize int8
	_f_bodySize bool
	bodySize int
}
func NewRar_Block() *Rar_Block {
	return &Rar_Block{
	}
}

func (this *Rar_Block) Read(io *kaitai.Stream, parent *Rar, root *Rar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Crc16 = uint16(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlockType = Rar_BlockTypes(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BlockSize = uint16(tmp11)
	tmp12, err := this.HasAdd()
	if err != nil {
		return err
	}
	if (tmp12) {
		tmp13, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.AddSize = uint32(tmp13)
	}
	switch (this.BlockType) {
	case Rar_BlockTypes__FileHeader:
		tmp14, err := this.BodySize()
		if err != nil {
			return err
		}
		tmp15, err := this._io.ReadBytes(int(tmp14))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this._raw_Body = tmp15
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp16 := NewRar_BlockFileHeader()
		err = tmp16.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp16
	default:
		tmp17, err := this.BodySize()
		if err != nil {
			return err
		}
		tmp18, err := this._io.ReadBytes(int(tmp17))
		if err != nil {
			return err
		}
		tmp18 = tmp18
		this._raw_Body = tmp18
	}
	tmp19, err := this.HasAdd()
	if err != nil {
		return err
	}
	if (tmp19) {
		tmp20, err := this._io.ReadBytes(int(this.AddSize))
		if err != nil {
			return err
		}
		tmp20 = tmp20
		this.AddBody = tmp20
	}
	return err
}

/**
 * True if block has additional content attached to it
 */
func (this *Rar_Block) HasAdd() (v bool, err error) {
	if (this._f_hasAdd) {
		return this.hasAdd, nil
	}
	this.hasAdd = bool((this.Flags & 32768) != 0)
	this._f_hasAdd = true
	return this.hasAdd, nil
}
func (this *Rar_Block) HeaderSize() (v int8, err error) {
	if (this._f_headerSize) {
		return this.headerSize, nil
	}
	var tmp21 int8;
	tmp22, err := this.HasAdd()
	if err != nil {
		return 0, err
	}
	if (tmp22) {
		tmp21 = 11
	} else {
		tmp21 = 7
	}
	this.headerSize = int8(tmp21)
	this._f_headerSize = true
	return this.headerSize, nil
}
func (this *Rar_Block) BodySize() (v int, err error) {
	if (this._f_bodySize) {
		return this.bodySize, nil
	}
	tmp23, err := this.HeaderSize()
	if err != nil {
		return 0, err
	}
	this.bodySize = int((this.BlockSize - tmp23))
	this._f_bodySize = true
	return this.bodySize, nil
}

/**
 * CRC16 of whole block or some part of it (depends on block type)
 */

/**
 * Size of block (header + body, but without additional content)
 */

/**
 * Size of additional content in this block
 */

/**
 * Additional content in this block
 */
type Rar_BlockFileHeader struct {
	LowUnpSize uint32
	HostOs Rar_Oses
	FileCrc32 uint32
	FileTime *DosDatetime
	RarVersion uint8
	Method Rar_Methods
	NameSize uint16
	Attr uint32
	HighPackSize uint32
	FileName []byte
	Salt uint64
	_io *kaitai.Stream
	_root *Rar
	_parent *Rar_Block
	_raw_FileTime []byte
}
func NewRar_BlockFileHeader() *Rar_BlockFileHeader {
	return &Rar_BlockFileHeader{
	}
}

func (this *Rar_BlockFileHeader) Read(io *kaitai.Stream, parent *Rar_Block, root *Rar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LowUnpSize = uint32(tmp24)
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HostOs = Rar_Oses(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileCrc32 = uint32(tmp26)
	tmp27, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this._raw_FileTime = tmp27
	_io__raw_FileTime := kaitai.NewStream(bytes.NewReader(this._raw_FileTime))
	tmp28 := NewDosDatetime()
	err = tmp28.Read(_io__raw_FileTime, this, nil)
	if err != nil {
		return err
	}
	this.FileTime = tmp28
	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RarVersion = tmp29
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Method = Rar_Methods(tmp30)
	tmp31, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NameSize = uint16(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Attr = uint32(tmp32)
	if ((this._parent.Flags & 256) != 0) {
		tmp33, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.HighPackSize = uint32(tmp33)
	}
	tmp34, err := this._io.ReadBytes(int(this.NameSize))
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.FileName = tmp34
	if ((this._parent.Flags & 1024) != 0) {
		tmp35, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Salt = uint64(tmp35)
	}
	return err
}

/**
 * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
 */

/**
 * Operating system used for archiving
 */

/**
 * Date and time in standard MS DOS format
 */

/**
 * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
 */

/**
 * Compression method
 */

/**
 * File name size
 */

/**
 * File attributes
 */

/**
 * Compressed file size, high 32 bits, only if 64-bit header flag is present
 */
type Rar_BlockV5 struct {
	_io *kaitai.Stream
	_root *Rar
	_parent *Rar
}
func NewRar_BlockV5() *Rar_BlockV5 {
	return &Rar_BlockV5{
	}
}

func (this *Rar_BlockV5) Read(io *kaitai.Stream, parent *Rar, root *Rar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
