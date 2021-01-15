// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system's motherboard. UEFI firmware is very modular: it usually contains
 * dozens, if not hundreds, of executables. To store all these separates files,
 * the firmware is laid out in volumes using the Firmware File System (FFS), a
 * file system specifically designed to store firmware images. The volumes
 * contain files that are identified by GUIDs and each of these files contain
 * one or more sections holding the data. One of these sections contains the
 * actual executable image. Most of the executable images follow the PE format.
 * However, some of them follow the TE format.
 * 
 * The Terse Executable (TE) image format was created as a mechanism to reduce
 * the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
 * corresponding reduction of image sizes for executables running in the PI
 * (Platform Initialization) Architecture environment. Reducing image size
 * provides an opportunity for use of a smaller system flash part.
 * 
 * So the TE format is basically a stripped version of PE.
 * @see <a href="https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf">Source</a>
 */
type UefiTe struct {
	TeHdr *UefiTe_TeHeader
	Sections []*UefiTe_Section
	_io *kaitai.Stream
	_root *UefiTe
	_parent interface{}
	_raw_TeHdr []byte
}
func NewUefiTe() *UefiTe {
	return &UefiTe{
	}
}

func (this *UefiTe) Read(io *kaitai.Stream, parent interface{}, root *UefiTe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(40))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this._raw_TeHdr = tmp1
	_io__raw_TeHdr := kaitai.NewStream(bytes.NewReader(this._raw_TeHdr))
	tmp2 := NewUefiTe_TeHeader()
	err = tmp2.Read(_io__raw_TeHdr, this, this._root)
	if err != nil {
		return err
	}
	this.TeHdr = tmp2
	this.Sections = make([]*UefiTe_Section, this.TeHdr.NumSections)
	for i := range this.Sections {
		tmp3 := NewUefiTe_Section()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections[i] = tmp3
	}
	return err
}

type UefiTe_TeHeader_MachineType int
const (
	UefiTe_TeHeader_MachineType__Unknown UefiTe_TeHeader_MachineType = 0
	UefiTe_TeHeader_MachineType__I386 UefiTe_TeHeader_MachineType = 332
	UefiTe_TeHeader_MachineType__R4000 UefiTe_TeHeader_MachineType = 358
	UefiTe_TeHeader_MachineType__Wcemipsv2 UefiTe_TeHeader_MachineType = 361
	UefiTe_TeHeader_MachineType__Alpha UefiTe_TeHeader_MachineType = 388
	UefiTe_TeHeader_MachineType__Sh3 UefiTe_TeHeader_MachineType = 418
	UefiTe_TeHeader_MachineType__Sh3dsp UefiTe_TeHeader_MachineType = 419
	UefiTe_TeHeader_MachineType__Sh4 UefiTe_TeHeader_MachineType = 422
	UefiTe_TeHeader_MachineType__Sh5 UefiTe_TeHeader_MachineType = 424
	UefiTe_TeHeader_MachineType__Arm UefiTe_TeHeader_MachineType = 448
	UefiTe_TeHeader_MachineType__Thumb UefiTe_TeHeader_MachineType = 450
	UefiTe_TeHeader_MachineType__Armnt UefiTe_TeHeader_MachineType = 452
	UefiTe_TeHeader_MachineType__Am33 UefiTe_TeHeader_MachineType = 467
	UefiTe_TeHeader_MachineType__Powerpc UefiTe_TeHeader_MachineType = 496
	UefiTe_TeHeader_MachineType__Powerpcfp UefiTe_TeHeader_MachineType = 497
	UefiTe_TeHeader_MachineType__Ia64 UefiTe_TeHeader_MachineType = 512
	UefiTe_TeHeader_MachineType__Mips16 UefiTe_TeHeader_MachineType = 614
	UefiTe_TeHeader_MachineType__Mipsfpu UefiTe_TeHeader_MachineType = 870
	UefiTe_TeHeader_MachineType__Mipsfpu16 UefiTe_TeHeader_MachineType = 1126
	UefiTe_TeHeader_MachineType__Ebc UefiTe_TeHeader_MachineType = 3772
	UefiTe_TeHeader_MachineType__Riscv32 UefiTe_TeHeader_MachineType = 20530
	UefiTe_TeHeader_MachineType__Riscv64 UefiTe_TeHeader_MachineType = 20580
	UefiTe_TeHeader_MachineType__Riscv128 UefiTe_TeHeader_MachineType = 20776
	UefiTe_TeHeader_MachineType__Amd64 UefiTe_TeHeader_MachineType = 34404
	UefiTe_TeHeader_MachineType__M32r UefiTe_TeHeader_MachineType = 36929
	UefiTe_TeHeader_MachineType__Arm64 UefiTe_TeHeader_MachineType = 43620
)

type UefiTe_TeHeader_SubsystemEnum int
const (
	UefiTe_TeHeader_SubsystemEnum__Unknown UefiTe_TeHeader_SubsystemEnum = 0
	UefiTe_TeHeader_SubsystemEnum__Native UefiTe_TeHeader_SubsystemEnum = 1
	UefiTe_TeHeader_SubsystemEnum__WindowsGui UefiTe_TeHeader_SubsystemEnum = 2
	UefiTe_TeHeader_SubsystemEnum__WindowsCui UefiTe_TeHeader_SubsystemEnum = 3
	UefiTe_TeHeader_SubsystemEnum__PosixCui UefiTe_TeHeader_SubsystemEnum = 7
	UefiTe_TeHeader_SubsystemEnum__WindowsCeGui UefiTe_TeHeader_SubsystemEnum = 9
	UefiTe_TeHeader_SubsystemEnum__EfiApplication UefiTe_TeHeader_SubsystemEnum = 10
	UefiTe_TeHeader_SubsystemEnum__EfiBootServiceDriver UefiTe_TeHeader_SubsystemEnum = 11
	UefiTe_TeHeader_SubsystemEnum__EfiRuntimeDriver UefiTe_TeHeader_SubsystemEnum = 12
	UefiTe_TeHeader_SubsystemEnum__EfiRom UefiTe_TeHeader_SubsystemEnum = 13
	UefiTe_TeHeader_SubsystemEnum__Xbox UefiTe_TeHeader_SubsystemEnum = 14
	UefiTe_TeHeader_SubsystemEnum__WindowsBootApplication UefiTe_TeHeader_SubsystemEnum = 16
)
type UefiTe_TeHeader struct {
	Magic []byte
	Machine UefiTe_TeHeader_MachineType
	NumSections uint8
	Subsystem UefiTe_TeHeader_SubsystemEnum
	StrippedSize uint16
	EntryPointAddr uint32
	BaseOfCode uint32
	ImageBase uint64
	DataDirs *UefiTe_HeaderDataDirs
	_io *kaitai.Stream
	_root *UefiTe
	_parent *UefiTe
}
func NewUefiTe_TeHeader() *UefiTe_TeHeader {
	return &UefiTe_TeHeader{
	}
}

func (this *UefiTe_TeHeader) Read(io *kaitai.Stream, parent *UefiTe, root *UefiTe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Magic = tmp4
	if !(bytes.Equal(this.Magic, []uint8{86, 90})) {
		return kaitai.NewValidationNotEqualError([]uint8{86, 90}, this.Magic, this._io, "/types/te_header/seq/0")
	}
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Machine = UefiTe_TeHeader_MachineType(tmp5)
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumSections = tmp6
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Subsystem = UefiTe_TeHeader_SubsystemEnum(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.StrippedSize = uint16(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EntryPointAddr = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BaseOfCode = uint32(tmp10)
	tmp11, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.ImageBase = uint64(tmp11)
	tmp12 := NewUefiTe_HeaderDataDirs()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DataDirs = tmp12
	return err
}
type UefiTe_HeaderDataDirs struct {
	BaseRelocationTable *UefiTe_DataDir
	Debug *UefiTe_DataDir
	_io *kaitai.Stream
	_root *UefiTe
	_parent *UefiTe_TeHeader
}
func NewUefiTe_HeaderDataDirs() *UefiTe_HeaderDataDirs {
	return &UefiTe_HeaderDataDirs{
	}
}

func (this *UefiTe_HeaderDataDirs) Read(io *kaitai.Stream, parent *UefiTe_TeHeader, root *UefiTe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13 := NewUefiTe_DataDir()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BaseRelocationTable = tmp13
	tmp14 := NewUefiTe_DataDir()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Debug = tmp14
	return err
}
type UefiTe_DataDir struct {
	VirtualAddress uint32
	Size uint32
	_io *kaitai.Stream
	_root *UefiTe
	_parent *UefiTe_HeaderDataDirs
}
func NewUefiTe_DataDir() *UefiTe_DataDir {
	return &UefiTe_DataDir{
	}
}

func (this *UefiTe_DataDir) Read(io *kaitai.Stream, parent *UefiTe_HeaderDataDirs, root *UefiTe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualAddress = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp16)
	return err
}
type UefiTe_Section struct {
	Name string
	VirtualSize uint32
	VirtualAddress uint32
	SizeOfRawData uint32
	PointerToRawData uint32
	PointerToRelocations uint32
	PointerToLinenumbers uint32
	NumRelocations uint16
	NumLinenumbers uint16
	Characteristics uint32
	_io *kaitai.Stream
	_root *UefiTe
	_parent *UefiTe
	_f_body bool
	body []byte
}
func NewUefiTe_Section() *UefiTe_Section {
	return &UefiTe_Section{
	}
}

func (this *UefiTe_Section) Read(io *kaitai.Stream, parent *UefiTe, root *UefiTe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp17 = kaitai.BytesStripRight(tmp17, 0)
	this.Name = string(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualSize = uint32(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualAddress = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfRawData = uint32(tmp20)
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToRawData = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToRelocations = uint32(tmp22)
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToLinenumbers = uint32(tmp23)
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumRelocations = uint16(tmp24)
	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumLinenumbers = uint16(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Characteristics = uint32(tmp26)
	return err
}
func (this *UefiTe_Section) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp27, err := this._root.TeHdr._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(((this.PointerToRawData - this._root.TeHdr.StrippedSize) + tmp27)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp28, err := this._io.ReadBytes(int(this.SizeOfRawData))
	if err != nil {
		return nil, err
	}
	tmp28 = tmp28
	this.body = tmp28
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
