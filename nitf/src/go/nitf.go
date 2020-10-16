// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"strconv"
	"bytes"
)


/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://riverloopsecurity.com).
 * @see <a href="https://gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf">Source</a>
 */
type Nitf struct {
	Header *Nitf_Header
	ImageSegments []*Nitf_ImageSegment
	GraphicsSegments []*Nitf_GraphicsSegment
	TextSegments []*Nitf_TextSegment
	DataExtensionSegments []*Nitf_DataExtensionSegment
	ReservedExtensionSegments []*Nitf_ReservedExtensionSegment
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf() *Nitf {
	return &Nitf{
	}
}

func (this *Nitf) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewNitf_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := strconv.ParseInt(this.Header.NumImageSegments, 10, 0)
	if err != nil {
		return err
	}
	this.ImageSegments = make([]*Nitf_ImageSegment, tmp2)
	for i := range this.ImageSegments {
		tmp3 := NewNitf_ImageSegment(i)
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ImageSegments[i] = tmp3
	}
	tmp4, err := strconv.ParseInt(this.Header.NumGraphicsSegments, 10, 0)
	if err != nil {
		return err
	}
	this.GraphicsSegments = make([]*Nitf_GraphicsSegment, tmp4)
	for i := range this.GraphicsSegments {
		tmp5 := NewNitf_GraphicsSegment(i)
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.GraphicsSegments[i] = tmp5
	}
	tmp6, err := strconv.ParseInt(this.Header.NumTextFiles, 10, 0)
	if err != nil {
		return err
	}
	this.TextSegments = make([]*Nitf_TextSegment, tmp6)
	for i := range this.TextSegments {
		tmp7 := NewNitf_TextSegment(i)
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.TextSegments[i] = tmp7
	}
	tmp8, err := strconv.ParseInt(this.Header.NumDataExtension, 10, 0)
	if err != nil {
		return err
	}
	this.DataExtensionSegments = make([]*Nitf_DataExtensionSegment, tmp8)
	for i := range this.DataExtensionSegments {
		tmp9 := NewNitf_DataExtensionSegment(i)
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.DataExtensionSegments[i] = tmp9
	}
	tmp10, err := strconv.ParseInt(this.Header.NumReservedExtension, 10, 0)
	if err != nil {
		return err
	}
	this.ReservedExtensionSegments = make([]*Nitf_ReservedExtensionSegment, tmp10)
	for i := range this.ReservedExtensionSegments {
		tmp11 := NewNitf_ReservedExtensionSegment(i)
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ReservedExtensionSegments[i] = tmp11
	}
	return err
}
type Nitf_ReservedExtensionSegment struct {
	ReservedSubHeader *Nitf_ReservedSubHeader
	ReservedDataField []byte
	Idx uint16
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
	_raw_ReservedSubHeader []byte
}
func NewNitf_ReservedExtensionSegment(idx uint16) *Nitf_ReservedExtensionSegment {
	return &Nitf_ReservedExtensionSegment{
		Idx: idx,
	}
}

func (this *Nitf_ReservedExtensionSegment) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := strconv.ParseInt(this._parent.Header.Lrnfo[this.Idx].LengthReservedExtensionSubheader, 10, 0)
	if err != nil {
		return err
	}
	tmp13, err := this._io.ReadBytes(int(tmp12))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this._raw_ReservedSubHeader = tmp13
	_io__raw_ReservedSubHeader := kaitai.NewStream(bytes.NewReader(this._raw_ReservedSubHeader))
	tmp14 := NewNitf_ReservedSubHeader()
	err = tmp14.Read(_io__raw_ReservedSubHeader, this, this._root)
	if err != nil {
		return err
	}
	this.ReservedSubHeader = tmp14
	tmp15, err := strconv.ParseInt(this._parent.Header.Lrnfo[this.Idx].LengthReservedExtensionSegment, 10, 0)
	if err != nil {
		return err
	}
	tmp16, err := this._io.ReadBytes(int(tmp15))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.ReservedDataField = tmp16
	return err
}
type Nitf_ImageComment struct {
	_unnamed0 string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_ImageSubHeader
}
func NewNitf_ImageComment() *Nitf_ImageComment {
	return &Nitf_ImageComment{
	}
}

func (this *Nitf_ImageComment) Read(io *kaitai.Stream, parent *Nitf_ImageSubHeader, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadBytes(int(80))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this._unnamed0 = string(tmp17)
	return err
}
type Nitf_LengthReservedInfo struct {
	LengthReservedExtensionSubheader string
	LengthReservedExtensionSegment string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_Header
}
func NewNitf_LengthReservedInfo() *Nitf_LengthReservedInfo {
	return &Nitf_LengthReservedInfo{
	}
}

func (this *Nitf_LengthReservedInfo) Read(io *kaitai.Stream, parent *Nitf_Header, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.LengthReservedExtensionSubheader = string(tmp18)
	tmp19, err := this._io.ReadBytes(int(7))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.LengthReservedExtensionSegment = string(tmp19)
	return err
}
type Nitf_Tre struct {
	ExtensionTypeId string
	EdataLength string
	Edata string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_Tre() *Nitf_Tre {
	return &Nitf_Tre{
	}
}

func (this *Nitf_Tre) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.ExtensionTypeId = string(tmp20)
	tmp21, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.EdataLength = string(tmp21)
	tmp22, err := strconv.ParseInt(this.EdataLength, 10, 0)
	if err != nil {
		return err
	}
	tmp23, err := this._io.ReadBytes(int(tmp22))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Edata = string(tmp23)
	return err
}

/**
 * RETAG or CETAG
 */

/**
 * REL or CEL
 */

/**
 * REDATA or CEDATA
 */
type Nitf_BandInfo struct {
	Representation string
	Subcategory string
	ImgFilterCondition []byte
	ImgFilterCode string
	NumLuts string
	NumLutEntries string
	Luts [][]byte
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_ImageSubHeader
}
func NewNitf_BandInfo() *Nitf_BandInfo {
	return &Nitf_BandInfo{
	}
}

func (this *Nitf_BandInfo) Read(io *kaitai.Stream, parent *Nitf_ImageSubHeader, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Representation = string(tmp24)
	tmp25, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Subcategory = string(tmp25)
	tmp26, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.ImgFilterCondition = tmp26
	if !(bytes.Equal(this.ImgFilterCondition, []uint8{78})) {
		return kaitai.NewValidationNotEqualError([]uint8{78}, this.ImgFilterCondition, this._io, "/types/band_info/seq/2")
	}
	tmp27, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.ImgFilterCode = string(tmp27)
	tmp28, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.NumLuts = string(tmp28)
	tmp29, err := strconv.ParseInt(this.NumLuts, 10, 0)
	if err != nil {
		return err
	}
	if (tmp29 != 0) {
		tmp30, err := this._io.ReadBytes(int(5))
		if err != nil {
			return err
		}
		tmp30 = tmp30
		this.NumLutEntries = string(tmp30)
	}
	tmp31, err := strconv.ParseInt(this.NumLuts, 10, 0)
	if err != nil {
		return err
	}
	this.Luts = make([][]byte, tmp31)
	for i := range this.Luts {
		tmp32, err := strconv.ParseInt(this.NumLutEntries, 10, 0)
		if err != nil {
			return err
		}
		tmp33, err := this._io.ReadBytes(int(tmp32))
		if err != nil {
			return err
		}
		tmp33 = tmp33
		this.Luts[i] = tmp33
	}
	return err
}

/**
 * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
 */

/**
 * Reserved
 */

/**
 * Number of entries in each of the LUTs for the nth image band
 */
type Nitf_ImageSegment struct {
	ImageSubHeader *Nitf_ImageSubHeader
	ImageDataMask *Nitf_ImageDataMask
	ImageDataField []byte
	Idx uint16
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
	_f_hasMask bool
	hasMask bool
}
func NewNitf_ImageSegment(idx uint16) *Nitf_ImageSegment {
	return &Nitf_ImageSegment{
		Idx: idx,
	}
}

func (this *Nitf_ImageSegment) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34 := NewNitf_ImageSubHeader()
	err = tmp34.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageSubHeader = tmp34
	tmp35, err := this.HasMask()
	if err != nil {
		return err
	}
	if (tmp35) {
		tmp36 := NewNitf_ImageDataMask()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ImageDataMask = tmp36
	}
	tmp37, err := this.HasMask()
	if err != nil {
		return err
	}
	if (tmp37) {
		tmp38, err := strconv.ParseInt(this._parent.Header.Linfo[this.Idx].LengthImageSegment, 10, 0)
		if err != nil {
			return err
		}
		tmp39, err := this.ImageDataMask.TotalSize()
		if err != nil {
			return err
		}
		tmp40, err := this._io.ReadBytes(int((tmp38 - tmp39)))
		if err != nil {
			return err
		}
		tmp40 = tmp40
		this.ImageDataField = tmp40
	}
	return err
}
func (this *Nitf_ImageSegment) HasMask() (v bool, err error) {
	if (this._f_hasMask) {
		return this.hasMask, nil
	}
	this.hasMask = bool( ((this.ImageSubHeader.ImgCompression[0:1] == "M") || (this.ImageSubHeader.ImgCompression[1:2] == "M")) )
	this._f_hasMask = true
	return this.hasMask, nil
}
type Nitf_TextSegment struct {
	TextSubHeader []byte
	TextDataField []byte
	Idx uint16
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
}
func NewNitf_TextSegment(idx uint16) *Nitf_TextSegment {
	return &Nitf_TextSegment{
		Idx: idx,
	}
}

func (this *Nitf_TextSegment) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.TextSubHeader = tmp41
	tmp42, err := strconv.ParseInt(this._parent.Header.Ltnfo[this.Idx].LengthTextSegment, 10, 0)
	if err != nil {
		return err
	}
	tmp43, err := this._io.ReadBytes(int(tmp42))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.TextDataField = tmp43
	return err
}
type Nitf_GraphicSubHeader struct {
	FilePartTypeSy []byte
	GraphicId string
	GraphicName string
	GraphicClassification *Nitf_Clasnfo
	Encryption *Nitf_Encrypt
	GraphicType []byte
	Reserved1 string
	GraphicDisplayLevel string
	GraphicAttachmentLevel string
	GraphicLocation string
	FirstGraphicBoundLoc string
	GraphicColor string
	SecondGraphicBoundLoc string
	Reserved2 string
	GraphicsExtendedSubHeader *Nitf_TreHeader
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_GraphicsSegment
}
func NewNitf_GraphicSubHeader() *Nitf_GraphicSubHeader {
	return &Nitf_GraphicSubHeader{
	}
}

func (this *Nitf_GraphicSubHeader) Read(io *kaitai.Stream, parent *Nitf_GraphicsSegment, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.FilePartTypeSy = tmp44
	if !(bytes.Equal(this.FilePartTypeSy, []uint8{83, 89})) {
		return kaitai.NewValidationNotEqualError([]uint8{83, 89}, this.FilePartTypeSy, this._io, "/types/graphic_sub_header/seq/0")
	}
	tmp45, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp45 = tmp45
	this.GraphicId = string(tmp45)
	tmp46, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this.GraphicName = string(tmp46)
	tmp47 := NewNitf_Clasnfo()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.GraphicClassification = tmp47
	tmp48 := NewNitf_Encrypt()
	err = tmp48.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Encryption = tmp48
	tmp49, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp49 = tmp49
	this.GraphicType = tmp49
	if !(bytes.Equal(this.GraphicType, []uint8{67})) {
		return kaitai.NewValidationNotEqualError([]uint8{67}, this.GraphicType, this._io, "/types/graphic_sub_header/seq/5")
	}
	tmp50, err := this._io.ReadBytes(int(13))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this.Reserved1 = string(tmp50)
	tmp51, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp51 = tmp51
	this.GraphicDisplayLevel = string(tmp51)
	tmp52, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp52 = tmp52
	this.GraphicAttachmentLevel = string(tmp52)
	tmp53, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp53 = tmp53
	this.GraphicLocation = string(tmp53)
	tmp54, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp54 = tmp54
	this.FirstGraphicBoundLoc = string(tmp54)
	tmp55, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp55 = tmp55
	this.GraphicColor = string(tmp55)
	tmp56, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp56 = tmp56
	this.SecondGraphicBoundLoc = string(tmp56)
	tmp57, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp57 = tmp57
	this.Reserved2 = string(tmp57)
	tmp58 := NewNitf_TreHeader()
	err = tmp58.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.GraphicsExtendedSubHeader = tmp58
	return err
}

/**
 * Reserved
 */

/**
 * Reserved
 */
type Nitf_Clasnfo struct {
	SecurityClass string
	SecuritySystem string
	Codewords string
	ControlAndHandling string
	Releaseability string
	DeclassType string
	DeclassDate string
	DeclassExemption string
	Downgrade string
	DowngradeDate string
	ClassText string
	ClassAuthorityType string
	ClassAuthority string
	ClassReason string
	SourceDate string
	ControlNumber string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_Clasnfo() *Nitf_Clasnfo {
	return &Nitf_Clasnfo{
	}
}

func (this *Nitf_Clasnfo) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp59 = tmp59
	this.SecurityClass = string(tmp59)
	tmp60, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp60 = tmp60
	this.SecuritySystem = string(tmp60)
	tmp61, err := this._io.ReadBytes(int(11))
	if err != nil {
		return err
	}
	tmp61 = tmp61
	this.Codewords = string(tmp61)
	tmp62, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp62 = tmp62
	this.ControlAndHandling = string(tmp62)
	tmp63, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp63 = tmp63
	this.Releaseability = string(tmp63)
	tmp64, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp64 = tmp64
	this.DeclassType = string(tmp64)
	tmp65, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp65 = tmp65
	this.DeclassDate = string(tmp65)
	tmp66, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp66 = tmp66
	this.DeclassExemption = string(tmp66)
	tmp67, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp67 = tmp67
	this.Downgrade = string(tmp67)
	tmp68, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp68 = tmp68
	this.DowngradeDate = string(tmp68)
	tmp69, err := this._io.ReadBytes(int(43))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.ClassText = string(tmp69)
	tmp70, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp70 = tmp70
	this.ClassAuthorityType = string(tmp70)
	tmp71, err := this._io.ReadBytes(int(40))
	if err != nil {
		return err
	}
	tmp71 = tmp71
	this.ClassAuthority = string(tmp71)
	tmp72, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp72 = tmp72
	this.ClassReason = string(tmp72)
	tmp73, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.SourceDate = string(tmp73)
	tmp74, err := this._io.ReadBytes(int(15))
	if err != nil {
		return err
	}
	tmp74 = tmp74
	this.ControlNumber = string(tmp74)
	return err
}
type Nitf_LengthGraphicInfo struct {
	LengthGraphicSubheader string
	LengthGraphicSegment string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_Header
}
func NewNitf_LengthGraphicInfo() *Nitf_LengthGraphicInfo {
	return &Nitf_LengthGraphicInfo{
	}
}

func (this *Nitf_LengthGraphicInfo) Read(io *kaitai.Stream, parent *Nitf_Header, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp75, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp75 = tmp75
	this.LengthGraphicSubheader = string(tmp75)
	tmp76, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp76 = tmp76
	this.LengthGraphicSegment = string(tmp76)
	return err
}
type Nitf_Encrypt struct {
	_unnamed0 string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_Encrypt() *Nitf_Encrypt {
	return &Nitf_Encrypt{
	}
}

func (this *Nitf_Encrypt) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp77, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp77 = tmp77
	this._unnamed0 = string(tmp77)
	return err
}
type Nitf_ImageDataMask struct {
	BlockedImgDataOffset uint32
	Bmrlnth uint16
	Tmrlnth uint16
	Tpxcdlnth uint16
	Tpxcd []byte
	Bmrbnd []uint32
	Tmrbnd []uint32
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_ImageSegment
	_f_hasBmr bool
	hasBmr bool
	_f_hasTmr bool
	hasTmr bool
	_f_tmrbndSize bool
	tmrbndSize int
	_f_tpxcdSize bool
	tpxcdSize int
	_f_totalSize bool
	totalSize int
	_f_bmrbndSize bool
	bmrbndSize int
	_f_bmrtmrCount bool
	bmrtmrCount int
}
func NewNitf_ImageDataMask() *Nitf_ImageDataMask {
	return &Nitf_ImageDataMask{
	}
}

func (this *Nitf_ImageDataMask) Read(io *kaitai.Stream, parent *Nitf_ImageSegment, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp78, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BlockedImgDataOffset = uint32(tmp78)
	tmp79, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Bmrlnth = uint16(tmp79)
	tmp80, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Tmrlnth = uint16(tmp80)
	tmp81, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Tpxcdlnth = uint16(tmp81)
	tmp82, err := this.TpxcdSize()
	if err != nil {
		return err
	}
	tmp83, err := this._io.ReadBytes(int(tmp82))
	if err != nil {
		return err
	}
	tmp83 = tmp83
	this.Tpxcd = tmp83
	tmp84, err := this.HasBmr()
	if err != nil {
		return err
	}
	if (tmp84) {
		tmp85, err := this.BmrtmrCount()
		if err != nil {
			return err
		}
		this.Bmrbnd = make([]uint32, tmp85)
		for i := range this.Bmrbnd {
			tmp86, err := this._io.ReadU4be()
			if err != nil {
				return err
			}
			this.Bmrbnd[i] = tmp86
		}
	}
	tmp87, err := this.HasTmr()
	if err != nil {
		return err
	}
	if (tmp87) {
		tmp88, err := this.BmrtmrCount()
		if err != nil {
			return err
		}
		this.Tmrbnd = make([]uint32, tmp88)
		for i := range this.Tmrbnd {
			tmp89, err := this._io.ReadU4be()
			if err != nil {
				return err
			}
			this.Tmrbnd[i] = tmp89
		}
	}
	return err
}
func (this *Nitf_ImageDataMask) HasBmr() (v bool, err error) {
	if (this._f_hasBmr) {
		return this.hasBmr, nil
	}
	this.hasBmr = bool(this.Bmrlnth != 0)
	this._f_hasBmr = true
	return this.hasBmr, nil
}
func (this *Nitf_ImageDataMask) HasTmr() (v bool, err error) {
	if (this._f_hasTmr) {
		return this.hasTmr, nil
	}
	this.hasTmr = bool(this.Tmrlnth != 0)
	this._f_hasTmr = true
	return this.hasTmr, nil
}
func (this *Nitf_ImageDataMask) TmrbndSize() (v int, err error) {
	if (this._f_tmrbndSize) {
		return this.tmrbndSize, nil
	}
	var tmp90 int;
	tmp91, err := this.HasTmr()
	if err != nil {
		return 0, err
	}
	if (tmp91) {
		tmp92, err := this.BmrtmrCount()
		if err != nil {
			return 0, err
		}
		tmp90 = (tmp92 * 4)
	} else {
		tmp90 = 0
	}
	this.tmrbndSize = int(tmp90)
	this._f_tmrbndSize = true
	return this.tmrbndSize, nil
}
func (this *Nitf_ImageDataMask) TpxcdSize() (v int, err error) {
	if (this._f_tpxcdSize) {
		return this.tpxcdSize, nil
	}
	var tmp93 uint16;
	tmp94 := this.Tpxcdlnth % 8
	if tmp94 < 0 {
		tmp94 += 8
	}
	if (tmp94 == 0) {
		tmp93 = this.Tpxcdlnth
	} else {
		tmp95 := this.Tpxcdlnth % 8
		if tmp95 < 0 {
			tmp95 += 8
		}
		tmp93 = (this.Tpxcdlnth + (8 - tmp95))
	}
	this.tpxcdSize = int((tmp93 / 8))
	this._f_tpxcdSize = true
	return this.tpxcdSize, nil
}
func (this *Nitf_ImageDataMask) TotalSize() (v int, err error) {
	if (this._f_totalSize) {
		return this.totalSize, nil
	}
	tmp96, err := this.TpxcdSize()
	if err != nil {
		return 0, err
	}
	tmp97, err := this.BmrbndSize()
	if err != nil {
		return 0, err
	}
	tmp98, err := this.TmrbndSize()
	if err != nil {
		return 0, err
	}
	this.totalSize = int(((((((4 + 2) + 2) + 2) + tmp96) + tmp97) + tmp98))
	this._f_totalSize = true
	return this.totalSize, nil
}
func (this *Nitf_ImageDataMask) BmrbndSize() (v int, err error) {
	if (this._f_bmrbndSize) {
		return this.bmrbndSize, nil
	}
	var tmp99 int;
	tmp100, err := this.HasBmr()
	if err != nil {
		return 0, err
	}
	if (tmp100) {
		tmp101, err := this.BmrtmrCount()
		if err != nil {
			return 0, err
		}
		tmp99 = (tmp101 * 4)
	} else {
		tmp99 = 0
	}
	this.bmrbndSize = int(tmp99)
	this._f_bmrbndSize = true
	return this.bmrbndSize, nil
}
func (this *Nitf_ImageDataMask) BmrtmrCount() (v int, err error) {
	if (this._f_bmrtmrCount) {
		return this.bmrtmrCount, nil
	}
	tmp102, err := strconv.ParseInt(this._parent.ImageSubHeader.NumBlocksPerRow, 10, 0)
	if err != nil {
		return 0, err
	}
	tmp103, err := strconv.ParseInt(this._parent.ImageSubHeader.NumBlocksPerCol, 10, 0)
	if err != nil {
		return 0, err
	}
	var tmp104 int8;
	if (this._parent.ImageSubHeader.ImgMode != "S") {
		tmp104 = 1
	} else {
		var tmp105 int;
		tmp106, err := strconv.ParseInt(this._parent.ImageSubHeader.NumBands, 10, 0)
		if err != nil {
			return 0, err
		}
		if (tmp106 != 0) {
			tmp107, err := strconv.ParseInt(this._parent.ImageSubHeader.NumBands, 10, 0)
			if err != nil {
				return 0, err
			}
			tmp105 = tmp107
		} else {
			tmp108, err := strconv.ParseInt(this._parent.ImageSubHeader.NumMultispectralBands, 10, 0)
			if err != nil {
				return 0, err
			}
			tmp105 = tmp108
		}
		tmp104 = tmp105
	}
	this.bmrtmrCount = int(((tmp102 * tmp103) * tmp104))
	this._f_bmrtmrCount = true
	return this.bmrtmrCount, nil
}

/**
 * Block Mask Record Length
 */

/**
 * Pad Pixel Mask Record Length
 */

/**
 * Pad Output Pixel Code Length
 */

/**
 * Pad Output Pixel Code
 */

/**
 * Block n, Band m Offset
 */

/**
 * Pad Pixel n, Band m
 */
type Nitf_GraphicsSegment struct {
	GraphicSubHeader *Nitf_GraphicSubHeader
	GraphicDataField []byte
	Idx uint16
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
}
func NewNitf_GraphicsSegment(idx uint16) *Nitf_GraphicsSegment {
	return &Nitf_GraphicsSegment{
		Idx: idx,
	}
}

func (this *Nitf_GraphicsSegment) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp109 := NewNitf_GraphicSubHeader()
	err = tmp109.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.GraphicSubHeader = tmp109
	tmp110, err := strconv.ParseInt(this._parent.Header.Lnnfo[this.Idx].LengthGraphicSegment, 10, 0)
	if err != nil {
		return err
	}
	tmp111, err := this._io.ReadBytes(int(tmp110))
	if err != nil {
		return err
	}
	tmp111 = tmp111
	this.GraphicDataField = tmp111
	return err
}
type Nitf_DataSubHeader struct {
	DesBase *Nitf_DataSubHeaderBase
	OverflowedHeaderType string
	DataItemOverflowed string
	DesDefinedSubheaderFieldsLen string
	Desshf string
	DesDefinedDataField string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_DataExtensionSegment
	_f_treOfl bool
	treOfl bool
}
func NewNitf_DataSubHeader() *Nitf_DataSubHeader {
	return &Nitf_DataSubHeader{
	}
}

func (this *Nitf_DataSubHeader) Read(io *kaitai.Stream, parent *Nitf_DataExtensionSegment, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp112 := NewNitf_DataSubHeaderBase()
	err = tmp112.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DesBase = tmp112
	tmp113, err := this.TreOfl()
	if err != nil {
		return err
	}
	if (tmp113) {
		tmp114, err := this._io.ReadBytes(int(6))
		if err != nil {
			return err
		}
		tmp114 = tmp114
		this.OverflowedHeaderType = string(tmp114)
	}
	tmp115, err := this.TreOfl()
	if err != nil {
		return err
	}
	if (tmp115) {
		tmp116, err := this._io.ReadBytes(int(3))
		if err != nil {
			return err
		}
		tmp116 = tmp116
		this.DataItemOverflowed = string(tmp116)
	}
	tmp117, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp117 = tmp117
	this.DesDefinedSubheaderFieldsLen = string(tmp117)
	tmp118, err := strconv.ParseInt(this.DesDefinedSubheaderFieldsLen, 10, 0)
	if err != nil {
		return err
	}
	tmp119, err := this._io.ReadBytes(int(tmp118))
	if err != nil {
		return err
	}
	tmp119 = tmp119
	this.Desshf = string(tmp119)
	tmp120, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp120 = tmp120
	this.DesDefinedDataField = string(tmp120)
	return err
}
func (this *Nitf_DataSubHeader) TreOfl() (v bool, err error) {
	if (this._f_treOfl) {
		return this.treOfl, nil
	}
	this.treOfl = bool(this.DesBase.Desid == "TRE_OVERFLOW")
	this._f_treOfl = true
	return this.treOfl, nil
}
type Nitf_DataExtensionSegment struct {
	DataSubHeader *Nitf_DataSubHeader
	DataDataField []byte
	Idx uint16
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
	_raw_DataSubHeader []byte
}
func NewNitf_DataExtensionSegment(idx uint16) *Nitf_DataExtensionSegment {
	return &Nitf_DataExtensionSegment{
		Idx: idx,
	}
}

func (this *Nitf_DataExtensionSegment) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp121, err := strconv.ParseInt(this._parent.Header.Ldnfo[this.Idx].LengthDataExtensionSubheader, 10, 0)
	if err != nil {
		return err
	}
	tmp122, err := this._io.ReadBytes(int(tmp121))
	if err != nil {
		return err
	}
	tmp122 = tmp122
	this._raw_DataSubHeader = tmp122
	_io__raw_DataSubHeader := kaitai.NewStream(bytes.NewReader(this._raw_DataSubHeader))
	tmp123 := NewNitf_DataSubHeader()
	err = tmp123.Read(_io__raw_DataSubHeader, this, this._root)
	if err != nil {
		return err
	}
	this.DataSubHeader = tmp123
	tmp124, err := strconv.ParseInt(this._parent.Header.Ldnfo[this.Idx].LengthDataExtensionSegment, 10, 0)
	if err != nil {
		return err
	}
	tmp125, err := this._io.ReadBytes(int(tmp124))
	if err != nil {
		return err
	}
	tmp125 = tmp125
	this.DataDataField = tmp125
	return err
}
type Nitf_DataSubHeaderTre struct {
	DesBase *Nitf_DataSubHeaderBase
	OverflowedHeaderType string
	DataItemOverflowed string
	DesDefinedSubheaderFieldsLen string
	DesDefinedDataField string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_DataSubHeaderTre() *Nitf_DataSubHeaderTre {
	return &Nitf_DataSubHeaderTre{
	}
}

func (this *Nitf_DataSubHeaderTre) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp126 := NewNitf_DataSubHeaderBase()
	err = tmp126.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DesBase = tmp126
	if (this.DesBase.Desid == "TRE_OVERFLOW") {
		tmp127, err := this._io.ReadBytes(int(6))
		if err != nil {
			return err
		}
		tmp127 = tmp127
		this.OverflowedHeaderType = string(tmp127)
	}
	if (this.DesBase.Desid == "TRE_OVERFLOW") {
		tmp128, err := this._io.ReadBytes(int(3))
		if err != nil {
			return err
		}
		tmp128 = tmp128
		this.DataItemOverflowed = string(tmp128)
	}
	tmp129, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp129 = tmp129
	this.DesDefinedSubheaderFieldsLen = string(tmp129)
	tmp130, err := strconv.ParseInt(this.DesDefinedSubheaderFieldsLen, 10, 0)
	if err != nil {
		return err
	}
	tmp131, err := this._io.ReadBytes(int(tmp130))
	if err != nil {
		return err
	}
	tmp131 = tmp131
	this.DesDefinedDataField = string(tmp131)
	return err
}
type Nitf_ImageSubHeader struct {
	FilePartType []byte
	ImageId1 string
	ImageDateTime *Nitf_DateTime
	TargetId string
	ImageId2 string
	ImageSecurityClassification *Nitf_Clasnfo
	Encryption *Nitf_Encrypt
	ImageSource string
	NumSigRows string
	NumSigCols string
	PixelValueType string
	ImageRepresentation string
	ImageCategory string
	ActualBitsPerPixelPerBand string
	PixelJustification string
	ImageCoordinateRep string
	ImageGeoLoc string
	NumImgComments string
	ImgComments []*Nitf_ImageComment
	ImgCompression string
	CompressionRateCode string
	NumBands string
	NumMultispectralBands string
	Bands []*Nitf_BandInfo
	ImgSyncCode string
	ImgMode string
	NumBlocksPerRow string
	NumBlocksPerCol string
	NumPixelsPerBlockHorz string
	NumPixelsPerBlockVert string
	NumPixelsPerBand string
	ImgDisplayLevel string
	AttachmentLevel string
	ImgLocation string
	ImgMagnification string
	UserDefImgDataLen string
	UserDefOverflow string
	UserDefImgData []uint8
	ImageExtendedSubHeader *Nitf_TreHeader
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_ImageSegment
}
func NewNitf_ImageSubHeader() *Nitf_ImageSubHeader {
	return &Nitf_ImageSubHeader{
	}
}

func (this *Nitf_ImageSubHeader) Read(io *kaitai.Stream, parent *Nitf_ImageSegment, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp132, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp132 = tmp132
	this.FilePartType = tmp132
	if !(bytes.Equal(this.FilePartType, []uint8{73, 77})) {
		return kaitai.NewValidationNotEqualError([]uint8{73, 77}, this.FilePartType, this._io, "/types/image_sub_header/seq/0")
	}
	tmp133, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp133 = tmp133
	this.ImageId1 = string(tmp133)
	tmp134 := NewNitf_DateTime()
	err = tmp134.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageDateTime = tmp134
	tmp135, err := this._io.ReadBytes(int(17))
	if err != nil {
		return err
	}
	tmp135 = tmp135
	this.TargetId = string(tmp135)
	tmp136, err := this._io.ReadBytes(int(80))
	if err != nil {
		return err
	}
	tmp136 = tmp136
	this.ImageId2 = string(tmp136)
	tmp137 := NewNitf_Clasnfo()
	err = tmp137.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageSecurityClassification = tmp137
	tmp138 := NewNitf_Encrypt()
	err = tmp138.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Encryption = tmp138
	tmp139, err := this._io.ReadBytes(int(42))
	if err != nil {
		return err
	}
	tmp139 = tmp139
	this.ImageSource = string(tmp139)
	tmp140, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp140 = tmp140
	this.NumSigRows = string(tmp140)
	tmp141, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp141 = tmp141
	this.NumSigCols = string(tmp141)
	tmp142, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp142 = tmp142
	this.PixelValueType = string(tmp142)
	tmp143, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp143 = tmp143
	this.ImageRepresentation = string(tmp143)
	tmp144, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp144 = tmp144
	this.ImageCategory = string(tmp144)
	tmp145, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp145 = tmp145
	this.ActualBitsPerPixelPerBand = string(tmp145)
	tmp146, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp146 = tmp146
	this.PixelJustification = string(tmp146)
	tmp147, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp147 = tmp147
	this.ImageCoordinateRep = string(tmp147)
	tmp148, err := this._io.ReadBytes(int(60))
	if err != nil {
		return err
	}
	tmp148 = tmp148
	this.ImageGeoLoc = string(tmp148)
	tmp149, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp149 = tmp149
	this.NumImgComments = string(tmp149)
	tmp150, err := strconv.ParseInt(this.NumImgComments, 10, 0)
	if err != nil {
		return err
	}
	this.ImgComments = make([]*Nitf_ImageComment, tmp150)
	for i := range this.ImgComments {
		tmp151 := NewNitf_ImageComment()
		err = tmp151.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ImgComments[i] = tmp151
	}
	tmp152, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp152 = tmp152
	this.ImgCompression = string(tmp152)
	tmp153, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp153 = tmp153
	this.CompressionRateCode = string(tmp153)
	tmp154, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp154 = tmp154
	this.NumBands = string(tmp154)
	tmp155, err := strconv.ParseInt(this.NumBands, 10, 0)
	if err != nil {
		return err
	}
	if (tmp155 == 0) {
		tmp156, err := this._io.ReadBytes(int(5))
		if err != nil {
			return err
		}
		tmp156 = tmp156
		this.NumMultispectralBands = string(tmp156)
	}
	var tmp157 int;
	tmp158, err := strconv.ParseInt(this.NumBands, 10, 0)
	if err != nil {
		return err
	}
	if (tmp158 != 0) {
		tmp159, err := strconv.ParseInt(this.NumBands, 10, 0)
		if err != nil {
			return err
		}
		tmp157 = tmp159
	} else {
		tmp160, err := strconv.ParseInt(this.NumMultispectralBands, 10, 0)
		if err != nil {
			return err
		}
		tmp157 = tmp160
	}
	this.Bands = make([]*Nitf_BandInfo, tmp157)
	for i := range this.Bands {
		tmp161 := NewNitf_BandInfo()
		err = tmp161.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Bands[i] = tmp161
	}
	tmp162, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp162 = tmp162
	this.ImgSyncCode = string(tmp162)
	tmp163, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp163 = tmp163
	this.ImgMode = string(tmp163)
	tmp164, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp164 = tmp164
	this.NumBlocksPerRow = string(tmp164)
	tmp165, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp165 = tmp165
	this.NumBlocksPerCol = string(tmp165)
	tmp166, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp166 = tmp166
	this.NumPixelsPerBlockHorz = string(tmp166)
	tmp167, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp167 = tmp167
	this.NumPixelsPerBlockVert = string(tmp167)
	tmp168, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp168 = tmp168
	this.NumPixelsPerBand = string(tmp168)
	tmp169, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp169 = tmp169
	this.ImgDisplayLevel = string(tmp169)
	tmp170, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp170 = tmp170
	this.AttachmentLevel = string(tmp170)
	tmp171, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp171 = tmp171
	this.ImgLocation = string(tmp171)
	tmp172, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp172 = tmp172
	this.ImgMagnification = string(tmp172)
	tmp173, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp173 = tmp173
	this.UserDefImgDataLen = string(tmp173)
	tmp174, err := strconv.ParseInt(this.UserDefImgDataLen, 10, 0)
	if err != nil {
		return err
	}
	if (tmp174 != 0) {
		tmp175, err := this._io.ReadBytes(int(3))
		if err != nil {
			return err
		}
		tmp175 = tmp175
		this.UserDefOverflow = string(tmp175)
	}
	tmp176, err := strconv.ParseInt(this.UserDefImgDataLen, 10, 0)
	if err != nil {
		return err
	}
	if (tmp176 > 2) {
		tmp177, err := strconv.ParseInt(this.UserDefImgDataLen, 10, 0)
		if err != nil {
			return err
		}
		this.UserDefImgData = make([]uint8, (tmp177 - 3))
		for i := range this.UserDefImgData {
			tmp178, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.UserDefImgData[i] = tmp178
		}
	}
	tmp179 := NewNitf_TreHeader()
	err = tmp179.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageExtendedSubHeader = tmp179
	return err
}

/**
 * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
 */

/**
 * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
 */

/**
 * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
 */

/**
 * Reserved for future use.
 */

/**
 * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
 */
type Nitf_ReservedSubHeader struct {
	FilePartTypeRe []byte
	ResTypeId string
	ResVersion string
	Reclasnfo *Nitf_Clasnfo
	ResUserDefinedSubheaderLength string
	ResUserDefinedSubheaderFields string
	ResUserDefinedData string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_ReservedExtensionSegment
}
func NewNitf_ReservedSubHeader() *Nitf_ReservedSubHeader {
	return &Nitf_ReservedSubHeader{
	}
}

func (this *Nitf_ReservedSubHeader) Read(io *kaitai.Stream, parent *Nitf_ReservedExtensionSegment, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp180, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp180 = tmp180
	this.FilePartTypeRe = tmp180
	if !(bytes.Equal(this.FilePartTypeRe, []uint8{82, 69})) {
		return kaitai.NewValidationNotEqualError([]uint8{82, 69}, this.FilePartTypeRe, this._io, "/types/reserved_sub_header/seq/0")
	}
	tmp181, err := this._io.ReadBytes(int(25))
	if err != nil {
		return err
	}
	tmp181 = tmp181
	this.ResTypeId = string(tmp181)
	tmp182, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp182 = tmp182
	this.ResVersion = string(tmp182)
	tmp183 := NewNitf_Clasnfo()
	err = tmp183.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Reclasnfo = tmp183
	tmp184, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp184 = tmp184
	this.ResUserDefinedSubheaderLength = string(tmp184)
	tmp185, err := strconv.ParseInt(this.ResUserDefinedSubheaderLength, 10, 0)
	if err != nil {
		return err
	}
	tmp186, err := this._io.ReadBytes(int(tmp185))
	if err != nil {
		return err
	}
	tmp186 = tmp186
	this.ResUserDefinedSubheaderFields = string(tmp186)
	tmp187, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp187 = tmp187
	this.ResUserDefinedData = string(tmp187)
	return err
}
type Nitf_DataSubHeaderBase struct {
	FilePartTypeDe []byte
	Desid string
	DataDefinitionVersion string
	Declasnfo *Nitf_Clasnfo
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_DataSubHeader
}
func NewNitf_DataSubHeaderBase() *Nitf_DataSubHeaderBase {
	return &Nitf_DataSubHeaderBase{
	}
}

func (this *Nitf_DataSubHeaderBase) Read(io *kaitai.Stream, parent *Nitf_DataSubHeader, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp188, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp188 = tmp188
	this.FilePartTypeDe = tmp188
	if !(bytes.Equal(this.FilePartTypeDe, []uint8{68, 69})) {
		return kaitai.NewValidationNotEqualError([]uint8{68, 69}, this.FilePartTypeDe, this._io, "/types/data_sub_header_base/seq/0")
	}
	tmp189, err := this._io.ReadBytes(int(25))
	if err != nil {
		return err
	}
	tmp189 = tmp189
	this.Desid = string(tmp189)
	tmp190, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp190 = tmp190
	this.DataDefinitionVersion = string(tmp190)
	tmp191 := NewNitf_Clasnfo()
	err = tmp191.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Declasnfo = tmp191
	return err
}

/**
 * File Part Type desigantor for Data Extension
 */
type Nitf_TextSubHeader struct {
	TextDateTime string
	TextTitle string
	TextSecurityClass *Nitf_Clasnfo
	Encryp *Nitf_Encrypt
	TextFormat string
	TextExtendedSubHeader *Nitf_TreHeader
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_TextSubHeader() *Nitf_TextSubHeader {
	return &Nitf_TextSubHeader{
	}
}

func (this *Nitf_TextSubHeader) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp192, err := this._io.ReadBytes(int(14))
	if err != nil {
		return err
	}
	tmp192 = tmp192
	this.TextDateTime = string(tmp192)
	tmp193, err := this._io.ReadBytes(int(80))
	if err != nil {
		return err
	}
	tmp193 = tmp193
	this.TextTitle = string(tmp193)
	tmp194 := NewNitf_Clasnfo()
	err = tmp194.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TextSecurityClass = tmp194
	tmp195 := NewNitf_Encrypt()
	err = tmp195.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Encryp = tmp195
	tmp196, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp196 = tmp196
	this.TextFormat = string(tmp196)
	tmp197 := NewNitf_TreHeader()
	err = tmp197.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TextExtendedSubHeader = tmp197
	return err
}

/**
 * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
 */
type Nitf_DateTime struct {
	_unnamed0 string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_DateTime() *Nitf_DateTime {
	return &Nitf_DateTime{
	}
}

func (this *Nitf_DateTime) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp198, err := this._io.ReadBytes(int(14))
	if err != nil {
		return err
	}
	tmp198 = tmp198
	this._unnamed0 = string(tmp198)
	return err
}

/**
 * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
 */
type Nitf_Header struct {
	FileProfileName []byte
	FileVersion []byte
	ComplexityLevel []byte
	StandardType []byte
	OriginatingStationId string
	FileDateTime *Nitf_DateTime
	FileTitle string
	FileSecurity *Nitf_Clasnfo
	FileCopyNumber string
	FileNumOfCopys string
	Encryption *Nitf_Encrypt
	FileBgColor []byte
	OriginatorName string
	OriginatorPhone string
	FileLength string
	FileHeaderLength string
	NumImageSegments string
	Linfo []*Nitf_LengthImageInfo
	NumGraphicsSegments string
	Lnnfo []*Nitf_LengthGraphicInfo
	ReservedNumx string
	NumTextFiles string
	Ltnfo []*Nitf_LengthTextInfo
	NumDataExtension string
	Ldnfo []*Nitf_LengthDataInfo
	NumReservedExtension string
	Lrnfo []*Nitf_LengthReservedInfo
	UserDefinedHeader *Nitf_TreHeader
	ExtendedHeader *Nitf_TreHeader
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf
}
func NewNitf_Header() *Nitf_Header {
	return &Nitf_Header{
	}
}

func (this *Nitf_Header) Read(io *kaitai.Stream, parent *Nitf, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp199, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp199 = tmp199
	this.FileProfileName = tmp199
	if !(bytes.Equal(this.FileProfileName, []uint8{78, 73, 84, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{78, 73, 84, 70}, this.FileProfileName, this._io, "/types/header/seq/0")
	}
	tmp200, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp200 = tmp200
	this.FileVersion = tmp200
	if !(bytes.Equal(this.FileVersion, []uint8{48, 50, 46, 49, 48})) {
		return kaitai.NewValidationNotEqualError([]uint8{48, 50, 46, 49, 48}, this.FileVersion, this._io, "/types/header/seq/1")
	}
	tmp201, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp201 = tmp201
	this.ComplexityLevel = tmp201
	tmp202, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp202 = tmp202
	this.StandardType = tmp202
	if !(bytes.Equal(this.StandardType, []uint8{66, 70, 48, 49})) {
		return kaitai.NewValidationNotEqualError([]uint8{66, 70, 48, 49}, this.StandardType, this._io, "/types/header/seq/3")
	}
	tmp203, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp203 = tmp203
	this.OriginatingStationId = string(tmp203)
	tmp204 := NewNitf_DateTime()
	err = tmp204.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FileDateTime = tmp204
	tmp205, err := this._io.ReadBytes(int(80))
	if err != nil {
		return err
	}
	tmp205 = tmp205
	this.FileTitle = string(tmp205)
	tmp206 := NewNitf_Clasnfo()
	err = tmp206.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FileSecurity = tmp206
	tmp207, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp207 = tmp207
	this.FileCopyNumber = string(tmp207)
	tmp208, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp208 = tmp208
	this.FileNumOfCopys = string(tmp208)
	tmp209 := NewNitf_Encrypt()
	err = tmp209.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Encryption = tmp209
	tmp210, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp210 = tmp210
	this.FileBgColor = tmp210
	tmp211, err := this._io.ReadBytes(int(24))
	if err != nil {
		return err
	}
	tmp211 = tmp211
	this.OriginatorName = string(tmp211)
	tmp212, err := this._io.ReadBytes(int(18))
	if err != nil {
		return err
	}
	tmp212 = tmp212
	this.OriginatorPhone = string(tmp212)
	tmp213, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp213 = tmp213
	this.FileLength = string(tmp213)
	tmp214, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp214 = tmp214
	this.FileHeaderLength = string(tmp214)
	tmp215, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp215 = tmp215
	this.NumImageSegments = string(tmp215)
	tmp216, err := strconv.ParseInt(this.NumImageSegments, 10, 0)
	if err != nil {
		return err
	}
	this.Linfo = make([]*Nitf_LengthImageInfo, tmp216)
	for i := range this.Linfo {
		tmp217 := NewNitf_LengthImageInfo()
		err = tmp217.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Linfo[i] = tmp217
	}
	tmp218, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp218 = tmp218
	this.NumGraphicsSegments = string(tmp218)
	tmp219, err := strconv.ParseInt(this.NumGraphicsSegments, 10, 0)
	if err != nil {
		return err
	}
	this.Lnnfo = make([]*Nitf_LengthGraphicInfo, tmp219)
	for i := range this.Lnnfo {
		tmp220 := NewNitf_LengthGraphicInfo()
		err = tmp220.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Lnnfo[i] = tmp220
	}
	tmp221, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp221 = tmp221
	this.ReservedNumx = string(tmp221)
	tmp222, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp222 = tmp222
	this.NumTextFiles = string(tmp222)
	tmp223, err := strconv.ParseInt(this.NumTextFiles, 10, 0)
	if err != nil {
		return err
	}
	this.Ltnfo = make([]*Nitf_LengthTextInfo, tmp223)
	for i := range this.Ltnfo {
		tmp224 := NewNitf_LengthTextInfo()
		err = tmp224.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Ltnfo[i] = tmp224
	}
	tmp225, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp225 = tmp225
	this.NumDataExtension = string(tmp225)
	tmp226, err := strconv.ParseInt(this.NumDataExtension, 10, 0)
	if err != nil {
		return err
	}
	this.Ldnfo = make([]*Nitf_LengthDataInfo, tmp226)
	for i := range this.Ldnfo {
		tmp227 := NewNitf_LengthDataInfo()
		err = tmp227.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Ldnfo[i] = tmp227
	}
	tmp228, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp228 = tmp228
	this.NumReservedExtension = string(tmp228)
	tmp229, err := strconv.ParseInt(this.NumReservedExtension, 10, 0)
	if err != nil {
		return err
	}
	this.Lrnfo = make([]*Nitf_LengthReservedInfo, tmp229)
	for i := range this.Lrnfo {
		tmp230 := NewNitf_LengthReservedInfo()
		err = tmp230.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Lrnfo[i] = tmp230
	}
	tmp231 := NewNitf_TreHeader()
	err = tmp231.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.UserDefinedHeader = tmp231
	tmp232 := NewNitf_TreHeader()
	err = tmp232.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExtendedHeader = tmp232
	return err
}

/**
 * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
 */

/**
 * Streaming file Header Data Extension Segment Subheader
 */
type Nitf_DataSubHeaderStreaming struct {
	DesBase *Nitf_DataSubHeaderBase
	DesDefinedSubheaderFieldsLen string
	SfhL1 string
	SfhDelim1 uint32
	SfhDr []uint8
	SfhDelim2 uint32
	SfhL2 string
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_DataSubHeaderStreaming() *Nitf_DataSubHeaderStreaming {
	return &Nitf_DataSubHeaderStreaming{
	}
}

func (this *Nitf_DataSubHeaderStreaming) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp233 := NewNitf_DataSubHeaderBase()
	err = tmp233.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DesBase = tmp233
	tmp234, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp234 = tmp234
	this.DesDefinedSubheaderFieldsLen = string(tmp234)
	tmp235, err := this._io.ReadBytes(int(7))
	if err != nil {
		return err
	}
	tmp235 = tmp235
	this.SfhL1 = string(tmp235)
	tmp236, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SfhDelim1 = uint32(tmp236)
	tmp237, err := strconv.ParseInt(this.SfhL1, 10, 0)
	if err != nil {
		return err
	}
	this.SfhDr = make([]uint8, tmp237)
	for i := range this.SfhDr {
		tmp238, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.SfhDr[i] = tmp238
	}
	tmp239, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SfhDelim2 = uint32(tmp239)
	tmp240, err := this._io.ReadBytes(int(7))
	if err != nil {
		return err
	}
	tmp240 = tmp240
	this.SfhL2 = string(tmp240)
	return err
}

/**
 * SFH Length 1: number of bytes in sfh_dr field
 */

/**
 * Shall contain the value 0x0A6E1D97.
 */

/**
 * Shall contain the value 0x0ECA14BF.
 */

/**
 * A repeat of sfh_l1.
 */
type Nitf_TreHeader struct {
	HeaderDataLength string
	HeaderOverflow string
	HeaderData []uint8
	_io *kaitai.Stream
	_root *Nitf
	_parent interface{}
}
func NewNitf_TreHeader() *Nitf_TreHeader {
	return &Nitf_TreHeader{
	}
}

func (this *Nitf_TreHeader) Read(io *kaitai.Stream, parent interface{}, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp241, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp241 = tmp241
	this.HeaderDataLength = string(tmp241)
	tmp242, err := strconv.ParseInt(this.HeaderDataLength, 10, 0)
	if err != nil {
		return err
	}
	if (tmp242 != 0) {
		tmp243, err := this._io.ReadBytes(int(3))
		if err != nil {
			return err
		}
		tmp243 = tmp243
		this.HeaderOverflow = string(tmp243)
	}
	tmp244, err := strconv.ParseInt(this.HeaderDataLength, 10, 0)
	if err != nil {
		return err
	}
	if (tmp244 > 2) {
		tmp245, err := strconv.ParseInt(this.HeaderDataLength, 10, 0)
		if err != nil {
			return err
		}
		this.HeaderData = make([]uint8, (tmp245 - 3))
		for i := range this.HeaderData {
			tmp246, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.HeaderData[i] = tmp246
		}
	}
	return err
}
type Nitf_LengthImageInfo struct {
	LengthImageSubheader string
	LengthImageSegment string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_Header
}
func NewNitf_LengthImageInfo() *Nitf_LengthImageInfo {
	return &Nitf_LengthImageInfo{
	}
}

func (this *Nitf_LengthImageInfo) Read(io *kaitai.Stream, parent *Nitf_Header, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp247, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp247 = tmp247
	this.LengthImageSubheader = string(tmp247)
	tmp248, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp248 = tmp248
	this.LengthImageSegment = string(tmp248)
	return err
}
type Nitf_LengthDataInfo struct {
	LengthDataExtensionSubheader string
	LengthDataExtensionSegment string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_Header
}
func NewNitf_LengthDataInfo() *Nitf_LengthDataInfo {
	return &Nitf_LengthDataInfo{
	}
}

func (this *Nitf_LengthDataInfo) Read(io *kaitai.Stream, parent *Nitf_Header, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp249, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp249 = tmp249
	this.LengthDataExtensionSubheader = string(tmp249)
	tmp250, err := this._io.ReadBytes(int(9))
	if err != nil {
		return err
	}
	tmp250 = tmp250
	this.LengthDataExtensionSegment = string(tmp250)
	return err
}
type Nitf_LengthTextInfo struct {
	LengthTextSubheader string
	LengthTextSegment string
	_io *kaitai.Stream
	_root *Nitf
	_parent *Nitf_Header
}
func NewNitf_LengthTextInfo() *Nitf_LengthTextInfo {
	return &Nitf_LengthTextInfo{
	}
}

func (this *Nitf_LengthTextInfo) Read(io *kaitai.Stream, parent *Nitf_Header, root *Nitf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp251, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp251 = tmp251
	this.LengthTextSubheader = string(tmp251)
	tmp252, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp252 = tmp252
	this.LengthTextSegment = string(tmp252)
	return err
}
