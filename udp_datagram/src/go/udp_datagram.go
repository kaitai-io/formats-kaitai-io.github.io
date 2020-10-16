// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * UDP is a simple stateless transport layer (AKA OSI layer 4)
 * protocol, one of the core Internet protocols. It provides source and
 * destination ports, basic checksumming, but provides not guarantees
 * of delivery, order of packets, or duplicate delivery.
 */
type UdpDatagram struct {
	SrcPort uint16
	DstPort uint16
	Length uint16
	Checksum uint16
	Body []byte
	_io *kaitai.Stream
	_root *UdpDatagram
	_parent interface{}
}
func NewUdpDatagram() *UdpDatagram {
	return &UdpDatagram{
	}
}

func (this *UdpDatagram) Read(io *kaitai.Stream, parent interface{}, root *UdpDatagram) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SrcPort = uint16(tmp1)
	tmp2, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DstPort = uint16(tmp2)
	tmp3, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp3)
	tmp4, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp4)
	tmp5, err := this._io.ReadBytes(int((this.Length - 8)))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Body = tmp5
	return err
}
