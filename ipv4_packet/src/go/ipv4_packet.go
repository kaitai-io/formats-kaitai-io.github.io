// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)

type Ipv4Packet struct {
	B1 uint8
	B2 uint8
	TotalLength uint16
	Identification uint16
	B67 uint16
	Ttl uint8
	Protocol uint8
	HeaderChecksum uint16
	SrcIpAddr []byte
	DstIpAddr []byte
	Options *Ipv4Packet_Ipv4Options
	Body *ProtocolBody
	_io *kaitai.Stream
	_root *Ipv4Packet
	_parent interface{}
	_raw_Options []byte
	_raw_Body []byte
	_f_version bool
	version int
	_f_ihl bool
	ihl int
	_f_ihlBytes bool
	ihlBytes int
}
func NewIpv4Packet() *Ipv4Packet {
	return &Ipv4Packet{
	}
}

func (this *Ipv4Packet) Read(io *kaitai.Stream, parent interface{}, root *Ipv4Packet) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp1
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B2 = tmp2
	tmp3, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.TotalLength = uint16(tmp3)
	tmp4, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Identification = uint16(tmp4)
	tmp5, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.B67 = uint16(tmp5)
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Ttl = tmp6
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Protocol = tmp7
	tmp8, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.HeaderChecksum = uint16(tmp8)
	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.SrcIpAddr = tmp9
	tmp10, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.DstIpAddr = tmp10
	tmp11, err := this.IhlBytes()
	if err != nil {
		return err
	}
	tmp12, err := this._io.ReadBytes(int((tmp11 - 20)))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this._raw_Options = tmp12
	_io__raw_Options := kaitai.NewStream(bytes.NewReader(this._raw_Options))
	tmp13 := NewIpv4Packet_Ipv4Options()
	err = tmp13.Read(_io__raw_Options, this, this._root)
	if err != nil {
		return err
	}
	this.Options = tmp13
	tmp14, err := this.IhlBytes()
	if err != nil {
		return err
	}
	tmp15, err := this._io.ReadBytes(int((this.TotalLength - tmp14)))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this._raw_Body = tmp15
	_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
	tmp16 := NewProtocolBody(this.Protocol)
	err = tmp16.Read(_io__raw_Body, this, nil)
	if err != nil {
		return err
	}
	this.Body = tmp16
	return err
}
func (this *Ipv4Packet) Version() (v int, err error) {
	if (this._f_version) {
		return this.version, nil
	}
	this.version = int(((this.B1 & 240) >> 4))
	this._f_version = true
	return this.version, nil
}
func (this *Ipv4Packet) Ihl() (v int, err error) {
	if (this._f_ihl) {
		return this.ihl, nil
	}
	this.ihl = int((this.B1 & 15))
	this._f_ihl = true
	return this.ihl, nil
}
func (this *Ipv4Packet) IhlBytes() (v int, err error) {
	if (this._f_ihlBytes) {
		return this.ihlBytes, nil
	}
	tmp17, err := this.Ihl()
	if err != nil {
		return 0, err
	}
	this.ihlBytes = int((tmp17 * 4))
	this._f_ihlBytes = true
	return this.ihlBytes, nil
}
type Ipv4Packet_Ipv4Options struct {
	Entries []*Ipv4Packet_Ipv4Option
	_io *kaitai.Stream
	_root *Ipv4Packet
	_parent *Ipv4Packet
}
func NewIpv4Packet_Ipv4Options() *Ipv4Packet_Ipv4Options {
	return &Ipv4Packet_Ipv4Options{
	}
}

func (this *Ipv4Packet_Ipv4Options) Read(io *kaitai.Stream, parent *Ipv4Packet, root *Ipv4Packet) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp18, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp18 {
			break
		}
		tmp19 := NewIpv4Packet_Ipv4Option()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp19)
	}
	return err
}
type Ipv4Packet_Ipv4Option struct {
	B1 uint8
	Len uint8
	Body []byte
	_io *kaitai.Stream
	_root *Ipv4Packet
	_parent *Ipv4Packet_Ipv4Options
	_f_copy bool
	copy int
	_f_optClass bool
	optClass int
	_f_number bool
	number int
}
func NewIpv4Packet_Ipv4Option() *Ipv4Packet_Ipv4Option {
	return &Ipv4Packet_Ipv4Option{
	}
}

func (this *Ipv4Packet_Ipv4Option) Read(io *kaitai.Stream, parent *Ipv4Packet_Ipv4Options, root *Ipv4Packet) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp21
	var tmp22 int;
	if (this.Len > 2) {
		tmp22 = (this.Len - 2)
	} else {
		tmp22 = 0
	}
	tmp23, err := this._io.ReadBytes(int(tmp22))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Body = tmp23
	return err
}
func (this *Ipv4Packet_Ipv4Option) Copy() (v int, err error) {
	if (this._f_copy) {
		return this.copy, nil
	}
	this.copy = int(((this.B1 & 128) >> 7))
	this._f_copy = true
	return this.copy, nil
}
func (this *Ipv4Packet_Ipv4Option) OptClass() (v int, err error) {
	if (this._f_optClass) {
		return this.optClass, nil
	}
	this.optClass = int(((this.B1 & 96) >> 5))
	this._f_optClass = true
	return this.optClass, nil
}
func (this *Ipv4Packet_Ipv4Option) Number() (v int, err error) {
	if (this._f_number) {
		return this.number, nil
	}
	this.number = int((this.B1 & 31))
	this._f_number = true
	return this.number, nil
}
