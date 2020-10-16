// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * ISO9660 is standard filesystem used on read-only optical discs
 * (mostly CD-ROM). The standard was based on earlier High Sierra
 * Format (HSF), proposed for CD-ROMs in 1985, and, after several
 * revisions, it was accepted as ISO9960:1998.
 * 
 * The format emphasizes portability (thus having pretty minimal
 * features and very conservative file names standards) and sequential
 * access (which favors disc devices with relatively slow rotation
 * speed).
 */
type Iso9660 struct {
	_io *kaitai.Stream
	_root *Iso9660
	_parent interface{}
	_f_sectorSize bool
	sectorSize int
	_f_primaryVolDesc bool
	primaryVolDesc *Iso9660_VolDesc
}
func NewIso9660() *Iso9660 {
	return &Iso9660{
	}
}

func (this *Iso9660) Read(io *kaitai.Stream, parent interface{}, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Iso9660) SectorSize() (v int, err error) {
	if (this._f_sectorSize) {
		return this.sectorSize, nil
	}
	this.sectorSize = int(2048)
	this._f_sectorSize = true
	return this.sectorSize, nil
}
func (this *Iso9660) PrimaryVolDesc() (v *Iso9660_VolDesc, err error) {
	if (this._f_primaryVolDesc) {
		return this.primaryVolDesc, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp1, err := this.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((16 * tmp1)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2 := NewIso9660_VolDesc()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.primaryVolDesc = tmp2
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_primaryVolDesc = true
	this._f_primaryVolDesc = true
	return this.primaryVolDesc, nil
}

/**
 * @see <a href="http://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor">Source</a>
 */
type Iso9660_VolDescPrimary struct {
	Unused1 []byte
	SystemId string
	VolumeId string
	Unused2 []byte
	VolSpaceSize *Iso9660_U4bi
	Unused3 []byte
	VolSetSize *Iso9660_U2bi
	VolSeqNum *Iso9660_U2bi
	LogicalBlockSize *Iso9660_U2bi
	PathTableSize *Iso9660_U4bi
	LbaPathTableLe uint32
	LbaOptPathTableLe uint32
	LbaPathTableBe uint32
	LbaOptPathTableBe uint32
	RootDir *Iso9660_DirEntry
	VolSetId string
	PublisherId string
	DataPreparerId string
	ApplicationId string
	CopyrightFileId string
	AbstractFileId string
	BibliographicFileId string
	VolCreateDatetime *Iso9660_DecDatetime
	VolModDatetime *Iso9660_DecDatetime
	VolExpireDatetime *Iso9660_DecDatetime
	VolEffectiveDatetime *Iso9660_DecDatetime
	FileStructureVersion uint8
	Unused4 uint8
	ApplicationArea []byte
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_VolDesc
	_raw_RootDir []byte
	_raw_pathTable []byte
	_f_pathTable bool
	pathTable *Iso9660_PathTableLe
}
func NewIso9660_VolDescPrimary() *Iso9660_VolDescPrimary {
	return &Iso9660_VolDescPrimary{
	}
}

func (this *Iso9660_VolDescPrimary) Read(io *kaitai.Stream, parent *Iso9660_VolDesc, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Unused1 = tmp3
	if !(bytes.Equal(this.Unused1, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Unused1, this._io, "/types/vol_desc_primary/seq/0")
	}
	tmp4, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.SystemId = string(tmp4)
	tmp5, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.VolumeId = string(tmp5)
	tmp6, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Unused2 = tmp6
	if !(bytes.Equal(this.Unused2, []uint8{0, 0, 0, 0, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0, 0, 0, 0, 0}, this.Unused2, this._io, "/types/vol_desc_primary/seq/3")
	}
	tmp7 := NewIso9660_U4bi()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolSpaceSize = tmp7
	tmp8, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Unused3 = tmp8
	if !(bytes.Equal(this.Unused3, []uint8{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, this.Unused3, this._io, "/types/vol_desc_primary/seq/5")
	}
	tmp9 := NewIso9660_U2bi()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolSetSize = tmp9
	tmp10 := NewIso9660_U2bi()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolSeqNum = tmp10
	tmp11 := NewIso9660_U2bi()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LogicalBlockSize = tmp11
	tmp12 := NewIso9660_U4bi()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PathTableSize = tmp12
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LbaPathTableLe = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LbaOptPathTableLe = uint32(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LbaPathTableBe = uint32(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LbaOptPathTableBe = uint32(tmp16)
	tmp17, err := this._io.ReadBytes(int(34))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this._raw_RootDir = tmp17
	_io__raw_RootDir := kaitai.NewStream(bytes.NewReader(this._raw_RootDir))
	tmp18 := NewIso9660_DirEntry()
	err = tmp18.Read(_io__raw_RootDir, this, this._root)
	if err != nil {
		return err
	}
	this.RootDir = tmp18
	tmp19, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.VolSetId = string(tmp19)
	tmp20, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.PublisherId = string(tmp20)
	tmp21, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.DataPreparerId = string(tmp21)
	tmp22, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.ApplicationId = string(tmp22)
	tmp23, err := this._io.ReadBytes(int(38))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.CopyrightFileId = string(tmp23)
	tmp24, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.AbstractFileId = string(tmp24)
	tmp25, err := this._io.ReadBytes(int(37))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.BibliographicFileId = string(tmp25)
	tmp26 := NewIso9660_DecDatetime()
	err = tmp26.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolCreateDatetime = tmp26
	tmp27 := NewIso9660_DecDatetime()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolModDatetime = tmp27
	tmp28 := NewIso9660_DecDatetime()
	err = tmp28.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolExpireDatetime = tmp28
	tmp29 := NewIso9660_DecDatetime()
	err = tmp29.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolEffectiveDatetime = tmp29
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FileStructureVersion = tmp30
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unused4 = tmp31
	tmp32, err := this._io.ReadBytes(int(512))
	if err != nil {
		return err
	}
	tmp32 = tmp32
	this.ApplicationArea = tmp32
	return err
}
func (this *Iso9660_VolDescPrimary) PathTable() (v *Iso9660_PathTableLe, err error) {
	if (this._f_pathTable) {
		return this.pathTable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp33, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.LbaPathTableLe * tmp33)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp34, err := this._io.ReadBytes(int(this.PathTableSize.Le))
	if err != nil {
		return nil, err
	}
	tmp34 = tmp34
	this._raw_pathTable = tmp34
	_io__raw_pathTable := kaitai.NewStream(bytes.NewReader(this._raw_pathTable))
	tmp35 := NewIso9660_PathTableLe()
	err = tmp35.Read(_io__raw_pathTable, this, this._root)
	if err != nil {
		return nil, err
	}
	this.pathTable = tmp35
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_pathTable = true
	this._f_pathTable = true
	return this.pathTable, nil
}
type Iso9660_VolDescBootRecord struct {
	BootSystemId string
	BootId string
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_VolDesc
}
func NewIso9660_VolDescBootRecord() *Iso9660_VolDescBootRecord {
	return &Iso9660_VolDescBootRecord{
	}
}

func (this *Iso9660_VolDescBootRecord) Read(io *kaitai.Stream, parent *Iso9660_VolDesc, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.BootSystemId = string(tmp36)
	tmp37, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp37 = tmp37
	this.BootId = string(tmp37)
	return err
}
type Iso9660_Datetime struct {
	Year uint8
	Month uint8
	Day uint8
	Hour uint8
	Minute uint8
	Sec uint8
	Timezone uint8
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_DirEntryBody
}
func NewIso9660_Datetime() *Iso9660_Datetime {
	return &Iso9660_Datetime{
	}
}

func (this *Iso9660_Datetime) Read(io *kaitai.Stream, parent *Iso9660_DirEntryBody, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Year = tmp38
	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Month = tmp39
	tmp40, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Day = tmp40
	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Hour = tmp41
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minute = tmp42
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Sec = tmp43
	tmp44, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Timezone = tmp44
	return err
}
type Iso9660_DirEntry struct {
	Len uint8
	Body *Iso9660_DirEntryBody
	_io *kaitai.Stream
	_root *Iso9660
	_parent interface{}
	_raw_Body []byte
}
func NewIso9660_DirEntry() *Iso9660_DirEntry {
	return &Iso9660_DirEntry{
	}
}

func (this *Iso9660_DirEntry) Read(io *kaitai.Stream, parent interface{}, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp45
	if (this.Len > 0) {
		tmp46, err := this._io.ReadBytes(int((this.Len - 1)))
		if err != nil {
			return err
		}
		tmp46 = tmp46
		this._raw_Body = tmp46
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp47 := NewIso9660_DirEntryBody()
		err = tmp47.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	}
	return err
}
type Iso9660_VolDesc struct {
	Type uint8
	Magic []byte
	Version uint8
	VolDescBootRecord *Iso9660_VolDescBootRecord
	VolDescPrimary *Iso9660_VolDescPrimary
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660
}
func NewIso9660_VolDesc() *Iso9660_VolDesc {
	return &Iso9660_VolDesc{
	}
}

func (this *Iso9660_VolDesc) Read(io *kaitai.Stream, parent *Iso9660, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp48
	tmp49, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp49 = tmp49
	this.Magic = tmp49
	if !(bytes.Equal(this.Magic, []uint8{67, 68, 48, 48, 49})) {
		return kaitai.NewValidationNotEqualError([]uint8{67, 68, 48, 48, 49}, this.Magic, this._io, "/types/vol_desc/seq/1")
	}
	tmp50, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp50
	if (this.Type == 0) {
		tmp51 := NewIso9660_VolDescBootRecord()
		err = tmp51.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.VolDescBootRecord = tmp51
	}
	if (this.Type == 1) {
		tmp52 := NewIso9660_VolDescPrimary()
		err = tmp52.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.VolDescPrimary = tmp52
	}
	return err
}
type Iso9660_PathTableEntryLe struct {
	LenDirName uint8
	LenExtAttrRec uint8
	LbaExtent uint32
	ParentDirIdx uint16
	DirName string
	Padding uint8
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_PathTableLe
}
func NewIso9660_PathTableEntryLe() *Iso9660_PathTableEntryLe {
	return &Iso9660_PathTableEntryLe{
	}
}

func (this *Iso9660_PathTableEntryLe) Read(io *kaitai.Stream, parent *Iso9660_PathTableLe, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp53, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenDirName = tmp53
	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenExtAttrRec = tmp54
	tmp55, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LbaExtent = uint32(tmp55)
	tmp56, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ParentDirIdx = uint16(tmp56)
	tmp57, err := this._io.ReadBytes(int(this.LenDirName))
	if err != nil {
		return err
	}
	tmp57 = tmp57
	this.DirName = string(tmp57)
	tmp58 := this.LenDirName % 2
	if tmp58 < 0 {
		tmp58 += 2
	}
	if (tmp58 == 1) {
		tmp59, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Padding = tmp59
	}
	return err
}
type Iso9660_DirEntries struct {
	Entries []*Iso9660_DirEntry
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_DirEntryBody
}
func NewIso9660_DirEntries() *Iso9660_DirEntries {
	return &Iso9660_DirEntries{
	}
}

func (this *Iso9660_DirEntries) Read(io *kaitai.Stream, parent *Iso9660_DirEntryBody, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp60 := NewIso9660_DirEntry()
		err = tmp60.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp60
		this.Entries = append(this.Entries, _it)
		if _it.Len == 0 {
			break
		}
	}
	return err
}
type Iso9660_U4bi struct {
	Le uint32
	Be uint32
	_io *kaitai.Stream
	_root *Iso9660
	_parent interface{}
}
func NewIso9660_U4bi() *Iso9660_U4bi {
	return &Iso9660_U4bi{
	}
}

func (this *Iso9660_U4bi) Read(io *kaitai.Stream, parent interface{}, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp61, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Le = uint32(tmp61)
	tmp62, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Be = uint32(tmp62)
	return err
}
type Iso9660_U2bi struct {
	Le uint16
	Be uint16
	_io *kaitai.Stream
	_root *Iso9660
	_parent interface{}
}
func NewIso9660_U2bi() *Iso9660_U2bi {
	return &Iso9660_U2bi{
	}
}

func (this *Iso9660_U2bi) Read(io *kaitai.Stream, parent interface{}, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp63, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Le = uint16(tmp63)
	tmp64, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Be = uint16(tmp64)
	return err
}

/**
 * @see <a href="http://wiki.osdev.org/ISO_9660#The_Path_Table">Source</a>
 */
type Iso9660_PathTableLe struct {
	Entries []*Iso9660_PathTableEntryLe
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_VolDescPrimary
}
func NewIso9660_PathTableLe() *Iso9660_PathTableLe {
	return &Iso9660_PathTableLe{
	}
}

func (this *Iso9660_PathTableLe) Read(io *kaitai.Stream, parent *Iso9660_VolDescPrimary, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp65, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp65 {
			break
		}
		tmp66 := NewIso9660_PathTableEntryLe()
		err = tmp66.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp66)
	}
	return err
}

/**
 * @see <a href="http://wiki.osdev.org/ISO_9660#Date.2Ftime_format">Source</a>
 */
type Iso9660_DecDatetime struct {
	Year string
	Month string
	Day string
	Hour string
	Minute string
	Sec string
	SecHundreds string
	Timezone uint8
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_VolDescPrimary
}
func NewIso9660_DecDatetime() *Iso9660_DecDatetime {
	return &Iso9660_DecDatetime{
	}
}

func (this *Iso9660_DecDatetime) Read(io *kaitai.Stream, parent *Iso9660_VolDescPrimary, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp67, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp67 = tmp67
	this.Year = string(tmp67)
	tmp68, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp68 = tmp68
	this.Month = string(tmp68)
	tmp69, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.Day = string(tmp69)
	tmp70, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp70 = tmp70
	this.Hour = string(tmp70)
	tmp71, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp71 = tmp71
	this.Minute = string(tmp71)
	tmp72, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp72 = tmp72
	this.Sec = string(tmp72)
	tmp73, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.SecHundreds = string(tmp73)
	tmp74, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Timezone = tmp74
	return err
}
type Iso9660_DirEntryBody struct {
	LenExtAttrRec uint8
	LbaExtent *Iso9660_U4bi
	SizeExtent *Iso9660_U4bi
	Datetime *Iso9660_Datetime
	FileFlags uint8
	FileUnitSize uint8
	InterleaveGapSize uint8
	VolSeqNum *Iso9660_U2bi
	LenFileName uint8
	FileName string
	Padding uint8
	Rest []byte
	_io *kaitai.Stream
	_root *Iso9660
	_parent *Iso9660_DirEntry
	_raw_extentAsDir []byte
	_f_extentAsDir bool
	extentAsDir *Iso9660_DirEntries
	_f_extentAsFile bool
	extentAsFile []byte
}
func NewIso9660_DirEntryBody() *Iso9660_DirEntryBody {
	return &Iso9660_DirEntryBody{
	}
}

func (this *Iso9660_DirEntryBody) Read(io *kaitai.Stream, parent *Iso9660_DirEntry, root *Iso9660) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp75, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenExtAttrRec = tmp75
	tmp76 := NewIso9660_U4bi()
	err = tmp76.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LbaExtent = tmp76
	tmp77 := NewIso9660_U4bi()
	err = tmp77.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SizeExtent = tmp77
	tmp78 := NewIso9660_Datetime()
	err = tmp78.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Datetime = tmp78
	tmp79, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FileFlags = tmp79
	tmp80, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FileUnitSize = tmp80
	tmp81, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InterleaveGapSize = tmp81
	tmp82 := NewIso9660_U2bi()
	err = tmp82.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VolSeqNum = tmp82
	tmp83, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenFileName = tmp83
	tmp84, err := this._io.ReadBytes(int(this.LenFileName))
	if err != nil {
		return err
	}
	tmp84 = tmp84
	this.FileName = string(tmp84)
	tmp85 := this.LenFileName % 2
	if tmp85 < 0 {
		tmp85 += 2
	}
	if (tmp85 == 0) {
		tmp86, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Padding = tmp86
	}
	tmp87, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp87 = tmp87
	this.Rest = tmp87
	return err
}
func (this *Iso9660_DirEntryBody) ExtentAsDir() (v *Iso9660_DirEntries, err error) {
	if (this._f_extentAsDir) {
		return this.extentAsDir, nil
	}
	if ((this.FileFlags & 2) != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp88, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((this.LbaExtent.Le * tmp88)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp89, err := thisIo.ReadBytes(int(this.SizeExtent.Le))
		if err != nil {
			return nil, err
		}
		tmp89 = tmp89
		this._raw_extentAsDir = tmp89
		_io__raw_extentAsDir := kaitai.NewStream(bytes.NewReader(this._raw_extentAsDir))
		tmp90 := NewIso9660_DirEntries()
		err = tmp90.Read(_io__raw_extentAsDir, this, this._root)
		if err != nil {
			return nil, err
		}
		this.extentAsDir = tmp90
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_extentAsDir = true
	}
	this._f_extentAsDir = true
	return this.extentAsDir, nil
}
func (this *Iso9660_DirEntryBody) ExtentAsFile() (v []byte, err error) {
	if (this._f_extentAsFile) {
		return this.extentAsFile, nil
	}
	if ((this.FileFlags & 2) == 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp91, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((this.LbaExtent.Le * tmp91)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp92, err := thisIo.ReadBytes(int(this.SizeExtent.Le))
		if err != nil {
			return nil, err
		}
		tmp92 = tmp92
		this.extentAsFile = tmp92
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_extentAsFile = true
	}
	this._f_extentAsFile = true
	return this.extentAsFile, nil
}
