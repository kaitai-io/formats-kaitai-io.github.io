// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/debug/pe-format">Source</a>
 */

type MicrosoftPe_PeFormat int
const (
	MicrosoftPe_PeFormat__RomImage MicrosoftPe_PeFormat = 263
	MicrosoftPe_PeFormat__Pe32 MicrosoftPe_PeFormat = 267
	MicrosoftPe_PeFormat__Pe32Plus MicrosoftPe_PeFormat = 523
)
type MicrosoftPe struct {
	Mz *MicrosoftPe_MzPlaceholder
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent interface{}
	_f_pe bool
	pe *MicrosoftPe_PeHeader
}
func NewMicrosoftPe() *MicrosoftPe {
	return &MicrosoftPe{
	}
}

func (this *MicrosoftPe) Read(io *kaitai.Stream, parent interface{}, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewMicrosoftPe_MzPlaceholder()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Mz = tmp1
	return err
}
func (this *MicrosoftPe) Pe() (v *MicrosoftPe_PeHeader, err error) {
	if (this._f_pe) {
		return this.pe, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Mz.OfsPe), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2 := NewMicrosoftPe_PeHeader()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.pe = tmp2
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_pe = true
	this._f_pe = true
	return this.pe, nil
}

/**
 * @see <a href="https://docs.microsoft.com/en-us/windows/desktop/debug/pe-format#the-attribute-certificate-table-image-only">Source</a>
 */

type MicrosoftPe_CertificateEntry_CertificateRevision int
const (
	MicrosoftPe_CertificateEntry_CertificateRevision__Revision10 MicrosoftPe_CertificateEntry_CertificateRevision = 256
	MicrosoftPe_CertificateEntry_CertificateRevision__Revision20 MicrosoftPe_CertificateEntry_CertificateRevision = 512
)

type MicrosoftPe_CertificateEntry_CertificateTypeEnum int
const (
	MicrosoftPe_CertificateEntry_CertificateTypeEnum__X509 MicrosoftPe_CertificateEntry_CertificateTypeEnum = 1
	MicrosoftPe_CertificateEntry_CertificateTypeEnum__PkcsSignedData MicrosoftPe_CertificateEntry_CertificateTypeEnum = 2
	MicrosoftPe_CertificateEntry_CertificateTypeEnum__Reserved1 MicrosoftPe_CertificateEntry_CertificateTypeEnum = 3
	MicrosoftPe_CertificateEntry_CertificateTypeEnum__TsStackSigned MicrosoftPe_CertificateEntry_CertificateTypeEnum = 4
)
type MicrosoftPe_CertificateEntry struct {
	Length uint32
	Revision MicrosoftPe_CertificateEntry_CertificateRevision
	CertificateType MicrosoftPe_CertificateEntry_CertificateTypeEnum
	CertificateBytes []byte
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_CertificateTable
}
func NewMicrosoftPe_CertificateEntry() *MicrosoftPe_CertificateEntry {
	return &MicrosoftPe_CertificateEntry{
	}
}

func (this *MicrosoftPe_CertificateEntry) Read(io *kaitai.Stream, parent *MicrosoftPe_CertificateTable, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp3)
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Revision = MicrosoftPe_CertificateEntry_CertificateRevision(tmp4)
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CertificateType = MicrosoftPe_CertificateEntry_CertificateTypeEnum(tmp5)
	tmp6, err := this._io.ReadBytes(int((this.Length - 8)))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.CertificateBytes = tmp6
	return err
}

/**
 * Specifies the length of the attribute certificate entry.
 */

/**
 * Contains the certificate version number.
 */

/**
 * Specifies the type of content in bCertificate
 */

/**
 * Contains a certificate, such as an Authenticode signature.
 */

type MicrosoftPe_OptionalHeaderWindows_SubsystemEnum int
const (
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__Unknown MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 0
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__Native MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 1
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__WindowsGui MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 2
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__WindowsCui MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 3
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__PosixCui MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 7
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__WindowsCeGui MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 9
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__EfiApplication MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 10
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__EfiBootServiceDriver MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 11
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__EfiRuntimeDriver MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 12
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__EfiRom MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 13
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__Xbox MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 14
	MicrosoftPe_OptionalHeaderWindows_SubsystemEnum__WindowsBootApplication MicrosoftPe_OptionalHeaderWindows_SubsystemEnum = 16
)
type MicrosoftPe_OptionalHeaderWindows struct {
	ImageBase32 uint32
	ImageBase64 uint64
	SectionAlignment uint32
	FileAlignment uint32
	MajorOperatingSystemVersion uint16
	MinorOperatingSystemVersion uint16
	MajorImageVersion uint16
	MinorImageVersion uint16
	MajorSubsystemVersion uint16
	MinorSubsystemVersion uint16
	Win32VersionValue uint32
	SizeOfImage uint32
	SizeOfHeaders uint32
	CheckSum uint32
	Subsystem MicrosoftPe_OptionalHeaderWindows_SubsystemEnum
	DllCharacteristics uint16
	SizeOfStackReserve32 uint32
	SizeOfStackReserve64 uint64
	SizeOfStackCommit32 uint32
	SizeOfStackCommit64 uint64
	SizeOfHeapReserve32 uint32
	SizeOfHeapReserve64 uint64
	SizeOfHeapCommit32 uint32
	SizeOfHeapCommit64 uint64
	LoaderFlags uint32
	NumberOfRvaAndSizes uint32
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_OptionalHeader
}
func NewMicrosoftPe_OptionalHeaderWindows() *MicrosoftPe_OptionalHeaderWindows {
	return &MicrosoftPe_OptionalHeaderWindows{
	}
}

func (this *MicrosoftPe_OptionalHeaderWindows) Read(io *kaitai.Stream, parent *MicrosoftPe_OptionalHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp7, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.ImageBase32 = uint32(tmp7)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32Plus) {
		tmp8, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.ImageBase64 = uint64(tmp8)
	}
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SectionAlignment = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileAlignment = uint32(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MajorOperatingSystemVersion = uint16(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinorOperatingSystemVersion = uint16(tmp12)
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MajorImageVersion = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinorImageVersion = uint16(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MajorSubsystemVersion = uint16(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MinorSubsystemVersion = uint16(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Win32VersionValue = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfImage = uint32(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfHeaders = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CheckSum = uint32(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Subsystem = MicrosoftPe_OptionalHeaderWindows_SubsystemEnum(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DllCharacteristics = uint16(tmp22)
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp23, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.SizeOfStackReserve32 = uint32(tmp23)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32Plus) {
		tmp24, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.SizeOfStackReserve64 = uint64(tmp24)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp25, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.SizeOfStackCommit32 = uint32(tmp25)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32Plus) {
		tmp26, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.SizeOfStackCommit64 = uint64(tmp26)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp27, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.SizeOfHeapReserve32 = uint32(tmp27)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32Plus) {
		tmp28, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.SizeOfHeapReserve64 = uint64(tmp28)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp29, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.SizeOfHeapCommit32 = uint32(tmp29)
	}
	if (this._parent.Std.Format == MicrosoftPe_PeFormat__Pe32Plus) {
		tmp30, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.SizeOfHeapCommit64 = uint64(tmp30)
	}
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LoaderFlags = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumberOfRvaAndSizes = uint32(tmp32)
	return err
}
type MicrosoftPe_OptionalHeaderDataDirs struct {
	ExportTable *MicrosoftPe_DataDir
	ImportTable *MicrosoftPe_DataDir
	ResourceTable *MicrosoftPe_DataDir
	ExceptionTable *MicrosoftPe_DataDir
	CertificateTable *MicrosoftPe_DataDir
	BaseRelocationTable *MicrosoftPe_DataDir
	Debug *MicrosoftPe_DataDir
	Architecture *MicrosoftPe_DataDir
	GlobalPtr *MicrosoftPe_DataDir
	TlsTable *MicrosoftPe_DataDir
	LoadConfigTable *MicrosoftPe_DataDir
	BoundImport *MicrosoftPe_DataDir
	Iat *MicrosoftPe_DataDir
	DelayImportDescriptor *MicrosoftPe_DataDir
	ClrRuntimeHeader *MicrosoftPe_DataDir
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_OptionalHeader
}
func NewMicrosoftPe_OptionalHeaderDataDirs() *MicrosoftPe_OptionalHeaderDataDirs {
	return &MicrosoftPe_OptionalHeaderDataDirs{
	}
}

func (this *MicrosoftPe_OptionalHeaderDataDirs) Read(io *kaitai.Stream, parent *MicrosoftPe_OptionalHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33 := NewMicrosoftPe_DataDir()
	err = tmp33.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExportTable = tmp33
	tmp34 := NewMicrosoftPe_DataDir()
	err = tmp34.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImportTable = tmp34
	tmp35 := NewMicrosoftPe_DataDir()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ResourceTable = tmp35
	tmp36 := NewMicrosoftPe_DataDir()
	err = tmp36.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExceptionTable = tmp36
	tmp37 := NewMicrosoftPe_DataDir()
	err = tmp37.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CertificateTable = tmp37
	tmp38 := NewMicrosoftPe_DataDir()
	err = tmp38.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BaseRelocationTable = tmp38
	tmp39 := NewMicrosoftPe_DataDir()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Debug = tmp39
	tmp40 := NewMicrosoftPe_DataDir()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Architecture = tmp40
	tmp41 := NewMicrosoftPe_DataDir()
	err = tmp41.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.GlobalPtr = tmp41
	tmp42 := NewMicrosoftPe_DataDir()
	err = tmp42.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TlsTable = tmp42
	tmp43 := NewMicrosoftPe_DataDir()
	err = tmp43.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LoadConfigTable = tmp43
	tmp44 := NewMicrosoftPe_DataDir()
	err = tmp44.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundImport = tmp44
	tmp45 := NewMicrosoftPe_DataDir()
	err = tmp45.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Iat = tmp45
	tmp46 := NewMicrosoftPe_DataDir()
	err = tmp46.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DelayImportDescriptor = tmp46
	tmp47 := NewMicrosoftPe_DataDir()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ClrRuntimeHeader = tmp47
	return err
}
type MicrosoftPe_DataDir struct {
	VirtualAddress uint32
	Size uint32
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_OptionalHeaderDataDirs
}
func NewMicrosoftPe_DataDir() *MicrosoftPe_DataDir {
	return &MicrosoftPe_DataDir{
	}
}

func (this *MicrosoftPe_DataDir) Read(io *kaitai.Stream, parent *MicrosoftPe_OptionalHeaderDataDirs, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualAddress = uint32(tmp48)
	tmp49, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp49)
	return err
}
type MicrosoftPe_CoffSymbol struct {
	NameAnnoying *MicrosoftPe_Annoyingstring
	Value uint32
	SectionNumber uint16
	Type uint16
	StorageClass uint8
	NumberOfAuxSymbols uint8
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_CoffHeader
	_raw_NameAnnoying []byte
	_f_section bool
	section *MicrosoftPe_Section
	_f_data bool
	data []byte
}
func NewMicrosoftPe_CoffSymbol() *MicrosoftPe_CoffSymbol {
	return &MicrosoftPe_CoffSymbol{
	}
}

func (this *MicrosoftPe_CoffSymbol) Read(io *kaitai.Stream, parent *MicrosoftPe_CoffHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this._raw_NameAnnoying = tmp50
	_io__raw_NameAnnoying := kaitai.NewStream(bytes.NewReader(this._raw_NameAnnoying))
	tmp51 := NewMicrosoftPe_Annoyingstring()
	err = tmp51.Read(_io__raw_NameAnnoying, this, this._root)
	if err != nil {
		return err
	}
	this.NameAnnoying = tmp51
	tmp52, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp52)
	tmp53, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectionNumber = uint16(tmp53)
	tmp54, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = uint16(tmp54)
	tmp55, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.StorageClass = tmp55
	tmp56, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumberOfAuxSymbols = tmp56
	return err
}
func (this *MicrosoftPe_CoffSymbol) Section() (v *MicrosoftPe_Section, err error) {
	if (this._f_section) {
		return this.section, nil
	}
	tmp57, err := this._root.Pe()
	if err != nil {
		return nil, err
	}
	this.section = tmp57.Sections[(this.SectionNumber - 1)]
	this._f_section = true
	return this.section, nil
}
func (this *MicrosoftPe_CoffSymbol) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp58, err := this.Section()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp58.PointerToRawData + this.Value)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp59, err := this._io.ReadBytes(int(1))
	if err != nil {
		return nil, err
	}
	tmp59 = tmp59
	this.data = tmp59
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
type MicrosoftPe_PeHeader struct {
	PeSignature []byte
	CoffHdr *MicrosoftPe_CoffHeader
	OptionalHdr *MicrosoftPe_OptionalHeader
	Sections []*MicrosoftPe_Section
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe
	_raw_OptionalHdr []byte
	_raw_certificateTable []byte
	_f_certificateTable bool
	certificateTable *MicrosoftPe_CertificateTable
}
func NewMicrosoftPe_PeHeader() *MicrosoftPe_PeHeader {
	return &MicrosoftPe_PeHeader{
	}
}

func (this *MicrosoftPe_PeHeader) Read(io *kaitai.Stream, parent *MicrosoftPe, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp60 = tmp60
	this.PeSignature = tmp60
	if !(bytes.Equal(this.PeSignature, []uint8{80, 69, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 69, 0, 0}, this.PeSignature, this._io, "/types/pe_header/seq/0")
	}
	tmp61 := NewMicrosoftPe_CoffHeader()
	err = tmp61.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CoffHdr = tmp61
	tmp62, err := this._io.ReadBytes(int(this.CoffHdr.SizeOfOptionalHeader))
	if err != nil {
		return err
	}
	tmp62 = tmp62
	this._raw_OptionalHdr = tmp62
	_io__raw_OptionalHdr := kaitai.NewStream(bytes.NewReader(this._raw_OptionalHdr))
	tmp63 := NewMicrosoftPe_OptionalHeader()
	err = tmp63.Read(_io__raw_OptionalHdr, this, this._root)
	if err != nil {
		return err
	}
	this.OptionalHdr = tmp63
	this.Sections = make([]*MicrosoftPe_Section, this.CoffHdr.NumberOfSections)
	for i := range this.Sections {
		tmp64 := NewMicrosoftPe_Section()
		err = tmp64.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections[i] = tmp64
	}
	return err
}
func (this *MicrosoftPe_PeHeader) CertificateTable() (v *MicrosoftPe_CertificateTable, err error) {
	if (this._f_certificateTable) {
		return this.certificateTable, nil
	}
	if (this.OptionalHdr.DataDirs.CertificateTable.VirtualAddress != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.OptionalHdr.DataDirs.CertificateTable.VirtualAddress), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp65, err := this._io.ReadBytes(int(this.OptionalHdr.DataDirs.CertificateTable.Size))
		if err != nil {
			return nil, err
		}
		tmp65 = tmp65
		this._raw_certificateTable = tmp65
		_io__raw_certificateTable := kaitai.NewStream(bytes.NewReader(this._raw_certificateTable))
		tmp66 := NewMicrosoftPe_CertificateTable()
		err = tmp66.Read(_io__raw_certificateTable, this, this._root)
		if err != nil {
			return nil, err
		}
		this.certificateTable = tmp66
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_certificateTable = true
	}
	this._f_certificateTable = true
	return this.certificateTable, nil
}
type MicrosoftPe_OptionalHeader struct {
	Std *MicrosoftPe_OptionalHeaderStd
	Windows *MicrosoftPe_OptionalHeaderWindows
	DataDirs *MicrosoftPe_OptionalHeaderDataDirs
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_PeHeader
}
func NewMicrosoftPe_OptionalHeader() *MicrosoftPe_OptionalHeader {
	return &MicrosoftPe_OptionalHeader{
	}
}

func (this *MicrosoftPe_OptionalHeader) Read(io *kaitai.Stream, parent *MicrosoftPe_PeHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp67 := NewMicrosoftPe_OptionalHeaderStd()
	err = tmp67.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Std = tmp67
	tmp68 := NewMicrosoftPe_OptionalHeaderWindows()
	err = tmp68.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Windows = tmp68
	tmp69 := NewMicrosoftPe_OptionalHeaderDataDirs()
	err = tmp69.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DataDirs = tmp69
	return err
}
type MicrosoftPe_Section struct {
	Name string
	VirtualSize uint32
	VirtualAddress uint32
	SizeOfRawData uint32
	PointerToRawData uint32
	PointerToRelocations uint32
	PointerToLinenumbers uint32
	NumberOfRelocations uint16
	NumberOfLinenumbers uint16
	Characteristics uint32
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_PeHeader
	_f_body bool
	body []byte
}
func NewMicrosoftPe_Section() *MicrosoftPe_Section {
	return &MicrosoftPe_Section{
	}
}

func (this *MicrosoftPe_Section) Read(io *kaitai.Stream, parent *MicrosoftPe_PeHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp70, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp70 = kaitai.BytesStripRight(tmp70, 0)
	this.Name = string(tmp70)
	tmp71, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualSize = uint32(tmp71)
	tmp72, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VirtualAddress = uint32(tmp72)
	tmp73, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfRawData = uint32(tmp73)
	tmp74, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToRawData = uint32(tmp74)
	tmp75, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToRelocations = uint32(tmp75)
	tmp76, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToLinenumbers = uint32(tmp76)
	tmp77, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfRelocations = uint16(tmp77)
	tmp78, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfLinenumbers = uint16(tmp78)
	tmp79, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Characteristics = uint32(tmp79)
	return err
}
func (this *MicrosoftPe_Section) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.PointerToRawData), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp80, err := this._io.ReadBytes(int(this.SizeOfRawData))
	if err != nil {
		return nil, err
	}
	tmp80 = tmp80
	this.body = tmp80
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type MicrosoftPe_CertificateTable struct {
	Items []*MicrosoftPe_CertificateEntry
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_PeHeader
}
func NewMicrosoftPe_CertificateTable() *MicrosoftPe_CertificateTable {
	return &MicrosoftPe_CertificateTable{
	}
}

func (this *MicrosoftPe_CertificateTable) Read(io *kaitai.Stream, parent *MicrosoftPe_PeHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp81, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp81 {
			break
		}
		tmp82 := NewMicrosoftPe_CertificateEntry()
		err = tmp82.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp82)
	}
	return err
}
type MicrosoftPe_MzPlaceholder struct {
	Magic []byte
	Data1 []byte
	OfsPe uint32
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe
}
func NewMicrosoftPe_MzPlaceholder() *MicrosoftPe_MzPlaceholder {
	return &MicrosoftPe_MzPlaceholder{
	}
}

func (this *MicrosoftPe_MzPlaceholder) Read(io *kaitai.Stream, parent *MicrosoftPe, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp83, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp83 = tmp83
	this.Magic = tmp83
	if !(bytes.Equal(this.Magic, []uint8{77, 90})) {
		return kaitai.NewValidationNotEqualError([]uint8{77, 90}, this.Magic, this._io, "/types/mz_placeholder/seq/0")
	}
	tmp84, err := this._io.ReadBytes(int(58))
	if err != nil {
		return err
	}
	tmp84 = tmp84
	this.Data1 = tmp84
	tmp85, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsPe = uint32(tmp85)
	return err
}

/**
 * In PE file, an offset to PE header
 */
type MicrosoftPe_OptionalHeaderStd struct {
	Format MicrosoftPe_PeFormat
	MajorLinkerVersion uint8
	MinorLinkerVersion uint8
	SizeOfCode uint32
	SizeOfInitializedData uint32
	SizeOfUninitializedData uint32
	AddressOfEntryPoint uint32
	BaseOfCode uint32
	BaseOfData uint32
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_OptionalHeader
}
func NewMicrosoftPe_OptionalHeaderStd() *MicrosoftPe_OptionalHeaderStd {
	return &MicrosoftPe_OptionalHeaderStd{
	}
}

func (this *MicrosoftPe_OptionalHeaderStd) Read(io *kaitai.Stream, parent *MicrosoftPe_OptionalHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp86, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Format = MicrosoftPe_PeFormat(tmp86)
	tmp87, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MajorLinkerVersion = tmp87
	tmp88, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MinorLinkerVersion = tmp88
	tmp89, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfCode = uint32(tmp89)
	tmp90, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfInitializedData = uint32(tmp90)
	tmp91, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeOfUninitializedData = uint32(tmp91)
	tmp92, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AddressOfEntryPoint = uint32(tmp92)
	tmp93, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BaseOfCode = uint32(tmp93)
	if (this.Format == MicrosoftPe_PeFormat__Pe32) {
		tmp94, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BaseOfData = uint32(tmp94)
	}
	return err
}

/**
 * @see "3.3. COFF File Header (Object and Image)"
 */

type MicrosoftPe_CoffHeader_MachineType int
const (
	MicrosoftPe_CoffHeader_MachineType__Unknown MicrosoftPe_CoffHeader_MachineType = 0
	MicrosoftPe_CoffHeader_MachineType__I386 MicrosoftPe_CoffHeader_MachineType = 332
	MicrosoftPe_CoffHeader_MachineType__R4000 MicrosoftPe_CoffHeader_MachineType = 358
	MicrosoftPe_CoffHeader_MachineType__Wcemipsv2 MicrosoftPe_CoffHeader_MachineType = 361
	MicrosoftPe_CoffHeader_MachineType__Alpha MicrosoftPe_CoffHeader_MachineType = 388
	MicrosoftPe_CoffHeader_MachineType__Sh3 MicrosoftPe_CoffHeader_MachineType = 418
	MicrosoftPe_CoffHeader_MachineType__Sh3dsp MicrosoftPe_CoffHeader_MachineType = 419
	MicrosoftPe_CoffHeader_MachineType__Sh4 MicrosoftPe_CoffHeader_MachineType = 422
	MicrosoftPe_CoffHeader_MachineType__Sh5 MicrosoftPe_CoffHeader_MachineType = 424
	MicrosoftPe_CoffHeader_MachineType__Arm MicrosoftPe_CoffHeader_MachineType = 448
	MicrosoftPe_CoffHeader_MachineType__Thumb MicrosoftPe_CoffHeader_MachineType = 450
	MicrosoftPe_CoffHeader_MachineType__Armnt MicrosoftPe_CoffHeader_MachineType = 452
	MicrosoftPe_CoffHeader_MachineType__Am33 MicrosoftPe_CoffHeader_MachineType = 467
	MicrosoftPe_CoffHeader_MachineType__Powerpc MicrosoftPe_CoffHeader_MachineType = 496
	MicrosoftPe_CoffHeader_MachineType__Powerpcfp MicrosoftPe_CoffHeader_MachineType = 497
	MicrosoftPe_CoffHeader_MachineType__Ia64 MicrosoftPe_CoffHeader_MachineType = 512
	MicrosoftPe_CoffHeader_MachineType__Mips16 MicrosoftPe_CoffHeader_MachineType = 614
	MicrosoftPe_CoffHeader_MachineType__Mipsfpu MicrosoftPe_CoffHeader_MachineType = 870
	MicrosoftPe_CoffHeader_MachineType__Mipsfpu16 MicrosoftPe_CoffHeader_MachineType = 1126
	MicrosoftPe_CoffHeader_MachineType__Ebc MicrosoftPe_CoffHeader_MachineType = 3772
	MicrosoftPe_CoffHeader_MachineType__Riscv32 MicrosoftPe_CoffHeader_MachineType = 20530
	MicrosoftPe_CoffHeader_MachineType__Riscv64 MicrosoftPe_CoffHeader_MachineType = 20580
	MicrosoftPe_CoffHeader_MachineType__Riscv128 MicrosoftPe_CoffHeader_MachineType = 20776
	MicrosoftPe_CoffHeader_MachineType__Amd64 MicrosoftPe_CoffHeader_MachineType = 34404
	MicrosoftPe_CoffHeader_MachineType__M32r MicrosoftPe_CoffHeader_MachineType = 36929
	MicrosoftPe_CoffHeader_MachineType__Arm64 MicrosoftPe_CoffHeader_MachineType = 43620
)
type MicrosoftPe_CoffHeader struct {
	Machine MicrosoftPe_CoffHeader_MachineType
	NumberOfSections uint16
	TimeDateStamp uint32
	PointerToSymbolTable uint32
	NumberOfSymbols uint32
	SizeOfOptionalHeader uint16
	Characteristics uint16
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_PeHeader
	_f_symbolTableSize bool
	symbolTableSize int
	_f_symbolNameTableOffset bool
	symbolNameTableOffset int
	_f_symbolNameTableSize bool
	symbolNameTableSize uint32
	_f_symbolTable bool
	symbolTable []*MicrosoftPe_CoffSymbol
}
func NewMicrosoftPe_CoffHeader() *MicrosoftPe_CoffHeader {
	return &MicrosoftPe_CoffHeader{
	}
}

func (this *MicrosoftPe_CoffHeader) Read(io *kaitai.Stream, parent *MicrosoftPe_PeHeader, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp95, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Machine = MicrosoftPe_CoffHeader_MachineType(tmp95)
	tmp96, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfSections = uint16(tmp96)
	tmp97, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TimeDateStamp = uint32(tmp97)
	tmp98, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PointerToSymbolTable = uint32(tmp98)
	tmp99, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumberOfSymbols = uint32(tmp99)
	tmp100, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SizeOfOptionalHeader = uint16(tmp100)
	tmp101, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Characteristics = uint16(tmp101)
	return err
}
func (this *MicrosoftPe_CoffHeader) SymbolTableSize() (v int, err error) {
	if (this._f_symbolTableSize) {
		return this.symbolTableSize, nil
	}
	this.symbolTableSize = int((this.NumberOfSymbols * 18))
	this._f_symbolTableSize = true
	return this.symbolTableSize, nil
}
func (this *MicrosoftPe_CoffHeader) SymbolNameTableOffset() (v int, err error) {
	if (this._f_symbolNameTableOffset) {
		return this.symbolNameTableOffset, nil
	}
	tmp102, err := this.SymbolTableSize()
	if err != nil {
		return 0, err
	}
	this.symbolNameTableOffset = int((this.PointerToSymbolTable + tmp102))
	this._f_symbolNameTableOffset = true
	return this.symbolNameTableOffset, nil
}
func (this *MicrosoftPe_CoffHeader) SymbolNameTableSize() (v uint32, err error) {
	if (this._f_symbolNameTableSize) {
		return this.symbolNameTableSize, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	tmp103, err := this.SymbolNameTableOffset()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(tmp103), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp104, err := this._io.ReadU4le()
	if err != nil {
		return 0, err
	}
	this.symbolNameTableSize = tmp104
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_symbolNameTableSize = true
	this._f_symbolNameTableSize = true
	return this.symbolNameTableSize, nil
}
func (this *MicrosoftPe_CoffHeader) SymbolTable() (v []*MicrosoftPe_CoffSymbol, err error) {
	if (this._f_symbolTable) {
		return this.symbolTable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.PointerToSymbolTable), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.symbolTable = make([]*MicrosoftPe_CoffSymbol, this.NumberOfSymbols)
	for i := range this.symbolTable {
		tmp105 := NewMicrosoftPe_CoffSymbol()
		err = tmp105.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.symbolTable[i] = tmp105
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_symbolTable = true
	this._f_symbolTable = true
	return this.symbolTable, nil
}
type MicrosoftPe_Annoyingstring struct {
	_io *kaitai.Stream
	_root *MicrosoftPe
	_parent *MicrosoftPe_CoffSymbol
	_f_nameFromOffset bool
	nameFromOffset string
	_f_nameOffset bool
	nameOffset uint32
	_f_name bool
	name string
	_f_nameZeroes bool
	nameZeroes uint32
	_f_nameFromShort bool
	nameFromShort string
}
func NewMicrosoftPe_Annoyingstring() *MicrosoftPe_Annoyingstring {
	return &MicrosoftPe_Annoyingstring{
	}
}

func (this *MicrosoftPe_Annoyingstring) Read(io *kaitai.Stream, parent *MicrosoftPe_CoffSymbol, root *MicrosoftPe) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MicrosoftPe_Annoyingstring) NameFromOffset() (v string, err error) {
	if (this._f_nameFromOffset) {
		return this.nameFromOffset, nil
	}
	tmp106, err := this.NameZeroes()
	if err != nil {
		return "", err
	}
	if (tmp106 == 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return "", err
		}
		var tmp107 int;
		tmp108, err := this.NameZeroes()
		if err != nil {
			return "", err
		}
		if (tmp108 == 0) {
			tmp109, err := this._parent._parent.SymbolNameTableOffset()
			if err != nil {
				return "", err
			}
			tmp110, err := this.NameOffset()
			if err != nil {
				return "", err
			}
			tmp107 = (tmp109 + tmp110)
		} else {
			tmp107 = 0
		}
		_, err = thisIo.Seek(int64(tmp107), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp111, err := thisIo.ReadBytesTerm(0, false, true, false)
		if err != nil {
			return "", err
		}
		this.nameFromOffset = string(tmp111)
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_nameFromOffset = true
	}
	this._f_nameFromOffset = true
	return this.nameFromOffset, nil
}
func (this *MicrosoftPe_Annoyingstring) NameOffset() (v uint32, err error) {
	if (this._f_nameOffset) {
		return this.nameOffset, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(4), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp112, err := this._io.ReadU4le()
	if err != nil {
		return 0, err
	}
	this.nameOffset = tmp112
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_nameOffset = true
	this._f_nameOffset = true
	return this.nameOffset, nil
}
func (this *MicrosoftPe_Annoyingstring) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	var tmp113 string;
	tmp114, err := this.NameZeroes()
	if err != nil {
		return "", err
	}
	if (tmp114 == 0) {
		tmp115, err := this.NameFromOffset()
		if err != nil {
			return "", err
		}
		tmp113 = tmp115
	} else {
		tmp116, err := this.NameFromShort()
		if err != nil {
			return "", err
		}
		tmp113 = tmp116
	}
	this.name = string(tmp113)
	this._f_name = true
	return this.name, nil
}
func (this *MicrosoftPe_Annoyingstring) NameZeroes() (v uint32, err error) {
	if (this._f_nameZeroes) {
		return this.nameZeroes, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp117, err := this._io.ReadU4le()
	if err != nil {
		return 0, err
	}
	this.nameZeroes = tmp117
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_nameZeroes = true
	this._f_nameZeroes = true
	return this.nameZeroes, nil
}
func (this *MicrosoftPe_Annoyingstring) NameFromShort() (v string, err error) {
	if (this._f_nameFromShort) {
		return this.nameFromShort, nil
	}
	tmp118, err := this.NameZeroes()
	if err != nil {
		return "", err
	}
	if (tmp118 != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return "", err
		}
		_, err = this._io.Seek(int64(0), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp119, err := this._io.ReadBytesTerm(0, false, true, false)
		if err != nil {
			return "", err
		}
		this.nameFromShort = string(tmp119)
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_nameFromShort = true
	}
	this._f_nameFromShort = true
	return this.nameFromShort, nil
}
