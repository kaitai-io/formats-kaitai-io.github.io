// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="http://id3.org/id3v2.4.0-structure">Source</a>
 * @see <a href="http://id3.org/id3v2.4.0-frames">Source</a>
 */
type Id3v24 struct {
	Tag *Id3v24_Tag
	_io *kaitai.Stream
	_root *Id3v24
	_parent interface{}
}
func NewId3v24() *Id3v24 {
	return &Id3v24{
	}
}

func (this *Id3v24) Read(io *kaitai.Stream, parent interface{}, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewId3v24_Tag()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Tag = tmp1
	return err
}
type Id3v24_U1beSynchsafe struct {
	Padding bool
	Value uint64
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_U2beSynchsafe
}
func NewId3v24_U1beSynchsafe() *Id3v24_U1beSynchsafe {
	return &Id3v24_U1beSynchsafe{
	}
}

func (this *Id3v24_U1beSynchsafe) Read(io *kaitai.Stream, parent *Id3v24_U2beSynchsafe, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Padding = tmp2 != 0
	tmp3, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.Value = tmp3
	return err
}
type Id3v24_U2beSynchsafe struct {
	Byte0 *Id3v24_U1beSynchsafe
	Byte1 *Id3v24_U1beSynchsafe
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_U4beSynchsafe
	_f_value bool
	value int
}
func NewId3v24_U2beSynchsafe() *Id3v24_U2beSynchsafe {
	return &Id3v24_U2beSynchsafe{
	}
}

func (this *Id3v24_U2beSynchsafe) Read(io *kaitai.Stream, parent *Id3v24_U4beSynchsafe, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4 := NewId3v24_U1beSynchsafe()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Byte0 = tmp4
	tmp5 := NewId3v24_U1beSynchsafe()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Byte1 = tmp5
	return err
}
func (this *Id3v24_U2beSynchsafe) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int(((this.Byte0.Value << 7) | this.Byte1.Value))
	this._f_value = true
	return this.value, nil
}
type Id3v24_Tag struct {
	Header *Id3v24_Header
	HeaderEx *Id3v24_HeaderEx
	Frames []*Id3v24_Frame
	Padding *Id3v24_Padding
	Footer *Id3v24_Footer
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24
}
func NewId3v24_Tag() *Id3v24_Tag {
	return &Id3v24_Tag{
	}
}

func (this *Id3v24_Tag) Read(io *kaitai.Stream, parent *Id3v24, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6 := NewId3v24_Header()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp6
	if (this.Header.Flags.FlagHeaderex) {
		tmp7 := NewId3v24_HeaderEx()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.HeaderEx = tmp7
	}
	for i := 1;; i++ {
		tmp8 := NewId3v24_Frame()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp8
		this.Frames = append(this.Frames, _it)
		tmp9, err := this._io.Pos()
		if err != nil {
			return err
		}
		tmp10, err := _it.Size.Value()
		if err != nil {
			return err
		}
		tmp11, err := this.Header.Size.Value()
		if err != nil {
			return err
		}
		tmp12, err := _it.IsInvalid()
		if err != nil {
			return err
		}
		if  (((tmp9 + tmp10) > tmp11) || (tmp12))  {
			break
		}
	}
	if (!(this.Header.Flags.FlagFooter)) {
		tmp13 := NewId3v24_Padding()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Padding = tmp13
	}
	if (this.Header.Flags.FlagFooter) {
		tmp14 := NewId3v24_Footer()
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Footer = tmp14
	}
	return err
}
type Id3v24_U4beSynchsafe struct {
	Short0 *Id3v24_U2beSynchsafe
	Short1 *Id3v24_U2beSynchsafe
	_io *kaitai.Stream
	_root *Id3v24
	_parent interface{}
	_f_value bool
	value int
}
func NewId3v24_U4beSynchsafe() *Id3v24_U4beSynchsafe {
	return &Id3v24_U4beSynchsafe{
	}
}

func (this *Id3v24_U4beSynchsafe) Read(io *kaitai.Stream, parent interface{}, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15 := NewId3v24_U2beSynchsafe()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Short0 = tmp15
	tmp16 := NewId3v24_U2beSynchsafe()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Short1 = tmp16
	return err
}
func (this *Id3v24_U4beSynchsafe) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp17, err := this.Short0.Value()
	if err != nil {
		return 0, err
	}
	tmp18, err := this.Short1.Value()
	if err != nil {
		return 0, err
	}
	this.value = int(((tmp17 << 14) | tmp18))
	this._f_value = true
	return this.value, nil
}
type Id3v24_Frame struct {
	Id string
	Size *Id3v24_U4beSynchsafe
	FlagsStatus *Id3v24_Frame_FlagsStatus
	FlagsFormat *Id3v24_Frame_FlagsFormat
	Data []byte
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Tag
	_f_isInvalid bool
	isInvalid bool
}
func NewId3v24_Frame() *Id3v24_Frame {
	return &Id3v24_Frame{
	}
}

func (this *Id3v24_Frame) Read(io *kaitai.Stream, parent *Id3v24_Tag, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Id = string(tmp19)
	tmp20 := NewId3v24_U4beSynchsafe()
	err = tmp20.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Size = tmp20
	tmp21 := NewId3v24_Frame_FlagsStatus()
	err = tmp21.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FlagsStatus = tmp21
	tmp22 := NewId3v24_Frame_FlagsFormat()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FlagsFormat = tmp22
	tmp23, err := this.Size.Value()
	if err != nil {
		return err
	}
	tmp24, err := this._io.ReadBytes(int(tmp23))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Data = tmp24
	return err
}
func (this *Id3v24_Frame) IsInvalid() (v bool, err error) {
	if (this._f_isInvalid) {
		return this.isInvalid, nil
	}
	this.isInvalid = bool(this.Id == "\000\000\000\000")
	this._f_isInvalid = true
	return this.isInvalid, nil
}
type Id3v24_Frame_FlagsStatus struct {
	Reserved1 bool
	FlagDiscardAlterTag bool
	FlagDiscardAlterFile bool
	FlagReadOnly bool
	Reserved2 uint64
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Frame
}
func NewId3v24_Frame_FlagsStatus() *Id3v24_Frame_FlagsStatus {
	return &Id3v24_Frame_FlagsStatus{
	}
}

func (this *Id3v24_Frame_FlagsStatus) Read(io *kaitai.Stream, parent *Id3v24_Frame, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp25 != 0
	tmp26, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagDiscardAlterTag = tmp26 != 0
	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagDiscardAlterFile = tmp27 != 0
	tmp28, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagReadOnly = tmp28 != 0
	tmp29, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp29
	return err
}
type Id3v24_Frame_FlagsFormat struct {
	Reserved1 bool
	FlagGrouping bool
	Reserved2 uint64
	FlagCompressed bool
	FlagEncrypted bool
	FlagUnsynchronisated bool
	FlagIndicator bool
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Frame
}
func NewId3v24_Frame_FlagsFormat() *Id3v24_Frame_FlagsFormat {
	return &Id3v24_Frame_FlagsFormat{
	}
}

func (this *Id3v24_Frame_FlagsFormat) Read(io *kaitai.Stream, parent *Id3v24_Frame, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp30 != 0
	tmp31, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagGrouping = tmp31 != 0
	tmp32, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp32
	tmp33, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagCompressed = tmp33 != 0
	tmp34, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagEncrypted = tmp34 != 0
	tmp35, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagUnsynchronisated = tmp35 != 0
	tmp36, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagIndicator = tmp36 != 0
	return err
}
type Id3v24_HeaderEx struct {
	Size *Id3v24_U4beSynchsafe
	FlagsEx *Id3v24_HeaderEx_FlagsEx
	Data []byte
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Tag
}
func NewId3v24_HeaderEx() *Id3v24_HeaderEx {
	return &Id3v24_HeaderEx{
	}
}

func (this *Id3v24_HeaderEx) Read(io *kaitai.Stream, parent *Id3v24_Tag, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37 := NewId3v24_U4beSynchsafe()
	err = tmp37.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Size = tmp37
	tmp38 := NewId3v24_HeaderEx_FlagsEx()
	err = tmp38.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FlagsEx = tmp38
	tmp39, err := this.Size.Value()
	if err != nil {
		return err
	}
	tmp40, err := this._io.ReadBytes(int((tmp39 - 5)))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Data = tmp40
	return err
}
type Id3v24_HeaderEx_FlagsEx struct {
	Reserved1 bool
	FlagUpdate bool
	FlagCrc bool
	FlagRestrictions bool
	Reserved2 uint64
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_HeaderEx
}
func NewId3v24_HeaderEx_FlagsEx() *Id3v24_HeaderEx_FlagsEx {
	return &Id3v24_HeaderEx_FlagsEx{
	}
}

func (this *Id3v24_HeaderEx_FlagsEx) Read(io *kaitai.Stream, parent *Id3v24_HeaderEx, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp41 != 0
	tmp42, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagUpdate = tmp42 != 0
	tmp43, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagCrc = tmp43 != 0
	tmp44, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagRestrictions = tmp44 != 0
	tmp45, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp45
	return err
}
type Id3v24_Header struct {
	Magic []byte
	VersionMajor uint8
	VersionRevision uint8
	Flags *Id3v24_Header_Flags
	Size *Id3v24_U4beSynchsafe
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Tag
}
func NewId3v24_Header() *Id3v24_Header {
	return &Id3v24_Header{
	}
}

func (this *Id3v24_Header) Read(io *kaitai.Stream, parent *Id3v24_Tag, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this.Magic = tmp46
	if !(bytes.Equal(this.Magic, []uint8{73, 68, 51})) {
		return kaitai.NewValidationNotEqualError([]uint8{73, 68, 51}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp47, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMajor = tmp47
	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionRevision = tmp48
	tmp49 := NewId3v24_Header_Flags()
	err = tmp49.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp49
	tmp50 := NewId3v24_U4beSynchsafe()
	err = tmp50.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Size = tmp50
	return err
}
type Id3v24_Header_Flags struct {
	FlagUnsynchronization bool
	FlagHeaderex bool
	FlagExperimental bool
	FlagFooter bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Header
}
func NewId3v24_Header_Flags() *Id3v24_Header_Flags {
	return &Id3v24_Header_Flags{
	}
}

func (this *Id3v24_Header_Flags) Read(io *kaitai.Stream, parent *Id3v24_Header, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp51, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagUnsynchronization = tmp51 != 0
	tmp52, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagHeaderex = tmp52 != 0
	tmp53, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagExperimental = tmp53 != 0
	tmp54, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagFooter = tmp54 != 0
	tmp55, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Reserved = tmp55
	return err
}
type Id3v24_Padding struct {
	Padding []byte
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Tag
}
func NewId3v24_Padding() *Id3v24_Padding {
	return &Id3v24_Padding{
	}
}

func (this *Id3v24_Padding) Read(io *kaitai.Stream, parent *Id3v24_Tag, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp56, err := this._root.Tag.Header.Size.Value()
	if err != nil {
		return err
	}
	tmp57, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp58, err := this._io.ReadBytes(int((tmp56 - tmp57)))
	if err != nil {
		return err
	}
	tmp58 = tmp58
	this.Padding = tmp58
	return err
}
type Id3v24_Footer struct {
	Magic []byte
	VersionMajor uint8
	VersionRevision uint8
	Flags *Id3v24_Footer_Flags
	Size *Id3v24_U4beSynchsafe
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Tag
}
func NewId3v24_Footer() *Id3v24_Footer {
	return &Id3v24_Footer{
	}
}

func (this *Id3v24_Footer) Read(io *kaitai.Stream, parent *Id3v24_Tag, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp59 = tmp59
	this.Magic = tmp59
	if !(bytes.Equal(this.Magic, []uint8{51, 68, 73})) {
		return kaitai.NewValidationNotEqualError([]uint8{51, 68, 73}, this.Magic, this._io, "/types/footer/seq/0")
	}
	tmp60, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMajor = tmp60
	tmp61, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionRevision = tmp61
	tmp62 := NewId3v24_Footer_Flags()
	err = tmp62.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp62
	tmp63 := NewId3v24_U4beSynchsafe()
	err = tmp63.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Size = tmp63
	return err
}
type Id3v24_Footer_Flags struct {
	FlagUnsynchronization bool
	FlagHeaderex bool
	FlagExperimental bool
	FlagFooter bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Id3v24
	_parent *Id3v24_Footer
}
func NewId3v24_Footer_Flags() *Id3v24_Footer_Flags {
	return &Id3v24_Footer_Flags{
	}
}

func (this *Id3v24_Footer_Flags) Read(io *kaitai.Stream, parent *Id3v24_Footer, root *Id3v24) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp64, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagUnsynchronization = tmp64 != 0
	tmp65, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagHeaderex = tmp65 != 0
	tmp66, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagExperimental = tmp66 != 0
	tmp67, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagFooter = tmp67 != 0
	tmp68, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Reserved = tmp68
	return err
}
