// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type IcmpPacket_IcmpTypeEnum int
const (
	IcmpPacket_IcmpTypeEnum__EchoReply IcmpPacket_IcmpTypeEnum = 0
	IcmpPacket_IcmpTypeEnum__DestinationUnreachable IcmpPacket_IcmpTypeEnum = 3
	IcmpPacket_IcmpTypeEnum__SourceQuench IcmpPacket_IcmpTypeEnum = 4
	IcmpPacket_IcmpTypeEnum__Redirect IcmpPacket_IcmpTypeEnum = 5
	IcmpPacket_IcmpTypeEnum__Echo IcmpPacket_IcmpTypeEnum = 8
	IcmpPacket_IcmpTypeEnum__TimeExceeded IcmpPacket_IcmpTypeEnum = 11
)
type IcmpPacket struct {
	IcmpType IcmpPacket_IcmpTypeEnum
	DestinationUnreachable *IcmpPacket_DestinationUnreachableMsg
	TimeExceeded *IcmpPacket_TimeExceededMsg
	Echo *IcmpPacket_EchoMsg
	_io *kaitai.Stream
	_root *IcmpPacket
	_parent interface{}
}
func NewIcmpPacket() *IcmpPacket {
	return &IcmpPacket{
	}
}

func (this *IcmpPacket) Read(io *kaitai.Stream, parent interface{}, root *IcmpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IcmpType = IcmpPacket_IcmpTypeEnum(tmp1)
	if (this.IcmpType == IcmpPacket_IcmpTypeEnum__DestinationUnreachable) {
		tmp2 := NewIcmpPacket_DestinationUnreachableMsg()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.DestinationUnreachable = tmp2
	}
	if (this.IcmpType == IcmpPacket_IcmpTypeEnum__TimeExceeded) {
		tmp3 := NewIcmpPacket_TimeExceededMsg()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.TimeExceeded = tmp3
	}
	if ( ((this.IcmpType == IcmpPacket_IcmpTypeEnum__Echo) || (this.IcmpType == IcmpPacket_IcmpTypeEnum__EchoReply)) ) {
		tmp4 := NewIcmpPacket_EchoMsg()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Echo = tmp4
	}
	return err
}

type IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode int
const (
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__NetUnreachable IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 0
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__HostUnreachable IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 1
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__ProtocolUnreachable IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 2
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__PortUnreachable IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 3
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__FragmentationNeededAndDfSet IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 4
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__SourceRouteFailed IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 5
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__DstNetUnkown IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 6
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__SdtHostUnkown IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 7
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__SrcIsolated IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 8
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__NetProhibitedByAdmin IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 9
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__HostProhibitedByAdmin IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 10
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__NetUnreachableForTos IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 11
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__HostUnreachableForTos IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 12
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__CommunicationProhibitedByAdmin IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 13
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__HostPrecedenceViolation IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 14
	IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode__PrecedenceCuttoffInEffect IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode = 15
)
type IcmpPacket_DestinationUnreachableMsg struct {
	Code IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode
	Checksum uint16
	_io *kaitai.Stream
	_root *IcmpPacket
	_parent *IcmpPacket
}
func NewIcmpPacket_DestinationUnreachableMsg() *IcmpPacket_DestinationUnreachableMsg {
	return &IcmpPacket_DestinationUnreachableMsg{
	}
}

func (this *IcmpPacket_DestinationUnreachableMsg) Read(io *kaitai.Stream, parent *IcmpPacket, root *IcmpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode(tmp5)
	tmp6, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp6)
	return err
}

type IcmpPacket_TimeExceededMsg_TimeExceededCode int
const (
	IcmpPacket_TimeExceededMsg_TimeExceededCode__TimeToLiveExceededInTransit IcmpPacket_TimeExceededMsg_TimeExceededCode = 0
	IcmpPacket_TimeExceededMsg_TimeExceededCode__FragmentReassemblyTimeExceeded IcmpPacket_TimeExceededMsg_TimeExceededCode = 1
)
type IcmpPacket_TimeExceededMsg struct {
	Code IcmpPacket_TimeExceededMsg_TimeExceededCode
	Checksum uint16
	_io *kaitai.Stream
	_root *IcmpPacket
	_parent *IcmpPacket
}
func NewIcmpPacket_TimeExceededMsg() *IcmpPacket_TimeExceededMsg {
	return &IcmpPacket_TimeExceededMsg{
	}
}

func (this *IcmpPacket_TimeExceededMsg) Read(io *kaitai.Stream, parent *IcmpPacket, root *IcmpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = IcmpPacket_TimeExceededMsg_TimeExceededCode(tmp7)
	tmp8, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp8)
	return err
}
type IcmpPacket_EchoMsg struct {
	Code []byte
	Checksum uint16
	Identifier uint16
	SeqNum uint16
	Data []byte
	_io *kaitai.Stream
	_root *IcmpPacket
	_parent *IcmpPacket
}
func NewIcmpPacket_EchoMsg() *IcmpPacket_EchoMsg {
	return &IcmpPacket_EchoMsg{
	}
}

func (this *IcmpPacket_EchoMsg) Read(io *kaitai.Stream, parent *IcmpPacket, root *IcmpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Code = tmp9
	if !(bytes.Equal(this.Code, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Code, this._io, "/types/echo_msg/seq/0")
	}
	tmp10, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp10)
	tmp11, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Identifier = uint16(tmp11)
	tmp12, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SeqNum = uint16(tmp12)
	tmp13, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Data = tmp13
	return err
}
