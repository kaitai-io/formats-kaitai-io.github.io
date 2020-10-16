// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 * @see <a href="https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h">Source</a>
 */

type Uimage_UimageOs int
const (
	Uimage_UimageOs__Invalid Uimage_UimageOs = 0
	Uimage_UimageOs__Openbsd Uimage_UimageOs = 1
	Uimage_UimageOs__Netbsd Uimage_UimageOs = 2
	Uimage_UimageOs__Freebsd Uimage_UimageOs = 3
	Uimage_UimageOs__Bsd44 Uimage_UimageOs = 4
	Uimage_UimageOs__Linux Uimage_UimageOs = 5
	Uimage_UimageOs__Svr4 Uimage_UimageOs = 6
	Uimage_UimageOs__Esix Uimage_UimageOs = 7
	Uimage_UimageOs__Solaris Uimage_UimageOs = 8
	Uimage_UimageOs__Irix Uimage_UimageOs = 9
	Uimage_UimageOs__Sco Uimage_UimageOs = 10
	Uimage_UimageOs__Dell Uimage_UimageOs = 11
	Uimage_UimageOs__Ncr Uimage_UimageOs = 12
	Uimage_UimageOs__Lynxos Uimage_UimageOs = 13
	Uimage_UimageOs__Vxworks Uimage_UimageOs = 14
	Uimage_UimageOs__Psos Uimage_UimageOs = 15
	Uimage_UimageOs__Qnx Uimage_UimageOs = 16
	Uimage_UimageOs__UBoot Uimage_UimageOs = 17
	Uimage_UimageOs__Rtems Uimage_UimageOs = 18
	Uimage_UimageOs__Artos Uimage_UimageOs = 19
	Uimage_UimageOs__Unity Uimage_UimageOs = 20
	Uimage_UimageOs__Integrity Uimage_UimageOs = 21
)

type Uimage_UimageArch int
const (
	Uimage_UimageArch__Invalid Uimage_UimageArch = 0
	Uimage_UimageArch__Alpha Uimage_UimageArch = 1
	Uimage_UimageArch__Arm Uimage_UimageArch = 2
	Uimage_UimageArch__I386 Uimage_UimageArch = 3
	Uimage_UimageArch__Ia64 Uimage_UimageArch = 4
	Uimage_UimageArch__Mips Uimage_UimageArch = 5
	Uimage_UimageArch__Mips64 Uimage_UimageArch = 6
	Uimage_UimageArch__Ppc Uimage_UimageArch = 7
	Uimage_UimageArch__S390 Uimage_UimageArch = 8
	Uimage_UimageArch__Sh Uimage_UimageArch = 9
	Uimage_UimageArch__Sparc Uimage_UimageArch = 10
	Uimage_UimageArch__Sparc64 Uimage_UimageArch = 11
	Uimage_UimageArch__M68k Uimage_UimageArch = 12
	Uimage_UimageArch__Nios Uimage_UimageArch = 13
	Uimage_UimageArch__Microblaze Uimage_UimageArch = 14
	Uimage_UimageArch__Nios2 Uimage_UimageArch = 15
	Uimage_UimageArch__Blackfin Uimage_UimageArch = 16
	Uimage_UimageArch__Avr32 Uimage_UimageArch = 17
	Uimage_UimageArch__St200 Uimage_UimageArch = 18
)

type Uimage_UimageComp int
const (
	Uimage_UimageComp__None Uimage_UimageComp = 0
	Uimage_UimageComp__Gzip Uimage_UimageComp = 1
	Uimage_UimageComp__Bzip2 Uimage_UimageComp = 2
	Uimage_UimageComp__Lzma Uimage_UimageComp = 3
	Uimage_UimageComp__Lzo Uimage_UimageComp = 4
)

type Uimage_UimageType int
const (
	Uimage_UimageType__Invalid Uimage_UimageType = 0
	Uimage_UimageType__Standalone Uimage_UimageType = 1
	Uimage_UimageType__Kernel Uimage_UimageType = 2
	Uimage_UimageType__Ramdisk Uimage_UimageType = 3
	Uimage_UimageType__Multi Uimage_UimageType = 4
	Uimage_UimageType__Firmware Uimage_UimageType = 5
	Uimage_UimageType__Script Uimage_UimageType = 6
	Uimage_UimageType__Filesystem Uimage_UimageType = 7
	Uimage_UimageType__Flatdt Uimage_UimageType = 8
	Uimage_UimageType__Kwbimage Uimage_UimageType = 9
	Uimage_UimageType__Imximage Uimage_UimageType = 10
)
type Uimage struct {
	Header *Uimage_Uheader
	Data []byte
	_io *kaitai.Stream
	_root *Uimage
	_parent interface{}
}
func NewUimage() *Uimage {
	return &Uimage{
	}
}

func (this *Uimage) Read(io *kaitai.Stream, parent interface{}, root *Uimage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewUimage_Uheader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this._io.ReadBytes(int(this.Header.LenImage))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Data = tmp2
	return err
}
type Uimage_Uheader struct {
	Magic []byte
	HeaderCrc uint32
	Timestamp uint32
	LenImage uint32
	LoadAddress uint32
	EntryAddress uint32
	DataCrc uint32
	OsType Uimage_UimageOs
	Architecture Uimage_UimageArch
	ImageType Uimage_UimageType
	CompressionType Uimage_UimageComp
	Name string
	_io *kaitai.Stream
	_root *Uimage
	_parent *Uimage
}
func NewUimage_Uheader() *Uimage_Uheader {
	return &Uimage_Uheader{
	}
}

func (this *Uimage_Uheader) Read(io *kaitai.Stream, parent *Uimage, root *Uimage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{39, 5, 25, 86})) {
		return kaitai.NewValidationNotEqualError([]uint8{39, 5, 25, 86}, this.Magic, this._io, "/types/uheader/seq/0")
	}
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.HeaderCrc = uint32(tmp4)
	tmp5, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenImage = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LoadAddress = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.EntryAddress = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DataCrc = uint32(tmp9)
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.OsType = Uimage_UimageOs(tmp10)
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Architecture = Uimage_UimageArch(tmp11)
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ImageType = Uimage_UimageType(tmp12)
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionType = Uimage_UimageComp(tmp13)
	tmp14, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp14 = kaitai.BytesTerminate(tmp14, 0, false)
	this.Name = string(tmp14)
	return err
}
