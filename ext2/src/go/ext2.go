// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)

type Ext2 struct {
	_io *kaitai.Stream
	_root *Ext2
	_parent interface{}
	_f_bg1 bool
	bg1 *Ext2_BlockGroup
	_f_rootDir bool
	rootDir *Ext2_Dir
}
func NewExt2() *Ext2 {
	return &Ext2{
	}
}

func (this *Ext2) Read(io *kaitai.Stream, parent interface{}, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Ext2) Bg1() (v *Ext2_BlockGroup, err error) {
	if (this._f_bg1) {
		return this.bg1, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(1024), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp1 := NewExt2_BlockGroup()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.bg1 = tmp1
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_bg1 = true
	this._f_bg1 = true
	return this.bg1, nil
}
func (this *Ext2) RootDir() (v *Ext2_Dir, err error) {
	if (this._f_rootDir) {
		return this.rootDir, nil
	}
	tmp2, err := this.Bg1()
	if err != nil {
		return nil, err
	}
	tmp3, err := tmp2.BlockGroups[0].Inodes()
	if err != nil {
		return nil, err
	}
	tmp4, err := tmp3[1].AsDir()
	if err != nil {
		return nil, err
	}
	this.rootDir = tmp4
	this._f_rootDir = true
	return this.rootDir, nil
}

type Ext2_SuperBlockStruct_StateEnum int
const (
	Ext2_SuperBlockStruct_StateEnum__ValidFs Ext2_SuperBlockStruct_StateEnum = 1
	Ext2_SuperBlockStruct_StateEnum__ErrorFs Ext2_SuperBlockStruct_StateEnum = 2
)

type Ext2_SuperBlockStruct_ErrorsEnum int
const (
	Ext2_SuperBlockStruct_ErrorsEnum__ActContinue Ext2_SuperBlockStruct_ErrorsEnum = 1
	Ext2_SuperBlockStruct_ErrorsEnum__ActRo Ext2_SuperBlockStruct_ErrorsEnum = 2
	Ext2_SuperBlockStruct_ErrorsEnum__ActPanic Ext2_SuperBlockStruct_ErrorsEnum = 3
)
type Ext2_SuperBlockStruct struct {
	InodesCount uint32
	BlocksCount uint32
	RBlocksCount uint32
	FreeBlocksCount uint32
	FreeInodesCount uint32
	FirstDataBlock uint32
	LogBlockSize uint32
	LogFragSize uint32
	BlocksPerGroup uint32
	FragsPerGroup uint32
	InodesPerGroup uint32
	Mtime uint32
	Wtime uint32
	MntCount uint16
	MaxMntCount uint16
	Magic []byte
	State Ext2_SuperBlockStruct_StateEnum
	Errors Ext2_SuperBlockStruct_ErrorsEnum
	MinorRevLevel uint16
	Lastcheck uint32
	Checkinterval uint32
	CreatorOs uint32
	RevLevel uint32
	DefResuid uint16
	DefResgid uint16
	FirstIno uint32
	InodeSize uint16
	BlockGroupNr uint16
	FeatureCompat uint32
	FeatureIncompat uint32
	FeatureRoCompat uint32
	Uuid []byte
	VolumeName []byte
	LastMounted []byte
	AlgoBitmap uint32
	PreallocBlocks uint8
	PreallocDirBlocks uint8
	Padding1 []byte
	JournalUuid []byte
	JournalInum uint32
	JournalDev uint32
	LastOrphan uint32
	HashSeed []uint32
	DefHashVersion uint8
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_BlockGroup
	_f_blockSize bool
	blockSize int
	_f_blockGroupCount bool
	blockGroupCount int
}
func NewExt2_SuperBlockStruct() *Ext2_SuperBlockStruct {
	return &Ext2_SuperBlockStruct{
	}
}

func (this *Ext2_SuperBlockStruct) Read(io *kaitai.Stream, parent *Ext2_BlockGroup, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InodesCount = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlocksCount = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RBlocksCount = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FreeBlocksCount = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FreeInodesCount = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FirstDataBlock = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LogBlockSize = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LogFragSize = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlocksPerGroup = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FragsPerGroup = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InodesPerGroup = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Mtime = uint32(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Wtime = uint32(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MntCount = uint16(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxMntCount = uint16(tmp19)
	tmp20, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Magic = tmp20
	if !(bytes.Equal(this.Magic, []uint8{83, 239})) {
		return kaitai.NewValidationNotEqualError([]uint8{83, 239}, this.Magic, this._io, "/types/super_block_struct/seq/15")
	}
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.State = Ext2_SuperBlockStruct_StateEnum(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Errors = Ext2_SuperBlockStruct_ErrorsEnum(tmp22)
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinorRevLevel = uint16(tmp23)
	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Lastcheck = uint32(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checkinterval = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CreatorOs = uint32(tmp26)
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RevLevel = uint32(tmp27)
	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DefResuid = uint16(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DefResgid = uint16(tmp29)
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FirstIno = uint32(tmp30)
	tmp31, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.InodeSize = uint16(tmp31)
	tmp32, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BlockGroupNr = uint16(tmp32)
	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FeatureCompat = uint32(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FeatureIncompat = uint32(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FeatureRoCompat = uint32(tmp35)
	tmp36, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Uuid = tmp36
	tmp37, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp37 = tmp37
	this.VolumeName = tmp37
	tmp38, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.LastMounted = tmp38
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AlgoBitmap = uint32(tmp39)
	tmp40, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PreallocBlocks = tmp40
	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PreallocDirBlocks = tmp41
	tmp42, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this.Padding1 = tmp42
	tmp43, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.JournalUuid = tmp43
	tmp44, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.JournalInum = uint32(tmp44)
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.JournalDev = uint32(tmp45)
	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LastOrphan = uint32(tmp46)
	this.HashSeed = make([]uint32, 4)
	for i := range this.HashSeed {
		tmp47, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.HashSeed[i] = tmp47
	}
	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DefHashVersion = tmp48
	return err
}
func (this *Ext2_SuperBlockStruct) BlockSize() (v int, err error) {
	if (this._f_blockSize) {
		return this.blockSize, nil
	}
	this.blockSize = int((1024 << this.LogBlockSize))
	this._f_blockSize = true
	return this.blockSize, nil
}
func (this *Ext2_SuperBlockStruct) BlockGroupCount() (v int, err error) {
	if (this._f_blockGroupCount) {
		return this.blockGroupCount, nil
	}
	this.blockGroupCount = int((this.BlocksCount / this.BlocksPerGroup))
	this._f_blockGroupCount = true
	return this.blockGroupCount, nil
}

type Ext2_DirEntry_FileTypeEnum int
const (
	Ext2_DirEntry_FileTypeEnum__Unknown Ext2_DirEntry_FileTypeEnum = 0
	Ext2_DirEntry_FileTypeEnum__RegFile Ext2_DirEntry_FileTypeEnum = 1
	Ext2_DirEntry_FileTypeEnum__Dir Ext2_DirEntry_FileTypeEnum = 2
	Ext2_DirEntry_FileTypeEnum__Chrdev Ext2_DirEntry_FileTypeEnum = 3
	Ext2_DirEntry_FileTypeEnum__Blkdev Ext2_DirEntry_FileTypeEnum = 4
	Ext2_DirEntry_FileTypeEnum__Fifo Ext2_DirEntry_FileTypeEnum = 5
	Ext2_DirEntry_FileTypeEnum__Sock Ext2_DirEntry_FileTypeEnum = 6
	Ext2_DirEntry_FileTypeEnum__Symlink Ext2_DirEntry_FileTypeEnum = 7
)
type Ext2_DirEntry struct {
	InodePtr uint32
	RecLen uint16
	NameLen uint8
	FileType Ext2_DirEntry_FileTypeEnum
	Name string
	Padding []byte
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_Dir
	_f_inode bool
	inode *Ext2_Inode
}
func NewExt2_DirEntry() *Ext2_DirEntry {
	return &Ext2_DirEntry{
	}
}

func (this *Ext2_DirEntry) Read(io *kaitai.Stream, parent *Ext2_Dir, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InodePtr = uint32(tmp49)
	tmp50, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.RecLen = uint16(tmp50)
	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NameLen = tmp51
	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FileType = Ext2_DirEntry_FileTypeEnum(tmp52)
	tmp53, err := this._io.ReadBytes(int(this.NameLen))
	if err != nil {
		return err
	}
	tmp53 = tmp53
	this.Name = string(tmp53)
	tmp54, err := this._io.ReadBytes(int(((this.RecLen - this.NameLen) - 8)))
	if err != nil {
		return err
	}
	tmp54 = tmp54
	this.Padding = tmp54
	return err
}
func (this *Ext2_DirEntry) Inode() (v *Ext2_Inode, err error) {
	if (this._f_inode) {
		return this.inode, nil
	}
	tmp55, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp56, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp57, err := tmp55.BlockGroups[((this.InodePtr - 1) / tmp56.SuperBlock.InodesPerGroup)].Inodes()
	if err != nil {
		return nil, err
	}
	tmp59, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp58 := (this.InodePtr - 1) % tmp59.SuperBlock.InodesPerGroup
	if tmp58 < 0 {
		tmp60, err := this._root.Bg1()
		if err != nil {
			return nil, err
		}
		tmp58 += tmp60.SuperBlock.InodesPerGroup
	}
	this.inode = tmp57[tmp58]
	this._f_inode = true
	return this.inode, nil
}
type Ext2_Inode struct {
	Mode uint16
	Uid uint16
	Size uint32
	Atime uint32
	Ctime uint32
	Mtime uint32
	Dtime uint32
	Gid uint16
	LinksCount uint16
	Blocks uint32
	Flags uint32
	Osd1 uint32
	Block []*Ext2_BlockPtr
	Generation uint32
	FileAcl uint32
	DirAcl uint32
	Faddr uint32
	Osd2 []byte
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_Bgd
	_f_asDir bool
	asDir *Ext2_Dir
}
func NewExt2_Inode() *Ext2_Inode {
	return &Ext2_Inode{
	}
}

func (this *Ext2_Inode) Read(io *kaitai.Stream, parent *Ext2_Bgd, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp61, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Mode = uint16(tmp61)
	tmp62, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Uid = uint16(tmp62)
	tmp63, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp63)
	tmp64, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Atime = uint32(tmp64)
	tmp65, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ctime = uint32(tmp65)
	tmp66, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Mtime = uint32(tmp66)
	tmp67, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Dtime = uint32(tmp67)
	tmp68, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Gid = uint16(tmp68)
	tmp69, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LinksCount = uint16(tmp69)
	tmp70, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Blocks = uint32(tmp70)
	tmp71, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp71)
	tmp72, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Osd1 = uint32(tmp72)
	this.Block = make([]*Ext2_BlockPtr, 15)
	for i := range this.Block {
		tmp73 := NewExt2_BlockPtr()
		err = tmp73.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Block[i] = tmp73
	}
	tmp74, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Generation = uint32(tmp74)
	tmp75, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileAcl = uint32(tmp75)
	tmp76, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DirAcl = uint32(tmp76)
	tmp77, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Faddr = uint32(tmp77)
	tmp78, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp78 = tmp78
	this.Osd2 = tmp78
	return err
}
func (this *Ext2_Inode) AsDir() (v *Ext2_Dir, err error) {
	if (this._f_asDir) {
		return this.asDir, nil
	}
	tmp79, err := this.Block[0].Body()
	if err != nil {
		return nil, err
	}
	thisIo := tmp79._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp80 := NewExt2_Dir()
	err = tmp80.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.asDir = tmp80
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_asDir = true
	this._f_asDir = true
	return this.asDir, nil
}
type Ext2_BlockPtr struct {
	Ptr uint32
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_Inode
	_raw_body []byte
	_f_body bool
	body *Ext2_RawBlock
}
func NewExt2_BlockPtr() *Ext2_BlockPtr {
	return &Ext2_BlockPtr{
	}
}

func (this *Ext2_BlockPtr) Read(io *kaitai.Stream, parent *Ext2_Inode, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp81, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ptr = uint32(tmp81)
	return err
}
func (this *Ext2_BlockPtr) Body() (v *Ext2_RawBlock, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp82, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp83, err := tmp82.SuperBlock.BlockSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.Ptr * tmp83)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp84, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp85, err := tmp84.SuperBlock.BlockSize()
	if err != nil {
		return nil, err
	}
	tmp86, err := this._io.ReadBytes(int(tmp85))
	if err != nil {
		return nil, err
	}
	tmp86 = tmp86
	this._raw_body = tmp86
	_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
	tmp87 := NewExt2_RawBlock()
	err = tmp87.Read(_io__raw_body, this, this._root)
	if err != nil {
		return nil, err
	}
	this.body = tmp87
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type Ext2_Dir struct {
	Entries []*Ext2_DirEntry
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_Inode
}
func NewExt2_Dir() *Ext2_Dir {
	return &Ext2_Dir{
	}
}

func (this *Ext2_Dir) Read(io *kaitai.Stream, parent *Ext2_Inode, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp88, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp88 {
			break
		}
		tmp89 := NewExt2_DirEntry()
		err = tmp89.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp89)
	}
	return err
}
type Ext2_BlockGroup struct {
	SuperBlock *Ext2_SuperBlockStruct
	BlockGroups []*Ext2_Bgd
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2
	_raw_SuperBlock []byte
}
func NewExt2_BlockGroup() *Ext2_BlockGroup {
	return &Ext2_BlockGroup{
	}
}

func (this *Ext2_BlockGroup) Read(io *kaitai.Stream, parent *Ext2, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp90, err := this._io.ReadBytes(int(1024))
	if err != nil {
		return err
	}
	tmp90 = tmp90
	this._raw_SuperBlock = tmp90
	_io__raw_SuperBlock := kaitai.NewStream(bytes.NewReader(this._raw_SuperBlock))
	tmp91 := NewExt2_SuperBlockStruct()
	err = tmp91.Read(_io__raw_SuperBlock, this, this._root)
	if err != nil {
		return err
	}
	this.SuperBlock = tmp91
	tmp92, err := this.SuperBlock.BlockGroupCount()
	if err != nil {
		return err
	}
	this.BlockGroups = make([]*Ext2_Bgd, tmp92)
	for i := range this.BlockGroups {
		tmp93 := NewExt2_Bgd()
		err = tmp93.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.BlockGroups[i] = tmp93
	}
	return err
}
type Ext2_Bgd struct {
	BlockBitmapBlock uint32
	InodeBitmapBlock uint32
	InodeTableBlock uint32
	FreeBlocksCount uint16
	FreeInodesCount uint16
	UsedDirsCount uint16
	PadReserved []byte
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_BlockGroup
	_f_blockBitmap bool
	blockBitmap []byte
	_f_inodeBitmap bool
	inodeBitmap []byte
	_f_inodes bool
	inodes []*Ext2_Inode
}
func NewExt2_Bgd() *Ext2_Bgd {
	return &Ext2_Bgd{
	}
}

func (this *Ext2_Bgd) Read(io *kaitai.Stream, parent *Ext2_BlockGroup, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp94, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlockBitmapBlock = uint32(tmp94)
	tmp95, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InodeBitmapBlock = uint32(tmp95)
	tmp96, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InodeTableBlock = uint32(tmp96)
	tmp97, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FreeBlocksCount = uint16(tmp97)
	tmp98, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FreeInodesCount = uint16(tmp98)
	tmp99, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.UsedDirsCount = uint16(tmp99)
	tmp100, err := this._io.ReadBytes(int((2 + 12)))
	if err != nil {
		return err
	}
	tmp100 = tmp100
	this.PadReserved = tmp100
	return err
}
func (this *Ext2_Bgd) BlockBitmap() (v []byte, err error) {
	if (this._f_blockBitmap) {
		return this.blockBitmap, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp101, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp102, err := tmp101.SuperBlock.BlockSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.BlockBitmapBlock * tmp102)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp103, err := this._io.ReadBytes(int(1024))
	if err != nil {
		return nil, err
	}
	tmp103 = tmp103
	this.blockBitmap = tmp103
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_blockBitmap = true
	this._f_blockBitmap = true
	return this.blockBitmap, nil
}
func (this *Ext2_Bgd) InodeBitmap() (v []byte, err error) {
	if (this._f_inodeBitmap) {
		return this.inodeBitmap, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp104, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp105, err := tmp104.SuperBlock.BlockSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.InodeBitmapBlock * tmp105)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp106, err := this._io.ReadBytes(int(1024))
	if err != nil {
		return nil, err
	}
	tmp106 = tmp106
	this.inodeBitmap = tmp106
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_inodeBitmap = true
	this._f_inodeBitmap = true
	return this.inodeBitmap, nil
}
func (this *Ext2_Bgd) Inodes() (v []*Ext2_Inode, err error) {
	if (this._f_inodes) {
		return this.inodes, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp107, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	tmp108, err := tmp107.SuperBlock.BlockSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.InodeTableBlock * tmp108)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp109, err := this._root.Bg1()
	if err != nil {
		return nil, err
	}
	this.inodes = make([]*Ext2_Inode, tmp109.SuperBlock.InodesPerGroup)
	for i := range this.inodes {
		tmp110 := NewExt2_Inode()
		err = tmp110.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.inodes[i] = tmp110
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_inodes = true
	this._f_inodes = true
	return this.inodes, nil
}
type Ext2_RawBlock struct {
	Body []byte
	_io *kaitai.Stream
	_root *Ext2
	_parent *Ext2_BlockPtr
}
func NewExt2_RawBlock() *Ext2_RawBlock {
	return &Ext2_RawBlock{
	}
}

func (this *Ext2_RawBlock) Read(io *kaitai.Stream, parent *Ext2_BlockPtr, root *Ext2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp111, err := this._root.Bg1()
	if err != nil {
		return err
	}
	tmp112, err := tmp111.SuperBlock.BlockSize()
	if err != nil {
		return err
	}
	tmp113, err := this._io.ReadBytes(int(tmp112))
	if err != nil {
		return err
	}
	tmp113 = tmp113
	this.Body = tmp113
	return err
}
