// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * @see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">Source</a>
 */
type Vfat struct {
	BootSector *Vfat_BootSector
	_io *kaitai.Stream
	_root *Vfat
	_parent interface{}
	_raw_rootDir []byte
	_f_fats bool
	fats [][]byte
	_f_rootDir bool
	rootDir *Vfat_RootDirectory
}
func NewVfat() *Vfat {
	return &Vfat{
	}
}

func (this *Vfat) Read(io *kaitai.Stream, parent interface{}, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewVfat_BootSector()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BootSector = tmp1
	return err
}
func (this *Vfat) Fats() (v [][]byte, err error) {
	if (this._f_fats) {
		return this.fats, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp2, err := this.BootSector.PosFats()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp2), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.fats = make([][]byte, this.BootSector.Bpb.NumFats)
	for i := range this.fats {
		tmp3, err := this.BootSector.SizeFat()
		if err != nil {
			return nil, err
		}
		tmp4, err := this._io.ReadBytes(int(tmp3))
		if err != nil {
			return nil, err
		}
		tmp4 = tmp4
		this.fats[i] = tmp4
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_fats = true
	this._f_fats = true
	return this.fats, nil
}
func (this *Vfat) RootDir() (v *Vfat_RootDirectory, err error) {
	if (this._f_rootDir) {
		return this.rootDir, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp5, err := this.BootSector.PosRootDir()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp5), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp6, err := this.BootSector.SizeRootDir()
	if err != nil {
		return nil, err
	}
	tmp7, err := this._io.ReadBytes(int(tmp6))
	if err != nil {
		return nil, err
	}
	tmp7 = tmp7
	this._raw_rootDir = tmp7
	_io__raw_rootDir := kaitai.NewStream(bytes.NewReader(this._raw_rootDir))
	tmp8 := NewVfat_RootDirectory()
	err = tmp8.Read(_io__raw_rootDir, this, this._root)
	if err != nil {
		return nil, err
	}
	this.rootDir = tmp8
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_rootDir = true
	this._f_rootDir = true
	return this.rootDir, nil
}

/**
 * Extended BIOS Parameter Block for FAT32
 */
type Vfat_ExtBiosParamBlockFat32 struct {
	LsPerFat uint32
	HasActiveFat bool
	Reserved1 uint64
	ActiveFatId uint64
	Reserved2 []byte
	FatVersion uint16
	RootDirStartClus uint32
	LsFsInfo uint16
	BootSectorsCopyStartLs uint16
	Reserved3 []byte
	PhysDriveNum uint8
	Reserved4 uint8
	ExtBootSign uint8
	VolumeId []byte
	PartitionVolumeLabel string
	FsTypeStr string
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat_BootSector
}
func NewVfat_ExtBiosParamBlockFat32() *Vfat_ExtBiosParamBlockFat32 {
	return &Vfat_ExtBiosParamBlockFat32{
	}
}

func (this *Vfat_ExtBiosParamBlockFat32) Read(io *kaitai.Stream, parent *Vfat_BootSector, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LsPerFat = uint32(tmp9)
	tmp10, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.HasActiveFat = tmp10 != 0
	tmp11, err := this._io.ReadBitsIntLe(3)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp11
	tmp12, err := this._io.ReadBitsIntLe(4)
	if err != nil {
		return err
	}
	this.ActiveFatId = tmp12
	this._io.AlignToByte()
	tmp13, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Reserved2 = tmp13
	if !(bytes.Equal(this.Reserved2, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Reserved2, this._io, "/types/ext_bios_param_block_fat32/seq/4")
	}
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FatVersion = uint16(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RootDirStartClus = uint32(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LsFsInfo = uint16(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BootSectorsCopyStartLs = uint16(tmp17)
	tmp18, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Reserved3 = tmp18
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PhysDriveNum = tmp19
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved4 = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ExtBootSign = tmp21
	tmp22, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.VolumeId = tmp22
	tmp23, err := this._io.ReadBytes(int(11))
	if err != nil {
		return err
	}
	tmp23 = kaitai.BytesStripRight(tmp23, 32)
	this.PartitionVolumeLabel = string(tmp23)
	tmp24, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp24 = kaitai.BytesStripRight(tmp24, 32)
	this.FsTypeStr = string(tmp24)
	return err
}

/**
 * Logical sectors per file allocation table (corresponds with
 * the old entry `ls_per_fat` in the DOS 2.0 BPB).
 */

/**
 * If true, then there is "active" FAT, which is designated in
 * `active_fat` attribute. If false, all FATs are mirrored as
 * usual.
 */

/**
 * Zero-based number of active FAT, if `has_active_fat`
 * attribute is true.
 */

/**
 * Cluster number of root directory start, typically 2 if it
 * contains no bad sector. (Microsoft's FAT32 implementation
 * imposes an artificial limit of 65,535 entries per directory,
 * whilst many third-party implementations do not.)
 */

/**
 * Logical sector number of FS Information Sector, typically 1,
 * i.e., the second of the three FAT32 boot sectors. Values
 * like 0 and 0xFFFF are used by some FAT32 implementations to
 * designate abscence of FS Information Sector.
 */

/**
 * First logical sector number of a copy of the three FAT32
 * boot sectors, typically 6.
 */

/**
 * Physical drive number (0x00 for (first) removable media,
 * 0x80 for (first) fixed disk as per INT 13h).
 */

/**
 * Should be 0x29 to indicate that an EBPB with the following 3
 * entries exists.
 */

/**
 * Volume ID (serial number).
 * 
 * Typically the serial number "xxxx-xxxx" is created by a
 * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
 * (get system date) and INT 21h/AH=2Ch (get system time) for
 * the high word and another 16-bit addition of both CX values
 * for the low word of the serial number. Alternatively, some
 * DR-DOS disk utilities provide a /# option to generate a
 * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
 * 8-bit values for the month, day, hour and minute instead of
 * a serial number.
 */
type Vfat_BootSector struct {
	JmpInstruction []byte
	OemName string
	Bpb *Vfat_BiosParamBlock
	EbpbFat16 *Vfat_ExtBiosParamBlockFat16
	EbpbFat32 *Vfat_ExtBiosParamBlockFat32
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat
	_f_posFats bool
	posFats int
	_f_lsPerFat bool
	lsPerFat uint32
	_f_lsPerRootDir bool
	lsPerRootDir int
	_f_isFat32 bool
	isFat32 bool
	_f_sizeFat bool
	sizeFat int
	_f_posRootDir bool
	posRootDir int
	_f_sizeRootDir bool
	sizeRootDir int
}
func NewVfat_BootSector() *Vfat_BootSector {
	return &Vfat_BootSector{
	}
}

func (this *Vfat_BootSector) Read(io *kaitai.Stream, parent *Vfat, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.JmpInstruction = tmp25
	tmp26, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp26 = kaitai.BytesStripRight(tmp26, 32)
	this.OemName = string(tmp26)
	tmp27 := NewVfat_BiosParamBlock()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Bpb = tmp27
	tmp28, err := this.IsFat32()
	if err != nil {
		return err
	}
	if (!(tmp28)) {
		tmp29 := NewVfat_ExtBiosParamBlockFat16()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EbpbFat16 = tmp29
	}
	tmp30, err := this.IsFat32()
	if err != nil {
		return err
	}
	if (tmp30) {
		tmp31 := NewVfat_ExtBiosParamBlockFat32()
		err = tmp31.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EbpbFat32 = tmp31
	}
	return err
}

/**
 * Offset of FATs in bytes from start of filesystem
 */
func (this *Vfat_BootSector) PosFats() (v int, err error) {
	if (this._f_posFats) {
		return this.posFats, nil
	}
	this.posFats = int((this.Bpb.BytesPerLs * this.Bpb.NumReservedLs))
	this._f_posFats = true
	return this.posFats, nil
}
func (this *Vfat_BootSector) LsPerFat() (v uint32, err error) {
	if (this._f_lsPerFat) {
		return this.lsPerFat, nil
	}
	var tmp32 uint32;
	tmp33, err := this.IsFat32()
	if err != nil {
		return 0, err
	}
	if (tmp33) {
		tmp32 = this.EbpbFat32.LsPerFat
	} else {
		tmp32 = this.Bpb.LsPerFat
	}
	this.lsPerFat = uint32(tmp32)
	this._f_lsPerFat = true
	return this.lsPerFat, nil
}

/**
 * Size of root directory in logical sectors
 * @see "FAT: General Overview of On-Disk Format, section "FAT Data Structure""
 */
func (this *Vfat_BootSector) LsPerRootDir() (v int, err error) {
	if (this._f_lsPerRootDir) {
		return this.lsPerRootDir, nil
	}
	this.lsPerRootDir = int(((((this.Bpb.MaxRootDirRec * 32) + this.Bpb.BytesPerLs) - 1) / this.Bpb.BytesPerLs))
	this._f_lsPerRootDir = true
	return this.lsPerRootDir, nil
}

/**
 * Determines if filesystem is FAT32 (true) or FAT12/16 (false)
 * by analyzing some preliminary conditions in BPB. Used to
 * determine whether we should parse post-BPB data as
 * `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
 */
func (this *Vfat_BootSector) IsFat32() (v bool, err error) {
	if (this._f_isFat32) {
		return this.isFat32, nil
	}
	this.isFat32 = bool(this.Bpb.MaxRootDirRec == 0)
	this._f_isFat32 = true
	return this.isFat32, nil
}

/**
 * Size of one FAT in bytes
 */
func (this *Vfat_BootSector) SizeFat() (v int, err error) {
	if (this._f_sizeFat) {
		return this.sizeFat, nil
	}
	tmp34, err := this.LsPerFat()
	if err != nil {
		return 0, err
	}
	this.sizeFat = int((this.Bpb.BytesPerLs * tmp34))
	this._f_sizeFat = true
	return this.sizeFat, nil
}

/**
 * Offset of root directory in bytes from start of filesystem
 */
func (this *Vfat_BootSector) PosRootDir() (v int, err error) {
	if (this._f_posRootDir) {
		return this.posRootDir, nil
	}
	tmp35, err := this.LsPerFat()
	if err != nil {
		return 0, err
	}
	this.posRootDir = int((this.Bpb.BytesPerLs * (this.Bpb.NumReservedLs + (tmp35 * this.Bpb.NumFats))))
	this._f_posRootDir = true
	return this.posRootDir, nil
}

/**
 * Size of root directory in bytes
 */
func (this *Vfat_BootSector) SizeRootDir() (v int, err error) {
	if (this._f_sizeRootDir) {
		return this.sizeRootDir, nil
	}
	tmp36, err := this.LsPerRootDir()
	if err != nil {
		return 0, err
	}
	this.sizeRootDir = int((tmp36 * this.Bpb.BytesPerLs))
	this._f_sizeRootDir = true
	return this.sizeRootDir, nil
}

/**
 * Basic BIOS parameter block, present in all versions of FAT
 */

/**
 * FAT12/16-specific extended BIOS parameter block
 */

/**
 * FAT32-specific extended BIOS parameter block
 */
type Vfat_BiosParamBlock struct {
	BytesPerLs uint16
	LsPerClus uint8
	NumReservedLs uint16
	NumFats uint8
	MaxRootDirRec uint16
	TotalLs2 uint16
	MediaCode uint8
	LsPerFat uint16
	PsPerTrack uint16
	NumHeads uint16
	NumHiddenSectors uint32
	TotalLs4 uint32
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat_BootSector
}
func NewVfat_BiosParamBlock() *Vfat_BiosParamBlock {
	return &Vfat_BiosParamBlock{
	}
}

func (this *Vfat_BiosParamBlock) Read(io *kaitai.Stream, parent *Vfat_BootSector, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BytesPerLs = uint16(tmp37)
	tmp38, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LsPerClus = tmp38
	tmp39, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumReservedLs = uint16(tmp39)
	tmp40, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumFats = tmp40
	tmp41, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxRootDirRec = uint16(tmp41)
	tmp42, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.TotalLs2 = uint16(tmp42)
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MediaCode = tmp43
	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LsPerFat = uint16(tmp44)
	tmp45, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PsPerTrack = uint16(tmp45)
	tmp46, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumHeads = uint16(tmp46)
	tmp47, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumHiddenSectors = uint32(tmp47)
	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TotalLs4 = uint32(tmp48)
	return err
}

/**
 * Bytes per logical sector
 */

/**
 * Logical sectors per cluster
 */

/**
 * Count of reserved logical sectors. The number of logical
 * sectors before the first FAT in the file system image.
 */

/**
 * Number of File Allocation Tables
 */

/**
 * Maximum number of FAT12 or FAT16 root directory entries. 0
 * for FAT32, where the root directory is stored in ordinary
 * data clusters.
 */

/**
 * Total logical sectors (if zero, use total_ls_4)
 */

/**
 * Media descriptor
 */

/**
 * Logical sectors per File Allocation Table for
 * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
 * at offset 0x024 instead.
 */

/**
 * Physical sectors per track for disks with INT 13h CHS
 * geometry, e.g., 15 for a "1.20 MB" (1200 KB) floppy. A zero
 * entry indicates that this entry is reserved, but not used.
 */

/**
 * Number of heads for disks with INT 13h CHS geometry,[9]
 * e.g., 2 for a double sided floppy.
 */

/**
 * Number of hidden sectors preceding the partition that
 * contains this FAT volume. This field should always be zero
 * on media that are not partitioned. This DOS 3.0 entry is
 * incompatible with a similar entry at offset 0x01C in BPBs
 * since DOS 3.31.  It must not be used if the logical sectors
 * entry at offset 0x013 is zero.
 */

/**
 * Total logical sectors including hidden sectors. This DOS 3.2
 * entry is incompatible with a similar entry at offset 0x020
 * in BPBs since DOS 3.31. It must not be used if the logical
 * sectors entry at offset 0x013 is zero.
 */
type Vfat_RootDirectoryRec struct {
	FileName []byte
	Attrs *Vfat_RootDirectoryRec_AttrFlags
	Reserved []byte
	LastWriteTime *DosDatetime
	StartClus uint16
	FileSize uint32
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat_RootDirectory
	_raw_Attrs []byte
	_raw_LastWriteTime []byte
}
func NewVfat_RootDirectoryRec() *Vfat_RootDirectoryRec {
	return &Vfat_RootDirectoryRec{
	}
}

func (this *Vfat_RootDirectoryRec) Read(io *kaitai.Stream, parent *Vfat_RootDirectory, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadBytes(int(11))
	if err != nil {
		return err
	}
	tmp49 = tmp49
	this.FileName = tmp49
	tmp50, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this._raw_Attrs = tmp50
	_io__raw_Attrs := kaitai.NewStream(bytes.NewReader(this._raw_Attrs))
	tmp51 := NewVfat_RootDirectoryRec_AttrFlags()
	err = tmp51.Read(_io__raw_Attrs, this, this._root)
	if err != nil {
		return err
	}
	this.Attrs = tmp51
	tmp52, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp52 = tmp52
	this.Reserved = tmp52
	tmp53, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp53 = tmp53
	this._raw_LastWriteTime = tmp53
	_io__raw_LastWriteTime := kaitai.NewStream(bytes.NewReader(this._raw_LastWriteTime))
	tmp54 := NewDosDatetime()
	err = tmp54.Read(_io__raw_LastWriteTime, this, nil)
	if err != nil {
		return err
	}
	this.LastWriteTime = tmp54
	tmp55, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.StartClus = uint16(tmp55)
	tmp56, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSize = uint32(tmp56)
	return err
}
type Vfat_RootDirectoryRec_AttrFlags struct {
	ReadOnly bool
	Hidden bool
	System bool
	VolumeId bool
	IsDirectory bool
	Archive bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat_RootDirectoryRec
	_f_longName bool
	longName bool
}
func NewVfat_RootDirectoryRec_AttrFlags() *Vfat_RootDirectoryRec_AttrFlags {
	return &Vfat_RootDirectoryRec_AttrFlags{
	}
}

func (this *Vfat_RootDirectoryRec_AttrFlags) Read(io *kaitai.Stream, parent *Vfat_RootDirectoryRec, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp57, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.ReadOnly = tmp57 != 0
	tmp58, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.Hidden = tmp58 != 0
	tmp59, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.System = tmp59 != 0
	tmp60, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.VolumeId = tmp60 != 0
	tmp61, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.IsDirectory = tmp61 != 0
	tmp62, err := this._io.ReadBitsIntLe(1)
	if err != nil {
		return err
	}
	this.Archive = tmp62 != 0
	tmp63, err := this._io.ReadBitsIntLe(2)
	if err != nil {
		return err
	}
	this.Reserved = tmp63
	return err
}
func (this *Vfat_RootDirectoryRec_AttrFlags) LongName() (v bool, err error) {
	if (this._f_longName) {
		return this.longName, nil
	}
	this.longName = bool( ((this.ReadOnly) && (this.Hidden) && (this.System) && (this.VolumeId)) )
	this._f_longName = true
	return this.longName, nil
}
type Vfat_RootDirectory struct {
	Records []*Vfat_RootDirectoryRec
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat
}
func NewVfat_RootDirectory() *Vfat_RootDirectory {
	return &Vfat_RootDirectory{
	}
}

func (this *Vfat_RootDirectory) Read(io *kaitai.Stream, parent *Vfat, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Records = make([]*Vfat_RootDirectoryRec, this._root.BootSector.Bpb.MaxRootDirRec)
	for i := range this.Records {
		tmp64 := NewVfat_RootDirectoryRec()
		err = tmp64.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records[i] = tmp64
	}
	return err
}

/**
 * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
 * for FAT12 and FAT16.
 */
type Vfat_ExtBiosParamBlockFat16 struct {
	PhysDriveNum uint8
	Reserved1 uint8
	ExtBootSign uint8
	VolumeId []byte
	PartitionVolumeLabel string
	FsTypeStr string
	_io *kaitai.Stream
	_root *Vfat
	_parent *Vfat_BootSector
}
func NewVfat_ExtBiosParamBlockFat16() *Vfat_ExtBiosParamBlockFat16 {
	return &Vfat_ExtBiosParamBlockFat16{
	}
}

func (this *Vfat_ExtBiosParamBlockFat16) Read(io *kaitai.Stream, parent *Vfat_BootSector, root *Vfat) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp65, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PhysDriveNum = tmp65
	tmp66, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved1 = tmp66
	tmp67, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ExtBootSign = tmp67
	tmp68, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp68 = tmp68
	this.VolumeId = tmp68
	tmp69, err := this._io.ReadBytes(int(11))
	if err != nil {
		return err
	}
	tmp69 = kaitai.BytesStripRight(tmp69, 32)
	this.PartitionVolumeLabel = string(tmp69)
	tmp70, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp70 = kaitai.BytesStripRight(tmp70, 32)
	this.FsTypeStr = string(tmp70)
	return err
}

/**
 * Physical drive number (0x00 for (first) removable media,
 * 0x80 for (first) fixed disk as per INT 13h).
 */

/**
 * Should be 0x29 to indicate that an EBPB with the following 3
 * entries exists.
 */

/**
 * Volume ID (serial number).
 * 
 * Typically the serial number "xxxx-xxxx" is created by a
 * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
 * (get system date) and INT 21h/AH=2Ch (get system time) for
 * the high word and another 16-bit addition of both CX values
 * for the low word of the serial number. Alternatively, some
 * DR-DOS disk utilities provide a /# option to generate a
 * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
 * 8-bit values for the month, day, hour and minute instead of
 * a serial number.
 */
