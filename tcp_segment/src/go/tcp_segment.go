// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */
type TcpSegment struct {
	SrcPort uint16
	DstPort uint16
	SeqNum uint32
	AckNum uint32
	B12 uint8
	B13 uint8
	WindowSize uint16
	Checksum uint16
	UrgentPointer uint16
	Body []byte
	_io *kaitai.Stream
	_root *TcpSegment
	_parent interface{}
}
func NewTcpSegment() *TcpSegment {
	return &TcpSegment{
	}
}

func (this *TcpSegment) Read(io *kaitai.Stream, parent interface{}, root *TcpSegment) (err error) {
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
	tmp3, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SeqNum = uint32(tmp3)
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.AckNum = uint32(tmp4)
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B12 = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B13 = tmp6
	tmp7, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.WindowSize = uint16(tmp7)
	tmp8, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp8)
	tmp9, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.UrgentPointer = uint16(tmp9)
	tmp10, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Body = tmp10
	return err
}
