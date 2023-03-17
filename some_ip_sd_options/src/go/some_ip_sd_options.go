// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -">section 4.1.2.4 Options Format</a>
 */
type SomeIpSdOptions struct {
	Entries []*SomeIpSdOptions_SdOption
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent interface{}
}
func NewSomeIpSdOptions() *SomeIpSdOptions {
	return &SomeIpSdOptions{
	}
}

func (this *SomeIpSdOptions) Read(io *kaitai.Stream, parent interface{}, root *SomeIpSdOptions) (err error) {
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
		tmp2 := NewSomeIpSdOptions_SdOption()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp2)
	}
	return err
}

type SomeIpSdOptions_SdOption_OptionTypes int
const (
	SomeIpSdOptions_SdOption_OptionTypes__ConfigurationOption SomeIpSdOptions_SdOption_OptionTypes = 1
	SomeIpSdOptions_SdOption_OptionTypes__LoadBalancingOption SomeIpSdOptions_SdOption_OptionTypes = 2
	SomeIpSdOptions_SdOption_OptionTypes__Ipv4EndpointOption SomeIpSdOptions_SdOption_OptionTypes = 4
	SomeIpSdOptions_SdOption_OptionTypes__Ipv6EndpointOption SomeIpSdOptions_SdOption_OptionTypes = 6
	SomeIpSdOptions_SdOption_OptionTypes__Ipv4MulticastOption SomeIpSdOptions_SdOption_OptionTypes = 20
	SomeIpSdOptions_SdOption_OptionTypes__Ipv6MulticastOption SomeIpSdOptions_SdOption_OptionTypes = 22
	SomeIpSdOptions_SdOption_OptionTypes__Ipv4SdEndpointOption SomeIpSdOptions_SdOption_OptionTypes = 36
	SomeIpSdOptions_SdOption_OptionTypes__Ipv6SdEndpointOption SomeIpSdOptions_SdOption_OptionTypes = 38
)
type SomeIpSdOptions_SdOption struct {
	Header *SomeIpSdOptions_SdOption_SdOptionHeader
	Content interface{}
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions
}
func NewSomeIpSdOptions_SdOption() *SomeIpSdOptions_SdOption {
	return &SomeIpSdOptions_SdOption{
	}
}

func (this *SomeIpSdOptions_SdOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewSomeIpSdOptions_SdOption_SdOptionHeader()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	switch (this.Header.Type) {
	case SomeIpSdOptions_SdOption_OptionTypes__LoadBalancingOption:
		tmp4 := NewSomeIpSdOptions_SdOption_SdLoadBalancingOption()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp4
	case SomeIpSdOptions_SdOption_OptionTypes__ConfigurationOption:
		tmp5 := NewSomeIpSdOptions_SdOption_SdConfigurationOption()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp5
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv4SdEndpointOption:
		tmp6 := NewSomeIpSdOptions_SdOption_SdIpv4SdEndpointOption()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp6
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv4EndpointOption:
		tmp7 := NewSomeIpSdOptions_SdOption_SdIpv4EndpointOption()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp7
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv6SdEndpointOption:
		tmp8 := NewSomeIpSdOptions_SdOption_SdIpv6SdEndpointOption()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp8
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv4MulticastOption:
		tmp9 := NewSomeIpSdOptions_SdOption_SdIpv4MulticastOption()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp9
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv6EndpointOption:
		tmp10 := NewSomeIpSdOptions_SdOption_SdIpv6EndpointOption()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp10
	case SomeIpSdOptions_SdOption_OptionTypes__Ipv6MulticastOption:
		tmp11 := NewSomeIpSdOptions_SdOption_SdIpv6MulticastOption()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp11
	}
	return err
}
type SomeIpSdOptions_SdOption_SdOptionHeader struct {
	Length uint16
	Type SomeIpSdOptions_SdOption_OptionTypes
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdOptionHeader() *SomeIpSdOptions_SdOption_SdOptionHeader {
	return &SomeIpSdOptions_SdOption_SdOptionHeader{
	}
}

func (this *SomeIpSdOptions_SdOption_SdOptionHeader) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp12)
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = SomeIpSdOptions_SdOption_OptionTypes(tmp13)
	return err
}
type SomeIpSdOptions_SdOption_SdConfigString struct {
	Length uint8
	Config *SomeIpSdOptions_SdOption_SdConfigKvPair
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption_SdConfigStringsContainer
	_raw_Config []byte
}
func NewSomeIpSdOptions_SdOption_SdConfigString() *SomeIpSdOptions_SdOption_SdConfigString {
	return &SomeIpSdOptions_SdOption_SdConfigString{
	}
}

func (this *SomeIpSdOptions_SdOption_SdConfigString) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption_SdConfigStringsContainer, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Length = tmp14
	if (this.Length != 0) {
		tmp15, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this._raw_Config = tmp15
		_io__raw_Config := kaitai.NewStream(bytes.NewReader(this._raw_Config))
		tmp16 := NewSomeIpSdOptions_SdOption_SdConfigKvPair()
		err = tmp16.Read(_io__raw_Config, this, this._root)
		if err != nil {
			return err
		}
		this.Config = tmp16
	}
	return err
}
type SomeIpSdOptions_SdOption_SdConfigStringsContainer struct {
	ConfigStrings []*SomeIpSdOptions_SdOption_SdConfigString
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption_SdConfigurationOption
}
func NewSomeIpSdOptions_SdOption_SdConfigStringsContainer() *SomeIpSdOptions_SdOption_SdConfigStringsContainer {
	return &SomeIpSdOptions_SdOption_SdConfigStringsContainer{
	}
}

func (this *SomeIpSdOptions_SdOption_SdConfigStringsContainer) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption_SdConfigurationOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp17, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp17 {
			break
		}
		tmp18 := NewSomeIpSdOptions_SdOption_SdConfigString()
		err = tmp18.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ConfigStrings = append(this.ConfigStrings, tmp18)
	}
	return err
}
type SomeIpSdOptions_SdOption_SdConfigurationOption struct {
	Reserved uint8
	Configurations *SomeIpSdOptions_SdOption_SdConfigStringsContainer
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
	_raw_Configurations []byte
}
func NewSomeIpSdOptions_SdOption_SdConfigurationOption() *SomeIpSdOptions_SdOption_SdConfigurationOption {
	return &SomeIpSdOptions_SdOption_SdConfigurationOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdConfigurationOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp19
	tmp20, err := this._io.ReadBytes(int((this._parent.Header.Length - 1)))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this._raw_Configurations = tmp20
	_io__raw_Configurations := kaitai.NewStream(bytes.NewReader(this._raw_Configurations))
	tmp21 := NewSomeIpSdOptions_SdOption_SdConfigStringsContainer()
	err = tmp21.Read(_io__raw_Configurations, this, this._root)
	if err != nil {
		return err
	}
	this.Configurations = tmp21
	return err
}
type SomeIpSdOptions_SdOption_SdIpv4MulticastOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv4MulticastOption() *SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
	return &SomeIpSdOptions_SdOption_SdIpv4MulticastOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv4MulticastOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp22
	tmp23, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Address = tmp23
	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp24
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp25
	tmp26, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp26)
	return err
}
type SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv4SdEndpointOption() *SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
	return &SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp27
	tmp28, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Address = tmp28
	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp29
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp30
	tmp31, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp31)
	return err
}
type SomeIpSdOptions_SdOption_SdIpv6MulticastOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv6MulticastOption() *SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
	return &SomeIpSdOptions_SdOption_SdIpv6MulticastOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv6MulticastOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp32
	tmp33, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp33 = tmp33
	this.Address = tmp33
	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp34
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp35
	tmp36, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp36)
	return err
}
type SomeIpSdOptions_SdOption_SdConfigKvPair struct {
	Key string
	Value string
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption_SdConfigString
}
func NewSomeIpSdOptions_SdOption_SdConfigKvPair() *SomeIpSdOptions_SdOption_SdConfigKvPair {
	return &SomeIpSdOptions_SdOption_SdConfigKvPair{
	}
}

func (this *SomeIpSdOptions_SdOption_SdConfigKvPair) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption_SdConfigString, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadBytesTerm(61, false, true, true)
	if err != nil {
		return err
	}
	this.Key = string(tmp37)
	tmp38, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this.Value = string(tmp38)
	return err
}
type SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv6SdEndpointOption() *SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
	return &SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp39
	tmp40, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Address = tmp40
	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp41
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp42
	tmp43, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp43)
	return err
}
type SomeIpSdOptions_SdOption_SdIpv4EndpointOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv4EndpointOption() *SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
	return &SomeIpSdOptions_SdOption_SdIpv4EndpointOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv4EndpointOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp44
	tmp45, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp45 = tmp45
	this.Address = tmp45
	tmp46, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp46
	tmp47, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp47
	tmp48, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp48)
	return err
}
type SomeIpSdOptions_SdOption_SdIpv6EndpointOption struct {
	Reserved uint8
	Address []byte
	Reserved2 uint8
	L4Protocol uint8
	Port uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdIpv6EndpointOption() *SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
	return &SomeIpSdOptions_SdOption_SdIpv6EndpointOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdIpv6EndpointOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp49
	tmp50, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this.Address = tmp50
	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp51
	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.L4Protocol = tmp52
	tmp53, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port = uint16(tmp53)
	return err
}
type SomeIpSdOptions_SdOption_SdLoadBalancingOption struct {
	Reserved uint8
	Priority uint16
	Weight uint16
	_io *kaitai.Stream
	_root *SomeIpSdOptions
	_parent *SomeIpSdOptions_SdOption
}
func NewSomeIpSdOptions_SdOption_SdLoadBalancingOption() *SomeIpSdOptions_SdOption_SdLoadBalancingOption {
	return &SomeIpSdOptions_SdOption_SdLoadBalancingOption{
	}
}

func (this *SomeIpSdOptions_SdOption_SdLoadBalancingOption) Read(io *kaitai.Stream, parent *SomeIpSdOptions_SdOption, root *SomeIpSdOptions) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp54
	tmp55, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Priority = uint16(tmp55)
	tmp56, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Weight = uint16(tmp56)
	return err
}
