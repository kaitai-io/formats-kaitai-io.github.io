// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES">Source</a>
 */
type Ines struct {
	Header *Ines_Header
	Trainer []byte
	PrgRom []byte
	ChrRom []byte
	Playchoice10 *Ines_Playchoice10
	Title string
	_io *kaitai.Stream
	_root *Ines
	_parent interface{}
	_raw_Header []byte
}
func NewInes() *Ines {
	return &Ines{
	}
}

func (this *Ines) Read(io *kaitai.Stream, parent interface{}, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this._raw_Header = tmp1
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp2 := NewInes_Header()
	err = tmp2.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp2
	if (this.Header.F6.Trainer) {
		tmp3, err := this._io.ReadBytes(int(512))
		if err != nil {
			return err
		}
		tmp3 = tmp3
		this.Trainer = tmp3
	}
	tmp4, err := this._io.ReadBytes(int((this.Header.LenPrgRom * 16384)))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.PrgRom = tmp4
	tmp5, err := this._io.ReadBytes(int((this.Header.LenChrRom * 8192)))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.ChrRom = tmp5
	if (this.Header.F7.Playchoice10) {
		tmp6 := NewInes_Playchoice10()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Playchoice10 = tmp6
	}
	tmp7, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp7)) {
		tmp8, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp8 = tmp8
		this.Title = string(tmp8)
	}
	return err
}
type Ines_Header struct {
	Magic []byte
	LenPrgRom uint8
	LenChrRom uint8
	F6 *Ines_Header_F6
	F7 *Ines_Header_F7
	LenPrgRam uint8
	F9 *Ines_Header_F9
	F10 *Ines_Header_F10
	Reserved []byte
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines
	_raw_F6 []byte
	_raw_F7 []byte
	_raw_F9 []byte
	_raw_F10 []byte
	_f_mapper bool
	mapper int
}
func NewInes_Header() *Ines_Header {
	return &Ines_Header{
	}
}

func (this *Ines_Header) Read(io *kaitai.Stream, parent *Ines, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Magic = tmp9
	if !(bytes.Equal(this.Magic, []uint8{78, 69, 83, 26})) {
		return kaitai.NewValidationNotEqualError([]uint8{78, 69, 83, 26}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenPrgRom = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenChrRom = tmp11
	tmp12, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this._raw_F6 = tmp12
	_io__raw_F6 := kaitai.NewStream(bytes.NewReader(this._raw_F6))
	tmp13 := NewInes_Header_F6()
	err = tmp13.Read(_io__raw_F6, this, this._root)
	if err != nil {
		return err
	}
	this.F6 = tmp13
	tmp14, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this._raw_F7 = tmp14
	_io__raw_F7 := kaitai.NewStream(bytes.NewReader(this._raw_F7))
	tmp15 := NewInes_Header_F7()
	err = tmp15.Read(_io__raw_F7, this, this._root)
	if err != nil {
		return err
	}
	this.F7 = tmp15
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenPrgRam = tmp16
	tmp17, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this._raw_F9 = tmp17
	_io__raw_F9 := kaitai.NewStream(bytes.NewReader(this._raw_F9))
	tmp18 := NewInes_Header_F9()
	err = tmp18.Read(_io__raw_F9, this, this._root)
	if err != nil {
		return err
	}
	this.F9 = tmp18
	tmp19, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this._raw_F10 = tmp19
	_io__raw_F10 := kaitai.NewStream(bytes.NewReader(this._raw_F10))
	tmp20 := NewInes_Header_F10()
	err = tmp20.Read(_io__raw_F10, this, this._root)
	if err != nil {
		return err
	}
	this.F10 = tmp20
	tmp21, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.Reserved = tmp21
	if !(bytes.Equal(this.Reserved, []uint8{0, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0, 0}, this.Reserved, this._io, "/types/header/seq/8")
	}
	return err
}

/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/Mapper">Source</a>
 */
func (this *Ines_Header) Mapper() (v int, err error) {
	if (this._f_mapper) {
		return this.mapper, nil
	}
	this.mapper = int((this.F6.LowerMapper | (this.F7.UpperMapper << 4)))
	this._f_mapper = true
	return this.mapper, nil
}

/**
 * Size of PRG ROM in 16 KB units
 */

/**
 * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
 */

/**
 * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
 */

/**
 * this one is unofficial
 */

/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_6">Source</a>
 */

type Ines_Header_F6_Mirroring int
const (
	Ines_Header_F6_Mirroring__Horizontal Ines_Header_F6_Mirroring = 0
	Ines_Header_F6_Mirroring__Vertical Ines_Header_F6_Mirroring = 1
)
type Ines_Header_F6 struct {
	LowerMapper uint64
	FourScreen bool
	Trainer bool
	HasBatteryRam bool
	Mirroring Ines_Header_F6_Mirroring
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines_Header
}
func NewInes_Header_F6() *Ines_Header_F6 {
	return &Ines_Header_F6{
	}
}

func (this *Ines_Header_F6) Read(io *kaitai.Stream, parent *Ines_Header, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.LowerMapper = tmp22
	tmp23, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FourScreen = tmp23 != 0
	tmp24, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Trainer = tmp24 != 0
	tmp25, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasBatteryRam = tmp25 != 0
	tmp26, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Mirroring = Ines_Header_F6_Mirroring(tmp26)
	return err
}

/**
 * Lower nibble of mapper number
 */

/**
 * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
 */

/**
 * 512-byte trainer at $7000-$71FF (stored before PRG data)
 */

/**
 * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
 */

/**
 * if 0, horizontal arrangement. if 1, vertical arrangement
 */

/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_7">Source</a>
 */
type Ines_Header_F7 struct {
	UpperMapper uint64
	Format uint64
	Playchoice10 bool
	VsUnisystem bool
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines_Header
}
func NewInes_Header_F7() *Ines_Header_F7 {
	return &Ines_Header_F7{
	}
}

func (this *Ines_Header_F7) Read(io *kaitai.Stream, parent *Ines_Header, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.UpperMapper = tmp27
	tmp28, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Format = tmp28
	tmp29, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Playchoice10 = tmp29 != 0
	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.VsUnisystem = tmp30 != 0
	return err
}

/**
 * Upper nibble of mapper number
 */

/**
 * If equal to 2, flags 8-15 are in NES 2.0 format
 */

/**
 * Determines if it made for a Nintendo PlayChoice-10 or not
 */

/**
 * Determines if it is made for a Nintendo VS Unisystem or not
 */

/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_9">Source</a>
 */

type Ines_Header_F9_TvSystem int
const (
	Ines_Header_F9_TvSystem__Ntsc Ines_Header_F9_TvSystem = 0
	Ines_Header_F9_TvSystem__Pal Ines_Header_F9_TvSystem = 1
)
type Ines_Header_F9 struct {
	Reserved uint64
	TvSystem Ines_Header_F9_TvSystem
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines_Header
}
func NewInes_Header_F9() *Ines_Header_F9 {
	return &Ines_Header_F9{
	}
}

func (this *Ines_Header_F9) Read(io *kaitai.Stream, parent *Ines_Header, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.Reserved = tmp31
	tmp32, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TvSystem = Ines_Header_F9_TvSystem(tmp32)
	return err
}

/**
 * if 0, NTSC. If 1, PAL.
 */

/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_10">Source</a>
 */

type Ines_Header_F10_TvSystem int
const (
	Ines_Header_F10_TvSystem__Ntsc Ines_Header_F10_TvSystem = 0
	Ines_Header_F10_TvSystem__Dual1 Ines_Header_F10_TvSystem = 1
	Ines_Header_F10_TvSystem__Pal Ines_Header_F10_TvSystem = 2
	Ines_Header_F10_TvSystem__Dual2 Ines_Header_F10_TvSystem = 3
)
type Ines_Header_F10 struct {
	Reserved1 uint64
	BusConflict bool
	PrgRam bool
	Reserved2 uint64
	TvSystem Ines_Header_F10_TvSystem
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines_Header
}
func NewInes_Header_F10() *Ines_Header_F10 {
	return &Ines_Header_F10{
	}
}

func (this *Ines_Header_F10) Read(io *kaitai.Stream, parent *Ines_Header, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp33
	tmp34, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BusConflict = tmp34 != 0
	tmp35, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.PrgRam = tmp35 != 0
	tmp36, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp36
	tmp37, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.TvSystem = Ines_Header_F10_TvSystem(tmp37)
	return err
}

/**
 * If 0, no bus conflicts. If 1, bus conflicts.
 */

/**
 * If 0, PRG ram is present. If 1, not present.
 */

/**
 * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
 */

/**
 * @see <a href="http://wiki.nesdev.com/w/index.php/PC10_ROM-Images">Source</a>
 */
type Ines_Playchoice10 struct {
	InstRom []byte
	Prom *Ines_Playchoice10_Prom
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines
}
func NewInes_Playchoice10() *Ines_Playchoice10 {
	return &Ines_Playchoice10{
	}
}

func (this *Ines_Playchoice10) Read(io *kaitai.Stream, parent *Ines, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadBytes(int(8192))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.InstRom = tmp38
	tmp39 := NewInes_Playchoice10_Prom()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Prom = tmp39
	return err
}
type Ines_Playchoice10_Prom struct {
	Data []byte
	CounterOut []byte
	_io *kaitai.Stream
	_root *Ines
	_parent *Ines_Playchoice10
}
func NewInes_Playchoice10_Prom() *Ines_Playchoice10_Prom {
	return &Ines_Playchoice10_Prom{
	}
}

func (this *Ines_Playchoice10_Prom) Read(io *kaitai.Stream, parent *Ines_Playchoice10, root *Ines) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp40, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Data = tmp40
	tmp41, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.CounterOut = tmp41
	return err
}
