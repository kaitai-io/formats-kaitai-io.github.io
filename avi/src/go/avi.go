// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779636(v=vs.85)">Source</a>
 */

type Avi_ChunkType int
const (
	Avi_ChunkType__Idx1 Avi_ChunkType = 829973609
	Avi_ChunkType__Junk Avi_ChunkType = 1263424842
	Avi_ChunkType__Info Avi_ChunkType = 1330007625
	Avi_ChunkType__Isft Avi_ChunkType = 1413894985
	Avi_ChunkType__List Avi_ChunkType = 1414744396
	Avi_ChunkType__Strf Avi_ChunkType = 1718776947
	Avi_ChunkType__Avih Avi_ChunkType = 1751742049
	Avi_ChunkType__Strh Avi_ChunkType = 1752331379
	Avi_ChunkType__Movi Avi_ChunkType = 1769369453
	Avi_ChunkType__Hdrl Avi_ChunkType = 1819436136
	Avi_ChunkType__Strl Avi_ChunkType = 1819440243
)

type Avi_StreamType int
const (
	Avi_StreamType__Mids Avi_StreamType = 1935960429
	Avi_StreamType__Vids Avi_StreamType = 1935960438
	Avi_StreamType__Auds Avi_StreamType = 1935963489
	Avi_StreamType__Txts Avi_StreamType = 1937012852
)

type Avi_HandlerType int
const (
	Avi_HandlerType__Mp3 Avi_HandlerType = 85
	Avi_HandlerType__Ac3 Avi_HandlerType = 8192
	Avi_HandlerType__Dts Avi_HandlerType = 8193
	Avi_HandlerType__Cvid Avi_HandlerType = 1684633187
	Avi_HandlerType__Xvid Avi_HandlerType = 1684633208
)
type Avi struct {
	Magic1 []byte
	FileSize uint32
	Magic2 []byte
	Data *Avi_Blocks
	_io *kaitai.Stream
	_root *Avi
	_parent interface{}
	_raw_Data []byte
}
func NewAvi() *Avi {
	return &Avi{
	}
}

func (this *Avi) Read(io *kaitai.Stream, parent interface{}, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic1 = tmp1
	if !(bytes.Equal(this.Magic1, []uint8{82, 73, 70, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{82, 73, 70, 70}, this.Magic1, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSize = uint32(tmp2)
	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic2 = tmp3
	if !(bytes.Equal(this.Magic2, []uint8{65, 86, 73, 32})) {
		return kaitai.NewValidationNotEqualError([]uint8{65, 86, 73, 32}, this.Magic2, this._io, "/seq/2")
	}
	tmp4, err := this._io.ReadBytes(int((this.FileSize - 4)))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this._raw_Data = tmp4
	_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
	tmp5 := NewAvi_Blocks()
	err = tmp5.Read(_io__raw_Data, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp5
	return err
}
type Avi_ListBody struct {
	ListType Avi_ChunkType
	Data *Avi_Blocks
	_io *kaitai.Stream
	_root *Avi
	_parent *Avi_Block
}
func NewAvi_ListBody() *Avi_ListBody {
	return &Avi_ListBody{
	}
}

func (this *Avi_ListBody) Read(io *kaitai.Stream, parent *Avi_Block, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ListType = Avi_ChunkType(tmp6)
	tmp7 := NewAvi_Blocks()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp7
	return err
}
type Avi_Rect struct {
	Left int16
	Top int16
	Right int16
	Bottom int16
	_io *kaitai.Stream
	_root *Avi
	_parent *Avi_StrhBody
}
func NewAvi_Rect() *Avi_Rect {
	return &Avi_Rect{
	}
}

func (this *Avi_Rect) Read(io *kaitai.Stream, parent *Avi_StrhBody, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Left = int16(tmp8)
	tmp9, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Top = int16(tmp9)
	tmp10, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Right = int16(tmp10)
	tmp11, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Bottom = int16(tmp11)
	return err
}
type Avi_Blocks struct {
	Entries []*Avi_Block
	_io *kaitai.Stream
	_root *Avi
	_parent interface{}
}
func NewAvi_Blocks() *Avi_Blocks {
	return &Avi_Blocks{
	}
}

func (this *Avi_Blocks) Read(io *kaitai.Stream, parent interface{}, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp12 {
			break
		}
		tmp13 := NewAvi_Block()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp13)
	}
	return err
}

/**
 * Main header of an AVI file, defined as AVIMAINHEADER structure
 * @see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)">Source</a>
 */
type Avi_AvihBody struct {
	MicroSecPerFrame uint32
	MaxBytesPerSec uint32
	PaddingGranularity uint32
	Flags uint32
	TotalFrames uint32
	InitialFrames uint32
	Streams uint32
	SuggestedBufferSize uint32
	Width uint32
	Height uint32
	Reserved []byte
	_io *kaitai.Stream
	_root *Avi
	_parent *Avi_Block
}
func NewAvi_AvihBody() *Avi_AvihBody {
	return &Avi_AvihBody{
	}
}

func (this *Avi_AvihBody) Read(io *kaitai.Stream, parent *Avi_Block, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MicroSecPerFrame = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MaxBytesPerSec = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PaddingGranularity = uint32(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TotalFrames = uint32(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InitialFrames = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Streams = uint32(tmp20)
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SuggestedBufferSize = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Width = uint32(tmp22)
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Height = uint32(tmp23)
	tmp24, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Reserved = tmp24
	return err
}
type Avi_Block struct {
	FourCc Avi_ChunkType
	BlockSize uint32
	Data interface{}
	_io *kaitai.Stream
	_root *Avi
	_parent *Avi_Blocks
	_raw_Data []byte
}
func NewAvi_Block() *Avi_Block {
	return &Avi_Block{
	}
}

func (this *Avi_Block) Read(io *kaitai.Stream, parent *Avi_Blocks, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FourCc = Avi_ChunkType(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlockSize = uint32(tmp26)
	switch (this.FourCc) {
	case Avi_ChunkType__List:
		tmp27, err := this._io.ReadBytes(int(this.BlockSize))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Data = tmp27
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp28 := NewAvi_ListBody()
		err = tmp28.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp28
	case Avi_ChunkType__Avih:
		tmp29, err := this._io.ReadBytes(int(this.BlockSize))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_Data = tmp29
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp30 := NewAvi_AvihBody()
		err = tmp30.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp30
	case Avi_ChunkType__Strh:
		tmp31, err := this._io.ReadBytes(int(this.BlockSize))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Data = tmp31
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp32 := NewAvi_StrhBody()
		err = tmp32.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp32
	default:
		tmp33, err := this._io.ReadBytes(int(this.BlockSize))
		if err != nil {
			return err
		}
		tmp33 = tmp33
		this._raw_Data = tmp33
	}
	return err
}

/**
 * Stream header (one header per stream), defined as AVISTREAMHEADER structure
 * @see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)">Source</a>
 */
type Avi_StrhBody struct {
	FccType Avi_StreamType
	FccHandler Avi_HandlerType
	Flags uint32
	Priority uint16
	Language uint16
	InitialFrames uint32
	Scale uint32
	Rate uint32
	Start uint32
	Length uint32
	SuggestedBufferSize uint32
	Quality uint32
	SampleSize uint32
	Frame *Avi_Rect
	_io *kaitai.Stream
	_root *Avi
	_parent *Avi_Block
}
func NewAvi_StrhBody() *Avi_StrhBody {
	return &Avi_StrhBody{
	}
}

func (this *Avi_StrhBody) Read(io *kaitai.Stream, parent *Avi_Block, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FccType = Avi_StreamType(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FccHandler = Avi_HandlerType(tmp35)
	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp36)
	tmp37, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Priority = uint16(tmp37)
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Language = uint16(tmp38)
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InitialFrames = uint32(tmp39)
	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Scale = uint32(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Rate = uint32(tmp41)
	tmp42, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Start = uint32(tmp42)
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp43)
	tmp44, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SuggestedBufferSize = uint32(tmp44)
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Quality = uint32(tmp45)
	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SampleSize = uint32(tmp46)
	tmp47 := NewAvi_Rect()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Frame = tmp47
	return err
}

/**
 * Type of the data contained in the stream
 */

/**
 * Type of preferred data handler for the stream (specifies codec for audio / video streams)
 */

/**
 * Stream format description
 */
type Avi_StrfBody struct {
	_io *kaitai.Stream
	_root *Avi
	_parent interface{}
}
func NewAvi_StrfBody() *Avi_StrfBody {
	return &Avi_StrfBody{
	}
}

func (this *Avi_StrfBody) Read(io *kaitai.Stream, parent interface{}, root *Avi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
