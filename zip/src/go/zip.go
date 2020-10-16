// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">Source</a>
 */

type Zip_Compression int
const (
	Zip_Compression__None Zip_Compression = 0
	Zip_Compression__Shrunk Zip_Compression = 1
	Zip_Compression__Reduced1 Zip_Compression = 2
	Zip_Compression__Reduced2 Zip_Compression = 3
	Zip_Compression__Reduced3 Zip_Compression = 4
	Zip_Compression__Reduced4 Zip_Compression = 5
	Zip_Compression__Imploded Zip_Compression = 6
	Zip_Compression__Deflated Zip_Compression = 8
	Zip_Compression__EnhancedDeflated Zip_Compression = 9
	Zip_Compression__PkwareDclImploded Zip_Compression = 10
	Zip_Compression__Bzip2 Zip_Compression = 12
	Zip_Compression__Lzma Zip_Compression = 14
	Zip_Compression__IbmTerse Zip_Compression = 18
	Zip_Compression__IbmLz77Z Zip_Compression = 19
	Zip_Compression__Ppmd Zip_Compression = 98
)

type Zip_ExtraCodes int
const (
	Zip_ExtraCodes__Zip64 Zip_ExtraCodes = 1
	Zip_ExtraCodes__AvInfo Zip_ExtraCodes = 7
	Zip_ExtraCodes__Os2 Zip_ExtraCodes = 9
	Zip_ExtraCodes__Ntfs Zip_ExtraCodes = 10
	Zip_ExtraCodes__Openvms Zip_ExtraCodes = 12
	Zip_ExtraCodes__PkwareUnix Zip_ExtraCodes = 13
	Zip_ExtraCodes__FileStreamAndForkDescriptors Zip_ExtraCodes = 14
	Zip_ExtraCodes__PatchDescriptor Zip_ExtraCodes = 15
	Zip_ExtraCodes__Pkcs7 Zip_ExtraCodes = 20
	Zip_ExtraCodes__X509CertIdAndSignatureForFile Zip_ExtraCodes = 21
	Zip_ExtraCodes__X509CertIdForCentralDir Zip_ExtraCodes = 22
	Zip_ExtraCodes__StrongEncryptionHeader Zip_ExtraCodes = 23
	Zip_ExtraCodes__RecordManagementControls Zip_ExtraCodes = 24
	Zip_ExtraCodes__Pkcs7EncRecipCertList Zip_ExtraCodes = 25
	Zip_ExtraCodes__IbmS390Uncomp Zip_ExtraCodes = 101
	Zip_ExtraCodes__IbmS390Comp Zip_ExtraCodes = 102
	Zip_ExtraCodes__Poszip4690 Zip_ExtraCodes = 18064
	Zip_ExtraCodes__ExtendedTimestamp Zip_ExtraCodes = 21589
	Zip_ExtraCodes__InfozipUnix Zip_ExtraCodes = 30805
	Zip_ExtraCodes__InfozipUnixVarSize Zip_ExtraCodes = 30837
)
type Zip struct {
	Sections []*Zip_PkSection
	_io *kaitai.Stream
	_root *Zip
	_parent interface{}
}
func NewZip() *Zip {
	return &Zip{
	}
}

func (this *Zip) Read(io *kaitai.Stream, parent interface{}, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewZip_PkSection()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections = append(this.Sections, tmp2)
	}
	return err
}
type Zip_LocalFile struct {
	Header *Zip_LocalFileHeader
	Body []byte
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_PkSection
}
func NewZip_LocalFile() *Zip_LocalFile {
	return &Zip_LocalFile{
	}
}

func (this *Zip_LocalFile) Read(io *kaitai.Stream, parent *Zip_PkSection, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewZip_LocalFileHeader()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	tmp4, err := this._io.ReadBytes(int(this.Header.LenBodyCompressed))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Body = tmp4
	return err
}
type Zip_DataDescriptor struct {
	Crc32 uint32
	LenBodyCompressed uint32
	LenBodyUncompressed uint32
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_PkSection
}
func NewZip_DataDescriptor() *Zip_DataDescriptor {
	return &Zip_DataDescriptor{
	}
}

func (this *Zip_DataDescriptor) Read(io *kaitai.Stream, parent *Zip_PkSection, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyCompressed = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyUncompressed = uint32(tmp7)
	return err
}
type Zip_ExtraField struct {
	Code Zip_ExtraCodes
	LenBody uint16
	Body interface{}
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_Extras
	_raw_Body []byte
}
func NewZip_ExtraField() *Zip_ExtraField {
	return &Zip_ExtraField{
	}
}

func (this *Zip_ExtraField) Read(io *kaitai.Stream, parent *Zip_Extras, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Code = Zip_ExtraCodes(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenBody = uint16(tmp9)
	switch (this.Code) {
	case Zip_ExtraCodes__Ntfs:
		tmp10, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this._raw_Body = tmp10
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp11 := NewZip_ExtraField_Ntfs()
		err = tmp11.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case Zip_ExtraCodes__ExtendedTimestamp:
		tmp12, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp12 = tmp12
		this._raw_Body = tmp12
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp13 := NewZip_ExtraField_ExtendedTimestamp()
		err = tmp13.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp13
	case Zip_ExtraCodes__InfozipUnixVarSize:
		tmp14, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp14 = tmp14
		this._raw_Body = tmp14
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp15 := NewZip_ExtraField_InfozipUnixVarSize()
		err = tmp15.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp15
	default:
		tmp16, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Body = tmp16
	}
	return err
}

/**
 * @see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191">Source</a>
 */
type Zip_ExtraField_Ntfs struct {
	Reserved uint32
	Attributes []*Zip_ExtraField_Ntfs_Attribute
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_ExtraField
}
func NewZip_ExtraField_Ntfs() *Zip_ExtraField_Ntfs {
	return &Zip_ExtraField_Ntfs{
	}
}

func (this *Zip_ExtraField_Ntfs) Read(io *kaitai.Stream, parent *Zip_ExtraField, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved = uint32(tmp17)
	for i := 1;; i++ {
		tmp18, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp18 {
			break
		}
		tmp19 := NewZip_ExtraField_Ntfs_Attribute()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Attributes = append(this.Attributes, tmp19)
	}
	return err
}
type Zip_ExtraField_Ntfs_Attribute struct {
	Tag uint16
	LenBody uint16
	Body interface{}
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_ExtraField_Ntfs
	_raw_Body []byte
}
func NewZip_ExtraField_Ntfs_Attribute() *Zip_ExtraField_Ntfs_Attribute {
	return &Zip_ExtraField_Ntfs_Attribute{
	}
}

func (this *Zip_ExtraField_Ntfs_Attribute) Read(io *kaitai.Stream, parent *Zip_ExtraField_Ntfs, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Tag = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenBody = uint16(tmp21)
	switch (this.Tag) {
	case 1:
		tmp22, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this._raw_Body = tmp22
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp23 := NewZip_ExtraField_Ntfs_Attribute1()
		err = tmp23.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp23
	default:
		tmp24, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp24 = tmp24
		this._raw_Body = tmp24
	}
	return err
}
type Zip_ExtraField_Ntfs_Attribute1 struct {
	LastModTime uint64
	LastAccessTime uint64
	CreationTime uint64
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_ExtraField_Ntfs_Attribute
}
func NewZip_ExtraField_Ntfs_Attribute1() *Zip_ExtraField_Ntfs_Attribute1 {
	return &Zip_ExtraField_Ntfs_Attribute1{
	}
}

func (this *Zip_ExtraField_Ntfs_Attribute1) Read(io *kaitai.Stream, parent *Zip_ExtraField_Ntfs_Attribute, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LastModTime = uint64(tmp25)
	tmp26, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LastAccessTime = uint64(tmp26)
	tmp27, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.CreationTime = uint64(tmp27)
	return err
}

/**
 * @see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817">Source</a>
 */
type Zip_ExtraField_ExtendedTimestamp struct {
	Flags uint8
	ModTime uint32
	AccessTime uint32
	CreateTime uint32
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_ExtraField
}
func NewZip_ExtraField_ExtendedTimestamp() *Zip_ExtraField_ExtendedTimestamp {
	return &Zip_ExtraField_ExtendedTimestamp{
	}
}

func (this *Zip_ExtraField_ExtendedTimestamp) Read(io *kaitai.Stream, parent *Zip_ExtraField, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp28
	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ModTime = uint32(tmp29)
	tmp30, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp30)) {
		tmp31, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.AccessTime = uint32(tmp31)
	}
	tmp32, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp32)) {
		tmp33, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.CreateTime = uint32(tmp33)
	}
	return err
}

/**
 * @see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339">Source</a>
 */
type Zip_ExtraField_InfozipUnixVarSize struct {
	Version uint8
	LenUid uint8
	Uid []byte
	LenGid uint8
	Gid []byte
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_ExtraField
}
func NewZip_ExtraField_InfozipUnixVarSize() *Zip_ExtraField_InfozipUnixVarSize {
	return &Zip_ExtraField_InfozipUnixVarSize{
	}
}

func (this *Zip_ExtraField_InfozipUnixVarSize) Read(io *kaitai.Stream, parent *Zip_ExtraField, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp34
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenUid = tmp35
	tmp36, err := this._io.ReadBytes(int(this.LenUid))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Uid = tmp36
	tmp37, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenGid = tmp37
	tmp38, err := this._io.ReadBytes(int(this.LenGid))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.Gid = tmp38
	return err
}

/**
 * Version of this extra field, currently 1
 */

/**
 * Size of UID field
 */

/**
 * UID (User ID) for a file
 */

/**
 * Size of GID field
 */

/**
 * GID (Group ID) for a file
 */

/**
 * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.3.12</a>
 */
type Zip_CentralDirEntry struct {
	VersionMadeBy uint16
	VersionNeededToExtract uint16
	Flags uint16
	CompressionMethod Zip_Compression
	LastModFileTime uint16
	LastModFileDate uint16
	Crc32 uint32
	LenBodyCompressed uint32
	LenBodyUncompressed uint32
	LenFileName uint16
	LenExtra uint16
	LenComment uint16
	DiskNumberStart uint16
	IntFileAttr uint16
	ExtFileAttr uint32
	OfsLocalHeader int32
	FileName string
	Extra *Zip_Extras
	Comment string
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_PkSection
	_raw_Extra []byte
	_f_localHeader bool
	localHeader *Zip_PkSection
}
func NewZip_CentralDirEntry() *Zip_CentralDirEntry {
	return &Zip_CentralDirEntry{
	}
}

func (this *Zip_CentralDirEntry) Read(io *kaitai.Stream, parent *Zip_PkSection, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMadeBy = uint16(tmp39)
	tmp40, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionNeededToExtract = uint16(tmp40)
	tmp41, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp41)
	tmp42, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CompressionMethod = Zip_Compression(tmp42)
	tmp43, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LastModFileTime = uint16(tmp43)
	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LastModFileDate = uint16(tmp44)
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp45)
	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyCompressed = uint32(tmp46)
	tmp47, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyUncompressed = uint32(tmp47)
	tmp48, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenFileName = uint16(tmp48)
	tmp49, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenExtra = uint16(tmp49)
	tmp50, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenComment = uint16(tmp50)
	tmp51, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DiskNumberStart = uint16(tmp51)
	tmp52, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.IntFileAttr = uint16(tmp52)
	tmp53, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExtFileAttr = uint32(tmp53)
	tmp54, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OfsLocalHeader = int32(tmp54)
	tmp55, err := this._io.ReadBytes(int(this.LenFileName))
	if err != nil {
		return err
	}
	tmp55 = tmp55
	this.FileName = string(tmp55)
	tmp56, err := this._io.ReadBytes(int(this.LenExtra))
	if err != nil {
		return err
	}
	tmp56 = tmp56
	this._raw_Extra = tmp56
	_io__raw_Extra := kaitai.NewStream(bytes.NewReader(this._raw_Extra))
	tmp57 := NewZip_Extras()
	err = tmp57.Read(_io__raw_Extra, this, this._root)
	if err != nil {
		return err
	}
	this.Extra = tmp57
	tmp58, err := this._io.ReadBytes(int(this.LenComment))
	if err != nil {
		return err
	}
	tmp58 = tmp58
	this.Comment = string(tmp58)
	return err
}
func (this *Zip_CentralDirEntry) LocalHeader() (v *Zip_PkSection, err error) {
	if (this._f_localHeader) {
		return this.localHeader, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsLocalHeader), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp59 := NewZip_PkSection()
	err = tmp59.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.localHeader = tmp59
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_localHeader = true
	this._f_localHeader = true
	return this.localHeader, nil
}
type Zip_PkSection struct {
	Magic []byte
	SectionType uint16
	Body interface{}
	_io *kaitai.Stream
	_root *Zip
	_parent interface{}
}
func NewZip_PkSection() *Zip_PkSection {
	return &Zip_PkSection{
	}
}

func (this *Zip_PkSection) Read(io *kaitai.Stream, parent interface{}, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp60 = tmp60
	this.Magic = tmp60
	if !(bytes.Equal(this.Magic, []uint8{80, 75})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 75}, this.Magic, this._io, "/types/pk_section/seq/0")
	}
	tmp61, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectionType = uint16(tmp61)
	switch (this.SectionType) {
	case 513:
		tmp62 := NewZip_CentralDirEntry()
		err = tmp62.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp62
	case 1027:
		tmp63 := NewZip_LocalFile()
		err = tmp63.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp63
	case 1541:
		tmp64 := NewZip_EndOfCentralDir()
		err = tmp64.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp64
	case 2055:
		tmp65 := NewZip_DataDescriptor()
		err = tmp65.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp65
	}
	return err
}
type Zip_Extras struct {
	Entries []*Zip_ExtraField
	_io *kaitai.Stream
	_root *Zip
	_parent interface{}
}
func NewZip_Extras() *Zip_Extras {
	return &Zip_Extras{
	}
}

func (this *Zip_Extras) Read(io *kaitai.Stream, parent interface{}, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp66, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp66 {
			break
		}
		tmp67 := NewZip_ExtraField()
		err = tmp67.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp67)
	}
	return err
}
type Zip_LocalFileHeader struct {
	Version uint16
	Flags uint16
	CompressionMethod Zip_Compression
	FileModTime uint16
	FileModDate uint16
	Crc32 uint32
	LenBodyCompressed uint32
	LenBodyUncompressed uint32
	LenFileName uint16
	LenExtra uint16
	FileName string
	Extra *Zip_Extras
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_LocalFile
	_raw_Extra []byte
}
func NewZip_LocalFileHeader() *Zip_LocalFileHeader {
	return &Zip_LocalFileHeader{
	}
}

func (this *Zip_LocalFileHeader) Read(io *kaitai.Stream, parent *Zip_LocalFile, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp68)
	tmp69, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp69)
	tmp70, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CompressionMethod = Zip_Compression(tmp70)
	tmp71, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FileModTime = uint16(tmp71)
	tmp72, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FileModDate = uint16(tmp72)
	tmp73, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp73)
	tmp74, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyCompressed = uint32(tmp74)
	tmp75, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBodyUncompressed = uint32(tmp75)
	tmp76, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenFileName = uint16(tmp76)
	tmp77, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenExtra = uint16(tmp77)
	tmp78, err := this._io.ReadBytes(int(this.LenFileName))
	if err != nil {
		return err
	}
	tmp78 = tmp78
	this.FileName = string(tmp78)
	tmp79, err := this._io.ReadBytes(int(this.LenExtra))
	if err != nil {
		return err
	}
	tmp79 = tmp79
	this._raw_Extra = tmp79
	_io__raw_Extra := kaitai.NewStream(bytes.NewReader(this._raw_Extra))
	tmp80 := NewZip_Extras()
	err = tmp80.Read(_io__raw_Extra, this, this._root)
	if err != nil {
		return err
	}
	this.Extra = tmp80
	return err
}
type Zip_EndOfCentralDir struct {
	DiskOfEndOfCentralDir uint16
	DiskOfCentralDir uint16
	NumCentralDirEntriesOnDisk uint16
	NumCentralDirEntriesTotal uint16
	LenCentralDir uint32
	OfsCentralDir uint32
	LenComment uint16
	Comment string
	_io *kaitai.Stream
	_root *Zip
	_parent *Zip_PkSection
}
func NewZip_EndOfCentralDir() *Zip_EndOfCentralDir {
	return &Zip_EndOfCentralDir{
	}
}

func (this *Zip_EndOfCentralDir) Read(io *kaitai.Stream, parent *Zip_PkSection, root *Zip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp81, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DiskOfEndOfCentralDir = uint16(tmp81)
	tmp82, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DiskOfCentralDir = uint16(tmp82)
	tmp83, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumCentralDirEntriesOnDisk = uint16(tmp83)
	tmp84, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumCentralDirEntriesTotal = uint16(tmp84)
	tmp85, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenCentralDir = uint32(tmp85)
	tmp86, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsCentralDir = uint32(tmp86)
	tmp87, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenComment = uint16(tmp87)
	tmp88, err := this._io.ReadBytes(int(this.LenComment))
	if err != nil {
		return err
	}
	tmp88 = tmp88
	this.Comment = string(tmp88)
	return err
}
