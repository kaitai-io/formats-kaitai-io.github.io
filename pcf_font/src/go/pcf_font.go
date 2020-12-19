// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html">Source</a>
 */

type PcfFont_Types int
const (
	PcfFont_Types__Properties PcfFont_Types = 1
	PcfFont_Types__Accelerators PcfFont_Types = 2
	PcfFont_Types__Metrics PcfFont_Types = 4
	PcfFont_Types__Bitmaps PcfFont_Types = 8
	PcfFont_Types__InkMetrics PcfFont_Types = 16
	PcfFont_Types__BdfEncodings PcfFont_Types = 32
	PcfFont_Types__Swidths PcfFont_Types = 64
	PcfFont_Types__GlyphNames PcfFont_Types = 128
	PcfFont_Types__BdfAccelerators PcfFont_Types = 256
)
type PcfFont struct {
	Magic []byte
	NumTables uint32
	Tables []*PcfFont_Table
	_io *kaitai.Stream
	_root *PcfFont
	_parent interface{}
}
func NewPcfFont() *PcfFont {
	return &PcfFont{
	}
}

func (this *PcfFont) Read(io *kaitai.Stream, parent interface{}, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{1, 102, 99, 112})) {
		return kaitai.NewValidationNotEqualError([]uint8{1, 102, 99, 112}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumTables = uint32(tmp2)
	this.Tables = make([]*PcfFont_Table, this.NumTables)
	for i := range this.Tables {
		tmp3 := NewPcfFont_Table()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tables[i] = tmp3
	}
	return err
}

/**
 * Table offers a offset + length pointer to a particular
 * table. "Type" of table references certain enum. Applications can
 * ignore enum values which they don't support.
 */
type PcfFont_Table struct {
	Type PcfFont_Types
	Format *PcfFont_Format
	LenBody uint32
	OfsBody uint32
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont
	_raw_body []byte
	_f_body bool
	body interface{}
}
func NewPcfFont_Table() *PcfFont_Table {
	return &PcfFont_Table{
	}
}

func (this *PcfFont_Table) Read(io *kaitai.Stream, parent *PcfFont, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = PcfFont_Types(tmp4)
	tmp5 := NewPcfFont_Format()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp5
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp7)
	return err
}
func (this *PcfFont_Table) Body() (v interface{}, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsBody), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.Type) {
	case PcfFont_Types__Properties:
		tmp8, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp8 = tmp8
		this._raw_body = tmp8
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp9 := NewPcfFont_Table_Properties()
		err = tmp9.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp9
	case PcfFont_Types__BdfEncodings:
		tmp10, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp10 = tmp10
		this._raw_body = tmp10
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp11 := NewPcfFont_Table_BdfEncodings()
		err = tmp11.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp11
	case PcfFont_Types__Swidths:
		tmp12, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp12 = tmp12
		this._raw_body = tmp12
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp13 := NewPcfFont_Table_Swidths()
		err = tmp13.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp13
	case PcfFont_Types__GlyphNames:
		tmp14, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp14 = tmp14
		this._raw_body = tmp14
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp15 := NewPcfFont_Table_GlyphNames()
		err = tmp15.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp15
	case PcfFont_Types__Bitmaps:
		tmp16, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp16 = tmp16
		this._raw_body = tmp16
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp17 := NewPcfFont_Table_Bitmaps()
		err = tmp17.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp17
	default:
		tmp18, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp18 = tmp18
		this._raw_body = tmp18
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

/**
 * Table containing scalable widths of characters.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table">Source</a>
 */
type PcfFont_Table_Swidths struct {
	Format *PcfFont_Format
	NumGlyphs uint32
	Swidths []uint32
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table
}
func NewPcfFont_Table_Swidths() *PcfFont_Table_Swidths {
	return &PcfFont_Table_Swidths{
	}
}

func (this *PcfFont_Table_Swidths) Read(io *kaitai.Stream, parent *PcfFont_Table, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19 := NewPcfFont_Format()
	err = tmp19.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp19
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumGlyphs = uint32(tmp20)
	this.Swidths = make([]uint32, this.NumGlyphs)
	for i := range this.Swidths {
		tmp21, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Swidths[i] = tmp21
	}
	return err
}

/**
 * The scalable width of a character is the width of the corresponding
 * PostScript character in em-units (1/1000ths of an em).
 */

/**
 * Array of properties (key-value pairs), used to convey different X11
 * settings of a font. Key is always an X font atom.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#properties-table">Source</a>
 */
type PcfFont_Table_Properties struct {
	Format *PcfFont_Format
	NumProps uint32
	Props []*PcfFont_Table_Properties_Prop
	Padding []byte
	LenStrings uint32
	Strings *BytesWithIo
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table
	_raw_Strings []byte
}
func NewPcfFont_Table_Properties() *PcfFont_Table_Properties {
	return &PcfFont_Table_Properties{
	}
}

func (this *PcfFont_Table_Properties) Read(io *kaitai.Stream, parent *PcfFont_Table, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22 := NewPcfFont_Format()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp22
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumProps = uint32(tmp23)
	this.Props = make([]*PcfFont_Table_Properties_Prop, this.NumProps)
	for i := range this.Props {
		tmp24 := NewPcfFont_Table_Properties_Prop()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Props[i] = tmp24
	}
	var tmp25 int8;
	if ((this.NumProps & 3) == 0) {
		tmp25 = 0
	} else {
		tmp25 = (4 - (this.NumProps & 3))
	}
	tmp26, err := this._io.ReadBytes(int(tmp25))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Padding = tmp26
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStrings = uint32(tmp27)
	tmp28, err := this._io.ReadBytes(int(this.LenStrings))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this._raw_Strings = tmp28
	_io__raw_Strings := kaitai.NewStream(bytes.NewReader(this._raw_Strings))
	tmp29 := NewBytesWithIo()
	err = tmp29.Read(_io__raw_Strings, this, nil)
	if err != nil {
		return err
	}
	this.Strings = tmp29
	return err
}

/**
 * Strings buffer. Never used directly, but instead is
 * addressed by offsets from the properties.
 */

/**
 * Property is a key-value pair, "key" being always a
 * string and "value" being either a string or a 32-bit
 * integer based on an additinal flag (`is_string`).
 * 
 * Simple offset-based mechanism is employed to keep this
 * type's sequence fixed-sized and thus have simple access
 * to property key/value by index.
 */
type PcfFont_Table_Properties_Prop struct {
	OfsName uint32
	IsString uint8
	ValueOrOfsValue uint32
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table_Properties
	_f_name bool
	name string
	_f_strValue bool
	strValue string
	_f_intValue bool
	intValue uint32
}
func NewPcfFont_Table_Properties_Prop() *PcfFont_Table_Properties_Prop {
	return &PcfFont_Table_Properties_Prop{
	}
}

func (this *PcfFont_Table_Properties_Prop) Read(io *kaitai.Stream, parent *PcfFont_Table_Properties, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsName = uint32(tmp30)
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IsString = tmp31
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ValueOrOfsValue = uint32(tmp32)
	return err
}

/**
 * Name of the property addressed in the strings buffer.
 */
func (this *PcfFont_Table_Properties_Prop) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	thisIo := this._parent.Strings._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.OfsName), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp33, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.name = string(tmp33)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_name = true
	this._f_name = true
	return this.name, nil
}

/**
 * Value of the property addressed in the strings
 * buffer, if this is a string value.
 */
func (this *PcfFont_Table_Properties_Prop) StrValue() (v string, err error) {
	if (this._f_strValue) {
		return this.strValue, nil
	}
	if (this.IsString != 0) {
		thisIo := this._parent.Strings._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return "", err
		}
		_, err = thisIo.Seek(int64(this.ValueOrOfsValue), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp34, err := thisIo.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return "", err
		}
		this.strValue = string(tmp34)
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_strValue = true
	}
	this._f_strValue = true
	return this.strValue, nil
}

/**
 * Value of the property, if this is an integer value.
 */
func (this *PcfFont_Table_Properties_Prop) IntValue() (v uint32, err error) {
	if (this._f_intValue) {
		return this.intValue, nil
	}
	if (this.IsString == 0) {
		this.intValue = uint32(this.ValueOrOfsValue)
	}
	this._f_intValue = true
	return this.intValue, nil
}

/**
 * Offset to name in the strings buffer.
 */

/**
 * Designates if value is an integer (zero) or a string (non-zero).
 */

/**
 * If the value is an integer (`is_string` is false),
 * then it's stored here. If the value is a string
 * (`is_string` is true), then it stores offset to the
 * value in the strings buffer.
 */

/**
 * Table that allows mapping of character codes to glyphs present in the
 * font. Supports 1-byte and 2-byte character codes.
 * 
 * Note that this mapping is agnostic to character encoding itself - it
 * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
 * national encodings, etc. If application cares about it, normally
 * encoding will be specified in `properties` table, in the properties named
 * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table">Source</a>
 */
type PcfFont_Table_BdfEncodings struct {
	Format *PcfFont_Format
	MinCharOrByte2 uint16
	MaxCharOrByte2 uint16
	MinByte1 uint16
	MaxByte1 uint16
	DefaultChar uint16
	GlyphIndexes []uint16
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table
}
func NewPcfFont_Table_BdfEncodings() *PcfFont_Table_BdfEncodings {
	return &PcfFont_Table_BdfEncodings{
	}
}

func (this *PcfFont_Table_BdfEncodings) Read(io *kaitai.Stream, parent *PcfFont_Table, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35 := NewPcfFont_Format()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp35
	tmp36, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinCharOrByte2 = uint16(tmp36)
	tmp37, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxCharOrByte2 = uint16(tmp37)
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinByte1 = uint16(tmp38)
	tmp39, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxByte1 = uint16(tmp39)
	tmp40, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DefaultChar = uint16(tmp40)
	this.GlyphIndexes = make([]uint16, (((this.MaxCharOrByte2 - this.MinCharOrByte2) + 1) * ((this.MaxByte1 - this.MinByte1) + 1)))
	for i := range this.GlyphIndexes {
		tmp41, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.GlyphIndexes[i] = tmp41
	}
	return err
}

/**
 * Table containing character names for every glyph.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table">Source</a>
 */
type PcfFont_Table_GlyphNames struct {
	Format *PcfFont_Format
	NumGlyphs uint32
	Names []*PcfFont_Table_GlyphNames_StringRef
	LenStrings uint32
	Strings *BytesWithIo
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table
	_raw_Strings []byte
}
func NewPcfFont_Table_GlyphNames() *PcfFont_Table_GlyphNames {
	return &PcfFont_Table_GlyphNames{
	}
}

func (this *PcfFont_Table_GlyphNames) Read(io *kaitai.Stream, parent *PcfFont_Table, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42 := NewPcfFont_Format()
	err = tmp42.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp42
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumGlyphs = uint32(tmp43)
	this.Names = make([]*PcfFont_Table_GlyphNames_StringRef, this.NumGlyphs)
	for i := range this.Names {
		tmp44 := NewPcfFont_Table_GlyphNames_StringRef()
		err = tmp44.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Names[i] = tmp44
	}
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStrings = uint32(tmp45)
	tmp46, err := this._io.ReadBytes(int(this.LenStrings))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this._raw_Strings = tmp46
	_io__raw_Strings := kaitai.NewStream(bytes.NewReader(this._raw_Strings))
	tmp47 := NewBytesWithIo()
	err = tmp47.Read(_io__raw_Strings, this, nil)
	if err != nil {
		return err
	}
	this.Strings = tmp47
	return err
}

/**
 * Glyph names are represented as string references in strings buffer.
 */

/**
 * Strings buffer which contains all glyph names.
 */
type PcfFont_Table_GlyphNames_StringRef struct {
	OfsString uint32
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table_GlyphNames
	_f_value bool
	value string
}
func NewPcfFont_Table_GlyphNames_StringRef() *PcfFont_Table_GlyphNames_StringRef {
	return &PcfFont_Table_GlyphNames_StringRef{
	}
}

func (this *PcfFont_Table_GlyphNames_StringRef) Read(io *kaitai.Stream, parent *PcfFont_Table_GlyphNames, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsString = uint32(tmp48)
	return err
}
func (this *PcfFont_Table_GlyphNames_StringRef) Value() (v string, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	thisIo := this._parent.Strings._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.OfsString), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp49, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.value = string(tmp49)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}

/**
 * Table containing uncompressed glyph bitmaps.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table">Source</a>
 */
type PcfFont_Table_Bitmaps struct {
	Format *PcfFont_Format
	NumGlyphs uint32
	Offsets []uint32
	BitmapSizes []uint32
	_io *kaitai.Stream
	_root *PcfFont
	_parent *PcfFont_Table
}
func NewPcfFont_Table_Bitmaps() *PcfFont_Table_Bitmaps {
	return &PcfFont_Table_Bitmaps{
	}
}

func (this *PcfFont_Table_Bitmaps) Read(io *kaitai.Stream, parent *PcfFont_Table, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50 := NewPcfFont_Format()
	err = tmp50.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Format = tmp50
	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumGlyphs = uint32(tmp51)
	this.Offsets = make([]uint32, this.NumGlyphs)
	for i := range this.Offsets {
		tmp52, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Offsets[i] = tmp52
	}
	this.BitmapSizes = make([]uint32, 4)
	for i := range this.BitmapSizes {
		tmp53, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BitmapSizes[i] = tmp53
	}
	return err
}

/**
 * Table format specifier, always 4 bytes. Original implementation treats
 * it as always little-endian and makes liberal use of bitmasking to parse
 * various parts of it.
 * 
 * TODO: this format specification recognizes endianness and bit
 * order format bits, but it does not really takes any parsing
 * decisions based on them.
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#file-header">Source</a>
 */
type PcfFont_Format struct {
	Padding1 uint64
	ScanUnitMask uint64
	IsMostSignificantBitFirst bool
	IsBigEndian bool
	GlyphPadMask uint64
	Format uint8
	Padding uint16
	_io *kaitai.Stream
	_root *PcfFont
	_parent interface{}
}
func NewPcfFont_Format() *PcfFont_Format {
	return &PcfFont_Format{
	}
}

func (this *PcfFont_Format) Read(io *kaitai.Stream, parent interface{}, root *PcfFont) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp54, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Padding1 = tmp54
	tmp55, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.ScanUnitMask = tmp55
	tmp56, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsMostSignificantBitFirst = tmp56 != 0
	tmp57, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsBigEndian = tmp57 != 0
	tmp58, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.GlyphPadMask = tmp58
	this._io.AlignToByte()
	tmp59, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Format = tmp59
	tmp60, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Padding = uint16(tmp60)
	return err
}

/**
 * If set, then all integers in the table are treated as big-endian
 */