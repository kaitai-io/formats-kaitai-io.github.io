// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">Source</a>
 */
type SomeIpSd struct {
	Flags *SomeIpSd_SdFlags
	Reserved []byte
	LenEntries uint32
	Entries *SomeIpSdEntries
	LenOptions uint32
	Options *SomeIpSdOptions
	_io *kaitai.Stream
	_root *SomeIpSd
	_parent interface{}
	_raw_Entries []byte
	_raw_Options []byte
}
func NewSomeIpSd() *SomeIpSd {
	return &SomeIpSd{
	}
}

func (this *SomeIpSd) Read(io *kaitai.Stream, parent interface{}, root *SomeIpSd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewSomeIpSd_SdFlags()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp1
	tmp2, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Reserved = tmp2
	tmp3, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenEntries = uint32(tmp3)
	tmp4, err := this._io.ReadBytes(int(this.LenEntries))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this._raw_Entries = tmp4
	_io__raw_Entries := kaitai.NewStream(bytes.NewReader(this._raw_Entries))
	tmp5 := NewSomeIpSdEntries()
	err = tmp5.Read(_io__raw_Entries, this, nil)
	if err != nil {
		return err
	}
	this.Entries = tmp5
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenOptions = uint32(tmp6)
	tmp7, err := this._io.ReadBytes(int(this.LenOptions))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this._raw_Options = tmp7
	_io__raw_Options := kaitai.NewStream(bytes.NewReader(this._raw_Options))
	tmp8 := NewSomeIpSdOptions()
	err = tmp8.Read(_io__raw_Options, this, nil)
	if err != nil {
		return err
	}
	this.Options = tmp8
	return err
}

/**
 * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
 */

/**
 * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3"
 */
type SomeIpSd_SdFlags struct {
	Reboot bool
	Unicast bool
	InitialData bool
	Reserved uint64
	_io *kaitai.Stream
	_root *SomeIpSd
	_parent *SomeIpSd
}
func NewSomeIpSd_SdFlags() *SomeIpSd_SdFlags {
	return &SomeIpSd_SdFlags{
	}
}

func (this *SomeIpSd_SdFlags) Read(io *kaitai.Stream, parent *SomeIpSd, root *SomeIpSd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reboot = tmp9 != 0
	tmp10, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Unicast = tmp10 != 0
	tmp11, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.InitialData = tmp11 != 0
	tmp12, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved = tmp12
	return err
}
