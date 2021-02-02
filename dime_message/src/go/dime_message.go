// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -L
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * | gunzip -c > scanner.dump`
 * @see <a href="https://tools.ietf.org/html/draft-nielsen-dime-02">Source</a>
 * @see <a href="https://docs.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime">Source</a>
 * @see <a href="http://imrannazar.com/Parsing-the-DIME-Message-Format">Source</a>
 */

type DimeMessage_TypeFormats int
const (
	DimeMessage_TypeFormats__Unchanged DimeMessage_TypeFormats = 0
	DimeMessage_TypeFormats__MediaType DimeMessage_TypeFormats = 1
	DimeMessage_TypeFormats__AbsoluteUri DimeMessage_TypeFormats = 2
	DimeMessage_TypeFormats__Unknown DimeMessage_TypeFormats = 3
	DimeMessage_TypeFormats__None DimeMessage_TypeFormats = 4
)
type DimeMessage struct {
	Records []*DimeMessage_Record
	_io *kaitai.Stream
	_root *DimeMessage
	_parent interface{}
}
func NewDimeMessage() *DimeMessage {
	return &DimeMessage{
	}
}

func (this *DimeMessage) Read(io *kaitai.Stream, parent interface{}, root *DimeMessage) (err error) {
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
		tmp2 := NewDimeMessage_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp2)
	}
	return err
}

/**
 * padding to the next 4-byte boundary
 */
type DimeMessage_Padding struct {
	BoundaryPadding []byte
	_io *kaitai.Stream
	_root *DimeMessage
	_parent *DimeMessage_Record
}
func NewDimeMessage_Padding() *DimeMessage_Padding {
	return &DimeMessage_Padding{
	}
}

func (this *DimeMessage_Padding) Read(io *kaitai.Stream, parent *DimeMessage_Record, root *DimeMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp3 := -(tmp4) % 4
	if tmp3 < 0 {
		tmp3 += 4
	}
	tmp5, err := this._io.ReadBytes(int(tmp3))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.BoundaryPadding = tmp5
	return err
}

/**
 * the option field of the record
 */
type DimeMessage_OptionField struct {
	OptionElements []*DimeMessage_OptionElement
	_io *kaitai.Stream
	_root *DimeMessage
	_parent *DimeMessage_Record
}
func NewDimeMessage_OptionField() *DimeMessage_OptionField {
	return &DimeMessage_OptionField{
	}
}

func (this *DimeMessage_OptionField) Read(io *kaitai.Stream, parent *DimeMessage_Record, root *DimeMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp6, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp6 {
			break
		}
		tmp7 := NewDimeMessage_OptionElement()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.OptionElements = append(this.OptionElements, tmp7)
	}
	return err
}

/**
 * one element of the option field
 */
type DimeMessage_OptionElement struct {
	ElementFormat uint16
	LenElement uint16
	ElementData []byte
	_io *kaitai.Stream
	_root *DimeMessage
	_parent *DimeMessage_OptionField
}
func NewDimeMessage_OptionElement() *DimeMessage_OptionElement {
	return &DimeMessage_OptionElement{
	}
}

func (this *DimeMessage_OptionElement) Read(io *kaitai.Stream, parent *DimeMessage_OptionField, root *DimeMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ElementFormat = uint16(tmp8)
	tmp9, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenElement = uint16(tmp9)
	tmp10, err := this._io.ReadBytes(int(this.LenElement))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.ElementData = tmp10
	return err
}

/**
 * each individual fragment of the message
 */
type DimeMessage_Record struct {
	Version uint64
	IsFirstRecord bool
	IsLastRecord bool
	IsChunkRecord bool
	TypeFormat DimeMessage_TypeFormats
	Reserved uint64
	LenOptions uint16
	LenId uint16
	LenType uint16
	LenData uint32
	Options *DimeMessage_OptionField
	OptionsPadding *DimeMessage_Padding
	Id string
	IdPadding *DimeMessage_Padding
	Type string
	TypePadding *DimeMessage_Padding
	Data []byte
	DataPadding *DimeMessage_Padding
	_io *kaitai.Stream
	_root *DimeMessage
	_parent *DimeMessage
	_raw_Options []byte
}
func NewDimeMessage_Record() *DimeMessage_Record {
	return &DimeMessage_Record{
	}
}

func (this *DimeMessage_Record) Read(io *kaitai.Stream, parent *DimeMessage, root *DimeMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Version = tmp11
	tmp12, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsFirstRecord = tmp12 != 0
	tmp13, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsLastRecord = tmp13 != 0
	tmp14, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsChunkRecord = tmp14 != 0
	tmp15, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.TypeFormat = DimeMessage_TypeFormats(tmp15)
	tmp16, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Reserved = tmp16
	this._io.AlignToByte()
	tmp17, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenOptions = uint16(tmp17)
	tmp18, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenId = uint16(tmp18)
	tmp19, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenType = uint16(tmp19)
	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp20)
	tmp21, err := this._io.ReadBytes(int(this.LenOptions))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this._raw_Options = tmp21
	_io__raw_Options := kaitai.NewStream(bytes.NewReader(this._raw_Options))
	tmp22 := NewDimeMessage_OptionField()
	err = tmp22.Read(_io__raw_Options, this, this._root)
	if err != nil {
		return err
	}
	this.Options = tmp22
	tmp23 := NewDimeMessage_Padding()
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.OptionsPadding = tmp23
	tmp24, err := this._io.ReadBytes(int(this.LenId))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Id = string(tmp24)
	tmp25 := NewDimeMessage_Padding()
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.IdPadding = tmp25
	tmp26, err := this._io.ReadBytes(int(this.LenType))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Type = string(tmp26)
	tmp27 := NewDimeMessage_Padding()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TypePadding = tmp27
	tmp28, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Data = tmp28
	tmp29 := NewDimeMessage_Padding()
	err = tmp29.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DataPadding = tmp29
	return err
}

/**
 * DIME format version (always 1)
 */

/**
 * Set if this is the first record in the message
 */

/**
 * Set if this is the last record in the message
 */

/**
 * Set if the file contained in this record is chunked into multiple records
 */

/**
 * Indicates the structure and format of the value of the TYPE field
 */

/**
 * Reserved for future use
 */

/**
 * Length of the Options field
 */

/**
 * Length of the ID field
 */

/**
 * Length of the Type field
 */

/**
 * Length of the Data field
 */

/**
 * Unique identifier of the file (set in the first record of file)
 */

/**
 * Specified type in the format set with type_format
 */

/**
 * The file data
 */
