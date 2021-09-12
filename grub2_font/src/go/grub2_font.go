// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Bitmap font format for the GRUB 2 bootloader.
 * @see <a href="https://grub.gibibit.com/New_font_format">Source</a>
 */
type Grub2Font struct {
	Magic []byte
	Sections []*Grub2Font_Section
	_io *kaitai.Stream
	_root *Grub2Font
	_parent interface{}
}
func NewGrub2Font() *Grub2Font {
	return &Grub2Font{
	}
}

func (this *Grub2Font) Read(io *kaitai.Stream, parent interface{}, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50})) {
		return kaitai.NewValidationNotEqualError([]uint8{70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50}, this.Magic, this._io, "/seq/0")
	}
	for i := 1;; i++ {
		tmp2 := NewGrub2Font_Section()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp2
		this.Sections = append(this.Sections, _it)
		if _it.SectionType == "DATA" {
			break
		}
	}
	return err
}

/**
 * The "DATA" section acts as a terminator. The documentation says:
 * "A marker that indicates the remainder of the file is data accessed
 * via the character index (CHIX) section. When reading this font file,
 * the rest of the file can be ignored when scanning the sections."
 */
type Grub2Font_PtszSection struct {
	FontPointSize uint16
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_PtszSection() *Grub2Font_PtszSection {
	return &Grub2Font_PtszSection{
	}
}

func (this *Grub2Font_PtszSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FontPointSize = uint16(tmp3)
	return err
}
type Grub2Font_FamiSection struct {
	FontFamilyName string
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_FamiSection() *Grub2Font_FamiSection {
	return &Grub2Font_FamiSection{
	}
}

func (this *Grub2Font_FamiSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.FontFamilyName = string(tmp4)
	return err
}
type Grub2Font_WeigSection struct {
	FontWeight string
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_WeigSection() *Grub2Font_WeigSection {
	return &Grub2Font_WeigSection{
	}
}

func (this *Grub2Font_WeigSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.FontWeight = string(tmp5)
	return err
}
type Grub2Font_MaxwSection struct {
	MaximumCharacterWidth uint16
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_MaxwSection() *Grub2Font_MaxwSection {
	return &Grub2Font_MaxwSection{
	}
}

func (this *Grub2Font_MaxwSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.MaximumCharacterWidth = uint16(tmp6)
	return err
}
type Grub2Font_DescSection struct {
	DescentInPixels uint16
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_DescSection() *Grub2Font_DescSection {
	return &Grub2Font_DescSection{
	}
}

func (this *Grub2Font_DescSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DescentInPixels = uint16(tmp7)
	return err
}
type Grub2Font_Section struct {
	SectionType string
	LenBody uint32
	Body interface{}
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font
	_raw_Body []byte
}
func NewGrub2Font_Section() *Grub2Font_Section {
	return &Grub2Font_Section{
	}
}

func (this *Grub2Font_Section) Read(io *kaitai.Stream, parent *Grub2Font, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.SectionType = string(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp9)
	if (this.SectionType != "DATA") {
		switch (this.SectionType) {
		case "MAXH":
			tmp10, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp10 = tmp10
			this._raw_Body = tmp10
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp11 := NewGrub2Font_MaxhSection()
			err = tmp11.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp11
		case "FAMI":
			tmp12, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp12 = tmp12
			this._raw_Body = tmp12
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp13 := NewGrub2Font_FamiSection()
			err = tmp13.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp13
		case "PTSZ":
			tmp14, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp14 = tmp14
			this._raw_Body = tmp14
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp15 := NewGrub2Font_PtszSection()
			err = tmp15.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp15
		case "MAXW":
			tmp16, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp16 = tmp16
			this._raw_Body = tmp16
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp17 := NewGrub2Font_MaxwSection()
			err = tmp17.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp17
		case "SLAN":
			tmp18, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp18 = tmp18
			this._raw_Body = tmp18
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp19 := NewGrub2Font_SlanSection()
			err = tmp19.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp19
		case "WEIG":
			tmp20, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp20 = tmp20
			this._raw_Body = tmp20
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp21 := NewGrub2Font_WeigSection()
			err = tmp21.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp21
		case "CHIX":
			tmp22, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp22 = tmp22
			this._raw_Body = tmp22
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp23 := NewGrub2Font_ChixSection()
			err = tmp23.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp23
		case "DESC":
			tmp24, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp24 = tmp24
			this._raw_Body = tmp24
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp25 := NewGrub2Font_DescSection()
			err = tmp25.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp25
		case "NAME":
			tmp26, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp26 = tmp26
			this._raw_Body = tmp26
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp27 := NewGrub2Font_NameSection()
			err = tmp27.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp27
		case "ASCE":
			tmp28, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp28 = tmp28
			this._raw_Body = tmp28
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp29 := NewGrub2Font_AsceSection()
			err = tmp29.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp29
		default:
			tmp30, err := this._io.ReadBytes(int(this.LenBody))
			if err != nil {
				return err
			}
			tmp30 = tmp30
			this._raw_Body = tmp30
		}
	}
	return err
}

/**
 * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
 */
type Grub2Font_AsceSection struct {
	AscentInPixels uint16
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_AsceSection() *Grub2Font_AsceSection {
	return &Grub2Font_AsceSection{
	}
}

func (this *Grub2Font_AsceSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.AscentInPixels = uint16(tmp31)
	return err
}
type Grub2Font_ChixSection struct {
	Characters []*Grub2Font_ChixSection_Character
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_ChixSection() *Grub2Font_ChixSection {
	return &Grub2Font_ChixSection{
	}
}

func (this *Grub2Font_ChixSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp32, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp32 {
			break
		}
		tmp33 := NewGrub2Font_ChixSection_Character()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Characters = append(this.Characters, tmp33)
	}
	return err
}
type Grub2Font_ChixSection_Character struct {
	CodePoint uint32
	Flags uint8
	OfsDefinition uint32
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_ChixSection
	_f_definition bool
	definition *Grub2Font_ChixSection_CharacterDefinition
}
func NewGrub2Font_ChixSection_Character() *Grub2Font_ChixSection_Character {
	return &Grub2Font_ChixSection_Character{
	}
}

func (this *Grub2Font_ChixSection_Character) Read(io *kaitai.Stream, parent *Grub2Font_ChixSection, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CodePoint = uint32(tmp34)
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp35
	tmp36, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsDefinition = uint32(tmp36)
	return err
}
func (this *Grub2Font_ChixSection_Character) Definition() (v *Grub2Font_ChixSection_CharacterDefinition, err error) {
	if (this._f_definition) {
		return this.definition, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsDefinition), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp37 := NewGrub2Font_ChixSection_CharacterDefinition()
	err = tmp37.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.definition = tmp37
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_definition = true
	this._f_definition = true
	return this.definition, nil
}

/**
 * Unicode code point
 */
type Grub2Font_ChixSection_CharacterDefinition struct {
	Width uint16
	Height uint16
	XOffset int16
	YOffset int16
	DeviceWidth int16
	BitmapData []byte
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_ChixSection_Character
}
func NewGrub2Font_ChixSection_CharacterDefinition() *Grub2Font_ChixSection_CharacterDefinition {
	return &Grub2Font_ChixSection_CharacterDefinition{
	}
}

func (this *Grub2Font_ChixSection_CharacterDefinition) Read(io *kaitai.Stream, parent *Grub2Font_ChixSection_Character, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp38)
	tmp39, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp39)
	tmp40, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.XOffset = int16(tmp40)
	tmp41, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.YOffset = int16(tmp41)
	tmp42, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.DeviceWidth = int16(tmp42)
	tmp43, err := this._io.ReadBytes(int((((this.Width * this.Height) + 7) / 8)))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.BitmapData = tmp43
	return err
}

/**
 * A two-dimensional bitmap, one bit per pixel. It is organized as
 * row-major, top-down, left-to-right. The most significant bit of
 * each byte corresponds to the leftmost or uppermost pixel from all
 * bits of the byte. If a bit is set (1, `true`), the pixel is set to
 * the font color, if a bit is clear (0, `false`), the pixel is
 * transparent.
 * 
 * Rows are **not** padded to byte boundaries (i.e., a
 * single byte may contain bits belonging to multiple rows). The last
 * byte of the bitmap _is_ padded with zero bits at all unused least
 * significant bit positions so that the bitmap ends on a byte
 * boundary.
 */
type Grub2Font_MaxhSection struct {
	MaximumCharacterHeight uint16
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_MaxhSection() *Grub2Font_MaxhSection {
	return &Grub2Font_MaxhSection{
	}
}

func (this *Grub2Font_MaxhSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.MaximumCharacterHeight = uint16(tmp44)
	return err
}
type Grub2Font_NameSection struct {
	FontName string
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_NameSection() *Grub2Font_NameSection {
	return &Grub2Font_NameSection{
	}
}

func (this *Grub2Font_NameSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.FontName = string(tmp45)
	return err
}
type Grub2Font_SlanSection struct {
	FontSlant string
	_io *kaitai.Stream
	_root *Grub2Font
	_parent *Grub2Font_Section
}
func NewGrub2Font_SlanSection() *Grub2Font_SlanSection {
	return &Grub2Font_SlanSection{
	}
}

func (this *Grub2Font_SlanSection) Read(io *kaitai.Stream, parent *Grub2Font_Section, root *Grub2Font) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.FontSlant = string(tmp46)
	return err
}
