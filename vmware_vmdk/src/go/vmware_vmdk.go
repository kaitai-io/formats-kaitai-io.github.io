// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * @see <a href="https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header">Source</a>
 */

type VmwareVmdk_CompressionMethods int
const (
	VmwareVmdk_CompressionMethods__None VmwareVmdk_CompressionMethods = 0
	VmwareVmdk_CompressionMethods__Deflate VmwareVmdk_CompressionMethods = 1
)
type VmwareVmdk struct {
	Magic []byte
	Version int32
	Flags *VmwareVmdk_HeaderFlags
	SizeMax int64
	SizeGrain int64
	StartDescriptor int64
	SizeDescriptor int64
	NumGrainTableEntries int32
	StartSecondaryGrain int64
	StartPrimaryGrain int64
	SizeMetadata int64
	IsDirty uint8
	Stuff []byte
	CompressionMethod VmwareVmdk_CompressionMethods
	_io *kaitai.Stream
	_root *VmwareVmdk
	_parent interface{}
	_f_lenSector bool
	lenSector int
	_f_descriptor bool
	descriptor []byte
	_f_grainPrimary bool
	grainPrimary []byte
	_f_grainSecondary bool
	grainSecondary []byte
}
func NewVmwareVmdk() *VmwareVmdk {
	return &VmwareVmdk{
	}
}

func (this *VmwareVmdk) Read(io *kaitai.Stream, parent interface{}, root *VmwareVmdk) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{75, 68, 77, 86})) {
		return kaitai.NewValidationNotEqualError([]uint8{75, 68, 77, 86}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Version = int32(tmp2)
	tmp3 := NewVmwareVmdk_HeaderFlags()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp3
	tmp4, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.SizeMax = int64(tmp4)
	tmp5, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.SizeGrain = int64(tmp5)
	tmp6, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.StartDescriptor = int64(tmp6)
	tmp7, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.SizeDescriptor = int64(tmp7)
	tmp8, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumGrainTableEntries = int32(tmp8)
	tmp9, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.StartSecondaryGrain = int64(tmp9)
	tmp10, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.StartPrimaryGrain = int64(tmp10)
	tmp11, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.SizeMetadata = int64(tmp11)
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IsDirty = tmp12
	tmp13, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Stuff = tmp13
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CompressionMethod = VmwareVmdk_CompressionMethods(tmp14)
	return err
}
func (this *VmwareVmdk) LenSector() (v int, err error) {
	if (this._f_lenSector) {
		return this.lenSector, nil
	}
	this.lenSector = int(512)
	this._f_lenSector = true
	return this.lenSector, nil
}
func (this *VmwareVmdk) Descriptor() (v []byte, err error) {
	if (this._f_descriptor) {
		return this.descriptor, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp15, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.StartDescriptor * tmp15)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp16, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	tmp17, err := this._io.ReadBytes(int((this.SizeDescriptor * tmp16)))
	if err != nil {
		return nil, err
	}
	tmp17 = tmp17
	this.descriptor = tmp17
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_descriptor = true
	this._f_descriptor = true
	return this.descriptor, nil
}
func (this *VmwareVmdk) GrainPrimary() (v []byte, err error) {
	if (this._f_grainPrimary) {
		return this.grainPrimary, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp18, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.StartPrimaryGrain * tmp18)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp19, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	tmp20, err := this._io.ReadBytes(int((this.SizeGrain * tmp19)))
	if err != nil {
		return nil, err
	}
	tmp20 = tmp20
	this.grainPrimary = tmp20
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_grainPrimary = true
	this._f_grainPrimary = true
	return this.grainPrimary, nil
}
func (this *VmwareVmdk) GrainSecondary() (v []byte, err error) {
	if (this._f_grainSecondary) {
		return this.grainSecondary, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp21, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.StartSecondaryGrain * tmp21)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp22, err := this._root.LenSector()
	if err != nil {
		return nil, err
	}
	tmp23, err := this._io.ReadBytes(int((this.SizeGrain * tmp22)))
	if err != nil {
		return nil, err
	}
	tmp23 = tmp23
	this.grainSecondary = tmp23
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_grainSecondary = true
	this._f_grainSecondary = true
	return this.grainSecondary, nil
}

/**
 * Maximum number of sectors in a given image file (capacity)
 */

/**
 * Embedded descriptor file start sector number (0 if not available)
 */

/**
 * Number of sectors that embedded descriptor file occupies
 */

/**
 * Number of grains table entries
 */

/**
 * Secondary (backup) grain directory start sector number
 */

/**
 * Primary grain directory start sector number
 */

/**
 * @see <a href="https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags">Source</a>
 */
type VmwareVmdk_HeaderFlags struct {
	Reserved1 uint64
	ZeroedGrainTableEntry bool
	UseSecondaryGrainDir bool
	ValidNewLineDetectionTest bool
	Reserved2 uint8
	Reserved3 uint64
	HasMetadata bool
	HasCompressedGrain bool
	Reserved4 uint8
	_io *kaitai.Stream
	_root *VmwareVmdk
	_parent *VmwareVmdk
}
func NewVmwareVmdk_HeaderFlags() *VmwareVmdk_HeaderFlags {
	return &VmwareVmdk_HeaderFlags{
	}
}

func (this *VmwareVmdk_HeaderFlags) Read(io *kaitai.Stream, parent *VmwareVmdk, root *VmwareVmdk) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp24
	tmp25, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.ZeroedGrainTableEntry = tmp25 != 0
	tmp26, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.UseSecondaryGrainDir = tmp26 != 0
	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.ValidNewLineDetectionTest = tmp27 != 0
	this._io.AlignToByte()
	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp28
	tmp29, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Reserved3 = tmp29
	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasMetadata = tmp30 != 0
	tmp31, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasCompressedGrain = tmp31 != 0
	this._io.AlignToByte()
	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved4 = tmp32
	return err
}
