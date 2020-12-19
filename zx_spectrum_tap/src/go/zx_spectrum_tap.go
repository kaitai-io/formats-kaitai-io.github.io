// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * TAP files are used by emulators of ZX Spectrum computer (released in
 * 1982 by Sinclair Research). TAP file stores blocks of data as if
 * they are written to magnetic tape, which was used as primary media
 * for ZX Spectrum. Contents of this file can be viewed as a very
 * simple linear filesystem, storing named files with some basic
 * metainformation prepended as a header.
 * @see <a href="https://faqwiki.zxnet.co.uk/wiki/TAP_format">Source</a>
 */

type ZxSpectrumTap_FlagEnum int
const (
	ZxSpectrumTap_FlagEnum__Header ZxSpectrumTap_FlagEnum = 0
	ZxSpectrumTap_FlagEnum__Data ZxSpectrumTap_FlagEnum = 255
)

type ZxSpectrumTap_HeaderTypeEnum int
const (
	ZxSpectrumTap_HeaderTypeEnum__Program ZxSpectrumTap_HeaderTypeEnum = 0
	ZxSpectrumTap_HeaderTypeEnum__NumArray ZxSpectrumTap_HeaderTypeEnum = 1
	ZxSpectrumTap_HeaderTypeEnum__CharArray ZxSpectrumTap_HeaderTypeEnum = 2
	ZxSpectrumTap_HeaderTypeEnum__Bytes ZxSpectrumTap_HeaderTypeEnum = 3
)
type ZxSpectrumTap struct {
	Blocks []*ZxSpectrumTap_Block
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent interface{}
}
func NewZxSpectrumTap() *ZxSpectrumTap {
	return &ZxSpectrumTap{
	}
}

func (this *ZxSpectrumTap) Read(io *kaitai.Stream, parent interface{}, root *ZxSpectrumTap) (err error) {
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
		tmp2 := NewZxSpectrumTap_Block()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Blocks = append(this.Blocks, tmp2)
	}
	return err
}
type ZxSpectrumTap_Block struct {
	LenBlock uint16
	Flag ZxSpectrumTap_FlagEnum
	Header *ZxSpectrumTap_Header
	Data []byte
	HeaderlessData []byte
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent *ZxSpectrumTap
}
func NewZxSpectrumTap_Block() *ZxSpectrumTap_Block {
	return &ZxSpectrumTap_Block{
	}
}

func (this *ZxSpectrumTap_Block) Read(io *kaitai.Stream, parent *ZxSpectrumTap, root *ZxSpectrumTap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenBlock = uint16(tmp3)
	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flag = ZxSpectrumTap_FlagEnum(tmp4)
	if ( ((this.LenBlock == 19) && (this.Flag == ZxSpectrumTap_FlagEnum__Header)) ) {
		tmp5 := NewZxSpectrumTap_Header()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp5
	}
	if (this.LenBlock == 19) {
		tmp6, err := this._io.ReadBytes(int((this.Header.LenData + 4)))
		if err != nil {
			return err
		}
		tmp6 = tmp6
		this.Data = tmp6
	}
	if (this.Flag == ZxSpectrumTap_FlagEnum__Data) {
		tmp7, err := this._io.ReadBytes(int((this.LenBlock - 1)))
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this.HeaderlessData = tmp7
	}
	return err
}
type ZxSpectrumTap_ProgramParams struct {
	AutostartLine uint16
	LenProgram uint16
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent *ZxSpectrumTap_Header
}
func NewZxSpectrumTap_ProgramParams() *ZxSpectrumTap_ProgramParams {
	return &ZxSpectrumTap_ProgramParams{
	}
}

func (this *ZxSpectrumTap_ProgramParams) Read(io *kaitai.Stream, parent *ZxSpectrumTap_Header, root *ZxSpectrumTap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.AutostartLine = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenProgram = uint16(tmp9)
	return err
}
type ZxSpectrumTap_BytesParams struct {
	StartAddress uint16
	Reserved []byte
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent *ZxSpectrumTap_Header
}
func NewZxSpectrumTap_BytesParams() *ZxSpectrumTap_BytesParams {
	return &ZxSpectrumTap_BytesParams{
	}
}

func (this *ZxSpectrumTap_BytesParams) Read(io *kaitai.Stream, parent *ZxSpectrumTap_Header, root *ZxSpectrumTap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.StartAddress = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Reserved = tmp11
	return err
}
type ZxSpectrumTap_Header struct {
	HeaderType ZxSpectrumTap_HeaderTypeEnum
	Filename []byte
	LenData uint16
	Params interface{}
	Checksum uint8
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent *ZxSpectrumTap_Block
}
func NewZxSpectrumTap_Header() *ZxSpectrumTap_Header {
	return &ZxSpectrumTap_Header{
	}
}

func (this *ZxSpectrumTap_Header) Read(io *kaitai.Stream, parent *ZxSpectrumTap_Block, root *ZxSpectrumTap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HeaderType = ZxSpectrumTap_HeaderTypeEnum(tmp12)
	tmp13, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp13 = kaitai.BytesStripRight(tmp13, 32)
	this.Filename = tmp13
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenData = uint16(tmp14)
	switch (this.HeaderType) {
	case ZxSpectrumTap_HeaderTypeEnum__Program:
		tmp15 := NewZxSpectrumTap_ProgramParams()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp15
	case ZxSpectrumTap_HeaderTypeEnum__NumArray:
		tmp16 := NewZxSpectrumTap_ArrayParams()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp16
	case ZxSpectrumTap_HeaderTypeEnum__CharArray:
		tmp17 := NewZxSpectrumTap_ArrayParams()
		err = tmp17.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp17
	case ZxSpectrumTap_HeaderTypeEnum__Bytes:
		tmp18 := NewZxSpectrumTap_BytesParams()
		err = tmp18.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp18
	}
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Checksum = tmp19
	return err
}

/**
 * Bitwise XOR of all bytes including the flag byte
 */
type ZxSpectrumTap_ArrayParams struct {
	Reserved uint8
	VarName uint8
	Reserved1 []byte
	_io *kaitai.Stream
	_root *ZxSpectrumTap
	_parent *ZxSpectrumTap_Header
}
func NewZxSpectrumTap_ArrayParams() *ZxSpectrumTap_ArrayParams {
	return &ZxSpectrumTap_ArrayParams{
	}
}

func (this *ZxSpectrumTap_ArrayParams) Read(io *kaitai.Stream, parent *ZxSpectrumTap_Header, root *ZxSpectrumTap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VarName = tmp21
	tmp22, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Reserved1 = tmp22
	if !(bytes.Equal(this.Reserved1, []uint8{0, 128})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 128}, this.Reserved1, this._io, "/types/array_params/seq/2")
	}
	return err
}

/**
 * Variable name (1..26 meaning A$..Z$ +192)
 */