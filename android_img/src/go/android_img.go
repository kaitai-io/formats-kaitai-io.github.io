// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * @see <a href="https://source.android.com/devices/bootloader/boot-image-header">Source</a>
 */
type AndroidImg struct {
	Magic []byte
	Kernel *AndroidImg_Load
	Ramdisk *AndroidImg_Load
	Second *AndroidImg_Load
	TagsLoad uint32
	PageSize uint32
	HeaderVersion uint32
	OsVersion *AndroidImg_OsVersion
	Name string
	Cmdline string
	Sha []byte
	ExtraCmdline string
	RecoveryDtbo *AndroidImg_SizeOffset
	BootHeaderSize uint32
	Dtb *AndroidImg_LoadLong
	_io *kaitai.Stream
	_root *AndroidImg
	_parent interface{}
	_f_kernelImg bool
	kernelImg []byte
	_f_tagsOffset bool
	tagsOffset int
	_f_ramdiskOffset bool
	ramdiskOffset int
	_f_secondOffset bool
	secondOffset int
	_f_kernelOffset bool
	kernelOffset int
	_f_dtbOffset bool
	dtbOffset int
	_f_dtbImg bool
	dtbImg []byte
	_f_ramdiskImg bool
	ramdiskImg []byte
	_f_recoveryDtboImg bool
	recoveryDtboImg []byte
	_f_secondImg bool
	secondImg []byte
	_f_base bool
	base int
}
func NewAndroidImg() *AndroidImg {
	return &AndroidImg{
	}
}

func (this *AndroidImg) Read(io *kaitai.Stream, parent interface{}, root *AndroidImg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{65, 78, 68, 82, 79, 73, 68, 33})) {
		return kaitai.NewValidationNotEqualError([]uint8{65, 78, 68, 82, 79, 73, 68, 33}, this.Magic, this._io, "/seq/0")
	}
	tmp2 := NewAndroidImg_Load()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Kernel = tmp2
	tmp3 := NewAndroidImg_Load()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ramdisk = tmp3
	tmp4 := NewAndroidImg_Load()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Second = tmp4
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TagsLoad = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PageSize = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderVersion = uint32(tmp7)
	tmp8 := NewAndroidImg_OsVersion()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.OsVersion = tmp8
	tmp9, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp9 = kaitai.BytesTerminate(tmp9, 0, false)
	this.Name = string(tmp9)
	tmp10, err := this._io.ReadBytes(int(512))
	if err != nil {
		return err
	}
	tmp10 = kaitai.BytesTerminate(tmp10, 0, false)
	this.Cmdline = string(tmp10)
	tmp11, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Sha = tmp11
	tmp12, err := this._io.ReadBytes(int(1024))
	if err != nil {
		return err
	}
	tmp12 = kaitai.BytesTerminate(tmp12, 0, false)
	this.ExtraCmdline = string(tmp12)
	if (this.HeaderVersion > 0) {
		tmp13 := NewAndroidImg_SizeOffset()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RecoveryDtbo = tmp13
	}
	if (this.HeaderVersion > 0) {
		tmp14, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BootHeaderSize = uint32(tmp14)
	}
	if (this.HeaderVersion > 1) {
		tmp15 := NewAndroidImg_LoadLong()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Dtb = tmp15
	}
	return err
}
func (this *AndroidImg) KernelImg() (v []byte, err error) {
	if (this._f_kernelImg) {
		return this.kernelImg, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.PageSize), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp16, err := this._io.ReadBytes(int(this.Kernel.Size))
	if err != nil {
		return nil, err
	}
	tmp16 = tmp16
	this.kernelImg = tmp16
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_kernelImg = true
	this._f_kernelImg = true
	return this.kernelImg, nil
}

/**
 * tags offset from base
 */
func (this *AndroidImg) TagsOffset() (v int, err error) {
	if (this._f_tagsOffset) {
		return this.tagsOffset, nil
	}
	tmp17, err := this.Base()
	if err != nil {
		return 0, err
	}
	this.tagsOffset = int((this.TagsLoad - tmp17))
	this._f_tagsOffset = true
	return this.tagsOffset, nil
}

/**
 * ramdisk offset from base
 */
func (this *AndroidImg) RamdiskOffset() (v int, err error) {
	if (this._f_ramdiskOffset) {
		return this.ramdiskOffset, nil
	}
	var tmp18 int;
	if (this.Ramdisk.Addr > 0) {
		tmp19, err := this.Base()
		if err != nil {
			return 0, err
		}
		tmp18 = (this.Ramdisk.Addr - tmp19)
	} else {
		tmp18 = 0
	}
	this.ramdiskOffset = int(tmp18)
	this._f_ramdiskOffset = true
	return this.ramdiskOffset, nil
}

/**
 * 2nd bootloader offset from base
 */
func (this *AndroidImg) SecondOffset() (v int, err error) {
	if (this._f_secondOffset) {
		return this.secondOffset, nil
	}
	var tmp20 int;
	if (this.Second.Addr > 0) {
		tmp21, err := this.Base()
		if err != nil {
			return 0, err
		}
		tmp20 = (this.Second.Addr - tmp21)
	} else {
		tmp20 = 0
	}
	this.secondOffset = int(tmp20)
	this._f_secondOffset = true
	return this.secondOffset, nil
}

/**
 * kernel offset from base
 */
func (this *AndroidImg) KernelOffset() (v int, err error) {
	if (this._f_kernelOffset) {
		return this.kernelOffset, nil
	}
	tmp22, err := this.Base()
	if err != nil {
		return 0, err
	}
	this.kernelOffset = int((this.Kernel.Addr - tmp22))
	this._f_kernelOffset = true
	return this.kernelOffset, nil
}

/**
 * dtb offset from base
 */
func (this *AndroidImg) DtbOffset() (v int, err error) {
	if (this._f_dtbOffset) {
		return this.dtbOffset, nil
	}
	if (this.HeaderVersion > 1) {
		var tmp23 int;
		if (this.Dtb.Addr > 0) {
			tmp24, err := this.Base()
			if err != nil {
				return 0, err
			}
			tmp23 = (this.Dtb.Addr - tmp24)
		} else {
			tmp23 = 0
		}
		this.dtbOffset = int(tmp23)
	}
	this._f_dtbOffset = true
	return this.dtbOffset, nil
}
func (this *AndroidImg) DtbImg() (v []byte, err error) {
	if (this._f_dtbImg) {
		return this.dtbImg, nil
	}
	if ( ((this.HeaderVersion > 1) && (this.Dtb.Size > 0)) ) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(((((((((this.PageSize + this.Kernel.Size) + this.Ramdisk.Size) + this.Second.Size) + this.RecoveryDtbo.Size) + this.PageSize) - 1) / this.PageSize) * this.PageSize)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp25, err := this._io.ReadBytes(int(this.Dtb.Size))
		if err != nil {
			return nil, err
		}
		tmp25 = tmp25
		this.dtbImg = tmp25
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_dtbImg = true
	}
	this._f_dtbImg = true
	return this.dtbImg, nil
}
func (this *AndroidImg) RamdiskImg() (v []byte, err error) {
	if (this._f_ramdiskImg) {
		return this.ramdiskImg, nil
	}
	if (this.Ramdisk.Size > 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64((((((this.PageSize + this.Kernel.Size) + this.PageSize) - 1) / this.PageSize) * this.PageSize)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp26, err := this._io.ReadBytes(int(this.Ramdisk.Size))
		if err != nil {
			return nil, err
		}
		tmp26 = tmp26
		this.ramdiskImg = tmp26
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_ramdiskImg = true
	}
	this._f_ramdiskImg = true
	return this.ramdiskImg, nil
}
func (this *AndroidImg) RecoveryDtboImg() (v []byte, err error) {
	if (this._f_recoveryDtboImg) {
		return this.recoveryDtboImg, nil
	}
	if ( ((this.HeaderVersion > 0) && (this.RecoveryDtbo.Size > 0)) ) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.RecoveryDtbo.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp27, err := this._io.ReadBytes(int(this.RecoveryDtbo.Size))
		if err != nil {
			return nil, err
		}
		tmp27 = tmp27
		this.recoveryDtboImg = tmp27
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_recoveryDtboImg = true
	}
	this._f_recoveryDtboImg = true
	return this.recoveryDtboImg, nil
}
func (this *AndroidImg) SecondImg() (v []byte, err error) {
	if (this._f_secondImg) {
		return this.secondImg, nil
	}
	if (this.Second.Size > 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(((((((this.PageSize + this.Kernel.Size) + this.Ramdisk.Size) + this.PageSize) - 1) / this.PageSize) * this.PageSize)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp28, err := this._io.ReadBytes(int(this.Second.Size))
		if err != nil {
			return nil, err
		}
		tmp28 = tmp28
		this.secondImg = tmp28
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_secondImg = true
	}
	this._f_secondImg = true
	return this.secondImg, nil
}

/**
 * base loading address
 */
func (this *AndroidImg) Base() (v int, err error) {
	if (this._f_base) {
		return this.base, nil
	}
	this.base = int((this.Kernel.Addr - 32768))
	this._f_base = true
	return this.base, nil
}
type AndroidImg_Load struct {
	Size uint32
	Addr uint32
	_io *kaitai.Stream
	_root *AndroidImg
	_parent *AndroidImg
}
func NewAndroidImg_Load() *AndroidImg_Load {
	return &AndroidImg_Load{
	}
}

func (this *AndroidImg_Load) Read(io *kaitai.Stream, parent *AndroidImg, root *AndroidImg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp29)
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Addr = uint32(tmp30)
	return err
}
type AndroidImg_LoadLong struct {
	Size uint32
	Addr uint64
	_io *kaitai.Stream
	_root *AndroidImg
	_parent *AndroidImg
}
func NewAndroidImg_LoadLong() *AndroidImg_LoadLong {
	return &AndroidImg_LoadLong{
	}
}

func (this *AndroidImg_LoadLong) Read(io *kaitai.Stream, parent *AndroidImg, root *AndroidImg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp31)
	tmp32, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Addr = uint64(tmp32)
	return err
}
type AndroidImg_SizeOffset struct {
	Size uint32
	Offset uint64
	_io *kaitai.Stream
	_root *AndroidImg
	_parent *AndroidImg
}
func NewAndroidImg_SizeOffset() *AndroidImg_SizeOffset {
	return &AndroidImg_SizeOffset{
	}
}

func (this *AndroidImg_SizeOffset) Read(io *kaitai.Stream, parent *AndroidImg, root *AndroidImg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp33)
	tmp34, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp34)
	return err
}
type AndroidImg_OsVersion struct {
	Version uint32
	_io *kaitai.Stream
	_root *AndroidImg
	_parent *AndroidImg
	_f_month bool
	month int
	_f_patch bool
	patch int
	_f_year bool
	year int
	_f_major bool
	major int
	_f_minor bool
	minor int
}
func NewAndroidImg_OsVersion() *AndroidImg_OsVersion {
	return &AndroidImg_OsVersion{
	}
}

func (this *AndroidImg_OsVersion) Read(io *kaitai.Stream, parent *AndroidImg, root *AndroidImg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp35)
	return err
}
func (this *AndroidImg_OsVersion) Month() (v int, err error) {
	if (this._f_month) {
		return this.month, nil
	}
	this.month = int((this.Version & 15))
	this._f_month = true
	return this.month, nil
}
func (this *AndroidImg_OsVersion) Patch() (v int, err error) {
	if (this._f_patch) {
		return this.patch, nil
	}
	this.patch = int(((this.Version >> 11) & 127))
	this._f_patch = true
	return this.patch, nil
}
func (this *AndroidImg_OsVersion) Year() (v int, err error) {
	if (this._f_year) {
		return this.year, nil
	}
	this.year = int((((this.Version >> 4) & 127) + 2000))
	this._f_year = true
	return this.year, nil
}
func (this *AndroidImg_OsVersion) Major() (v int, err error) {
	if (this._f_major) {
		return this.major, nil
	}
	this.major = int(((this.Version >> 25) & 127))
	this._f_major = true
	return this.major, nil
}
func (this *AndroidImg_OsVersion) Minor() (v int, err error) {
	if (this._f_minor) {
		return this.minor, nil
	}
	this.minor = int(((this.Version >> 18) & 127))
	this._f_minor = true
	return this.minor, nil
}