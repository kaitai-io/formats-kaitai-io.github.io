// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 * @see <a href="https://wiki.mozilla.org/Software_Update:MAR">Source</a>
 */

type MozillaMar_SignatureAlgorithms int
const (
	MozillaMar_SignatureAlgorithms__RsaPkcs1Sha1 MozillaMar_SignatureAlgorithms = 1
	MozillaMar_SignatureAlgorithms__RsaPkcs1Sha384 MozillaMar_SignatureAlgorithms = 2
)

type MozillaMar_BlockIdentifiers int
const (
	MozillaMar_BlockIdentifiers__ProductInformation MozillaMar_BlockIdentifiers = 1
)
type MozillaMar struct {
	Magic []byte
	OfsIndex uint32
	FileSize uint64
	LenSignatures uint32
	Signatures []*MozillaMar_Signature
	LenAdditionalSections uint32
	AdditionalSections []*MozillaMar_AdditionalSection
	_io *kaitai.Stream
	_root *MozillaMar
	_parent interface{}
	_f_index bool
	index *MozillaMar_MarIndex
}
func NewMozillaMar() *MozillaMar {
	return &MozillaMar{
	}
}

func (this *MozillaMar) Read(io *kaitai.Stream, parent interface{}, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{77, 65, 82, 49})) {
		return kaitai.NewValidationNotEqualError([]uint8{77, 65, 82, 49}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsIndex = uint32(tmp2)
	tmp3, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.FileSize = uint64(tmp3)
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenSignatures = uint32(tmp4)
	this.Signatures = make([]*MozillaMar_Signature, this.LenSignatures)
	for i := range this.Signatures {
		tmp5 := NewMozillaMar_Signature()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Signatures[i] = tmp5
	}
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenAdditionalSections = uint32(tmp6)
	this.AdditionalSections = make([]*MozillaMar_AdditionalSection, this.LenAdditionalSections)
	for i := range this.AdditionalSections {
		tmp7 := NewMozillaMar_AdditionalSection()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.AdditionalSections[i] = tmp7
	}
	return err
}
func (this *MozillaMar) Index() (v *MozillaMar_MarIndex, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsIndex), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp8 := NewMozillaMar_MarIndex()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.index = tmp8
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_index = true
	this._f_index = true
	return this.index, nil
}
type MozillaMar_MarIndex struct {
	LenIndex uint32
	IndexEntries *MozillaMar_IndexEntries
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar
	_raw_IndexEntries []byte
}
func NewMozillaMar_MarIndex() *MozillaMar_MarIndex {
	return &MozillaMar_MarIndex{
	}
}

func (this *MozillaMar_MarIndex) Read(io *kaitai.Stream, parent *MozillaMar, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenIndex = uint32(tmp9)
	tmp10, err := this._io.ReadBytes(int(this.LenIndex))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this._raw_IndexEntries = tmp10
	_io__raw_IndexEntries := kaitai.NewStream(bytes.NewReader(this._raw_IndexEntries))
	tmp11 := NewMozillaMar_IndexEntries()
	err = tmp11.Read(_io__raw_IndexEntries, this, this._root)
	if err != nil {
		return err
	}
	this.IndexEntries = tmp11
	return err
}
type MozillaMar_IndexEntries struct {
	IndexEntry []*MozillaMar_IndexEntry
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar_MarIndex
}
func NewMozillaMar_IndexEntries() *MozillaMar_IndexEntries {
	return &MozillaMar_IndexEntries{
	}
}

func (this *MozillaMar_IndexEntries) Read(io *kaitai.Stream, parent *MozillaMar_MarIndex, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp12 {
			break
		}
		tmp13 := NewMozillaMar_IndexEntry()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.IndexEntry = append(this.IndexEntry, tmp13)
	}
	return err
}
type MozillaMar_Signature struct {
	Algorithm MozillaMar_SignatureAlgorithms
	LenSignature uint32
	Signature []byte
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar
}
func NewMozillaMar_Signature() *MozillaMar_Signature {
	return &MozillaMar_Signature{
	}
}

func (this *MozillaMar_Signature) Read(io *kaitai.Stream, parent *MozillaMar, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Algorithm = MozillaMar_SignatureAlgorithms(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenSignature = uint32(tmp15)
	tmp16, err := this._io.ReadBytes(int(this.LenSignature))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Signature = tmp16
	return err
}
type MozillaMar_ProductInformationBlock struct {
	MarChannelName string
	ProductVersion string
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar_AdditionalSection
}
func NewMozillaMar_ProductInformationBlock() *MozillaMar_ProductInformationBlock {
	return &MozillaMar_ProductInformationBlock{
	}
}

func (this *MozillaMar_ProductInformationBlock) Read(io *kaitai.Stream, parent *MozillaMar_AdditionalSection, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp17 = kaitai.BytesTerminate(tmp17, 0, false)
	this.MarChannelName = string(tmp17)
	tmp18, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp18 = kaitai.BytesTerminate(tmp18, 0, false)
	this.ProductVersion = string(tmp18)
	return err
}
type MozillaMar_IndexEntry struct {
	OfsContent uint32
	LenContent uint32
	Flags uint32
	FileName string
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar_IndexEntries
	_f_body bool
	body []byte
}
func NewMozillaMar_IndexEntry() *MozillaMar_IndexEntry {
	return &MozillaMar_IndexEntry{
	}
}

func (this *MozillaMar_IndexEntry) Read(io *kaitai.Stream, parent *MozillaMar_IndexEntries, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsContent = uint32(tmp19)
	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenContent = uint32(tmp20)
	tmp21, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp21)
	tmp22, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.FileName = string(tmp22)
	return err
}
func (this *MozillaMar_IndexEntry) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsContent), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp23, err := thisIo.ReadBytes(int(this.LenContent))
	if err != nil {
		return nil, err
	}
	tmp23 = tmp23
	this.body = tmp23
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

/**
 * File permission bits (in standard unix-style format).
 */
type MozillaMar_AdditionalSection struct {
	LenBlock uint32
	BlockIdentifier MozillaMar_BlockIdentifiers
	Bytes interface{}
	_io *kaitai.Stream
	_root *MozillaMar
	_parent *MozillaMar
	_raw_Bytes []byte
}
func NewMozillaMar_AdditionalSection() *MozillaMar_AdditionalSection {
	return &MozillaMar_AdditionalSection{
	}
}

func (this *MozillaMar_AdditionalSection) Read(io *kaitai.Stream, parent *MozillaMar, root *MozillaMar) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenBlock = uint32(tmp24)
	tmp25, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BlockIdentifier = MozillaMar_BlockIdentifiers(tmp25)
	switch (this.BlockIdentifier) {
	case MozillaMar_BlockIdentifiers__ProductInformation:
		tmp26, err := this._io.ReadBytes(int(((this.LenBlock - 4) - 4)))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_Bytes = tmp26
		_io__raw_Bytes := kaitai.NewStream(bytes.NewReader(this._raw_Bytes))
		tmp27 := NewMozillaMar_ProductInformationBlock()
		err = tmp27.Read(_io__raw_Bytes, this, this._root)
		if err != nil {
			return err
		}
		this.Bytes = tmp27
	default:
		tmp28, err := this._io.ReadBytes(int(((this.LenBlock - 4) - 4)))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this._raw_Bytes = tmp28
	}
	return err
}
