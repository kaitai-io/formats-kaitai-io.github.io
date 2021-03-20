// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"golang.org/x/text/encoding/charmap"
)


/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */

type Png_PhysUnit int
const (
	Png_PhysUnit__Unknown Png_PhysUnit = 0
	Png_PhysUnit__Meter Png_PhysUnit = 1
)

type Png_BlendOpValues int
const (
	Png_BlendOpValues__Source Png_BlendOpValues = 0
	Png_BlendOpValues__Over Png_BlendOpValues = 1
)

type Png_CompressionMethods int
const (
	Png_CompressionMethods__Zlib Png_CompressionMethods = 0
)

type Png_DisposeOpValues int
const (
	Png_DisposeOpValues__None Png_DisposeOpValues = 0
	Png_DisposeOpValues__Background Png_DisposeOpValues = 1
	Png_DisposeOpValues__Previous Png_DisposeOpValues = 2
)

type Png_ColorType int
const (
	Png_ColorType__Greyscale Png_ColorType = 0
	Png_ColorType__Truecolor Png_ColorType = 2
	Png_ColorType__Indexed Png_ColorType = 3
	Png_ColorType__GreyscaleAlpha Png_ColorType = 4
	Png_ColorType__TruecolorAlpha Png_ColorType = 6
)
type Png struct {
	Magic []byte
	IhdrLen uint32
	IhdrType []byte
	Ihdr *Png_IhdrChunk
	IhdrCrc []byte
	Chunks []*Png_Chunk
	_io *kaitai.Stream
	_root *Png
	_parent interface{}
}
func NewPng() *Png {
	return &Png{
	}
}

func (this *Png) Read(io *kaitai.Stream, parent interface{}, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{137, 80, 78, 71, 13, 10, 26, 10})) {
		return kaitai.NewValidationNotEqualError([]uint8{137, 80, 78, 71, 13, 10, 26, 10}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.IhdrLen = uint32(tmp2)
	if !(this.IhdrLen == 13) {
		return kaitai.NewValidationNotEqualError(13, this.IhdrLen, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.IhdrType = tmp3
	if !(bytes.Equal(this.IhdrType, []uint8{73, 72, 68, 82})) {
		return kaitai.NewValidationNotEqualError([]uint8{73, 72, 68, 82}, this.IhdrType, this._io, "/seq/2")
	}
	tmp4 := NewPng_IhdrChunk()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ihdr = tmp4
	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.IhdrCrc = tmp5
	for i := 1;; i++ {
		tmp6 := NewPng_Chunk()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp6
		this.Chunks = append(this.Chunks, _it)
		tmp7, err := this._io.EOF()
		if err != nil {
			return err
		}
		if  ((_it.Type == "IEND") || (tmp7))  {
			break
		}
	}
	return err
}
type Png_Rgb struct {
	R uint8
	G uint8
	B uint8
	_io *kaitai.Stream
	_root *Png
	_parent *Png_PlteChunk
}
func NewPng_Rgb() *Png_Rgb {
	return &Png_Rgb{
	}
}

func (this *Png_Rgb) Read(io *kaitai.Stream, parent *Png_PlteChunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.R = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.G = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp10
	return err
}
type Png_Chunk struct {
	Len uint32
	Type string
	Body interface{}
	Crc []byte
	_io *kaitai.Stream
	_root *Png
	_parent *Png
	_raw_Body []byte
}
func NewPng_Chunk() *Png_Chunk {
	return &Png_Chunk{
	}
}

func (this *Png_Chunk) Read(io *kaitai.Stream, parent *Png, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp11)
	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Type = string(tmp12)
	switch (this.Type) {
	case "iTXt":
		tmp13, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp13 = tmp13
		this._raw_Body = tmp13
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp14 := NewPng_InternationalTextChunk()
		err = tmp14.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp14
	case "gAMA":
		tmp15, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this._raw_Body = tmp15
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp16 := NewPng_GamaChunk()
		err = tmp16.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp16
	case "tIME":
		tmp17, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp17 = tmp17
		this._raw_Body = tmp17
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp18 := NewPng_TimeChunk()
		err = tmp18.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp18
	case "PLTE":
		tmp19, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp19 = tmp19
		this._raw_Body = tmp19
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp20 := NewPng_PlteChunk()
		err = tmp20.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp20
	case "bKGD":
		tmp21, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp21 = tmp21
		this._raw_Body = tmp21
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp22 := NewPng_BkgdChunk()
		err = tmp22.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp22
	case "pHYs":
		tmp23, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp23 = tmp23
		this._raw_Body = tmp23
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp24 := NewPng_PhysChunk()
		err = tmp24.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp24
	case "fdAT":
		tmp25, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Body = tmp25
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp26 := NewPng_FrameDataChunk()
		err = tmp26.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp26
	case "tEXt":
		tmp27, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Body = tmp27
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp28 := NewPng_TextChunk()
		err = tmp28.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp28
	case "cHRM":
		tmp29, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_Body = tmp29
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp30 := NewPng_ChrmChunk()
		err = tmp30.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp30
	case "acTL":
		tmp31, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Body = tmp31
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp32 := NewPng_AnimationControlChunk()
		err = tmp32.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp32
	case "sRGB":
		tmp33, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp33 = tmp33
		this._raw_Body = tmp33
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp34 := NewPng_SrgbChunk()
		err = tmp34.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp34
	case "zTXt":
		tmp35, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp35 = tmp35
		this._raw_Body = tmp35
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp36 := NewPng_CompressedTextChunk()
		err = tmp36.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp36
	case "fcTL":
		tmp37, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Body = tmp37
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp38 := NewPng_FrameControlChunk()
		err = tmp38.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp38
	default:
		tmp39, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp39 = tmp39
		this._raw_Body = tmp39
	}
	tmp40, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Crc = tmp40
	return err
}

/**
 * Background chunk for images with indexed palette.
 */
type Png_BkgdIndexed struct {
	PaletteIndex uint8
	_io *kaitai.Stream
	_root *Png
	_parent *Png_BkgdChunk
}
func NewPng_BkgdIndexed() *Png_BkgdIndexed {
	return &Png_BkgdIndexed{
	}
}

func (this *Png_BkgdIndexed) Read(io *kaitai.Stream, parent *Png_BkgdChunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PaletteIndex = tmp41
	return err
}
type Png_Point struct {
	XInt uint32
	YInt uint32
	_io *kaitai.Stream
	_root *Png
	_parent *Png_ChrmChunk
	_f_x bool
	x float64
	_f_y bool
	y float64
}
func NewPng_Point() *Png_Point {
	return &Png_Point{
	}
}

func (this *Png_Point) Read(io *kaitai.Stream, parent *Png_ChrmChunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.XInt = uint32(tmp42)
	tmp43, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.YInt = uint32(tmp43)
	return err
}
func (this *Png_Point) X() (v float64, err error) {
	if (this._f_x) {
		return this.x, nil
	}
	this.x = float64((this.XInt / 100000.0))
	this._f_x = true
	return this.x, nil
}
func (this *Png_Point) Y() (v float64, err error) {
	if (this._f_y) {
		return this.y, nil
	}
	this.y = float64((this.YInt / 100000.0))
	this._f_y = true
	return this.y, nil
}

/**
 * Background chunk for greyscale images.
 */
type Png_BkgdGreyscale struct {
	Value uint16
	_io *kaitai.Stream
	_root *Png
	_parent *Png_BkgdChunk
}
func NewPng_BkgdGreyscale() *Png_BkgdGreyscale {
	return &Png_BkgdGreyscale{
	}
}

func (this *Png_BkgdGreyscale) Read(io *kaitai.Stream, parent *Png_BkgdChunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Value = uint16(tmp44)
	return err
}

/**
 * @see <a href="https://www.w3.org/TR/PNG/#11cHRM">Source</a>
 */
type Png_ChrmChunk struct {
	WhitePoint *Png_Point
	Red *Png_Point
	Green *Png_Point
	Blue *Png_Point
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_ChrmChunk() *Png_ChrmChunk {
	return &Png_ChrmChunk{
	}
}

func (this *Png_ChrmChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45 := NewPng_Point()
	err = tmp45.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.WhitePoint = tmp45
	tmp46 := NewPng_Point()
	err = tmp46.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Red = tmp46
	tmp47 := NewPng_Point()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Green = tmp47
	tmp48 := NewPng_Point()
	err = tmp48.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Blue = tmp48
	return err
}

/**
 * @see <a href="https://www.w3.org/TR/PNG/#11IHDR">Source</a>
 */
type Png_IhdrChunk struct {
	Width uint32
	Height uint32
	BitDepth uint8
	ColorType Png_ColorType
	CompressionMethod uint8
	FilterMethod uint8
	InterlaceMethod uint8
	_io *kaitai.Stream
	_root *Png
	_parent *Png
}
func NewPng_IhdrChunk() *Png_IhdrChunk {
	return &Png_IhdrChunk{
	}
}

func (this *Png_IhdrChunk) Read(io *kaitai.Stream, parent *Png, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Width = uint32(tmp49)
	tmp50, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Height = uint32(tmp50)
	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BitDepth = tmp51
	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorType = Png_ColorType(tmp52)
	tmp53, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = tmp53
	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FilterMethod = tmp54
	tmp55, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InterlaceMethod = tmp55
	return err
}

/**
 * @see <a href="https://www.w3.org/TR/PNG/#11PLTE">Source</a>
 */
type Png_PlteChunk struct {
	Entries []*Png_Rgb
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_PlteChunk() *Png_PlteChunk {
	return &Png_PlteChunk{
	}
}

func (this *Png_PlteChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp56, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp56 {
			break
		}
		tmp57 := NewPng_Rgb()
		err = tmp57.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp57)
	}
	return err
}

/**
 * @see <a href="https://www.w3.org/TR/PNG/#11sRGB">Source</a>
 */

type Png_SrgbChunk_Intent int
const (
	Png_SrgbChunk_Intent__Perceptual Png_SrgbChunk_Intent = 0
	Png_SrgbChunk_Intent__RelativeColorimetric Png_SrgbChunk_Intent = 1
	Png_SrgbChunk_Intent__Saturation Png_SrgbChunk_Intent = 2
	Png_SrgbChunk_Intent__AbsoluteColorimetric Png_SrgbChunk_Intent = 3
)
type Png_SrgbChunk struct {
	RenderIntent Png_SrgbChunk_Intent
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_SrgbChunk() *Png_SrgbChunk {
	return &Png_SrgbChunk{
	}
}

func (this *Png_SrgbChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RenderIntent = Png_SrgbChunk_Intent(tmp58)
	return err
}

/**
 * Compressed text chunk effectively allows to store key-value
 * string pairs in PNG container, compressing "value" part (which
 * can be quite lengthy) with zlib compression.
 * @see <a href="https://www.w3.org/TR/PNG/#11zTXt">Source</a>
 */
type Png_CompressedTextChunk struct {
	Keyword string
	CompressionMethod Png_CompressionMethods
	TextDatastream []byte
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
	_raw_TextDatastream []byte
}
func NewPng_CompressedTextChunk() *Png_CompressedTextChunk {
	return &Png_CompressedTextChunk{
	}
}

func (this *Png_CompressedTextChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Keyword = string(tmp59)
	tmp60, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = Png_CompressionMethods(tmp60)
	tmp61, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp61 = tmp61
	this._raw_TextDatastream = tmp61
	tmp62, err := kaitai.ProcessZlib(this._raw_TextDatastream)
	if err != nil {
		return err
	}
	this.TextDatastream = tmp62
	return err
}

/**
 * Indicates purpose of the following text data.
 */

/**
 * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk">Source</a>
 */
type Png_FrameDataChunk struct {
	SequenceNumber uint32
	FrameData []byte
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_FrameDataChunk() *Png_FrameDataChunk {
	return &Png_FrameDataChunk{
	}
}

func (this *Png_FrameDataChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp63, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SequenceNumber = uint32(tmp63)
	tmp64, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp64 = tmp64
	this.FrameData = tmp64
	return err
}

/**
 * Sequence number of the animation chunk. The fcTL and fdAT chunks
 * have a 4 byte sequence number. Both chunk types share the sequence.
 * The first fcTL chunk must contain sequence number 0, and the sequence
 * numbers in the remaining fcTL and fdAT chunks must be in order, with
 * no gaps or duplicates.
 */

/**
 * Frame data for the frame. At least one fdAT chunk is required for
 * each frame. The compressed datastream is the concatenation of the
 * contents of the data fields of all the fdAT chunks within a frame.
 */

/**
 * Background chunk for truecolor images.
 */
type Png_BkgdTruecolor struct {
	Red uint16
	Green uint16
	Blue uint16
	_io *kaitai.Stream
	_root *Png
	_parent *Png_BkgdChunk
}
func NewPng_BkgdTruecolor() *Png_BkgdTruecolor {
	return &Png_BkgdTruecolor{
	}
}

func (this *Png_BkgdTruecolor) Read(io *kaitai.Stream, parent *Png_BkgdChunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp65, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Red = uint16(tmp65)
	tmp66, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Green = uint16(tmp66)
	tmp67, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Blue = uint16(tmp67)
	return err
}

/**
 * @see <a href="https://www.w3.org/TR/PNG/#11gAMA">Source</a>
 */
type Png_GamaChunk struct {
	GammaInt uint32
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
	_f_gammaRatio bool
	gammaRatio float64
}
func NewPng_GamaChunk() *Png_GamaChunk {
	return &Png_GamaChunk{
	}
}

func (this *Png_GamaChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.GammaInt = uint32(tmp68)
	return err
}
func (this *Png_GamaChunk) GammaRatio() (v float64, err error) {
	if (this._f_gammaRatio) {
		return this.gammaRatio, nil
	}
	this.gammaRatio = float64((100000.0 / this.GammaInt))
	this._f_gammaRatio = true
	return this.gammaRatio, nil
}

/**
 * Background chunk stores default background color to display this
 * image against. Contents depend on `color_type` of the image.
 * @see <a href="https://www.w3.org/TR/PNG/#11bKGD">Source</a>
 */
type Png_BkgdChunk struct {
	Bkgd interface{}
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_BkgdChunk() *Png_BkgdChunk {
	return &Png_BkgdChunk{
	}
}

func (this *Png_BkgdChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	switch (this._root.Ihdr.ColorType) {
	case Png_ColorType__Indexed:
		tmp69 := NewPng_BkgdIndexed()
		err = tmp69.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp69
	case Png_ColorType__TruecolorAlpha:
		tmp70 := NewPng_BkgdTruecolor()
		err = tmp70.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp70
	case Png_ColorType__GreyscaleAlpha:
		tmp71 := NewPng_BkgdGreyscale()
		err = tmp71.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp71
	case Png_ColorType__Truecolor:
		tmp72 := NewPng_BkgdTruecolor()
		err = tmp72.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp72
	case Png_ColorType__Greyscale:
		tmp73 := NewPng_BkgdGreyscale()
		err = tmp73.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp73
	}
	return err
}

/**
 * "Physical size" chunk stores data that allows to translate
 * logical pixels into physical units (meters, etc) and vice-versa.
 * @see <a href="https://www.w3.org/TR/PNG/#11pHYs">Source</a>
 */
type Png_PhysChunk struct {
	PixelsPerUnitX uint32
	PixelsPerUnitY uint32
	Unit Png_PhysUnit
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_PhysChunk() *Png_PhysChunk {
	return &Png_PhysChunk{
	}
}

func (this *Png_PhysChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp74, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixelsPerUnitX = uint32(tmp74)
	tmp75, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixelsPerUnitY = uint32(tmp75)
	tmp76, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unit = Png_PhysUnit(tmp76)
	return err
}

/**
 * Number of pixels per physical unit (typically, 1 meter) by X
 * axis.
 */

/**
 * Number of pixels per physical unit (typically, 1 meter) by Y
 * axis.
 */

/**
 * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk">Source</a>
 */
type Png_FrameControlChunk struct {
	SequenceNumber uint32
	Width uint32
	Height uint32
	XOffset uint32
	YOffset uint32
	DelayNum uint16
	DelayDen uint16
	DisposeOp Png_DisposeOpValues
	BlendOp Png_BlendOpValues
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
	_f_delay bool
	delay float64
}
func NewPng_FrameControlChunk() *Png_FrameControlChunk {
	return &Png_FrameControlChunk{
	}
}

func (this *Png_FrameControlChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp77, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SequenceNumber = uint32(tmp77)
	tmp78, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Width = uint32(tmp78)
	if !(this.Width >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Width, this._io, "/types/frame_control_chunk/seq/1")
	}
	if !(this.Width <= this._root.Ihdr.Width) {
		return kaitai.NewValidationGreaterThanError(this._root.Ihdr.Width, this.Width, this._io, "/types/frame_control_chunk/seq/1")
	}
	tmp79, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Height = uint32(tmp79)
	if !(this.Height >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Height, this._io, "/types/frame_control_chunk/seq/2")
	}
	if !(this.Height <= this._root.Ihdr.Height) {
		return kaitai.NewValidationGreaterThanError(this._root.Ihdr.Height, this.Height, this._io, "/types/frame_control_chunk/seq/2")
	}
	tmp80, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.XOffset = uint32(tmp80)
	if !(this.XOffset <= (this._root.Ihdr.Width - this.Width)) {
		return kaitai.NewValidationGreaterThanError((this._root.Ihdr.Width - this.Width), this.XOffset, this._io, "/types/frame_control_chunk/seq/3")
	}
	tmp81, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.YOffset = uint32(tmp81)
	if !(this.YOffset <= (this._root.Ihdr.Height - this.Height)) {
		return kaitai.NewValidationGreaterThanError((this._root.Ihdr.Height - this.Height), this.YOffset, this._io, "/types/frame_control_chunk/seq/4")
	}
	tmp82, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DelayNum = uint16(tmp82)
	tmp83, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DelayDen = uint16(tmp83)
	tmp84, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DisposeOp = Png_DisposeOpValues(tmp84)
	tmp85, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlendOp = Png_BlendOpValues(tmp85)
	return err
}

/**
 * Time to display this frame, in seconds
 */
func (this *Png_FrameControlChunk) Delay() (v float64, err error) {
	if (this._f_delay) {
		return this.delay, nil
	}
	var tmp86 float64;
	if (this.DelayDen == 0) {
		tmp86 = 100.0
	} else {
		tmp86 = this.DelayDen
	}
	this.delay = float64((this.DelayNum / tmp86))
	this._f_delay = true
	return this.delay, nil
}

/**
 * Sequence number of the animation chunk
 */

/**
 * Width of the following frame
 */

/**
 * Height of the following frame
 */

/**
 * X position at which to render the following frame
 */

/**
 * Y position at which to render the following frame
 */

/**
 * Frame delay fraction numerator
 */

/**
 * Frame delay fraction denominator
 */

/**
 * Type of frame area disposal to be done after rendering this frame
 */

/**
 * Type of frame area rendering for this frame
 */

/**
 * International text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
 * @see <a href="https://www.w3.org/TR/PNG/#11iTXt">Source</a>
 */
type Png_InternationalTextChunk struct {
	Keyword string
	CompressionFlag uint8
	CompressionMethod Png_CompressionMethods
	LanguageTag string
	TranslatedKeyword string
	Text string
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_InternationalTextChunk() *Png_InternationalTextChunk {
	return &Png_InternationalTextChunk{
	}
}

func (this *Png_InternationalTextChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp87, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Keyword = string(tmp87)
	tmp88, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionFlag = tmp88
	tmp89, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = Png_CompressionMethods(tmp89)
	tmp90, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.LanguageTag = string(tmp90)
	tmp91, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.TranslatedKeyword = string(tmp91)
	tmp92, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp92 = tmp92
	this.Text = string(tmp92)
	return err
}

/**
 * Indicates purpose of the following text data.
 */

/**
 * 0 = text is uncompressed, 1 = text is compressed with a
 * method specified in `compression_method`.
 */

/**
 * Human language used in `translated_keyword` and `text`
 * attributes - should be a language code conforming to ISO
 * 646.IRV:1991.
 */

/**
 * Keyword translated into language specified in
 * `language_tag`. Line breaks are not allowed.
 */

/**
 * Text contents ("value" of this key-value pair), written in
 * language specified in `language_tag`. Linke breaks are
 * allowed.
 */

/**
 * Text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
 * @see <a href="https://www.w3.org/TR/PNG/#11tEXt">Source</a>
 */
type Png_TextChunk struct {
	Keyword string
	Text string
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_TextChunk() *Png_TextChunk {
	return &Png_TextChunk{
	}
}

func (this *Png_TextChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp93, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	tmp94, err := kaitai.BytesToStr(tmp93, charmap.ISO8859_1.NewDecoder())
	if err != nil {
		return err
	}
	this.Keyword = tmp94
	tmp95, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp95 = tmp95
	tmp96, err := kaitai.BytesToStr(tmp95, charmap.ISO8859_1.NewDecoder())
	if err != nil {
		return err
	}
	this.Text = tmp96
	return err
}

/**
 * Indicates purpose of the following text data.
 */

/**
 * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk">Source</a>
 */
type Png_AnimationControlChunk struct {
	NumFrames uint32
	NumPlays uint32
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_AnimationControlChunk() *Png_AnimationControlChunk {
	return &Png_AnimationControlChunk{
	}
}

func (this *Png_AnimationControlChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp97, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumFrames = uint32(tmp97)
	tmp98, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumPlays = uint32(tmp98)
	return err
}

/**
 * Number of frames, must be equal to the number of `frame_control_chunk`s
 */

/**
 * Number of times to loop, 0 indicates infinite looping.
 */

/**
 * Time chunk stores time stamp of last modification of this image,
 * up to 1 second precision in UTC timezone.
 * @see <a href="https://www.w3.org/TR/PNG/#11tIME">Source</a>
 */
type Png_TimeChunk struct {
	Year uint16
	Month uint8
	Day uint8
	Hour uint8
	Minute uint8
	Second uint8
	_io *kaitai.Stream
	_root *Png
	_parent *Png_Chunk
}
func NewPng_TimeChunk() *Png_TimeChunk {
	return &Png_TimeChunk{
	}
}

func (this *Png_TimeChunk) Read(io *kaitai.Stream, parent *Png_Chunk, root *Png) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp99, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Year = uint16(tmp99)
	tmp100, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Month = tmp100
	tmp101, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Day = tmp101
	tmp102, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Hour = tmp102
	tmp103, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minute = tmp103
	tmp104, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Second = tmp104
	return err
}
