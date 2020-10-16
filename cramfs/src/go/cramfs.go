// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)

type Cramfs struct {
	SuperBlock *Cramfs_SuperBlockStruct
	_io *kaitai.Stream
	_root *Cramfs
	_parent interface{}
	_f_pageSize bool
	pageSize int
}
func NewCramfs() *Cramfs {
	return &Cramfs{
	}
}

func (this *Cramfs) Read(io *kaitai.Stream, parent interface{}, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewCramfs_SuperBlockStruct()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SuperBlock = tmp1
	return err
}
func (this *Cramfs) PageSize() (v int, err error) {
	if (this._f_pageSize) {
		return this.pageSize, nil
	}
	this.pageSize = int(4096)
	this._f_pageSize = true
	return this.pageSize, nil
}
type Cramfs_SuperBlockStruct struct {
	Magic []byte
	Size uint32
	Flags uint32
	Future uint32
	Signature []byte
	Fsid *Cramfs_Info
	Name string
	Root *Cramfs_Inode
	_io *kaitai.Stream
	_root *Cramfs
	_parent *Cramfs
	_f_flagFsidV2 bool
	flagFsidV2 int
	_f_flagHoles bool
	flagHoles int
	_f_flagWrongSignature bool
	flagWrongSignature int
	_f_flagSortedDirs bool
	flagSortedDirs int
	_f_flagShiftedRootOffset bool
	flagShiftedRootOffset int
}
func NewCramfs_SuperBlockStruct() *Cramfs_SuperBlockStruct {
	return &Cramfs_SuperBlockStruct{
	}
}

func (this *Cramfs_SuperBlockStruct) Read(io *kaitai.Stream, parent *Cramfs, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Magic = tmp2
	if !(bytes.Equal(this.Magic, []uint8{69, 61, 205, 40})) {
		return kaitai.NewValidationNotEqualError([]uint8{69, 61, 205, 40}, this.Magic, this._io, "/types/super_block_struct/seq/0")
	}
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Future = uint32(tmp5)
	tmp6, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Signature = tmp6
	if !(bytes.Equal(this.Signature, []uint8{67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83})) {
		return kaitai.NewValidationNotEqualError([]uint8{67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83}, this.Signature, this._io, "/types/super_block_struct/seq/4")
	}
	tmp7 := NewCramfs_Info()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Fsid = tmp7
	tmp8, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Name = string(tmp8)
	tmp9 := NewCramfs_Inode()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Root = tmp9
	return err
}
func (this *Cramfs_SuperBlockStruct) FlagFsidV2() (v int, err error) {
	if (this._f_flagFsidV2) {
		return this.flagFsidV2, nil
	}
	this.flagFsidV2 = int(((this.Flags >> 0) & 1))
	this._f_flagFsidV2 = true
	return this.flagFsidV2, nil
}
func (this *Cramfs_SuperBlockStruct) FlagHoles() (v int, err error) {
	if (this._f_flagHoles) {
		return this.flagHoles, nil
	}
	this.flagHoles = int(((this.Flags >> 8) & 1))
	this._f_flagHoles = true
	return this.flagHoles, nil
}
func (this *Cramfs_SuperBlockStruct) FlagWrongSignature() (v int, err error) {
	if (this._f_flagWrongSignature) {
		return this.flagWrongSignature, nil
	}
	this.flagWrongSignature = int(((this.Flags >> 9) & 1))
	this._f_flagWrongSignature = true
	return this.flagWrongSignature, nil
}
func (this *Cramfs_SuperBlockStruct) FlagSortedDirs() (v int, err error) {
	if (this._f_flagSortedDirs) {
		return this.flagSortedDirs, nil
	}
	this.flagSortedDirs = int(((this.Flags >> 1) & 1))
	this._f_flagSortedDirs = true
	return this.flagSortedDirs, nil
}
func (this *Cramfs_SuperBlockStruct) FlagShiftedRootOffset() (v int, err error) {
	if (this._f_flagShiftedRootOffset) {
		return this.flagShiftedRootOffset, nil
	}
	this.flagShiftedRootOffset = int(((this.Flags >> 10) & 1))
	this._f_flagShiftedRootOffset = true
	return this.flagShiftedRootOffset, nil
}
type Cramfs_ChunkedDataInode struct {
	BlockEndIndex []uint32
	RawBlocks []byte
	_io *kaitai.Stream
	_root *Cramfs
	_parent *Cramfs_Inode
}
func NewCramfs_ChunkedDataInode() *Cramfs_ChunkedDataInode {
	return &Cramfs_ChunkedDataInode{
	}
}

func (this *Cramfs_ChunkedDataInode) Read(io *kaitai.Stream, parent *Cramfs_Inode, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._parent.Size()
	if err != nil {
		return err
	}
	tmp11, err := this._root.PageSize()
	if err != nil {
		return err
	}
	tmp12, err := this._root.PageSize()
	if err != nil {
		return err
	}
	this.BlockEndIndex = make([]uint32, (((tmp10 + tmp11) - 1) / tmp12))
	for i := range this.BlockEndIndex {
		tmp13, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BlockEndIndex[i] = tmp13
	}
	tmp14, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.RawBlocks = tmp14
	return err
}

type Cramfs_Inode_FileType int
const (
	Cramfs_Inode_FileType__Fifo Cramfs_Inode_FileType = 1
	Cramfs_Inode_FileType__Chrdev Cramfs_Inode_FileType = 2
	Cramfs_Inode_FileType__Dir Cramfs_Inode_FileType = 4
	Cramfs_Inode_FileType__Blkdev Cramfs_Inode_FileType = 6
	Cramfs_Inode_FileType__RegFile Cramfs_Inode_FileType = 8
	Cramfs_Inode_FileType__Symlink Cramfs_Inode_FileType = 10
	Cramfs_Inode_FileType__Socket Cramfs_Inode_FileType = 12
)
type Cramfs_Inode struct {
	Mode uint16
	Uid uint16
	SizeGid uint32
	NamelenOffset uint32
	Name string
	_io *kaitai.Stream
	_root *Cramfs
	_parent interface{}
	_raw_asDir []byte
	_f_attr bool
	attr int
	_f_asRegFile bool
	asRegFile *Cramfs_ChunkedDataInode
	_f_permU bool
	permU int
	_f_asSymlink bool
	asSymlink *Cramfs_ChunkedDataInode
	_f_permO bool
	permO int
	_f_size bool
	size int
	_f_gid bool
	gid int
	_f_permG bool
	permG int
	_f_namelen bool
	namelen int
	_f_asDir bool
	asDir *Cramfs_DirInode
	_f_type bool
	type Cramfs_Inode_FileType
	_f_offset bool
	offset int
}
func NewCramfs_Inode() *Cramfs_Inode {
	return &Cramfs_Inode{
	}
}

func (this *Cramfs_Inode) Read(io *kaitai.Stream, parent interface{}, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Mode = uint16(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Uid = uint16(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeGid = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NamelenOffset = uint32(tmp18)
	tmp19, err := this.Namelen()
	if err != nil {
		return err
	}
	tmp20, err := this._io.ReadBytes(int(tmp19))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Name = string(tmp20)
	return err
}
func (this *Cramfs_Inode) Attr() (v int, err error) {
	if (this._f_attr) {
		return this.attr, nil
	}
	this.attr = int(((this.Mode >> 9) & 7))
	this._f_attr = true
	return this.attr, nil
}
func (this *Cramfs_Inode) AsRegFile() (v *Cramfs_ChunkedDataInode, err error) {
	if (this._f_asRegFile) {
		return this.asRegFile, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp21, err := this.Offset()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp21), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp22 := NewCramfs_ChunkedDataInode()
	err = tmp22.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.asRegFile = tmp22
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_asRegFile = true
	this._f_asRegFile = true
	return this.asRegFile, nil
}
func (this *Cramfs_Inode) PermU() (v int, err error) {
	if (this._f_permU) {
		return this.permU, nil
	}
	this.permU = int(((this.Mode >> 6) & 7))
	this._f_permU = true
	return this.permU, nil
}
func (this *Cramfs_Inode) AsSymlink() (v *Cramfs_ChunkedDataInode, err error) {
	if (this._f_asSymlink) {
		return this.asSymlink, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp23, err := this.Offset()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp23), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp24 := NewCramfs_ChunkedDataInode()
	err = tmp24.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.asSymlink = tmp24
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_asSymlink = true
	this._f_asSymlink = true
	return this.asSymlink, nil
}
func (this *Cramfs_Inode) PermO() (v int, err error) {
	if (this._f_permO) {
		return this.permO, nil
	}
	this.permO = int((this.Mode & 7))
	this._f_permO = true
	return this.permO, nil
}
func (this *Cramfs_Inode) Size() (v int, err error) {
	if (this._f_size) {
		return this.size, nil
	}
	this.size = int((this.SizeGid & 16777215))
	this._f_size = true
	return this.size, nil
}
func (this *Cramfs_Inode) Gid() (v int, err error) {
	if (this._f_gid) {
		return this.gid, nil
	}
	this.gid = int((this.SizeGid >> 24))
	this._f_gid = true
	return this.gid, nil
}
func (this *Cramfs_Inode) PermG() (v int, err error) {
	if (this._f_permG) {
		return this.permG, nil
	}
	this.permG = int(((this.Mode >> 3) & 7))
	this._f_permG = true
	return this.permG, nil
}
func (this *Cramfs_Inode) Namelen() (v int, err error) {
	if (this._f_namelen) {
		return this.namelen, nil
	}
	this.namelen = int(((this.NamelenOffset & 63) << 2))
	this._f_namelen = true
	return this.namelen, nil
}
func (this *Cramfs_Inode) AsDir() (v *Cramfs_DirInode, err error) {
	if (this._f_asDir) {
		return this.asDir, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp25, err := this.Offset()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp25), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp26, err := this.Size()
	if err != nil {
		return nil, err
	}
	tmp27, err := thisIo.ReadBytes(int(tmp26))
	if err != nil {
		return nil, err
	}
	tmp27 = tmp27
	this._raw_asDir = tmp27
	_io__raw_asDir := kaitai.NewStream(bytes.NewReader(this._raw_asDir))
	tmp28 := NewCramfs_DirInode()
	err = tmp28.Read(_io__raw_asDir, this, this._root)
	if err != nil {
		return nil, err
	}
	this.asDir = tmp28
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_asDir = true
	this._f_asDir = true
	return this.asDir, nil
}
func (this *Cramfs_Inode) Type() (v Cramfs_Inode_FileType, err error) {
	if (this._f_type) {
		return this.type, nil
	}
	this.type = Cramfs_Inode_FileType(Cramfs_Inode_FileType(((this.Mode >> 12) & 15)))
	this._f_type = true
	return this.type, nil
}
func (this *Cramfs_Inode) Offset() (v int, err error) {
	if (this._f_offset) {
		return this.offset, nil
	}
	this.offset = int((((this.NamelenOffset >> 6) & 67108863) << 2))
	this._f_offset = true
	return this.offset, nil
}
type Cramfs_DirInode struct {
	Children []*Cramfs_Inode
	_io *kaitai.Stream
	_root *Cramfs
	_parent *Cramfs_Inode
}
func NewCramfs_DirInode() *Cramfs_DirInode {
	return &Cramfs_DirInode{
	}
}

func (this *Cramfs_DirInode) Read(io *kaitai.Stream, parent *Cramfs_Inode, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.Size()
	if err != nil {
		return err
	}
	if (tmp29 > 0) {
		for i := 1;; i++ {
			tmp30, err := this._io.EOF()
			if err != nil {
				return err
			}
			if tmp30 {
				break
			}
			tmp31 := NewCramfs_Inode()
			err = tmp31.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Children = append(this.Children, tmp31)
		}
	}
	return err
}
type Cramfs_Info struct {
	Crc uint32
	Edition uint32
	Blocks uint32
	Files uint32
	_io *kaitai.Stream
	_root *Cramfs
	_parent *Cramfs_SuperBlockStruct
}
func NewCramfs_Info() *Cramfs_Info {
	return &Cramfs_Info{
	}
}

func (this *Cramfs_Info) Read(io *kaitai.Stream, parent *Cramfs_SuperBlockStruct, root *Cramfs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc = uint32(tmp32)
	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Edition = uint32(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Blocks = uint32(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Files = uint32(tmp35)
	return err
}
