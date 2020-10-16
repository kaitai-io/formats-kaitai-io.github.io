// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * A native VirtualBox file format
 * Images for testing can be downloaded from
 *  * https://www.osboxes.org/virtualbox-images/
 *  * https://virtualboxes.org/images/
 *  * https://virtualboximages.com/
 * or you can convert images of other formats.
 * @see <a href="https://github.com/qemu/qemu/blob/master/block/vdi.c">Source</a>
 */

type Vdi_ImageType int
const (
	Vdi_ImageType__Dynamic Vdi_ImageType = 1
	Vdi_ImageType__Static Vdi_ImageType = 2
	Vdi_ImageType__Undo Vdi_ImageType = 3
	Vdi_ImageType__Diff Vdi_ImageType = 4
)
type Vdi struct {
	Header *Vdi_Header
	_io *kaitai.Stream
	_root *Vdi
	_parent interface{}
	_raw_blocksMap []byte
	_f_blockDiscarded bool
	blockDiscarded int
	_f_blockUnallocated bool
	blockUnallocated int
	_f_blocksMap bool
	blocksMap *Vdi_BlocksMap
	_f_disk bool
	disk *Vdi_Disk
}
func NewVdi() *Vdi {
	return &Vdi{
	}
}

func (this *Vdi) Read(io *kaitai.Stream, parent interface{}, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewVdi_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	return err
}
func (this *Vdi) BlockDiscarded() (v int, err error) {
	if (this._f_blockDiscarded) {
		return this.blockDiscarded, nil
	}
	this.blockDiscarded = int(uint32(4294967294))
	this._f_blockDiscarded = true
	return this.blockDiscarded, nil
}
func (this *Vdi) BlockUnallocated() (v int, err error) {
	if (this._f_blockUnallocated) {
		return this.blockUnallocated, nil
	}
	this.blockUnallocated = int(uint32(4294967295))
	this._f_blockUnallocated = true
	return this.blockUnallocated, nil
}

/**
 * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
 * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
 */
func (this *Vdi) BlocksMap() (v *Vdi_BlocksMap, err error) {
	if (this._f_blocksMap) {
		return this.blocksMap, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp2, err := this.Header.BlocksMapOffset()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp2), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp3, err := this.Header.BlocksMapSize()
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadBytes(int(tmp3))
	if err != nil {
		return nil, err
	}
	tmp4 = tmp4
	this._raw_blocksMap = tmp4
	_io__raw_blocksMap := kaitai.NewStream(bytes.NewReader(this._raw_blocksMap))
	tmp5 := NewVdi_BlocksMap()
	err = tmp5.Read(_io__raw_blocksMap, this, this._root)
	if err != nil {
		return nil, err
	}
	this.blocksMap = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_blocksMap = true
	this._f_blocksMap = true
	return this.blocksMap, nil
}
func (this *Vdi) Disk() (v *Vdi_Disk, err error) {
	if (this._f_disk) {
		return this.disk, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp6, err := this.Header.BlocksOffset()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp6), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7 := NewVdi_Disk()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.disk = tmp7
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_disk = true
	this._f_disk = true
	return this.disk, nil
}
type Vdi_Header struct {
	Text string
	Signature []byte
	Version *Vdi_Header_Version
	HeaderSizeOptional uint32
	HeaderMain *Vdi_Header_HeaderMain
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi
	_raw_HeaderMain []byte
	_f_headerSize bool
	headerSize int
	_f_blocksMapOffset bool
	blocksMapOffset uint32
	_f_subheaderSizeIsDynamic bool
	subheaderSizeIsDynamic bool
	_f_blocksOffset bool
	blocksOffset uint32
	_f_blockSize bool
	blockSize int
	_f_blocksMapSize bool
	blocksMapSize int
}
func NewVdi_Header() *Vdi_Header {
	return &Vdi_Header{
	}
}

func (this *Vdi_Header) Read(io *kaitai.Stream, parent *Vdi, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Text = string(tmp8)
	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Signature = tmp9
	if !(bytes.Equal(this.Signature, []uint8{127, 16, 218, 190})) {
		return kaitai.NewValidationNotEqualError([]uint8{127, 16, 218, 190}, this.Signature, this._io, "/types/header/seq/1")
	}
	tmp10 := NewVdi_Header_Version()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp10
	tmp11, err := this.SubheaderSizeIsDynamic()
	if err != nil {
		return err
	}
	if (tmp11) {
		tmp12, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.HeaderSizeOptional = uint32(tmp12)
	}
	tmp13, err := this.HeaderSize()
	if err != nil {
		return err
	}
	tmp14, err := this._io.ReadBytes(int(tmp13))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this._raw_HeaderMain = tmp14
	_io__raw_HeaderMain := kaitai.NewStream(bytes.NewReader(this._raw_HeaderMain))
	tmp15 := NewVdi_Header_HeaderMain()
	err = tmp15.Read(_io__raw_HeaderMain, this, this._root)
	if err != nil {
		return err
	}
	this.HeaderMain = tmp15
	return err
}
func (this *Vdi_Header) HeaderSize() (v int, err error) {
	if (this._f_headerSize) {
		return this.headerSize, nil
	}
	var tmp16 uint32;
	tmp17, err := this.SubheaderSizeIsDynamic()
	if err != nil {
		return 0, err
	}
	if (tmp17) {
		tmp16 = this.HeaderSizeOptional
	} else {
		tmp16 = 336
	}
	this.headerSize = int(tmp16)
	this._f_headerSize = true
	return this.headerSize, nil
}
func (this *Vdi_Header) BlocksMapOffset() (v uint32, err error) {
	if (this._f_blocksMapOffset) {
		return this.blocksMapOffset, nil
	}
	this.blocksMapOffset = uint32(this.HeaderMain.BlocksMapOffset)
	this._f_blocksMapOffset = true
	return this.blocksMapOffset, nil
}
func (this *Vdi_Header) SubheaderSizeIsDynamic() (v bool, err error) {
	if (this._f_subheaderSizeIsDynamic) {
		return this.subheaderSizeIsDynamic, nil
	}
	this.subheaderSizeIsDynamic = bool(this.Version.Major >= 1)
	this._f_subheaderSizeIsDynamic = true
	return this.subheaderSizeIsDynamic, nil
}
func (this *Vdi_Header) BlocksOffset() (v uint32, err error) {
	if (this._f_blocksOffset) {
		return this.blocksOffset, nil
	}
	this.blocksOffset = uint32(this.HeaderMain.OffsetData)
	this._f_blocksOffset = true
	return this.blocksOffset, nil
}
func (this *Vdi_Header) BlockSize() (v int, err error) {
	if (this._f_blockSize) {
		return this.blockSize, nil
	}
	this.blockSize = int((this.HeaderMain.BlockMetadataSize + this.HeaderMain.BlockDataSize))
	this._f_blockSize = true
	return this.blockSize, nil
}
func (this *Vdi_Header) BlocksMapSize() (v int, err error) {
	if (this._f_blocksMapSize) {
		return this.blocksMapSize, nil
	}
	this.blocksMapSize = int((((((this.HeaderMain.BlocksInImage * 4) + this.HeaderMain.Geometry.SectorSize) - 1) / this.HeaderMain.Geometry.SectorSize) * this.HeaderMain.Geometry.SectorSize))
	this._f_blocksMapSize = true
	return this.blocksMapSize, nil
}
type Vdi_Header_Uuid struct {
	Uuid []byte
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Header_HeaderMain
}
func NewVdi_Header_Uuid() *Vdi_Header_Uuid {
	return &Vdi_Header_Uuid{
	}
}

func (this *Vdi_Header_Uuid) Read(io *kaitai.Stream, parent *Vdi_Header_HeaderMain, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Uuid = tmp18
	return err
}
type Vdi_Header_Version struct {
	Major uint16
	Minor uint16
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Header
}
func NewVdi_Header_Version() *Vdi_Header_Version {
	return &Vdi_Header_Version{
	}
}

func (this *Vdi_Header_Version) Read(io *kaitai.Stream, parent *Vdi_Header, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Major = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Minor = uint16(tmp20)
	return err
}
type Vdi_Header_HeaderMain struct {
	ImageType Vdi_ImageType
	ImageFlags *Vdi_Header_HeaderMain_Flags
	Description string
	BlocksMapOffset uint32
	OffsetData uint32
	Geometry *Vdi_Header_HeaderMain_Geometry
	Reserved1 uint32
	DiskSize uint64
	BlockDataSize uint32
	BlockMetadataSize uint32
	BlocksInImage uint32
	BlocksAllocated uint32
	UuidImage *Vdi_Header_Uuid
	UuidLastSnap *Vdi_Header_Uuid
	UuidLink *Vdi_Header_Uuid
	UuidParent *Vdi_Header_Uuid
	LchcGeometry *Vdi_Header_HeaderMain_Geometry
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Header
}
func NewVdi_Header_HeaderMain() *Vdi_Header_HeaderMain {
	return &Vdi_Header_HeaderMain{
	}
}

func (this *Vdi_Header_HeaderMain) Read(io *kaitai.Stream, parent *Vdi_Header, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ImageType = Vdi_ImageType(tmp21)
	tmp22 := NewVdi_Header_HeaderMain_Flags()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageFlags = tmp22
	tmp23, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Description = string(tmp23)
	if (this._parent.Version.Major >= 1) {
		tmp24, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BlocksMapOffset = uint32(tmp24)
	}
	if (this._parent.Version.Major >= 1) {
		tmp25, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.OffsetData = uint32(tmp25)
	}
	tmp26 := NewVdi_Header_HeaderMain_Geometry()
	err = tmp26.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Geometry = tmp26
	if (this._parent.Version.Major >= 1) {
		tmp27, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Reserved1 = uint32(tmp27)
	}
	tmp28, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.DiskSize = uint64(tmp28)
	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlockDataSize = uint32(tmp29)
	if (this._parent.Version.Major >= 1) {
		tmp30, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BlockMetadataSize = uint32(tmp30)
	}
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlocksInImage = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlocksAllocated = uint32(tmp32)
	tmp33 := NewVdi_Header_Uuid()
	err = tmp33.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.UuidImage = tmp33
	tmp34 := NewVdi_Header_Uuid()
	err = tmp34.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.UuidLastSnap = tmp34
	tmp35 := NewVdi_Header_Uuid()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.UuidLink = tmp35
	if (this._parent.Version.Major >= 1) {
		tmp36 := NewVdi_Header_Uuid()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.UuidParent = tmp36
	}
	tmp37, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp38, err := this._io.Size()
	if err != nil {
		return err
	}
	if ( ((this._parent.Version.Major >= 1) && ((tmp37 + 16) <= tmp38)) ) {
		tmp39 := NewVdi_Header_HeaderMain_Geometry()
		err = tmp39.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.LchcGeometry = tmp39
	}
	return err
}

/**
 * Size of block (bytes).
 */
type Vdi_Header_HeaderMain_Geometry struct {
	Cylinders uint32
	Heads uint32
	Sectors uint32
	SectorSize uint32
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Header_HeaderMain
}
func NewVdi_Header_HeaderMain_Geometry() *Vdi_Header_HeaderMain_Geometry {
	return &Vdi_Header_HeaderMain_Geometry{
	}
}

func (this *Vdi_Header_HeaderMain_Geometry) Read(io *kaitai.Stream, parent *Vdi_Header_HeaderMain, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cylinders = uint32(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Heads = uint32(tmp41)
	tmp42, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sectors = uint32(tmp42)
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SectorSize = uint32(tmp43)
	return err
}
type Vdi_Header_HeaderMain_Flags struct {
	Reserved0 uint64
	ZeroExpand bool
	Reserved1 uint64
	Diff bool
	Fixed bool
	Reserved2 uint64
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Header_HeaderMain
}
func NewVdi_Header_HeaderMain_Flags() *Vdi_Header_HeaderMain_Flags {
	return &Vdi_Header_HeaderMain_Flags{
	}
}

func (this *Vdi_Header_HeaderMain_Flags) Read(io *kaitai.Stream, parent *Vdi_Header_HeaderMain, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadBitsIntBe(15)
	if err != nil {
		return err
	}
	this.Reserved0 = tmp44
	tmp45, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.ZeroExpand = tmp45 != 0
	tmp46, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp46
	tmp47, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Diff = tmp47 != 0
	tmp48, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Fixed = tmp48 != 0
	tmp49, err := this._io.ReadBitsIntBe(8)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp49
	return err
}
type Vdi_BlocksMap struct {
	Index []*Vdi_BlocksMap_BlockIndex
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi
}
func NewVdi_BlocksMap() *Vdi_BlocksMap {
	return &Vdi_BlocksMap{
	}
}

func (this *Vdi_BlocksMap) Read(io *kaitai.Stream, parent *Vdi, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Index = make([]*Vdi_BlocksMap_BlockIndex, this._root.Header.HeaderMain.BlocksInImage)
	for i := range this.Index {
		tmp50 := NewVdi_BlocksMap_BlockIndex()
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Index[i] = tmp50
	}
	return err
}
type Vdi_BlocksMap_BlockIndex struct {
	Index uint32
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_BlocksMap
	_f_isAllocated bool
	isAllocated bool
	_f_block bool
	block *Vdi_Disk_Block
}
func NewVdi_BlocksMap_BlockIndex() *Vdi_BlocksMap_BlockIndex {
	return &Vdi_BlocksMap_BlockIndex{
	}
}

func (this *Vdi_BlocksMap_BlockIndex) Read(io *kaitai.Stream, parent *Vdi_BlocksMap, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Index = uint32(tmp51)
	return err
}
func (this *Vdi_BlocksMap_BlockIndex) IsAllocated() (v bool, err error) {
	if (this._f_isAllocated) {
		return this.isAllocated, nil
	}
	tmp52, err := this._root.BlockDiscarded()
	if err != nil {
		return false, err
	}
	this.isAllocated = bool(this.Index < tmp52)
	this._f_isAllocated = true
	return this.isAllocated, nil
}
func (this *Vdi_BlocksMap_BlockIndex) Block() (v *Vdi_Disk_Block, err error) {
	if (this._f_block) {
		return this.block, nil
	}
	tmp53, err := this.IsAllocated()
	if err != nil {
		return nil, err
	}
	if (tmp53) {
		tmp54, err := this._root.Disk()
		if err != nil {
			return nil, err
		}
		this.block = tmp54.Blocks[this.Index]
	}
	this._f_block = true
	return this.block, nil
}
type Vdi_Disk struct {
	Blocks []*Vdi_Disk_Block
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi
}
func NewVdi_Disk() *Vdi_Disk {
	return &Vdi_Disk{
	}
}

func (this *Vdi_Disk) Read(io *kaitai.Stream, parent *Vdi, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Blocks = make([]*Vdi_Disk_Block, this._root.Header.HeaderMain.BlocksInImage)
	for i := range this.Blocks {
		tmp55 := NewVdi_Disk_Block()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Blocks[i] = tmp55
	}
	return err
}
type Vdi_Disk_Block struct {
	Metadata []byte
	Data []*Vdi_Disk_Block_Sector
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Disk
	_raw_Data [][]byte
}
func NewVdi_Disk_Block() *Vdi_Disk_Block {
	return &Vdi_Disk_Block{
	}
}

func (this *Vdi_Disk_Block) Read(io *kaitai.Stream, parent *Vdi_Disk, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp56, err := this._io.ReadBytes(int(this._root.Header.HeaderMain.BlockMetadataSize))
	if err != nil {
		return err
	}
	tmp56 = tmp56
	this.Metadata = tmp56
	this._raw_Data = make([][]byte, 0);
	for i := 1;; i++ {
		tmp57, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp57 {
			break
		}
		tmp58, err := this._io.ReadBytes(int(this._root.Header.HeaderMain.BlockDataSize))
		if err != nil {
			return err
		}
		tmp58 = tmp58
		this._raw_Data = append(this._raw_Data, tmp58)
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data[len(this._raw_Data) - 1]))
		tmp59 := NewVdi_Disk_Block_Sector()
		err = tmp59.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = append(this.Data, tmp59)
	}
	return err
}
type Vdi_Disk_Block_Sector struct {
	Data []byte
	_io *kaitai.Stream
	_root *Vdi
	_parent *Vdi_Disk_Block
}
func NewVdi_Disk_Block_Sector() *Vdi_Disk_Block_Sector {
	return &Vdi_Disk_Block_Sector{
	}
}

func (this *Vdi_Disk_Block_Sector) Read(io *kaitai.Stream, parent *Vdi_Disk_Block, root *Vdi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60, err := this._io.ReadBytes(int(this._root.Header.HeaderMain.Geometry.SectorSize))
	if err != nil {
		return err
	}
	tmp60 = tmp60
	this.Data = tmp60
	return err
}
