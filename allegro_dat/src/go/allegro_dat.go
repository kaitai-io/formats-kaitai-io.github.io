// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 * @see <a href="https://liballeg.org/stabledocs/en/datafile.html">Source</a>
 */

type AllegroDat_PackEnum int
const (
	AllegroDat_PackEnum__Unpacked AllegroDat_PackEnum = 1936484398
)
type AllegroDat struct {
	PackMagic AllegroDat_PackEnum
	DatMagic []byte
	NumObjects uint32
	Objects []*AllegroDat_DatObject
	_io *kaitai.Stream
	_root *AllegroDat
	_parent interface{}
}
func NewAllegroDat() *AllegroDat {
	return &AllegroDat{
	}
}

func (this *AllegroDat) Read(io *kaitai.Stream, parent interface{}, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PackMagic = AllegroDat_PackEnum(tmp1)
	tmp2, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.DatMagic = tmp2
	if !(bytes.Equal(this.DatMagic, []uint8{65, 76, 76, 46})) {
		return kaitai.NewValidationNotEqualError([]uint8{65, 76, 76, 46}, this.DatMagic, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumObjects = uint32(tmp3)
	for i := 0; i < int(this.NumObjects); i++ {
		_ = i
		tmp4 := NewAllegroDat_DatObject()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Objects = append(this.Objects, tmp4)
	}
	return err
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x16 px
 * characters.
 */
type AllegroDat_DatFont16 struct {
	Chars [][]byte
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatFont
}
func NewAllegroDat_DatFont16() *AllegroDat_DatFont16 {
	return &AllegroDat_DatFont16{
	}
}

func (this *AllegroDat_DatFont16) Read(io *kaitai.Stream, parent *AllegroDat_DatFont, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 0; i < int(95); i++ {
		_ = i
		tmp5, err := this._io.ReadBytes(int(16))
		if err != nil {
			return err
		}
		tmp5 = tmp5
		this.Chars = append(this.Chars, tmp5)
	}
	return err
}
type AllegroDat_DatBitmap struct {
	BitsPerPixel int16
	Width uint16
	Height uint16
	Image []byte
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatObject
}
func NewAllegroDat_DatBitmap() *AllegroDat_DatBitmap {
	return &AllegroDat_DatBitmap{
	}
}

func (this *AllegroDat_DatBitmap) Read(io *kaitai.Stream, parent *AllegroDat_DatObject, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.BitsPerPixel = int16(tmp6)
	tmp7, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp7)
	tmp8, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp8)
	tmp9, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Image = tmp9
	return err
}
type AllegroDat_DatFont struct {
	FontSize int16
	Body interface{}
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatObject
}
func NewAllegroDat_DatFont() *AllegroDat_DatFont {
	return &AllegroDat_DatFont{
	}
}

func (this *AllegroDat_DatFont) Read(io *kaitai.Stream, parent *AllegroDat_DatObject, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.FontSize = int16(tmp10)
	switch (this.FontSize) {
	case 8:
		tmp11 := NewAllegroDat_DatFont8()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case 16:
		tmp12 := NewAllegroDat_DatFont16()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp12
	case 0:
		tmp13 := NewAllegroDat_DatFont39()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp13
	}
	return err
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x8 px
 * characters.
 */
type AllegroDat_DatFont8 struct {
	Chars [][]byte
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatFont
}
func NewAllegroDat_DatFont8() *AllegroDat_DatFont8 {
	return &AllegroDat_DatFont8{
	}
}

func (this *AllegroDat_DatFont8) Read(io *kaitai.Stream, parent *AllegroDat_DatFont, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 0; i < int(95); i++ {
		_ = i
		tmp14, err := this._io.ReadBytes(int(8))
		if err != nil {
			return err
		}
		tmp14 = tmp14
		this.Chars = append(this.Chars, tmp14)
	}
	return err
}
type AllegroDat_DatObject struct {
	Properties []*AllegroDat_Property
	LenCompressed int32
	LenUncompressed int32
	Body interface{}
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat
	_raw_Body []byte
	_f_type bool
	type string
}
func NewAllegroDat_DatObject() *AllegroDat_DatObject {
	return &AllegroDat_DatObject{
	}
}

func (this *AllegroDat_DatObject) Read(io *kaitai.Stream, parent *AllegroDat, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp15 := NewAllegroDat_Property()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp15
		this.Properties = append(this.Properties, _it)
		tmp16, err := _it.IsValid()
		if err != nil {
			return err
		}
		if !(tmp16) {
			break
		}
	}
	tmp17, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.LenCompressed = int32(tmp17)
	tmp18, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.LenUncompressed = int32(tmp18)
	tmp19, err := this.Type()
	if err != nil {
		return err
	}
	switch (tmp19) {
	case "BMP ":
		tmp20, err := this._io.ReadBytes(int(this.LenCompressed))
		if err != nil {
			return err
		}
		tmp20 = tmp20
		this._raw_Body = tmp20
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp21 := NewAllegroDat_DatBitmap()
		err = tmp21.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp21
	case "RLE ":
		tmp22, err := this._io.ReadBytes(int(this.LenCompressed))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this._raw_Body = tmp22
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp23 := NewAllegroDat_DatRleSprite()
		err = tmp23.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp23
	case "FONT":
		tmp24, err := this._io.ReadBytes(int(this.LenCompressed))
		if err != nil {
			return err
		}
		tmp24 = tmp24
		this._raw_Body = tmp24
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp25 := NewAllegroDat_DatFont()
		err = tmp25.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp25
	default:
		tmp26, err := this._io.ReadBytes(int(this.LenCompressed))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_Body = tmp26
	}
	return err
}
func (this *AllegroDat_DatObject) Type() (v string, err error) {
	if (this._f_type) {
		return this.type, nil
	}
	tmp27 := this.Properties
	this.type = string(tmp27[len(tmp27) - 1].Magic)
	this._f_type = true
	return this.type, nil
}

/**
 * New bitmap font format introduced since Allegro 3.9: allows
 * flexible designation of character ranges, 8-bit colored
 * characters, etc.
 */
type AllegroDat_DatFont39 struct {
	NumRanges int16
	Ranges []*AllegroDat_DatFont39_Range
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatFont
}
func NewAllegroDat_DatFont39() *AllegroDat_DatFont39 {
	return &AllegroDat_DatFont39{
	}
}

func (this *AllegroDat_DatFont39) Read(io *kaitai.Stream, parent *AllegroDat_DatFont, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.NumRanges = int16(tmp28)
	for i := 0; i < int(this.NumRanges); i++ {
		_ = i
		tmp29 := NewAllegroDat_DatFont39_Range()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Ranges = append(this.Ranges, tmp29)
	}
	return err
}
type AllegroDat_DatFont39_Range struct {
	Mono uint8
	StartChar uint32
	EndChar uint32
	Chars []*AllegroDat_DatFont39_FontChar
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatFont39
}
func NewAllegroDat_DatFont39_Range() *AllegroDat_DatFont39_Range {
	return &AllegroDat_DatFont39_Range{
	}
}

func (this *AllegroDat_DatFont39_Range) Read(io *kaitai.Stream, parent *AllegroDat_DatFont39, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Mono = tmp30
	tmp31, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StartChar = uint32(tmp31)
	tmp32, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.EndChar = uint32(tmp32)
	for i := 0; i < int(((this.EndChar - this.StartChar) + 1)); i++ {
		_ = i
		tmp33 := NewAllegroDat_DatFont39_FontChar()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Chars = append(this.Chars, tmp33)
	}
	return err
}

/**
 * First character in range
 */

/**
 * Last character in range (inclusive)
 */
type AllegroDat_DatFont39_FontChar struct {
	Width uint16
	Height uint16
	Body []byte
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatFont39_Range
}
func NewAllegroDat_DatFont39_FontChar() *AllegroDat_DatFont39_FontChar {
	return &AllegroDat_DatFont39_FontChar{
	}
}

func (this *AllegroDat_DatFont39_FontChar) Read(io *kaitai.Stream, parent *AllegroDat_DatFont39_Range, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp34)
	tmp35, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp35)
	tmp36, err := this._io.ReadBytes(int((this.Width * this.Height)))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Body = tmp36
	return err
}
type AllegroDat_Property struct {
	Magic string
	Type string
	LenBody uint32
	Body string
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatObject
	_f_isValid bool
	isValid bool
}
func NewAllegroDat_Property() *AllegroDat_Property {
	return &AllegroDat_Property{
	}
}

func (this *AllegroDat_Property) Read(io *kaitai.Stream, parent *AllegroDat_DatObject, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp37 = tmp37
	this.Magic = string(tmp37)
	tmp38, err := this.IsValid()
	if err != nil {
		return err
	}
	if (tmp38) {
		tmp39, err := this._io.ReadBytes(int(4))
		if err != nil {
			return err
		}
		tmp39 = tmp39
		this.Type = string(tmp39)
	}
	tmp40, err := this.IsValid()
	if err != nil {
		return err
	}
	if (tmp40) {
		tmp41, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.LenBody = uint32(tmp41)
	}
	tmp42, err := this.IsValid()
	if err != nil {
		return err
	}
	if (tmp42) {
		tmp43, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this.Body = string(tmp43)
	}
	return err
}
func (this *AllegroDat_Property) IsValid() (v bool, err error) {
	if (this._f_isValid) {
		return this.isValid, nil
	}
	this.isValid = bool(this.Magic == "prop")
	this._f_isValid = true
	return this.isValid, nil
}
type AllegroDat_DatRleSprite struct {
	BitsPerPixel int16
	Width uint16
	Height uint16
	LenImage uint32
	Image []byte
	_io *kaitai.Stream
	_root *AllegroDat
	_parent *AllegroDat_DatObject
}
func NewAllegroDat_DatRleSprite() *AllegroDat_DatRleSprite {
	return &AllegroDat_DatRleSprite{
	}
}

func (this *AllegroDat_DatRleSprite) Read(io *kaitai.Stream, parent *AllegroDat_DatObject, root *AllegroDat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.BitsPerPixel = int16(tmp44)
	tmp45, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp45)
	tmp46, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp46)
	tmp47, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenImage = uint32(tmp47)
	tmp48, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp48 = tmp48
	this.Image = tmp48
	return err
}
