// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * xwd is a file format written by eponymous X11 screen capture
 * application (xwd stands for "X Window Dump"). Typically, an average
 * user transforms xwd format into something more widespread by any of
 * `xwdtopnm` and `pnmto...` utilities right away.
 * 
 * xwd format itself provides a raw uncompressed bitmap with some
 * metainformation, like pixel format, width, height, bit depth,
 * etc. Note that technically format includes machine-dependent fields
 * and thus is probably a poor choice for true cross-platform usage.
 */

type Xwd_PixmapFormat int
const (
	Xwd_PixmapFormat__XYBitmap Xwd_PixmapFormat = 0
	Xwd_PixmapFormat__XYPixmap Xwd_PixmapFormat = 1
	Xwd_PixmapFormat__ZPixmap Xwd_PixmapFormat = 2
)

type Xwd_ByteOrder int
const (
	Xwd_ByteOrder__Le Xwd_ByteOrder = 0
	Xwd_ByteOrder__Be Xwd_ByteOrder = 1
)

type Xwd_VisualClass int
const (
	Xwd_VisualClass__StaticGray Xwd_VisualClass = 0
	Xwd_VisualClass__GrayScale Xwd_VisualClass = 1
	Xwd_VisualClass__StaticColor Xwd_VisualClass = 2
	Xwd_VisualClass__PseudoColor Xwd_VisualClass = 3
	Xwd_VisualClass__TrueColor Xwd_VisualClass = 4
	Xwd_VisualClass__DirectColor Xwd_VisualClass = 5
)
type Xwd struct {
	LenHeader uint32
	Hdr *Xwd_Header
	ColorMap []*Xwd_ColorMapEntry
	_io *kaitai.Stream
	_root *Xwd
	_parent interface{}
	_raw_Hdr []byte
	_raw_ColorMap [][]byte
}
func NewXwd() *Xwd {
	return &Xwd{
	}
}

func (this *Xwd) Read(io *kaitai.Stream, parent interface{}, root *Xwd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenHeader = uint32(tmp1)
	tmp2, err := this._io.ReadBytes(int((this.LenHeader - 4)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Hdr = tmp2
	_io__raw_Hdr := kaitai.NewStream(bytes.NewReader(this._raw_Hdr))
	tmp3 := NewXwd_Header()
	err = tmp3.Read(_io__raw_Hdr, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp3
	this._raw_ColorMap = make([][]byte, this.Hdr.ColorMapEntries)
	this.ColorMap = make([]*Xwd_ColorMapEntry, this.Hdr.ColorMapEntries)
	for i := range this.ColorMap {
		tmp4, err := this._io.ReadBytes(int(12))
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_ColorMap[i] = tmp4
		_io__raw_ColorMap := kaitai.NewStream(bytes.NewReader(this._raw_ColorMap[i]))
		tmp5 := NewXwd_ColorMapEntry()
		err = tmp5.Read(_io__raw_ColorMap, this, this._root)
		if err != nil {
			return err
		}
		this.ColorMap[i] = tmp5
	}
	return err
}

/**
 * Size of the header in bytes
 */
type Xwd_Header struct {
	FileVersion uint32
	PixmapFormat Xwd_PixmapFormat
	PixmapDepth uint32
	PixmapWidth uint32
	PixmapHeight uint32
	XOffset uint32
	ByteOrder Xwd_ByteOrder
	BitmapUnit uint32
	BitmapBitOrder uint32
	BitmapPad uint32
	BitsPerPixel uint32
	BytesPerLine uint32
	VisualClass Xwd_VisualClass
	RedMask uint32
	GreenMask uint32
	BlueMask uint32
	BitsPerRgb uint32
	NumberOfColors uint32
	ColorMapEntries uint32
	WindowWidth uint32
	WindowHeight uint32
	WindowX int32
	WindowY int32
	WindowBorderWidth uint32
	Creator string
	_io *kaitai.Stream
	_root *Xwd
	_parent *Xwd
}
func NewXwd_Header() *Xwd_Header {
	return &Xwd_Header{
	}
}

func (this *Xwd_Header) Read(io *kaitai.Stream, parent *Xwd, root *Xwd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.FileVersion = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixmapFormat = Xwd_PixmapFormat(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixmapDepth = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixmapWidth = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PixmapHeight = uint32(tmp10)
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.XOffset = uint32(tmp11)
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ByteOrder = Xwd_ByteOrder(tmp12)
	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BitmapUnit = uint32(tmp13)
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BitmapBitOrder = uint32(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BitmapPad = uint32(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BitsPerPixel = uint32(tmp16)
	tmp17, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BytesPerLine = uint32(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.VisualClass = Xwd_VisualClass(tmp18)
	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.RedMask = uint32(tmp19)
	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.GreenMask = uint32(tmp20)
	tmp21, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BlueMask = uint32(tmp21)
	tmp22, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BitsPerRgb = uint32(tmp22)
	tmp23, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumberOfColors = uint32(tmp23)
	tmp24, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ColorMapEntries = uint32(tmp24)
	tmp25, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.WindowWidth = uint32(tmp25)
	tmp26, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.WindowHeight = uint32(tmp26)
	tmp27, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.WindowX = int32(tmp27)
	tmp28, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.WindowY = int32(tmp28)
	tmp29, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.WindowBorderWidth = uint32(tmp29)
	tmp30, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Creator = string(tmp30)
	return err
}

/**
 * X11WD file version (always 07h)
 */

/**
 * Format of the image data
 */

/**
 * Pixmap depth in pixels - in practice, bits per pixel
 */

/**
 * Pixmap width in pixels
 */

/**
 * Pixmap height in pixels
 */

/**
 * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
 */

/**
 * Byte order of image data
 */

/**
 * Bitmap base data size
 */

/**
 * Bit-order of image data
 */

/**
 * Bitmap scan-line pad
 */

/**
 * Bits per pixel
 */

/**
 * Bytes per scan-line
 */

/**
 * Class of the image
 */

/**
 * Red mask
 */

/**
 * Green mask
 */

/**
 * Blue mask
 */

/**
 * Size of each color mask in bits
 */

/**
 * Number of colors in image
 */

/**
 * Number of entries in color map
 */

/**
 * Window width
 */

/**
 * Window height
 */

/**
 * Window upper left X coordinate
 */

/**
 * Window upper left Y coordinate
 */

/**
 * Window border width
 */

/**
 * Program that created this xwd file
 */
type Xwd_ColorMapEntry struct {
	EntryNumber uint32
	Red uint16
	Green uint16
	Blue uint16
	Flags uint8
	Padding uint8
	_io *kaitai.Stream
	_root *Xwd
	_parent *Xwd
}
func NewXwd_ColorMapEntry() *Xwd_ColorMapEntry {
	return &Xwd_ColorMapEntry{
	}
}

func (this *Xwd_ColorMapEntry) Read(io *kaitai.Stream, parent *Xwd, root *Xwd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.EntryNumber = uint32(tmp31)
	tmp32, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Red = uint16(tmp32)
	tmp33, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Green = uint16(tmp33)
	tmp34, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Blue = uint16(tmp34)
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp35
	tmp36, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Padding = tmp36
	return err
}

/**
 * Number of the color map entry
 */