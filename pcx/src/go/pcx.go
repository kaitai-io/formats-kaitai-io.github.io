// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


type Pcx_Versions int
const (
	Pcx_Versions__V25 Pcx_Versions = 0
	Pcx_Versions__V28WithPalette Pcx_Versions = 2
	Pcx_Versions__V28WithoutPalette Pcx_Versions = 3
	Pcx_Versions__PaintbrushForWindows Pcx_Versions = 4
	Pcx_Versions__V30 Pcx_Versions = 5
)

type Pcx_Encodings int
const (
	Pcx_Encodings__Rle Pcx_Encodings = 1
)
type Pcx struct {
	Hdr *Pcx_Header
	_io *kaitai.Stream
	_root *Pcx
	_parent interface{}
	_raw_Hdr []byte
	_f_palette256 bool
	palette256 *Pcx_TPalette256
}
func NewPcx() *Pcx {
	return &Pcx{
	}
}

func (this *Pcx) Read(io *kaitai.Stream, parent interface{}, root *Pcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this._raw_Hdr = tmp1
	_io__raw_Hdr := kaitai.NewStream(bytes.NewReader(this._raw_Hdr))
	tmp2 := NewPcx_Header()
	err = tmp2.Read(_io__raw_Hdr, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp2
	return err
}

/**
 * @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "VGA 256 Color Palette Information"</a>
 */
func (this *Pcx) Palette256() (v *Pcx_TPalette256, err error) {
	if (this._f_palette256) {
		return this.palette256, nil
	}
	if ( ((this.Hdr.Version == Pcx_Versions__V30) && (this.Hdr.BitsPerPixel == 8) && (this.Hdr.NumPlanes == 1)) ) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		tmp3, err := this._io.Size()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64((tmp3 - 769)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp4 := NewPcx_TPalette256()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.palette256 = tmp4
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_palette256 = true
	}
	this._f_palette256 = true
	return this.palette256, nil
}

/**
 * @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
 */
type Pcx_Header struct {
	Magic []byte
	Version Pcx_Versions
	Encoding Pcx_Encodings
	BitsPerPixel uint8
	ImgXMin uint16
	ImgYMin uint16
	ImgXMax uint16
	ImgYMax uint16
	Hdpi uint16
	Vdpi uint16
	Palette16 []byte
	Reserved []byte
	NumPlanes uint8
	BytesPerLine uint16
	PaletteInfo uint16
	HScreenSize uint16
	VScreenSize uint16
	_io *kaitai.Stream
	_root *Pcx
	_parent *Pcx
}
func NewPcx_Header() *Pcx_Header {
	return &Pcx_Header{
	}
}

func (this *Pcx_Header) Read(io *kaitai.Stream, parent *Pcx, root *Pcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic = tmp5
	if !(bytes.Equal(this.Magic, []uint8{10})) {
		return kaitai.NewValidationNotEqualError([]uint8{10}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = Pcx_Versions(tmp6)
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Encoding = Pcx_Encodings(tmp7)
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BitsPerPixel = tmp8
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ImgXMin = uint16(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ImgYMin = uint16(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ImgXMax = uint16(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ImgYMax = uint16(tmp12)
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Hdpi = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Vdpi = uint16(tmp14)
	tmp15, err := this._io.ReadBytes(int(48))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Palette16 = tmp15
	tmp16, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Reserved = tmp16
	if !(bytes.Equal(this.Reserved, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Reserved, this._io, "/types/header/seq/11")
	}
	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumPlanes = tmp17
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BytesPerLine = uint16(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PaletteInfo = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.HScreenSize = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VScreenSize = uint16(tmp21)
	return err
}

/**
 * Technically, this field was supposed to be "manufacturer"
 * mark to distinguish between various software vendors, and
 * 0x0a was supposed to mean "ZSoft", but everyone else ended
 * up writing a 0x0a into this field, so that's what majority
 * of modern software expects to have in this attribute.
 */
type Pcx_TPalette256 struct {
	Magic []byte
	Colors []*Pcx_Rgb
	_io *kaitai.Stream
	_root *Pcx
	_parent *Pcx
}
func NewPcx_TPalette256() *Pcx_TPalette256 {
	return &Pcx_TPalette256{
	}
}

func (this *Pcx_TPalette256) Read(io *kaitai.Stream, parent *Pcx, root *Pcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Magic = tmp22
	if !(bytes.Equal(this.Magic, []uint8{12})) {
		return kaitai.NewValidationNotEqualError([]uint8{12}, this.Magic, this._io, "/types/t_palette_256/seq/0")
	}
	this.Colors = make([]*Pcx_Rgb, 256)
	for i := range this.Colors {
		tmp23 := NewPcx_Rgb()
		err = tmp23.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Colors[i] = tmp23
	}
	return err
}
type Pcx_Rgb struct {
	R uint8
	G uint8
	B uint8
	_io *kaitai.Stream
	_root *Pcx
	_parent *Pcx_TPalette256
}
func NewPcx_Rgb() *Pcx_Rgb {
	return &Pcx_Rgb{
	}
}

func (this *Pcx_Rgb) Read(io *kaitai.Stream, parent *Pcx_TPalette256, root *Pcx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.R = tmp24
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.G = tmp25
	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp26
	return err
}
