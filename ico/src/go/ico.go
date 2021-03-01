// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 * @see <a href="https://docs.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)">Source</a>
 */
type Ico struct {
	Magic []byte
	NumImages uint16
	Images []*Ico_IconDirEntry
	_io *kaitai.Stream
	_root *Ico
	_parent interface{}
}
func NewIco() *Ico {
	return &Ico{
	}
}

func (this *Ico) Read(io *kaitai.Stream, parent interface{}, root *Ico) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{0, 0, 1, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 1, 0}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumImages = uint16(tmp2)
	this.Images = make([]*Ico_IconDirEntry, this.NumImages)
	for i := range this.Images {
		tmp3 := NewIco_IconDirEntry()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Images[i] = tmp3
	}
	return err
}

/**
 * Number of images contained in this file
 */
type Ico_IconDirEntry struct {
	Width uint8
	Height uint8
	NumColors uint8
	Reserved []byte
	NumPlanes uint16
	Bpp uint16
	LenImg uint32
	OfsImg uint32
	_io *kaitai.Stream
	_root *Ico
	_parent *Ico
	_f_img bool
	img []byte
	_f_pngHeader bool
	pngHeader []byte
	_f_isPng bool
	isPng bool
}
func NewIco_IconDirEntry() *Ico_IconDirEntry {
	return &Ico_IconDirEntry{
	}
}

func (this *Ico_IconDirEntry) Read(io *kaitai.Stream, parent *Ico, root *Ico) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Width = tmp4
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Height = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumColors = tmp6
	tmp7, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Reserved = tmp7
	if !(bytes.Equal(this.Reserved, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Reserved, this._io, "/types/icon_dir_entry/seq/3")
	}
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPlanes = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Bpp = uint16(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenImg = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsImg = uint32(tmp11)
	return err
}

/**
 * Raw image data. Use `is_png` to determine whether this is an
 * embedded PNG file (true) or a DIB bitmap (false) and call a
 * relevant parser, if needed to parse image data further.
 */
func (this *Ico_IconDirEntry) Img() (v []byte, err error) {
	if (this._f_img) {
		return this.img, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsImg), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp12, err := this._io.ReadBytes(int(this.LenImg))
	if err != nil {
		return nil, err
	}
	tmp12 = tmp12
	this.img = tmp12
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_img = true
	this._f_img = true
	return this.img, nil
}

/**
 * Pre-reads first 8 bytes of the image to determine if it's an
 * embedded PNG file.
 */
func (this *Ico_IconDirEntry) PngHeader() (v []byte, err error) {
	if (this._f_pngHeader) {
		return this.pngHeader, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsImg), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp13, err := this._io.ReadBytes(int(8))
	if err != nil {
		return nil, err
	}
	tmp13 = tmp13
	this.pngHeader = tmp13
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_pngHeader = true
	this._f_pngHeader = true
	return this.pngHeader, nil
}

/**
 * True if this image is in PNG format.
 */
func (this *Ico_IconDirEntry) IsPng() (v bool, err error) {
	if (this._f_isPng) {
		return this.isPng, nil
	}
	tmp14, err := this.PngHeader()
	if err != nil {
		return false, err
	}
	this.isPng = bool(bytes.Equal(tmp14, []uint8{137, 80, 78, 71, 13, 10, 26, 10}))
	this._f_isPng = true
	return this.isPng, nil
}

/**
 * Width of image, px
 */

/**
 * Height of image, px
 */

/**
 * Number of colors in palette of the image or 0 if image has
 * no palette (i.e. RGB, RGBA, etc)
 */

/**
 * Number of color planes
 */

/**
 * Bits per pixel in the image
 */

/**
 * Size of the image data
 */

/**
 * Absolute offset of the image data start in the file
 */
