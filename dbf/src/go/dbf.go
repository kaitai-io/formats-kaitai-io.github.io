// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">Source</a>
 */
type Dbf struct {
	Header1 *Dbf_Header1
	Header2 *Dbf_Header2
	Records [][]byte
	_io *kaitai.Stream
	_root *Dbf
	_parent interface{}
	_raw_Header2 []byte
}
func NewDbf() *Dbf {
	return &Dbf{
	}
}

func (this *Dbf) Read(io *kaitai.Stream, parent interface{}, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewDbf_Header1()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header1 = tmp1
	tmp2, err := this._io.ReadBytes(int((this.Header1.LenHeader - 12)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Header2 = tmp2
	_io__raw_Header2 := kaitai.NewStream(bytes.NewReader(this._raw_Header2))
	tmp3 := NewDbf_Header2()
	err = tmp3.Read(_io__raw_Header2, this, this._root)
	if err != nil {
		return err
	}
	this.Header2 = tmp3
	this.Records = make([][]byte, this.Header1.NumRecords)
	for i := range this.Records {
		tmp4, err := this._io.ReadBytes(int(this.Header1.LenRecord))
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this.Records[i] = tmp4
	}
	return err
}
type Dbf_Header2 struct {
	HeaderDbase3 *Dbf_HeaderDbase3
	HeaderDbase7 *Dbf_HeaderDbase7
	Fields []*Dbf_Field
	_io *kaitai.Stream
	_root *Dbf
	_parent *Dbf
}
func NewDbf_Header2() *Dbf_Header2 {
	return &Dbf_Header2{
	}
}

func (this *Dbf_Header2) Read(io *kaitai.Stream, parent *Dbf, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._root.Header1.DbaseLevel()
	if err != nil {
		return err
	}
	if (tmp5 == 3) {
		tmp6 := NewDbf_HeaderDbase3()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.HeaderDbase3 = tmp6
	}
	tmp7, err := this._root.Header1.DbaseLevel()
	if err != nil {
		return err
	}
	if (tmp7 == 7) {
		tmp8 := NewDbf_HeaderDbase7()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.HeaderDbase7 = tmp8
	}
	this.Fields = make([]*Dbf_Field, 11)
	for i := range this.Fields {
		tmp9 := NewDbf_Field()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Fields[i] = tmp9
	}
	return err
}
type Dbf_Field struct {
	Name string
	Datatype uint8
	DataAddress uint32
	Length uint8
	DecimalCount uint8
	Reserved1 []byte
	WorkAreaId uint8
	Reserved2 []byte
	SetFieldsFlag uint8
	Reserved3 []byte
	_io *kaitai.Stream
	_root *Dbf
	_parent *Dbf_Header2
}
func NewDbf_Field() *Dbf_Field {
	return &Dbf_Field{
	}
}

func (this *Dbf_Field) Read(io *kaitai.Stream, parent *Dbf_Header2, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadBytes(int(11))
	if err != nil {
		return err
	}
	tmp10 = kaitai.BytesTerminate(tmp10, 0, false)
	this.Name = string(tmp10)
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Datatype = tmp11
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataAddress = uint32(tmp12)
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Length = tmp13
	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DecimalCount = tmp14
	tmp15, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Reserved1 = tmp15
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.WorkAreaId = tmp16
	tmp17, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this.Reserved2 = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SetFieldsFlag = tmp18
	tmp19, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Reserved3 = tmp19
	return err
}

/**
 * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">- section 1.1</a>
 */
type Dbf_Header1 struct {
	Version uint8
	LastUpdateY uint8
	LastUpdateM uint8
	LastUpdateD uint8
	NumRecords uint32
	LenHeader uint16
	LenRecord uint16
	_io *kaitai.Stream
	_root *Dbf
	_parent *Dbf
	_f_dbaseLevel bool
	dbaseLevel int
}
func NewDbf_Header1() *Dbf_Header1 {
	return &Dbf_Header1{
	}
}

func (this *Dbf_Header1) Read(io *kaitai.Stream, parent *Dbf, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LastUpdateY = tmp21
	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LastUpdateM = tmp22
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LastUpdateD = tmp23
	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumRecords = uint32(tmp24)
	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenHeader = uint16(tmp25)
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenRecord = uint16(tmp26)
	return err
}
func (this *Dbf_Header1) DbaseLevel() (v int, err error) {
	if (this._f_dbaseLevel) {
		return this.dbaseLevel, nil
	}
	this.dbaseLevel = int((this.Version & 7))
	this._f_dbaseLevel = true
	return this.dbaseLevel, nil
}
type Dbf_HeaderDbase3 struct {
	Reserved1 []byte
	Reserved2 []byte
	Reserved3 []byte
	_io *kaitai.Stream
	_root *Dbf
	_parent *Dbf_Header2
}
func NewDbf_HeaderDbase3() *Dbf_HeaderDbase3 {
	return &Dbf_HeaderDbase3{
	}
}

func (this *Dbf_HeaderDbase3) Read(io *kaitai.Stream, parent *Dbf_Header2, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.Reserved1 = tmp27
	tmp28, err := this._io.ReadBytes(int(13))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Reserved2 = tmp28
	tmp29, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp29 = tmp29
	this.Reserved3 = tmp29
	return err
}
type Dbf_HeaderDbase7 struct {
	Reserved1 []byte
	HasIncompleteTransaction uint8
	DbaseIvEncryption uint8
	Reserved2 []byte
	ProductionMdx uint8
	LanguageDriverId uint8
	Reserved3 []byte
	LanguageDriverName []byte
	Reserved4 []byte
	_io *kaitai.Stream
	_root *Dbf
	_parent *Dbf_Header2
}
func NewDbf_HeaderDbase7() *Dbf_HeaderDbase7 {
	return &Dbf_HeaderDbase7{
	}
}

func (this *Dbf_HeaderDbase7) Read(io *kaitai.Stream, parent *Dbf_Header2, root *Dbf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp30 = tmp30
	this.Reserved1 = tmp30
	if !(bytes.Equal(this.Reserved1, []uint8{0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0}, this.Reserved1, this._io, "/types/header_dbase_7/seq/0")
	}
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HasIncompleteTransaction = tmp31
	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DbaseIvEncryption = tmp32
	tmp33, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp33 = tmp33
	this.Reserved2 = tmp33
	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ProductionMdx = tmp34
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LanguageDriverId = tmp35
	tmp36, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Reserved3 = tmp36
	if !(bytes.Equal(this.Reserved3, []uint8{0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0}, this.Reserved3, this._io, "/types/header_dbase_7/seq/6")
	}
	tmp37, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp37 = tmp37
	this.LanguageDriverName = tmp37
	tmp38, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.Reserved4 = tmp38
	return err
}
