// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"

type Ipv6Packet struct {
	Version uint64
	TrafficClass uint64
	FlowLabel uint64
	PayloadLength uint16
	NextHeaderType uint8
	HopLimit uint8
	SrcIpv6Addr []byte
	DstIpv6Addr []byte
	NextHeader *ProtocolBody
	Rest []byte
	_io *kaitai.Stream
	_root *Ipv6Packet
	_parent interface{}
}
func NewIpv6Packet() *Ipv6Packet {
	return &Ipv6Packet{
	}
}

func (this *Ipv6Packet) Read(io *kaitai.Stream, parent interface{}, root *Ipv6Packet) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Version = tmp1
	tmp2, err := this._io.ReadBitsIntBe(8)
	if err != nil {
		return err
	}
	this.TrafficClass = tmp2
	tmp3, err := this._io.ReadBitsIntBe(20)
	if err != nil {
		return err
	}
	this.FlowLabel = tmp3
	this._io.AlignToByte()
	tmp4, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.PayloadLength = uint16(tmp4)
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NextHeaderType = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HopLimit = tmp6
	tmp7, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.SrcIpv6Addr = tmp7
	tmp8, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.DstIpv6Addr = tmp8
	tmp9 := NewProtocolBody(this.NextHeaderType)
	err = tmp9.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NextHeader = tmp9
	tmp10, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Rest = tmp10
	return err
}
