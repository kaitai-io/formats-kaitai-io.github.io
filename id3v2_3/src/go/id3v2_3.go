// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://id3.org/id3v2.3.0">Source</a>
 */
type Id3v23 struct {
	Tag *Id3v23_Tag
	_io *kaitai.Stream
	_root *Id3v23
	_parent interface{}
}
func NewId3v23() *Id3v23 {
	return &Id3v23{
	}
}

func (this *Id3v23) Read(io *kaitai.Stream, parent interface{}, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewId3v23_Tag()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Tag = tmp1
	return err
}
type Id3v23_U1beSynchsafe struct {
	Padding bool
	Value uint64
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_U2beSynchsafe
}
func NewId3v23_U1beSynchsafe() *Id3v23_U1beSynchsafe {
	return &Id3v23_U1beSynchsafe{
	}
}

func (this *Id3v23_U1beSynchsafe) Read(io *kaitai.Stream, parent *Id3v23_U2beSynchsafe, root *Id3v23) (err error) {
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
type Id3v23_U2beSynchsafe struct {
	Byte0 *Id3v23_U1beSynchsafe
	Byte1 *Id3v23_U1beSynchsafe
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_U4beSynchsafe
	_f_value bool
	value int
}
func NewId3v23_U2beSynchsafe() *Id3v23_U2beSynchsafe {
	return &Id3v23_U2beSynchsafe{
	}
}

func (this *Id3v23_U2beSynchsafe) Read(io *kaitai.Stream, parent *Id3v23_U4beSynchsafe, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4 := NewId3v23_U1beSynchsafe()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Byte0 = tmp4
	tmp5 := NewId3v23_U1beSynchsafe()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Byte1 = tmp5
	return err
}
func (this *Id3v23_U2beSynchsafe) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int(((this.Byte0.Value << 7) | this.Byte1.Value))
	this._f_value = true
	return this.value, nil
}

/**
 * @see "Section 3. ID3v2 overview"
 */
type Id3v23_Tag struct {
	Header *Id3v23_Header
	HeaderEx *Id3v23_HeaderEx
	Frames []*Id3v23_Frame
	Padding []byte
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23
}
func NewId3v23_Tag() *Id3v23_Tag {
	return &Id3v23_Tag{
	}
}

func (this *Id3v23_Tag) Read(io *kaitai.Stream, parent *Id3v23, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6 := NewId3v23_Header()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp6
	if (this.Header.Flags.FlagHeaderex) {
		tmp7 := NewId3v23_HeaderEx()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.HeaderEx = tmp7
	}
	for i := 1;; i++ {
		tmp8 := NewId3v23_Frame()
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
		tmp10, err := this.Header.Size.Value()
		if err != nil {
			return err
		}
		tmp11, err := _it.IsInvalid()
		if err != nil {
			return err
		}
		if  (((tmp9 + _it.Size) > tmp10) || (tmp11))  {
			break
		}
	}
	if (this.Header.Flags.FlagHeaderex) {
		tmp12, err := this._io.Pos()
		if err != nil {
			return err
		}
		tmp13, err := this._io.ReadBytes(int((this.HeaderEx.PaddingSize - tmp12)))
		if err != nil {
			return err
		}
		tmp13 = tmp13
		this.Padding = tmp13
	}
	return err
}
type Id3v23_U4beSynchsafe struct {
	Short0 *Id3v23_U2beSynchsafe
	Short1 *Id3v23_U2beSynchsafe
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Header
	_f_value bool
	value int
}
func NewId3v23_U4beSynchsafe() *Id3v23_U4beSynchsafe {
	return &Id3v23_U4beSynchsafe{
	}
}

func (this *Id3v23_U4beSynchsafe) Read(io *kaitai.Stream, parent *Id3v23_Header, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewId3v23_U2beSynchsafe()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Short0 = tmp14
	tmp15 := NewId3v23_U2beSynchsafe()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Short1 = tmp15
	return err
}
func (this *Id3v23_U4beSynchsafe) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp16, err := this.Short0.Value()
	if err != nil {
		return 0, err
	}
	tmp17, err := this.Short1.Value()
	if err != nil {
		return 0, err
	}
	this.value = int(((tmp16 << 14) | tmp17))
	this._f_value = true
	return this.value, nil
}

/**
 * @see "Section 3.3. ID3v2 frame overview"
 */
type Id3v23_Frame struct {
	Id string
	Size uint32
	Flags *Id3v23_Frame_Flags
	Data []byte
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Tag
	_f_isInvalid bool
	isInvalid bool
}
func NewId3v23_Frame() *Id3v23_Frame {
	return &Id3v23_Frame{
	}
}

func (this *Id3v23_Frame) Read(io *kaitai.Stream, parent *Id3v23_Tag, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Id = string(tmp18)
	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp19)
	tmp20 := NewId3v23_Frame_Flags()
	err = tmp20.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp20
	tmp21, err := this._io.ReadBytes(int(this.Size))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.Data = tmp21
	return err
}
func (this *Id3v23_Frame) IsInvalid() (v bool, err error) {
	if (this._f_isInvalid) {
		return this.isInvalid, nil
	}
	this.isInvalid = bool(this.Id == "\000\000\000\000")
	this._f_isInvalid = true
	return this.isInvalid, nil
}
type Id3v23_Frame_Flags struct {
	FlagDiscardAlterTag bool
	FlagDiscardAlterFile bool
	FlagReadOnly bool
	Reserved1 uint64
	FlagCompressed bool
	FlagEncrypted bool
	FlagGrouping bool
	Reserved2 uint64
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Frame
}
func NewId3v23_Frame_Flags() *Id3v23_Frame_Flags {
	return &Id3v23_Frame_Flags{
	}
}

func (this *Id3v23_Frame_Flags) Read(io *kaitai.Stream, parent *Id3v23_Frame, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagDiscardAlterTag = tmp22 != 0
	tmp23, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagDiscardAlterFile = tmp23 != 0
	tmp24, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagReadOnly = tmp24 != 0
	tmp25, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp25
	tmp26, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagCompressed = tmp26 != 0
	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagEncrypted = tmp27 != 0
	tmp28, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagGrouping = tmp28 != 0
	tmp29, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp29
	return err
}

/**
 * ID3v2 extended header
 * @see "Section 3.2. ID3v2 extended header"
 */
type Id3v23_HeaderEx struct {
	Size uint32
	FlagsEx *Id3v23_HeaderEx_FlagsEx
	PaddingSize uint32
	Crc uint32
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Tag
}
func NewId3v23_HeaderEx() *Id3v23_HeaderEx {
	return &Id3v23_HeaderEx{
	}
}

func (this *Id3v23_HeaderEx) Read(io *kaitai.Stream, parent *Id3v23_Tag, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp30)
	tmp31 := NewId3v23_HeaderEx_FlagsEx()
	err = tmp31.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FlagsEx = tmp31
	tmp32, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PaddingSize = uint32(tmp32)
	if (this.FlagsEx.FlagCrc) {
		tmp33, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Crc = uint32(tmp33)
	}
	return err
}
type Id3v23_HeaderEx_FlagsEx struct {
	FlagCrc bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_HeaderEx
}
func NewId3v23_HeaderEx_FlagsEx() *Id3v23_HeaderEx_FlagsEx {
	return &Id3v23_HeaderEx_FlagsEx{
	}
}

func (this *Id3v23_HeaderEx_FlagsEx) Read(io *kaitai.Stream, parent *Id3v23_HeaderEx, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagCrc = tmp34 != 0
	tmp35, err := this._io.ReadBitsIntBe(15)
	if err != nil {
		return err
	}
	this.Reserved = tmp35
	return err
}

/**
 * ID3v2 fixed header
 * @see "Section 3.1. ID3v2 header"
 */
type Id3v23_Header struct {
	Magic []byte
	VersionMajor uint8
	VersionRevision uint8
	Flags *Id3v23_Header_Flags
	Size *Id3v23_U4beSynchsafe
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Tag
}
func NewId3v23_Header() *Id3v23_Header {
	return &Id3v23_Header{
	}
}

func (this *Id3v23_Header) Read(io *kaitai.Stream, parent *Id3v23_Tag, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Magic = tmp36
	if !(bytes.Equal(this.Magic, []uint8{73, 68, 51})) {
		return kaitai.NewValidationNotEqualError([]uint8{73, 68, 51}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp37, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMajor = tmp37
	tmp38, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionRevision = tmp38
	tmp39 := NewId3v23_Header_Flags()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp39
	tmp40 := NewId3v23_U4beSynchsafe()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Size = tmp40
	return err
}
type Id3v23_Header_Flags struct {
	FlagUnsynchronization bool
	FlagHeaderex bool
	FlagExperimental bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Id3v23
	_parent *Id3v23_Header
}
func NewId3v23_Header_Flags() *Id3v23_Header_Flags {
	return &Id3v23_Header_Flags{
	}
}

func (this *Id3v23_Header_Flags) Read(io *kaitai.Stream, parent *Id3v23_Header, root *Id3v23) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagUnsynchronization = tmp41 != 0
	tmp42, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagHeaderex = tmp42 != 0
	tmp43, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FlagExperimental = tmp43 != 0
	tmp44, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved = tmp44
	return err
}
