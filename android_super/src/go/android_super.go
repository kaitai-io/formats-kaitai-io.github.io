// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * The metadata stored by Android at the beginning of a "super" partition, which
 * is what it calls a disk partition that holds one or more Dynamic Partitions.
 * Dynamic Partitions do more or less the same thing that LVM does on Linux,
 * allowing Android to map ranges of non-contiguous extents to a single logical
 * device. This metadata holds that mapping.
 * @see <a href="https://source.android.com/devices/tech/ota/dynamic_partitions">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h">Source</a>
 */
type AndroidSuper struct {
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent interface{}
	_f_root bool
	root *AndroidSuper_Root
}
func NewAndroidSuper() *AndroidSuper {
	return &AndroidSuper{
	}
}

func (this *AndroidSuper) Read(io *kaitai.Stream, parent interface{}, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *AndroidSuper) Root() (v *AndroidSuper_Root, err error) {
	if (this._f_root) {
		return this.root, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(4096), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp1 := NewAndroidSuper_Root()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.root = tmp1
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_root = true
	this._f_root = true
	return this.root, nil
}
type AndroidSuper_Root struct {
	PrimaryGeometry *AndroidSuper_Geometry
	BackupGeometry *AndroidSuper_Geometry
	PrimaryMetadata []*AndroidSuper_Metadata
	BackupMetadata []*AndroidSuper_Metadata
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper
	_raw_PrimaryGeometry []byte
	_raw_BackupGeometry []byte
	_raw_PrimaryMetadata [][]byte
	_raw_BackupMetadata [][]byte
}
func NewAndroidSuper_Root() *AndroidSuper_Root {
	return &AndroidSuper_Root{
	}
}

func (this *AndroidSuper_Root) Read(io *kaitai.Stream, parent *AndroidSuper, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadBytes(int(4096))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_PrimaryGeometry = tmp2
	_io__raw_PrimaryGeometry := kaitai.NewStream(bytes.NewReader(this._raw_PrimaryGeometry))
	tmp3 := NewAndroidSuper_Geometry()
	err = tmp3.Read(_io__raw_PrimaryGeometry, this, this._root)
	if err != nil {
		return err
	}
	this.PrimaryGeometry = tmp3
	tmp4, err := this._io.ReadBytes(int(4096))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this._raw_BackupGeometry = tmp4
	_io__raw_BackupGeometry := kaitai.NewStream(bytes.NewReader(this._raw_BackupGeometry))
	tmp5 := NewAndroidSuper_Geometry()
	err = tmp5.Read(_io__raw_BackupGeometry, this, this._root)
	if err != nil {
		return err
	}
	this.BackupGeometry = tmp5
	this._raw_PrimaryMetadata = make([][]byte, this.PrimaryGeometry.MetadataSlotCount)
	this.PrimaryMetadata = make([]*AndroidSuper_Metadata, this.PrimaryGeometry.MetadataSlotCount)
	for i := range this.PrimaryMetadata {
		tmp6, err := this._io.ReadBytes(int(this.PrimaryGeometry.MetadataMaxSize))
		if err != nil {
			return err
		}
		tmp6 = tmp6
		this._raw_PrimaryMetadata[i] = tmp6
		_io__raw_PrimaryMetadata := kaitai.NewStream(bytes.NewReader(this._raw_PrimaryMetadata[i]))
		tmp7 := NewAndroidSuper_Metadata()
		err = tmp7.Read(_io__raw_PrimaryMetadata, this, this._root)
		if err != nil {
			return err
		}
		this.PrimaryMetadata[i] = tmp7
	}
	this._raw_BackupMetadata = make([][]byte, this.PrimaryGeometry.MetadataSlotCount)
	this.BackupMetadata = make([]*AndroidSuper_Metadata, this.PrimaryGeometry.MetadataSlotCount)
	for i := range this.BackupMetadata {
		tmp8, err := this._io.ReadBytes(int(this.PrimaryGeometry.MetadataMaxSize))
		if err != nil {
			return err
		}
		tmp8 = tmp8
		this._raw_BackupMetadata[i] = tmp8
		_io__raw_BackupMetadata := kaitai.NewStream(bytes.NewReader(this._raw_BackupMetadata[i]))
		tmp9 := NewAndroidSuper_Metadata()
		err = tmp9.Read(_io__raw_BackupMetadata, this, this._root)
		if err != nil {
			return err
		}
		this.BackupMetadata[i] = tmp9
	}
	return err
}
type AndroidSuper_Geometry struct {
	Magic []byte
	StructSize uint32
	Checksum []byte
	MetadataMaxSize uint32
	MetadataSlotCount uint32
	LogicalBlockSize uint32
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Root
}
func NewAndroidSuper_Geometry() *AndroidSuper_Geometry {
	return &AndroidSuper_Geometry{
	}
}

func (this *AndroidSuper_Geometry) Read(io *kaitai.Stream, parent *AndroidSuper_Root, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Magic = tmp10
	if !(bytes.Equal(this.Magic, []uint8{103, 68, 108, 97})) {
		return kaitai.NewValidationNotEqualError([]uint8{103, 68, 108, 97}, this.Magic, this._io, "/types/geometry/seq/0")
	}
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StructSize = uint32(tmp11)
	tmp12, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Checksum = tmp12
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MetadataMaxSize = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MetadataSlotCount = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LogicalBlockSize = uint32(tmp15)
	return err
}

/**
 * SHA-256 hash of struct_size bytes from beginning of geometry,
 * calculated as if checksum were zeroed out
 */

type AndroidSuper_Metadata_TableKind int
const (
	AndroidSuper_Metadata_TableKind__Partitions AndroidSuper_Metadata_TableKind = 0
	AndroidSuper_Metadata_TableKind__Extents AndroidSuper_Metadata_TableKind = 1
	AndroidSuper_Metadata_TableKind__Groups AndroidSuper_Metadata_TableKind = 2
	AndroidSuper_Metadata_TableKind__BlockDevices AndroidSuper_Metadata_TableKind = 3
)
type AndroidSuper_Metadata struct {
	Magic []byte
	MajorVersion uint16
	MinorVersion uint16
	HeaderSize uint32
	HeaderChecksum []byte
	TablesSize uint32
	TablesChecksum []byte
	Partitions *AndroidSuper_Metadata_TableDescriptor
	Extents *AndroidSuper_Metadata_TableDescriptor
	Groups *AndroidSuper_Metadata_TableDescriptor
	BlockDevices *AndroidSuper_Metadata_TableDescriptor
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Root
}
func NewAndroidSuper_Metadata() *AndroidSuper_Metadata {
	return &AndroidSuper_Metadata{
	}
}

func (this *AndroidSuper_Metadata) Read(io *kaitai.Stream, parent *AndroidSuper_Root, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Magic = tmp16
	if !(bytes.Equal(this.Magic, []uint8{48, 80, 76, 65})) {
		return kaitai.NewValidationNotEqualError([]uint8{48, 80, 76, 65}, this.Magic, this._io, "/types/metadata/seq/0")
	}
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MajorVersion = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinorVersion = uint16(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp19)
	tmp20, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.HeaderChecksum = tmp20
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TablesSize = uint32(tmp21)
	tmp22, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.TablesChecksum = tmp22
	tmp23 := NewAndroidSuper_Metadata_TableDescriptor(AndroidSuper_Metadata_TableKind__Partitions)
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Partitions = tmp23
	tmp24 := NewAndroidSuper_Metadata_TableDescriptor(AndroidSuper_Metadata_TableKind__Extents)
	err = tmp24.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Extents = tmp24
	tmp25 := NewAndroidSuper_Metadata_TableDescriptor(AndroidSuper_Metadata_TableKind__Groups)
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Groups = tmp25
	tmp26 := NewAndroidSuper_Metadata_TableDescriptor(AndroidSuper_Metadata_TableKind__BlockDevices)
	err = tmp26.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BlockDevices = tmp26
	return err
}

/**
 * SHA-256 hash of header_size bytes from beginning of metadata,
 * calculated as if header_checksum were zeroed out
 */

/**
 * SHA-256 hash of tables_size bytes from end of header
 */
type AndroidSuper_Metadata_BlockDevice struct {
	FirstLogicalSector uint64
	Alignment uint32
	AlignmentOffset uint32
	Size uint64
	PartitionName string
	FlagSlotSuffixed bool
	FlagsReserved uint64
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Metadata_TableDescriptor
}
func NewAndroidSuper_Metadata_BlockDevice() *AndroidSuper_Metadata_BlockDevice {
	return &AndroidSuper_Metadata_BlockDevice{
	}
}

func (this *AndroidSuper_Metadata_BlockDevice) Read(io *kaitai.Stream, parent *AndroidSuper_Metadata_TableDescriptor, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.FirstLogicalSector = uint64(tmp27)
	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Alignment = uint32(tmp28)
	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AlignmentOffset = uint32(tmp29)
	tmp30, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp30)
	tmp31, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp31 = kaitai.BytesTerminate(tmp31, 0, false)
	this.PartitionName = string(tmp31)
	tmp32, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.FlagSlotSuffixed = tmp32 != 0
	tmp33, err := this._io.ReadBitsIntLe(31)
	if err != nil {
		return err
	}
	this.FlagsReserved = tmp33
	return err
}

type AndroidSuper_Metadata_Extent_TargetType int
const (
	AndroidSuper_Metadata_Extent_TargetType__Linear AndroidSuper_Metadata_Extent_TargetType = 0
	AndroidSuper_Metadata_Extent_TargetType__Zero AndroidSuper_Metadata_Extent_TargetType = 1
)
type AndroidSuper_Metadata_Extent struct {
	NumSectors uint64
	TargetType AndroidSuper_Metadata_Extent_TargetType
	TargetData uint64
	TargetSource uint32
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Metadata_TableDescriptor
}
func NewAndroidSuper_Metadata_Extent() *AndroidSuper_Metadata_Extent {
	return &AndroidSuper_Metadata_Extent{
	}
}

func (this *AndroidSuper_Metadata_Extent) Read(io *kaitai.Stream, parent *AndroidSuper_Metadata_TableDescriptor, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.NumSectors = uint64(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TargetType = AndroidSuper_Metadata_Extent_TargetType(tmp35)
	tmp36, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TargetData = uint64(tmp36)
	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TargetSource = uint32(tmp37)
	return err
}
type AndroidSuper_Metadata_TableDescriptor struct {
	Offset uint32
	NumEntries uint32
	EntrySize uint32
	Kind AndroidSuper_Metadata_TableKind
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Metadata
	_raw_table [][]byte
	_f_table bool
	table []interface{}
}
func NewAndroidSuper_Metadata_TableDescriptor(kind AndroidSuper_Metadata_TableKind) *AndroidSuper_Metadata_TableDescriptor {
	return &AndroidSuper_Metadata_TableDescriptor{
		Kind: kind,
	}
}

func (this *AndroidSuper_Metadata_TableDescriptor) Read(io *kaitai.Stream, parent *AndroidSuper_Metadata, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp38)
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumEntries = uint32(tmp39)
	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EntrySize = uint32(tmp40)
	return err
}
func (this *AndroidSuper_Metadata_TableDescriptor) Table() (v []interface{}, err error) {
	if (this._f_table) {
		return this.table, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this._parent.HeaderSize + this.Offset)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._raw_table = make([][]byte, this.NumEntries)
	this.table = make([]interface{}, this.NumEntries)
	for i := range this.table {
		switch (this.Kind) {
		case AndroidSuper_Metadata_TableKind__Partitions:
			tmp41, err := this._io.ReadBytes(int(this.EntrySize))
			if err != nil {
				return nil, err
			}
			tmp41 = tmp41
			this._raw_table[i] = tmp41
			_io__raw_table := kaitai.NewStream(bytes.NewReader(this._raw_table[i]))
			tmp42 := NewAndroidSuper_Metadata_Partition()
			err = tmp42.Read(_io__raw_table, this, this._root)
			if err != nil {
				return nil, err
			}
			this.table[i] = tmp42
		case AndroidSuper_Metadata_TableKind__Extents:
			tmp43, err := this._io.ReadBytes(int(this.EntrySize))
			if err != nil {
				return nil, err
			}
			tmp43 = tmp43
			this._raw_table[i] = tmp43
			_io__raw_table := kaitai.NewStream(bytes.NewReader(this._raw_table[i]))
			tmp44 := NewAndroidSuper_Metadata_Extent()
			err = tmp44.Read(_io__raw_table, this, this._root)
			if err != nil {
				return nil, err
			}
			this.table[i] = tmp44
		case AndroidSuper_Metadata_TableKind__Groups:
			tmp45, err := this._io.ReadBytes(int(this.EntrySize))
			if err != nil {
				return nil, err
			}
			tmp45 = tmp45
			this._raw_table[i] = tmp45
			_io__raw_table := kaitai.NewStream(bytes.NewReader(this._raw_table[i]))
			tmp46 := NewAndroidSuper_Metadata_Group()
			err = tmp46.Read(_io__raw_table, this, this._root)
			if err != nil {
				return nil, err
			}
			this.table[i] = tmp46
		case AndroidSuper_Metadata_TableKind__BlockDevices:
			tmp47, err := this._io.ReadBytes(int(this.EntrySize))
			if err != nil {
				return nil, err
			}
			tmp47 = tmp47
			this._raw_table[i] = tmp47
			_io__raw_table := kaitai.NewStream(bytes.NewReader(this._raw_table[i]))
			tmp48 := NewAndroidSuper_Metadata_BlockDevice()
			err = tmp48.Read(_io__raw_table, this, this._root)
			if err != nil {
				return nil, err
			}
			this.table[i] = tmp48
		default:
			tmp49, err := this._io.ReadBytes(int(this.EntrySize))
			if err != nil {
				return nil, err
			}
			tmp49 = tmp49
			this._raw_table[i] = tmp49
		}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_table = true
	this._f_table = true
	return this.table, nil
}
type AndroidSuper_Metadata_Partition struct {
	Name string
	AttrReadonly bool
	AttrSlotSuffixed bool
	AttrUpdated bool
	AttrDisabled bool
	AttrsReserved uint64
	FirstExtentIndex uint32
	NumExtents uint32
	GroupIndex uint32
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Metadata_TableDescriptor
}
func NewAndroidSuper_Metadata_Partition() *AndroidSuper_Metadata_Partition {
	return &AndroidSuper_Metadata_Partition{
	}
}

func (this *AndroidSuper_Metadata_Partition) Read(io *kaitai.Stream, parent *AndroidSuper_Metadata_TableDescriptor, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp50 = kaitai.BytesTerminate(tmp50, 0, false)
	this.Name = string(tmp50)
	tmp51, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.AttrReadonly = tmp51 != 0
	tmp52, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.AttrSlotSuffixed = tmp52 != 0
	tmp53, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.AttrUpdated = tmp53 != 0
	tmp54, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.AttrDisabled = tmp54 != 0
	tmp55, err := this._io.ReadBitsIntLe(28)
	if err != nil {
		return err
	}
	this.AttrsReserved = tmp55
	this._io.AlignToByte()
	tmp56, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FirstExtentIndex = uint32(tmp56)
	tmp57, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumExtents = uint32(tmp57)
	tmp58, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.GroupIndex = uint32(tmp58)
	return err
}
type AndroidSuper_Metadata_Group struct {
	Name string
	FlagSlotSuffixed bool
	FlagsReserved uint64
	MaximumSize uint64
	_io *kaitai.Stream
	_root *AndroidSuper
	_parent *AndroidSuper_Metadata_TableDescriptor
}
func NewAndroidSuper_Metadata_Group() *AndroidSuper_Metadata_Group {
	return &AndroidSuper_Metadata_Group{
	}
}

func (this *AndroidSuper_Metadata_Group) Read(io *kaitai.Stream, parent *AndroidSuper_Metadata_TableDescriptor, root *AndroidSuper) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp59 = kaitai.BytesTerminate(tmp59, 0, false)
	this.Name = string(tmp59)
	tmp60, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.FlagSlotSuffixed = tmp60 != 0
	tmp61, err := this._io.ReadBitsIntLe(31)
	if err != nil {
		return err
	}
	this.FlagsReserved = tmp61
	this._io.AlignToByte()
	tmp62, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MaximumSize = uint64(tmp62)
	return err
}
