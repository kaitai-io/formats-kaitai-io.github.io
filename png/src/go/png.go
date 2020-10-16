// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"golang.org/x/text/encoding/charmap"
)


type Png_ColorType int
const (
	Png_ColorType__Greyscale Png_ColorType = 0
	Png_ColorType__Truecolor Png_ColorType = 2
	Png_ColorType__Indexed Png_ColorType = 3
	Png_ColorType__GreyscaleAlpha Png_ColorType = 4
	Png_ColorType__TruecolorAlpha Png_ColorType = 6
)

type Png_PhysUnit int
const (
	Png_PhysUnit__Unknown Png_PhysUnit = 0
	Png_PhysUnit__Meter Png_PhysUnit = 1
)

type Png_CompressionMethods int
const (
	Png_CompressionMethods__Zlib Png_CompressionMethods = 0
)
type Png struct {
	Magic []byte
	IhdrLen []byte
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
	tmp2, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.IhdrLen = tmp2
	if !(bytes.Equal(this.IhdrLen, []uint8{0, 0, 0, 13})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 13}, this.IhdrLen, this._io, "/seq/1")
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
	case "tEXt":
		tmp25, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Body = tmp25
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp26 := NewPng_TextChunk()
		err = tmp26.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp26
	case "cHRM":
		tmp27, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Body = tmp27
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp28 := NewPng_ChrmChunk()
		err = tmp28.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp28
	case "sRGB":
		tmp29, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_Body = tmp29
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp30 := NewPng_SrgbChunk()
		err = tmp30.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp30
	case "zTXt":
		tmp31, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Body = tmp31
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp32 := NewPng_CompressedTextChunk()
		err = tmp32.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp32
	default:
		tmp33, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp33 = tmp33
		this._raw_Body = tmp33
	}
	tmp34, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.Crc = tmp34
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

	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PaletteIndex = tmp35
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

	tmp36, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.XInt = uint32(tmp36)
	tmp37, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.YInt = uint32(tmp37)
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

	tmp38, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Value = uint16(tmp38)
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

	tmp39 := NewPng_Point()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.WhitePoint = tmp39
	tmp40 := NewPng_Point()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Red = tmp40
	tmp41 := NewPng_Point()
	err = tmp41.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Green = tmp41
	tmp42 := NewPng_Point()
	err = tmp42.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Blue = tmp42
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

	tmp43, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Width = uint32(tmp43)
	tmp44, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Height = uint32(tmp44)
	tmp45, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BitDepth = tmp45
	tmp46, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorType = Png_ColorType(tmp46)
	tmp47, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = tmp47
	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FilterMethod = tmp48
	tmp49, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InterlaceMethod = tmp49
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
		tmp50, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp50 {
			break
		}
		tmp51 := NewPng_Rgb()
		err = tmp51.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp51)
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

	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RenderIntent = Png_SrgbChunk_Intent(tmp52)
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

	tmp53, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Keyword = string(tmp53)
	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = Png_CompressionMethods(tmp54)
	tmp55, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp55 = tmp55
	this._raw_TextDatastream = tmp55
	tmp56, err := kaitai.ProcessZlib(this._raw_TextDatastream)
	if err != nil {
		return err
	}
	this.TextDatastream = tmp56
	return err
}

/**
 * Indicates purpose of the following text data.
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

	tmp57, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Red = uint16(tmp57)
	tmp58, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Green = uint16(tmp58)
	tmp59, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Blue = uint16(tmp59)
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

	tmp60, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.GammaInt = uint32(tmp60)
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
		tmp61 := NewPng_BkgdIndexed()
		err = tmp61.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp61
	case Png_ColorType__TruecolorAlpha:
		tmp62 := NewPng_BkgdTruecolor()
		err = tmp62.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp62
	case Png_ColorType__GreyscaleAlpha:
		tmp63 := NewPng_BkgdGreyscale()
		err = tmp63.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp63
	case Png_ColorType__Truecolor:
		tmp64 := NewPng_BkgdTruecolor()
		err = tmp64.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp64
	case Png_ColorType__Greyscale:
		tmp65 := NewPng_BkgdGreyscale()
		err = tmp65.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bkgd = tmp65
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

	tmp66, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixelsPerUnitX = uint32(tmp66)
	tmp67, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixelsPerUnitY = uint32(tmp67)
	tmp68, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unit = Png_PhysUnit(tmp68)
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

	tmp69, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Keyword = string(tmp69)
	tmp70, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionFlag = tmp70
	tmp71, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = Png_CompressionMethods(tmp71)
	tmp72, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.LanguageTag = string(tmp72)
	tmp73, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.TranslatedKeyword = string(tmp73)
	tmp74, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp74 = tmp74
	this.Text = string(tmp74)
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

	tmp75, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	tmp76, err := kaitai.BytesToStr(tmp75, charmap.ISO8859_1.NewDecoder())
	if err != nil {
		return err
	}
	this.Keyword = tmp76
	tmp77, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp77 = tmp77
	tmp78, err := kaitai.BytesToStr(tmp77, charmap.ISO8859_1.NewDecoder())
	if err != nil {
		return err
	}
	this.Text = tmp78
	return err
}

/**
 * Indicates purpose of the following text data.
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

	tmp79, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Year = uint16(tmp79)
	tmp80, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Month = tmp80
	tmp81, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Day = tmp81
	tmp82, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Hour = tmp82
	tmp83, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minute = tmp83
	tmp84, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Second = tmp84
	return err
}
