// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded 
 * communication protocol which supports remoteprocedure calls, event notifications 
 * and the underlying serialization/wire format.
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf">Source</a>
 */
type SomeIp struct {
	Header *SomeIp_Header
	Payload interface{}
	_io *kaitai.Stream
	_root *SomeIp
	_parent interface{}
	_raw_Payload []byte
}
func NewSomeIp() *SomeIp {
	return &SomeIp{
	}
}

func (this *SomeIp) Read(io *kaitai.Stream, parent interface{}, root *SomeIp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewSomeIp_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this.Header.MessageId.Value()
	if err != nil {
		return err
	}
	switch (tmp2) {
	case uint32(4294934784):
		tmp3, err := this._io.ReadBytes(int((this.Header.Length - 8)))
		if err != nil {
			return err
		}
		tmp3 = tmp3
		this._raw_Payload = tmp3
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp4 := NewSomeIpSd()
		err = tmp4.Read(_io__raw_Payload, this, nil)
		if err != nil {
			return err
		}
		this.Payload = tmp4
	default:
		tmp5, err := this._io.ReadBytes(int((this.Header.Length - 8)))
		if err != nil {
			return err
		}
		tmp5 = tmp5
		this._raw_Payload = tmp5
	}
	return err
}

type SomeIp_Header_MessageTypeEnum int
const (
	SomeIp_Header_MessageTypeEnum__Request SomeIp_Header_MessageTypeEnum = 0
	SomeIp_Header_MessageTypeEnum__RequestNoReturn SomeIp_Header_MessageTypeEnum = 1
	SomeIp_Header_MessageTypeEnum__Notification SomeIp_Header_MessageTypeEnum = 2
	SomeIp_Header_MessageTypeEnum__RequestAck SomeIp_Header_MessageTypeEnum = 64
	SomeIp_Header_MessageTypeEnum__RequestNoReturnAck SomeIp_Header_MessageTypeEnum = 65
	SomeIp_Header_MessageTypeEnum__NotificationAck SomeIp_Header_MessageTypeEnum = 66
	SomeIp_Header_MessageTypeEnum__Response SomeIp_Header_MessageTypeEnum = 128
	SomeIp_Header_MessageTypeEnum__Error SomeIp_Header_MessageTypeEnum = 129
	SomeIp_Header_MessageTypeEnum__ResponseAck SomeIp_Header_MessageTypeEnum = 192
	SomeIp_Header_MessageTypeEnum__ErrorAck SomeIp_Header_MessageTypeEnum = 193
)

type SomeIp_Header_ReturnCodeEnum int
const (
	SomeIp_Header_ReturnCodeEnum__Ok SomeIp_Header_ReturnCodeEnum = 0
	SomeIp_Header_ReturnCodeEnum__NotOk SomeIp_Header_ReturnCodeEnum = 1
	SomeIp_Header_ReturnCodeEnum__UnknownService SomeIp_Header_ReturnCodeEnum = 2
	SomeIp_Header_ReturnCodeEnum__UnknownMethod SomeIp_Header_ReturnCodeEnum = 3
	SomeIp_Header_ReturnCodeEnum__NotReady SomeIp_Header_ReturnCodeEnum = 4
	SomeIp_Header_ReturnCodeEnum__NotReachable SomeIp_Header_ReturnCodeEnum = 5
	SomeIp_Header_ReturnCodeEnum__TimeOut SomeIp_Header_ReturnCodeEnum = 6
	SomeIp_Header_ReturnCodeEnum__WrongProtocolVersion SomeIp_Header_ReturnCodeEnum = 7
	SomeIp_Header_ReturnCodeEnum__WrongInterfaceVersion SomeIp_Header_ReturnCodeEnum = 8
	SomeIp_Header_ReturnCodeEnum__MalformedMessage SomeIp_Header_ReturnCodeEnum = 9
	SomeIp_Header_ReturnCodeEnum__WrongMessageType SomeIp_Header_ReturnCodeEnum = 10
)
type SomeIp_Header struct {
	MessageId *SomeIp_Header_MessageId
	Length uint32
	RequestId *SomeIp_Header_RequestId
	ProtocolVersion uint8
	InterfaceVersion uint8
	MessageType SomeIp_Header_MessageTypeEnum
	ReturnCode SomeIp_Header_ReturnCodeEnum
	_io *kaitai.Stream
	_root *SomeIp
	_parent *SomeIp
	_raw_MessageId []byte
	_raw_RequestId []byte
	_f_isValidServiceDiscovery bool
	isValidServiceDiscovery bool
}
func NewSomeIp_Header() *SomeIp_Header {
	return &SomeIp_Header{
	}
}

func (this *SomeIp_Header) Read(io *kaitai.Stream, parent *SomeIp, root *SomeIp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this._raw_MessageId = tmp6
	_io__raw_MessageId := kaitai.NewStream(bytes.NewReader(this._raw_MessageId))
	tmp7 := NewSomeIp_Header_MessageId()
	err = tmp7.Read(_io__raw_MessageId, this, this._root)
	if err != nil {
		return err
	}
	this.MessageId = tmp7
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp8)
	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this._raw_RequestId = tmp9
	_io__raw_RequestId := kaitai.NewStream(bytes.NewReader(this._raw_RequestId))
	tmp10 := NewSomeIp_Header_RequestId()
	err = tmp10.Read(_io__raw_RequestId, this, this._root)
	if err != nil {
		return err
	}
	this.RequestId = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ProtocolVersion = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InterfaceVersion = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MessageType = SomeIp_Header_MessageTypeEnum(tmp13)
	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ReturnCode = SomeIp_Header_ReturnCodeEnum(tmp14)
	return err
}

/**
 * auxillary value
 * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements"
 */
func (this *SomeIp_Header) IsValidServiceDiscovery() (v bool, err error) {
	if (this._f_isValidServiceDiscovery) {
		return this.isValidServiceDiscovery, nil
	}
	tmp15, err := this.MessageId.Value()
	if err != nil {
		return false, err
	}
	this.isValidServiceDiscovery = bool( ((tmp15 == uint32(4294934784)) && (this.ProtocolVersion == 1) && (this.InterfaceVersion == 1) && (this.MessageType == SomeIp_Header_MessageTypeEnum__Notification) && (this.ReturnCode == SomeIp_Header_ReturnCodeEnum__Ok)) )
	this._f_isValidServiceDiscovery = true
	return this.isValidServiceDiscovery, nil
}

/**
 * The Message ID shall be a 32 Bit identifier that is used to identify
 * the RPC call to a method of an application or to identify an event.
 */

/**
 * [PRS_SOMEIP_00042] Length field shall contain the length in Byte 
 * starting from Request ID/Client ID until the end of the SOME/IP message.
 */

/**
 * The Request ID allows a provider and subscriber to differentiate 
 * multiple parallel uses of the same method, event, getter or setter.
 */

/**
 * The Protocol Version identifies the used SOME/IP Header format 
 * (not including the Payload format).
 */

/**
 * Interface Version shall be an 8 Bit field that contains the 
 * MajorVersion of the Service Interface.
 */

/**
 * The Message Type field is used to differentiate different types of 
 * messages.
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4"
 */

/**
 * The Return Code shall be used to signal whether a request was 
 * successfully processed.
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5"
 */

/**
 * [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to 
 * the user. However, the Message ID shall be unique for the whole 
 * system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
 * should be handled via a comparable process.
 * [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
 * the ID with 2^16 services with 2^15 methods.        
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID"
 */
type SomeIp_Header_MessageId struct {
	ServiceId uint16
	SubId bool
	MethodId uint64
	EventId uint64
	_io *kaitai.Stream
	_root *SomeIp
	_parent *SomeIp_Header
	_f_value bool
	value uint32
}
func NewSomeIp_Header_MessageId() *SomeIp_Header_MessageId {
	return &SomeIp_Header_MessageId{
	}
}

func (this *SomeIp_Header_MessageId) Read(io *kaitai.Stream, parent *SomeIp_Header, root *SomeIp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ServiceId = uint16(tmp16)
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.SubId = tmp17 != 0
	if (this.SubId == false) {
		tmp18, err := this._io.ReadBitsIntBe(15)
		if err != nil {
			return err
		}
		this.MethodId = tmp18
	}
	if (this.SubId == true) {
		tmp19, err := this._io.ReadBitsIntBe(15)
		if err != nil {
			return err
		}
		this.EventId = tmp19
	}
	return err
}

/**
 * The value provides the undissected Message ID
 */
func (this *SomeIp_Header_MessageId) Value() (v uint32, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return 0, err
	}
	this.value = tmp20
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}

/**
 * Service ID
 */

/**
 * Single bit to flag, if there is a Method or a Event ID
 */

/**
 * Method ID
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1."
 */

/**
 * Event ID
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6"
 */

/**
 * The Request ID allows a provider and subscriber to differentiate 
 * multiple parallel usesof the same method, event, getter or setter.
 * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID"
 */
type SomeIp_Header_RequestId struct {
	ClientId uint16
	SessionId uint16
	_io *kaitai.Stream
	_root *SomeIp
	_parent *SomeIp_Header
	_f_value bool
	value uint32
}
func NewSomeIp_Header_RequestId() *SomeIp_Header_RequestId {
	return &SomeIp_Header_RequestId{
	}
}

func (this *SomeIp_Header_RequestId) Read(io *kaitai.Stream, parent *SomeIp_Header, root *SomeIp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ClientId = uint16(tmp21)
	tmp22, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SessionId = uint16(tmp22)
	return err
}

/**
 * The value provides the undissected Request ID
 */
func (this *SomeIp_Header_RequestId) Value() (v uint32, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp23, err := this._io.ReadU4be()
	if err != nil {
		return 0, err
	}
	this.value = tmp23
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}
