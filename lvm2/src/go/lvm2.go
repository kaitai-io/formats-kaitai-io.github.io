// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 * @see <a href="https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc">Source</a>
 */
type Lvm2 struct {
	Pv *Lvm2_PhysicalVolume
	_io *kaitai.Stream
	_root *Lvm2
	_parent interface{}
	_f_sectorSize bool
	sectorSize int
}
func NewLvm2() *Lvm2 {
	return &Lvm2{
	}
}

func (this *Lvm2) Read(io *kaitai.Stream, parent interface{}, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewLvm2_PhysicalVolume()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Pv = tmp1
	return err
}
func (this *Lvm2) SectorSize() (v int, err error) {
	if (this._f_sectorSize) {
		return this.sectorSize, nil
	}
	this.sectorSize = int(512)
	this._f_sectorSize = true
	return this.sectorSize, nil
}

/**
 * Physical volume
 */
type Lvm2_PhysicalVolume struct {
	EmptySector []byte
	Label *Lvm2_PhysicalVolume_Label
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2
}
func NewLvm2_PhysicalVolume() *Lvm2_PhysicalVolume {
	return &Lvm2_PhysicalVolume{
	}
}

func (this *Lvm2_PhysicalVolume) Read(io *kaitai.Stream, parent *Lvm2, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._root.SectorSize()
	if err != nil {
		return err
	}
	tmp3, err := this._io.ReadBytes(int(tmp2))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.EmptySector = tmp3
	tmp4 := NewLvm2_PhysicalVolume_Label()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Label = tmp4
	return err
}
type Lvm2_PhysicalVolume_Label struct {
	LabelHeader *Lvm2_PhysicalVolume_Label_LabelHeader
	VolumeHeader *Lvm2_PhysicalVolume_Label_VolumeHeader
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume
}
func NewLvm2_PhysicalVolume_Label() *Lvm2_PhysicalVolume_Label {
	return &Lvm2_PhysicalVolume_Label{
	}
}

func (this *Lvm2_PhysicalVolume_Label) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5 := NewLvm2_PhysicalVolume_Label_LabelHeader()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LabelHeader = tmp5
	tmp6 := NewLvm2_PhysicalVolume_Label_VolumeHeader()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolumeHeader = tmp6
	return err
}
type Lvm2_PhysicalVolume_Label_LabelHeader struct {
	Signature []byte
	SectorNumber uint64
	Checksum uint32
	LabelHeader *Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label
}
func NewLvm2_PhysicalVolume_Label_LabelHeader() *Lvm2_PhysicalVolume_Label_LabelHeader {
	return &Lvm2_PhysicalVolume_Label_LabelHeader{
	}
}

func (this *Lvm2_PhysicalVolume_Label_LabelHeader) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Signature = tmp7
	if !(bytes.Equal(this.Signature, []uint8{76, 65, 66, 69, 76, 79, 78, 69})) {
		return kaitai.NewValidationNotEqualError([]uint8{76, 65, 66, 69, 76, 79, 78, 69}, this.Signature, this._io, "/types/physical_volume/types/label/types/label_header/seq/0")
	}
	tmp8, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.SectorNumber = uint64(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp9)
	tmp10 := NewLvm2_PhysicalVolume_Label_LabelHeader_LabelHeader()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LabelHeader = tmp10
	return err
}

/**
 * The sector number of the physical volume label header
 */

/**
 * CRC-32 for offset 20 to end of the physical volume label sector
 */
type Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader struct {
	DataOffset uint32
	TypeIndicator []byte
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label_LabelHeader
}
func NewLvm2_PhysicalVolume_Label_LabelHeader_LabelHeader() *Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
	return &Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader{
	}
}

func (this *Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label_LabelHeader, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataOffset = uint32(tmp11)
	tmp12, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.TypeIndicator = tmp12
	if !(bytes.Equal(this.TypeIndicator, []uint8{76, 86, 77, 50, 32, 48, 48, 49})) {
		return kaitai.NewValidationNotEqualError([]uint8{76, 86, 77, 50, 32, 48, 48, 49}, this.TypeIndicator, this._io, "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1")
	}
	return err
}

/**
 * The offset, in bytes, relative from the start of the physical volume label header where data is stored
 */
type Lvm2_PhysicalVolume_Label_VolumeHeader struct {
	Id string
	Size uint64
	DataAreaDescriptors []*Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor
	MetadataAreaDescriptors []*Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader() *Lvm2_PhysicalVolume_Label_VolumeHeader {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Id = string(tmp13)
	tmp14, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp14)
	for i := 1;; i++ {
		tmp15 := NewLvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp15
		this.DataAreaDescriptors = append(this.DataAreaDescriptors, _it)
		if  ((_it.Size != 0) && (_it.Offset != 0))  {
			break
		}
	}
	for i := 1;; i++ {
		tmp16 := NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp16
		this.MetadataAreaDescriptors = append(this.MetadataAreaDescriptors, _it)
		if  ((_it.Size != 0) && (_it.Offset != 0))  {
			break
		}
	}
	return err
}

/**
 * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
 */

/**
 * Physical Volume size. Value in bytes
 */

/**
 * The last descriptor in the list is terminator and consists of 0-byte values.
 */
type Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor struct {
	Offset uint64
	Size uint64
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label_VolumeHeader
	_f_data bool
	data string
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor() *Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label_VolumeHeader, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp17)
	tmp18, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp18)
	return err
}
func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor) Data() (v string, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	if (this.Size != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return "", err
		}
		_, err = this._io.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp19, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return "", err
		}
		tmp19 = tmp19
		this.data = string(tmp19)
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_data = true
	}
	this._f_data = true
	return this.data, nil
}

/**
 * The offset, in bytes, relative from the start of the physical volume
 */

/**
 * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
 */
type Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor struct {
	Offset uint64
	Size uint64
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label_VolumeHeader
	_raw_data []byte
	_f_data bool
	data *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor() *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label_VolumeHeader, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp20)
	tmp21, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp21)
	return err
}
func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor) Data() (v *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	if (this.Size != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp22, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp22 = tmp22
		this._raw_data = tmp22
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp23 := NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea()
		err = tmp23.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp23
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_data = true
	}
	this._f_data = true
	return this.data, nil
}

/**
 * The offset, in bytes, relative from the start of the physical volume
 */

/**
 * Value in bytes
 */

/**
 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
 */
type Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea struct {
	Header *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea() *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24 := NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader()
	err = tmp24.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp24
	return err
}
type Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader struct {
	Checksum *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
	Signature []byte
	Version uint32
	MetadataAreaOffset uint64
	MetadataAreaSize uint64
	RawLocationDescriptors []*Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor
	_io *kaitai.Stream
	_root *Lvm2
	_parent interface{}
	_f_metadata bool
	metadata []byte
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader() *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader) Read(io *kaitai.Stream, parent interface{}, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25 := NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader()
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Checksum = tmp25
	tmp26, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Signature = tmp26
	if !(bytes.Equal(this.Signature, []uint8{32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62})) {
		return kaitai.NewValidationNotEqualError([]uint8{32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62}, this.Signature, this._io, "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1")
	}
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp27)
	tmp28, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MetadataAreaOffset = uint64(tmp28)
	tmp29, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MetadataAreaSize = uint64(tmp29)
	for i := 1;; i++ {
		tmp30 := NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor()
		err = tmp30.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp30
		this.RawLocationDescriptors = append(this.RawLocationDescriptors, _it)
		if  ((_it.Offset != 0) && (_it.Size != 0) && (_it.Checksum != 0))  {
			break
		}
	}
	return err
}
func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader) Metadata() (v []byte, err error) {
	if (this._f_metadata) {
		return this.metadata, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.MetadataAreaOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp31, err := this._io.ReadBytes(int(this.MetadataAreaSize))
	if err != nil {
		return nil, err
	}
	tmp31 = tmp31
	this.metadata = tmp31
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_metadata = true
	this._f_metadata = true
	return this.metadata, nil
}

/**
 * CRC-32 for offset 4 to end of the metadata area header
 */

/**
 * The offset, in bytes, of the metadata area relative from the start of the physical volume
 */

/**
 * The last descriptor in the list is terminator and consists of 0-byte values.
 */

/**
 * The data area size can be 0. It is assumed it represents the remaining  available data.
 */

type Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags int
const (
	Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags__RawLocationIgnored Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags = 1
)
type Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor struct {
	Offset uint64
	Size uint64
	Checksum uint32
	Flags Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags
	_io *kaitai.Stream
	_root *Lvm2
	_parent *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
}
func NewLvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor() *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
	return &Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor{
	}
}

func (this *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor) Read(io *kaitai.Stream, parent *Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader, root *Lvm2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp32)
	tmp33, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags(tmp35)
	return err
}

/**
 * The data area offset, in bytes, relative from the start of the metadata area
 */

/**
 * data area size in bytes
 */

/**
 * CRC-32 of *TODO (metadata?)*
 */
