// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 * @see <a href="https://gitlab.gnome.org/GNOME/gimp/-/raw/4416313/devel-docs/gbr.txt">Source</a>
 */

type GimpBrush_ColorDepth int
const (
	GimpBrush_ColorDepth__Grayscale GimpBrush_ColorDepth = 1
	GimpBrush_ColorDepth__Rgba GimpBrush_ColorDepth = 4
)
type GimpBrush struct {
	LenHeader uint32
	Header *GimpBrush_Header
	_io *kaitai.Stream
	_root *GimpBrush
	_parent interface{}
	_raw_Header []byte
	_f_lenBody bool
	lenBody int
	_f_body bool
	body []byte
}
func NewGimpBrush() *GimpBrush {
	return &GimpBrush{
	}
}

func (this *GimpBrush) Read(io *kaitai.Stream, parent interface{}, root *GimpBrush) (err error) {
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
	this._raw_Header = tmp2
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp3 := NewGimpBrush_Header()
	err = tmp3.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	return err
}
func (this *GimpBrush) LenBody() (v int, err error) {
	if (this._f_lenBody) {
		return this.lenBody, nil
	}
	this.lenBody = int(((this.Header.Width * this.Header.Height) * this.Header.BytesPerPixel))
	this._f_lenBody = true
	return this.lenBody, nil
}
func (this *GimpBrush) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.LenHeader), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp4, err := this.LenBody()
	if err != nil {
		return nil, err
	}
	tmp5, err := this._io.ReadBytes(int(tmp4))
	if err != nil {
		return nil, err
	}
	tmp5 = tmp5
	this.body = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type GimpBrush_Header struct {
	Version uint32
	Width uint32
	Height uint32
	BytesPerPixel GimpBrush_ColorDepth
	Magic []byte
	Spacing uint32
	BrushName string
	_io *kaitai.Stream
	_root *GimpBrush
	_parent *GimpBrush
}
func NewGimpBrush_Header() *GimpBrush_Header {
	return &GimpBrush_Header{
	}
}

func (this *GimpBrush_Header) Read(io *kaitai.Stream, parent *GimpBrush, root *GimpBrush) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp6)
	if !(this.Version == 2) {
		return kaitai.NewValidationNotEqualError(2, this.Version, this._io, "/types/header/seq/0")
	}
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Width = uint32(tmp7)
	if !(this.Width >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Width, this._io, "/types/header/seq/1")
	}
	if !(this.Width <= 10000) {
		return kaitai.NewValidationGreaterThanError(10000, this.Width, this._io, "/types/header/seq/1")
	}
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Height = uint32(tmp8)
	if !(this.Height >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Height, this._io, "/types/header/seq/2")
	}
	if !(this.Height <= 10000) {
		return kaitai.NewValidationGreaterThanError(10000, this.Height, this._io, "/types/header/seq/2")
	}
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BytesPerPixel = GimpBrush_ColorDepth(tmp9)
	tmp10, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Magic = tmp10
	if !(bytes.Equal(this.Magic, []uint8{71, 73, 77, 80})) {
		return kaitai.NewValidationNotEqualError([]uint8{71, 73, 77, 80}, this.Magic, this._io, "/types/header/seq/4")
	}
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Spacing = uint32(tmp11)
	tmp12, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp12 = kaitai.BytesTerminate(tmp12, 0, false)
	this.BrushName = string(tmp12)
	return err
}

/**
 * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L170">Source</a>
 * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24">Source</a>
 */

/**
 * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L177">Source</a>
 * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24">Source</a>
 */

/**
 * Default spacing to be used for brush. Percentage of brush width.
 */
type GimpBrush_Bitmap struct {
	Rows []*GimpBrush_Row
	_io *kaitai.Stream
	_root *GimpBrush
	_parent interface{}
}
func NewGimpBrush_Bitmap() *GimpBrush_Bitmap {
	return &GimpBrush_Bitmap{
	}
}

func (this *GimpBrush_Bitmap) Read(io *kaitai.Stream, parent interface{}, root *GimpBrush) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Rows = make([]*GimpBrush_Row, this._root.Header.Height)
	for i := range this.Rows {
		tmp13 := NewGimpBrush_Row()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Rows[i] = tmp13
	}
	return err
}
type GimpBrush_Row struct {
	Pixels []interface{}
	_io *kaitai.Stream
	_root *GimpBrush
	_parent interface{}
}
func NewGimpBrush_Row() *GimpBrush_Row {
	return &GimpBrush_Row{
	}
}

func (this *GimpBrush_Row) Read(io *kaitai.Stream, parent interface{}, root *GimpBrush) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Pixels = make([]interface{}, this._root.Header.Width)
	for i := range this.Pixels {
		switch (this._root.Header.BytesPerPixel) {
		case GimpBrush_ColorDepth__Grayscale:
			tmp14 := NewGimpBrush_Row_PixelGray()
			err = tmp14.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Pixels[i] = tmp14
		case GimpBrush_ColorDepth__Rgba:
			tmp15 := NewGimpBrush_Row_PixelRgba()
			err = tmp15.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Pixels[i] = tmp15
		}
	}
	return err
}
type GimpBrush_Row_PixelGray struct {
	Gray uint8
	_io *kaitai.Stream
	_root *GimpBrush
	_parent interface{}
	_f_red bool
	red int8
	_f_green bool
	green int8
	_f_blue bool
	blue int8
	_f_alpha bool
	alpha uint8
}
func NewGimpBrush_Row_PixelGray() *GimpBrush_Row_PixelGray {
	return &GimpBrush_Row_PixelGray{
	}
}

func (this *GimpBrush_Row_PixelGray) Read(io *kaitai.Stream, parent interface{}, root *GimpBrush) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Gray = tmp16
	return err
}
func (this *GimpBrush_Row_PixelGray) Red() (v int8, err error) {
	if (this._f_red) {
		return this.red, nil
	}
	this.red = int8(0)
	this._f_red = true
	return this.red, nil
}
func (this *GimpBrush_Row_PixelGray) Green() (v int8, err error) {
	if (this._f_green) {
		return this.green, nil
	}
	this.green = int8(0)
	this._f_green = true
	return this.green, nil
}
func (this *GimpBrush_Row_PixelGray) Blue() (v int8, err error) {
	if (this._f_blue) {
		return this.blue, nil
	}
	this.blue = int8(0)
	this._f_blue = true
	return this.blue, nil
}
func (this *GimpBrush_Row_PixelGray) Alpha() (v uint8, err error) {
	if (this._f_alpha) {
		return this.alpha, nil
	}
	this.alpha = uint8(this.Gray)
	this._f_alpha = true
	return this.alpha, nil
}
type GimpBrush_Row_PixelRgba struct {
	Red uint8
	Green uint8
	Blue uint8
	Alpha uint8
	_io *kaitai.Stream
	_root *GimpBrush
	_parent interface{}
}
func NewGimpBrush_Row_PixelRgba() *GimpBrush_Row_PixelRgba {
	return &GimpBrush_Row_PixelRgba{
	}
}

func (this *GimpBrush_Row_PixelRgba) Read(io *kaitai.Stream, parent interface{}, root *GimpBrush) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Red = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Green = tmp18
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Blue = tmp19
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Alpha = tmp20
	return err
}
