// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * @see <a href="https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf">Source</a>
 */

type Tga_ColorMapEnum int
const (
	Tga_ColorMapEnum__NoColorMap Tga_ColorMapEnum = 0
	Tga_ColorMapEnum__HasColorMap Tga_ColorMapEnum = 1
)

type Tga_ImageTypeEnum int
const (
	Tga_ImageTypeEnum__NoImageData Tga_ImageTypeEnum = 0
	Tga_ImageTypeEnum__UncompColorMapped Tga_ImageTypeEnum = 1
	Tga_ImageTypeEnum__UncompTrueColor Tga_ImageTypeEnum = 2
	Tga_ImageTypeEnum__UncompBw Tga_ImageTypeEnum = 3
	Tga_ImageTypeEnum__RleColorMapped Tga_ImageTypeEnum = 9
	Tga_ImageTypeEnum__RleTrueColor Tga_ImageTypeEnum = 10
	Tga_ImageTypeEnum__RleBw Tga_ImageTypeEnum = 11
)
type Tga struct {
	ImageIdLen uint8
	ColorMapType Tga_ColorMapEnum
	ImageType Tga_ImageTypeEnum
	ColorMapOfs uint16
	NumColorMap uint16
	ColorMapDepth uint8
	XOffset uint16
	YOffset uint16
	Width uint16
	Height uint16
	ImageDepth uint8
	ImgDescriptor uint8
	ImageId []byte
	ColorMap [][]byte
	_io *kaitai.Stream
	_root *Tga
	_parent interface{}
	_f_footer bool
	footer *Tga_TgaFooter
}
func NewTga() *Tga {
	return &Tga{
	}
}

func (this *Tga) Read(io *kaitai.Stream, parent interface{}, root *Tga) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ImageIdLen = tmp1
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorMapType = Tga_ColorMapEnum(tmp2)
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ImageType = Tga_ImageTypeEnum(tmp3)
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ColorMapOfs = uint16(tmp4)
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumColorMap = uint16(tmp5)
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorMapDepth = tmp6
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.XOffset = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.YOffset = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp10)
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ImageDepth = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ImgDescriptor = tmp12
	tmp13, err := this._io.ReadBytes(int(this.ImageIdLen))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.ImageId = tmp13
	if (this.ColorMapType == Tga_ColorMapEnum__HasColorMap) {
		this.ColorMap = make([][]byte, this.NumColorMap)
		for i := range this.ColorMap {
			tmp14, err := this._io.ReadBytes(int(((this.ColorMapDepth + 7) / 8)))
			if err != nil {
				return err
			}
			tmp14 = tmp14
			this.ColorMap[i] = tmp14
		}
	}
	return err
}
func (this *Tga) Footer() (v *Tga_TgaFooter, err error) {
	if (this._f_footer) {
		return this.footer, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp15, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp15 - 26)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp16 := NewTga_TgaFooter()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.footer = tmp16
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_footer = true
	this._f_footer = true
	return this.footer, nil
}

/**
 * Number of entries in a color map
 */

/**
 * Number of bits in a each color maps entry
 */

/**
 * Width of the image, in pixels
 */

/**
 * Height of the image, in pixels
 */

/**
 * Arbitrary application-specific information that is used to
 * identify image. May contain text or some binary data.
 */

/**
 * Color map
 */
type Tga_TgaFooter struct {
	ExtAreaOfs uint32
	DevDirOfs uint32
	VersionMagic []byte
	_io *kaitai.Stream
	_root *Tga
	_parent *Tga
	_f_isValid bool
	isValid bool
	_f_extArea bool
	extArea *Tga_TgaExtArea
}
func NewTga_TgaFooter() *Tga_TgaFooter {
	return &Tga_TgaFooter{
	}
}

func (this *Tga_TgaFooter) Read(io *kaitai.Stream, parent *Tga, root *Tga) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExtAreaOfs = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DevDirOfs = uint32(tmp18)
	tmp19, err := this._io.ReadBytes(int(18))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.VersionMagic = tmp19
	return err
}
func (this *Tga_TgaFooter) IsValid() (v bool, err error) {
	if (this._f_isValid) {
		return this.isValid, nil
	}
	this.isValid = bool(bytes.Equal(this.VersionMagic, []uint8{84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0}))
	this._f_isValid = true
	return this.isValid, nil
}
func (this *Tga_TgaFooter) ExtArea() (v *Tga_TgaExtArea, err error) {
	if (this._f_extArea) {
		return this.extArea, nil
	}
	tmp20, err := this.IsValid()
	if err != nil {
		return nil, err
	}
	if (tmp20) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.ExtAreaOfs), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp21 := NewTga_TgaExtArea()
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.extArea = tmp21
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_extArea = true
	}
	this._f_extArea = true
	return this.extArea, nil
}

/**
 * Offset to extension area
 */

/**
 * Offset to developer directory
 */
type Tga_TgaExtArea struct {
	ExtAreaSize uint16
	AuthorName string
	Comments []string
	Timestamp []byte
	JobId string
	JobTime string
	SoftwareId string
	SoftwareVersion []byte
	KeyColor uint32
	PixelAspectRatio uint32
	GammaValue uint32
	ColorCorrOfs uint32
	PostageStampOfs uint32
	ScanLineOfs uint32
	Attributes uint8
	_io *kaitai.Stream
	_root *Tga
	_parent *Tga_TgaFooter
}
func NewTga_TgaExtArea() *Tga_TgaExtArea {
	return &Tga_TgaExtArea{
	}
}

func (this *Tga_TgaExtArea) Read(io *kaitai.Stream, parent *Tga_TgaFooter, root *Tga) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ExtAreaSize = uint16(tmp22)
	tmp23, err := this._io.ReadBytes(int(41))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.AuthorName = string(tmp23)
	this.Comments = make([]string, 4)
	for i := range this.Comments {
		tmp24, err := this._io.ReadBytes(int(81))
		if err != nil {
			return err
		}
		tmp24 = tmp24
		this.Comments[i] = string(tmp24)
	}
	tmp25, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Timestamp = tmp25
	tmp26, err := this._io.ReadBytes(int(41))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.JobId = string(tmp26)
	tmp27, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.JobTime = string(tmp27)
	tmp28, err := this._io.ReadBytes(int(41))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.SoftwareId = string(tmp28)
	tmp29, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp29 = tmp29
	this.SoftwareVersion = tmp29
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.KeyColor = uint32(tmp30)
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PixelAspectRatio = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.GammaValue = uint32(tmp32)
	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ColorCorrOfs = uint32(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PostageStampOfs = uint32(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ScanLineOfs = uint32(tmp35)
	tmp36, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Attributes = tmp36
	return err
}

/**
 * Extension area size in bytes (always 495)
 */

/**
 * Comments, organized as four lines, each consisting of 80 characters plus a NULL
 */

/**
 * Image creation date / time
 */

/**
 * Internal job ID, to be used in image workflow systems
 */

/**
 * Hours, minutes and seconds spent creating the file (for billing, etc.)
 */

/**
 * The application that created the file.
 */

/**
 * Number of bytes from the beginning of the file to the color correction table if present
 */

/**
 * Number of bytes from the beginning of the file to the postage stamp image if present
 */

/**
 * Number of bytes from the beginning of the file to the scan lines table if present
 */

/**
 * Specifies the alpha channel
 */
