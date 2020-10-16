// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */

type DnsPacket_ClassType int
const (
	DnsPacket_ClassType__InClass DnsPacket_ClassType = 1
	DnsPacket_ClassType__Cs DnsPacket_ClassType = 2
	DnsPacket_ClassType__Ch DnsPacket_ClassType = 3
	DnsPacket_ClassType__Hs DnsPacket_ClassType = 4
)

type DnsPacket_TypeType int
const (
	DnsPacket_TypeType__A DnsPacket_TypeType = 1
	DnsPacket_TypeType__Ns DnsPacket_TypeType = 2
	DnsPacket_TypeType__Md DnsPacket_TypeType = 3
	DnsPacket_TypeType__Mf DnsPacket_TypeType = 4
	DnsPacket_TypeType__Cname DnsPacket_TypeType = 5
	DnsPacket_TypeType__Soa DnsPacket_TypeType = 6
	DnsPacket_TypeType__Mb DnsPacket_TypeType = 7
	DnsPacket_TypeType__Mg DnsPacket_TypeType = 8
	DnsPacket_TypeType__Mr DnsPacket_TypeType = 9
	DnsPacket_TypeType__Null DnsPacket_TypeType = 10
	DnsPacket_TypeType__Wks DnsPacket_TypeType = 11
	DnsPacket_TypeType__Ptr DnsPacket_TypeType = 12
	DnsPacket_TypeType__Hinfo DnsPacket_TypeType = 13
	DnsPacket_TypeType__Minfo DnsPacket_TypeType = 14
	DnsPacket_TypeType__Mx DnsPacket_TypeType = 15
	DnsPacket_TypeType__Txt DnsPacket_TypeType = 16
	DnsPacket_TypeType__Aaaa DnsPacket_TypeType = 28
	DnsPacket_TypeType__Srv DnsPacket_TypeType = 33
)
type DnsPacket struct {
	TransactionId uint16
	Flags *DnsPacket_PacketFlags
	Qdcount uint16
	Ancount uint16
	Nscount uint16
	Arcount uint16
	Queries []*DnsPacket_Query
	Answers []*DnsPacket_Answer
	Authorities []*DnsPacket_Answer
	Additionals []*DnsPacket_Answer
	_io *kaitai.Stream
	_root *DnsPacket
	_parent interface{}
}
func NewDnsPacket() *DnsPacket {
	return &DnsPacket{
	}
}

func (this *DnsPacket) Read(io *kaitai.Stream, parent interface{}, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.TransactionId = uint16(tmp1)
	tmp2 := NewDnsPacket_PacketFlags()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp2
	tmp3, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp3) {
		tmp4, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Qdcount = uint16(tmp4)
	}
	tmp5, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp5) {
		tmp6, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Ancount = uint16(tmp6)
	}
	tmp7, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp7) {
		tmp8, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Nscount = uint16(tmp8)
	}
	tmp9, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp9) {
		tmp10, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Arcount = uint16(tmp10)
	}
	tmp11, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp11) {
		this.Queries = make([]*DnsPacket_Query, this.Qdcount)
		for i := range this.Queries {
			tmp12 := NewDnsPacket_Query()
			err = tmp12.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Queries[i] = tmp12
		}
	}
	tmp13, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp13) {
		this.Answers = make([]*DnsPacket_Answer, this.Ancount)
		for i := range this.Answers {
			tmp14 := NewDnsPacket_Answer()
			err = tmp14.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Answers[i] = tmp14
		}
	}
	tmp15, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp15) {
		this.Authorities = make([]*DnsPacket_Answer, this.Nscount)
		for i := range this.Authorities {
			tmp16 := NewDnsPacket_Answer()
			err = tmp16.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Authorities[i] = tmp16
		}
	}
	tmp17, err := this.Flags.IsOpcodeValid()
	if err != nil {
		return err
	}
	if (tmp17) {
		this.Additionals = make([]*DnsPacket_Answer, this.Arcount)
		for i := range this.Additionals {
			tmp18 := NewDnsPacket_Answer()
			err = tmp18.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Additionals[i] = tmp18
		}
	}
	return err
}

/**
 * ID to keep track of request/responces
 */

/**
 * How many questions are there
 */

/**
 * Number of resource records answering the question
 */

/**
 * Number of resource records pointing toward an authority
 */

/**
 * Number of resource records holding additional information
 */
type DnsPacket_MxInfo struct {
	Preference uint16
	Mx *DnsPacket_DomainName
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_MxInfo() *DnsPacket_MxInfo {
	return &DnsPacket_MxInfo{
	}
}

func (this *DnsPacket_MxInfo) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Preference = uint16(tmp19)
	tmp20 := NewDnsPacket_DomainName()
	err = tmp20.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Mx = tmp20
	return err
}
type DnsPacket_PointerStruct struct {
	Value uint8
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Label
	_f_contents bool
	contents *DnsPacket_DomainName
}
func NewDnsPacket_PointerStruct() *DnsPacket_PointerStruct {
	return &DnsPacket_PointerStruct{
	}
}

func (this *DnsPacket_PointerStruct) Read(io *kaitai.Stream, parent *DnsPacket_Label, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Value = tmp21
	return err
}
func (this *DnsPacket_PointerStruct) Contents() (v *DnsPacket_DomainName, err error) {
	if (this._f_contents) {
		return this.contents, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((this.Value + ((this._parent.Length - 192) << 8))), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp22 := NewDnsPacket_DomainName()
	err = tmp22.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.contents = tmp22
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_contents = true
	this._f_contents = true
	return this.contents, nil
}

/**
 * Read one byte, then offset to that position, read one domain-name and return
 */
type DnsPacket_Label struct {
	Length uint8
	Pointer *DnsPacket_PointerStruct
	Name string
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_DomainName
	_f_isPointer bool
	isPointer bool
}
func NewDnsPacket_Label() *DnsPacket_Label {
	return &DnsPacket_Label{
	}
}

func (this *DnsPacket_Label) Read(io *kaitai.Stream, parent *DnsPacket_DomainName, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Length = tmp23
	tmp24, err := this.IsPointer()
	if err != nil {
		return err
	}
	if (tmp24) {
		tmp25 := NewDnsPacket_PointerStruct()
		err = tmp25.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Pointer = tmp25
	}
	tmp26, err := this.IsPointer()
	if err != nil {
		return err
	}
	if (!(tmp26)) {
		tmp27, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this.Name = string(tmp27)
	}
	return err
}
func (this *DnsPacket_Label) IsPointer() (v bool, err error) {
	if (this._f_isPointer) {
		return this.isPointer, nil
	}
	this.isPointer = bool(this.Length >= 192)
	this._f_isPointer = true
	return this.isPointer, nil
}

/**
 * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
 */

/**
 * Otherwise its a string the length of the length value
 */
type DnsPacket_Query struct {
	Name *DnsPacket_DomainName
	Type DnsPacket_TypeType
	QueryClass DnsPacket_ClassType
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket
}
func NewDnsPacket_Query() *DnsPacket_Query {
	return &DnsPacket_Query{
	}
}

func (this *DnsPacket_Query) Read(io *kaitai.Stream, parent *DnsPacket, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28 := NewDnsPacket_DomainName()
	err = tmp28.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp28
	tmp29, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Type = DnsPacket_TypeType(tmp29)
	tmp30, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.QueryClass = DnsPacket_ClassType(tmp30)
	return err
}
type DnsPacket_DomainName struct {
	Name []*DnsPacket_Label
	_io *kaitai.Stream
	_root *DnsPacket
	_parent interface{}
}
func NewDnsPacket_DomainName() *DnsPacket_DomainName {
	return &DnsPacket_DomainName{
	}
}

func (this *DnsPacket_DomainName) Read(io *kaitai.Stream, parent interface{}, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp31 := NewDnsPacket_Label()
		err = tmp31.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp31
		this.Name = append(this.Name, _it)
		if  ((_it.Length == 0) || (_it.Length >= 192))  {
			break
		}
	}
	return err
}

/**
 * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
 */
type DnsPacket_AddressV6 struct {
	IpV6 []byte
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_AddressV6() *DnsPacket_AddressV6 {
	return &DnsPacket_AddressV6{
	}
}

func (this *DnsPacket_AddressV6) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp32 = tmp32
	this.IpV6 = tmp32
	return err
}
type DnsPacket_Service struct {
	Priority uint16
	Weight uint16
	Port uint16
	Target *DnsPacket_DomainName
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_Service() *DnsPacket_Service {
	return &DnsPacket_Service{
	}
}

func (this *DnsPacket_Service) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Priority = uint16(tmp33)
	tmp34, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Weight = uint16(tmp34)
	tmp35, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp35)
	tmp36 := NewDnsPacket_DomainName()
	err = tmp36.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Target = tmp36
	return err
}
type DnsPacket_Txt struct {
	Length uint8
	Text string
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_TxtBody
}
func NewDnsPacket_Txt() *DnsPacket_Txt {
	return &DnsPacket_Txt{
	}
}

func (this *DnsPacket_Txt) Read(io *kaitai.Stream, parent *DnsPacket_TxtBody, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Length = tmp37
	tmp38, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.Text = string(tmp38)
	return err
}
type DnsPacket_TxtBody struct {
	Data []*DnsPacket_Txt
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_TxtBody() *DnsPacket_TxtBody {
	return &DnsPacket_TxtBody{
	}
}

func (this *DnsPacket_TxtBody) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp39, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp39 {
			break
		}
		tmp40 := NewDnsPacket_Txt()
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = append(this.Data, tmp40)
	}
	return err
}
type DnsPacket_Address struct {
	Ip []byte
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_Address() *DnsPacket_Address {
	return &DnsPacket_Address{
	}
}

func (this *DnsPacket_Address) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.Ip = tmp41
	return err
}
type DnsPacket_Answer struct {
	Name *DnsPacket_DomainName
	Type DnsPacket_TypeType
	AnswerClass DnsPacket_ClassType
	Ttl int32
	Rdlength uint16
	Payload interface{}
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket
	_raw_Payload []byte
}
func NewDnsPacket_Answer() *DnsPacket_Answer {
	return &DnsPacket_Answer{
	}
}

func (this *DnsPacket_Answer) Read(io *kaitai.Stream, parent *DnsPacket, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42 := NewDnsPacket_DomainName()
	err = tmp42.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp42
	tmp43, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Type = DnsPacket_TypeType(tmp43)
	tmp44, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.AnswerClass = DnsPacket_ClassType(tmp44)
	tmp45, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Ttl = int32(tmp45)
	tmp46, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Rdlength = uint16(tmp46)
	switch (this.Type) {
	case DnsPacket_TypeType__Srv:
		tmp47, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp47 = tmp47
		this._raw_Payload = tmp47
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp48 := NewDnsPacket_Service()
		err = tmp48.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp48
	case DnsPacket_TypeType__A:
		tmp49, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp49 = tmp49
		this._raw_Payload = tmp49
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp50 := NewDnsPacket_Address()
		err = tmp50.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp50
	case DnsPacket_TypeType__Cname:
		tmp51, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp51 = tmp51
		this._raw_Payload = tmp51
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp52 := NewDnsPacket_DomainName()
		err = tmp52.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp52
	case DnsPacket_TypeType__Ns:
		tmp53, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp53 = tmp53
		this._raw_Payload = tmp53
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp54 := NewDnsPacket_DomainName()
		err = tmp54.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp54
	case DnsPacket_TypeType__Soa:
		tmp55, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp55 = tmp55
		this._raw_Payload = tmp55
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp56 := NewDnsPacket_AuthorityInfo()
		err = tmp56.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp56
	case DnsPacket_TypeType__Mx:
		tmp57, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp57 = tmp57
		this._raw_Payload = tmp57
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp58 := NewDnsPacket_MxInfo()
		err = tmp58.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp58
	case DnsPacket_TypeType__Txt:
		tmp59, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp59 = tmp59
		this._raw_Payload = tmp59
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp60 := NewDnsPacket_TxtBody()
		err = tmp60.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp60
	case DnsPacket_TypeType__Ptr:
		tmp61, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp61 = tmp61
		this._raw_Payload = tmp61
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp62 := NewDnsPacket_DomainName()
		err = tmp62.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp62
	case DnsPacket_TypeType__Aaaa:
		tmp63, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp63 = tmp63
		this._raw_Payload = tmp63
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp64 := NewDnsPacket_AddressV6()
		err = tmp64.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp64
	default:
		tmp65, err := this._io.ReadBytes(int(this.Rdlength))
		if err != nil {
			return err
		}
		tmp65 = tmp65
		this._raw_Payload = tmp65
	}
	return err
}

/**
 * Time to live (in seconds)
 */

/**
 * Length in octets of the following payload
 */
type DnsPacket_PacketFlags struct {
	Flag uint16
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket
	_f_qr bool
	qr int
	_f_ra bool
	ra int
	_f_tc bool
	tc int
	_f_isOpcodeValid bool
	isOpcodeValid bool
	_f_rcode bool
	rcode int
	_f_opcode bool
	opcode int
	_f_aa bool
	aa int
	_f_z bool
	z int
	_f_rd bool
	rd int
	_f_cd bool
	cd int
	_f_ad bool
	ad int
}
func NewDnsPacket_PacketFlags() *DnsPacket_PacketFlags {
	return &DnsPacket_PacketFlags{
	}
}

func (this *DnsPacket_PacketFlags) Read(io *kaitai.Stream, parent *DnsPacket, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp66, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Flag = uint16(tmp66)
	return err
}
func (this *DnsPacket_PacketFlags) Qr() (v int, err error) {
	if (this._f_qr) {
		return this.qr, nil
	}
	this.qr = int(((this.Flag & 32768) >> 15))
	this._f_qr = true
	return this.qr, nil
}
func (this *DnsPacket_PacketFlags) Ra() (v int, err error) {
	if (this._f_ra) {
		return this.ra, nil
	}
	this.ra = int(((this.Flag & 128) >> 7))
	this._f_ra = true
	return this.ra, nil
}
func (this *DnsPacket_PacketFlags) Tc() (v int, err error) {
	if (this._f_tc) {
		return this.tc, nil
	}
	this.tc = int(((this.Flag & 512) >> 9))
	this._f_tc = true
	return this.tc, nil
}
func (this *DnsPacket_PacketFlags) IsOpcodeValid() (v bool, err error) {
	if (this._f_isOpcodeValid) {
		return this.isOpcodeValid, nil
	}
	tmp67, err := this.Opcode()
	if err != nil {
		return false, err
	}
	tmp68, err := this.Opcode()
	if err != nil {
		return false, err
	}
	tmp69, err := this.Opcode()
	if err != nil {
		return false, err
	}
	this.isOpcodeValid = bool( ((tmp67 == 0) || (tmp68 == 1) || (tmp69 == 2)) )
	this._f_isOpcodeValid = true
	return this.isOpcodeValid, nil
}
func (this *DnsPacket_PacketFlags) Rcode() (v int, err error) {
	if (this._f_rcode) {
		return this.rcode, nil
	}
	this.rcode = int(((this.Flag & 15) >> 0))
	this._f_rcode = true
	return this.rcode, nil
}
func (this *DnsPacket_PacketFlags) Opcode() (v int, err error) {
	if (this._f_opcode) {
		return this.opcode, nil
	}
	this.opcode = int(((this.Flag & 30720) >> 11))
	this._f_opcode = true
	return this.opcode, nil
}
func (this *DnsPacket_PacketFlags) Aa() (v int, err error) {
	if (this._f_aa) {
		return this.aa, nil
	}
	this.aa = int(((this.Flag & 1024) >> 10))
	this._f_aa = true
	return this.aa, nil
}
func (this *DnsPacket_PacketFlags) Z() (v int, err error) {
	if (this._f_z) {
		return this.z, nil
	}
	this.z = int(((this.Flag & 64) >> 6))
	this._f_z = true
	return this.z, nil
}
func (this *DnsPacket_PacketFlags) Rd() (v int, err error) {
	if (this._f_rd) {
		return this.rd, nil
	}
	this.rd = int(((this.Flag & 256) >> 8))
	this._f_rd = true
	return this.rd, nil
}
func (this *DnsPacket_PacketFlags) Cd() (v int, err error) {
	if (this._f_cd) {
		return this.cd, nil
	}
	this.cd = int(((this.Flag & 16) >> 4))
	this._f_cd = true
	return this.cd, nil
}
func (this *DnsPacket_PacketFlags) Ad() (v int, err error) {
	if (this._f_ad) {
		return this.ad, nil
	}
	this.ad = int(((this.Flag & 32) >> 5))
	this._f_ad = true
	return this.ad, nil
}
type DnsPacket_AuthorityInfo struct {
	PrimaryNs *DnsPacket_DomainName
	ResoponsibleMailbox *DnsPacket_DomainName
	Serial uint32
	RefreshInterval uint32
	RetryInterval uint32
	ExpireLimit uint32
	MinTtl uint32
	_io *kaitai.Stream
	_root *DnsPacket
	_parent *DnsPacket_Answer
}
func NewDnsPacket_AuthorityInfo() *DnsPacket_AuthorityInfo {
	return &DnsPacket_AuthorityInfo{
	}
}

func (this *DnsPacket_AuthorityInfo) Read(io *kaitai.Stream, parent *DnsPacket_Answer, root *DnsPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp70 := NewDnsPacket_DomainName()
	err = tmp70.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PrimaryNs = tmp70
	tmp71 := NewDnsPacket_DomainName()
	err = tmp71.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ResoponsibleMailbox = tmp71
	tmp72, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Serial = uint32(tmp72)
	tmp73, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.RefreshInterval = uint32(tmp73)
	tmp74, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.RetryInterval = uint32(tmp74)
	tmp75, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ExpireLimit = uint32(tmp75)
	tmp76, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MinTtl = uint32(tmp76)
	return err
}
