// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -">section 4.1.2.3  Entry Format</a>
 */
type SomeIpSdEntries struct {
	Entries []*SomeIpSdEntries_SdEntry
	_io *kaitai.Stream
	_root *SomeIpSdEntries
	_parent interface{}
}
func NewSomeIpSdEntries() *SomeIpSdEntries {
	return &SomeIpSdEntries{
	}
}

func (this *SomeIpSdEntries) Read(io *kaitai.Stream, parent interface{}, root *SomeIpSdEntries) (err error) {
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
		tmp2 := NewSomeIpSdEntries_SdEntry()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp2)
	}
	return err
}

type SomeIpSdEntries_SdEntry_EntryTypes int
const (
	SomeIpSdEntries_SdEntry_EntryTypes__Find SomeIpSdEntries_SdEntry_EntryTypes = 0
	SomeIpSdEntries_SdEntry_EntryTypes__Offer SomeIpSdEntries_SdEntry_EntryTypes = 1
	SomeIpSdEntries_SdEntry_EntryTypes__Subscribe SomeIpSdEntries_SdEntry_EntryTypes = 6
	SomeIpSdEntries_SdEntry_EntryTypes__SubscribeAck SomeIpSdEntries_SdEntry_EntryTypes = 7
)
type SomeIpSdEntries_SdEntry struct {
	Header *SomeIpSdEntries_SdEntry_SdEntryHeader
	Content interface{}
	_io *kaitai.Stream
	_root *SomeIpSdEntries
	_parent *SomeIpSdEntries
}
func NewSomeIpSdEntries_SdEntry() *SomeIpSdEntries_SdEntry {
	return &SomeIpSdEntries_SdEntry{
	}
}

func (this *SomeIpSdEntries_SdEntry) Read(io *kaitai.Stream, parent *SomeIpSdEntries, root *SomeIpSdEntries) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewSomeIpSdEntries_SdEntry_SdEntryHeader()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	switch (this.Header.Type) {
	case SomeIpSdEntries_SdEntry_EntryTypes__Find:
		tmp4 := NewSomeIpSdEntries_SdEntry_SdServiceEntry()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp4
	case SomeIpSdEntries_SdEntry_EntryTypes__Offer:
		tmp5 := NewSomeIpSdEntries_SdEntry_SdServiceEntry()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp5
	case SomeIpSdEntries_SdEntry_EntryTypes__Subscribe:
		tmp6 := NewSomeIpSdEntries_SdEntry_SdEventgroupEntry()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp6
	case SomeIpSdEntries_SdEntry_EntryTypes__SubscribeAck:
		tmp7 := NewSomeIpSdEntries_SdEntry_SdEventgroupEntry()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp7
	}
	return err
}
type SomeIpSdEntries_SdEntry_SdEntryHeader struct {
	Type SomeIpSdEntries_SdEntry_EntryTypes
	IndexFirstOptions uint8
	IndexSecondOptions uint8
	NumberFirstOptions uint64
	NumberSecondOptions uint64
	ServiceId uint16
	InstanceId uint16
	MajorVersion uint8
	Ttl uint64
	_io *kaitai.Stream
	_root *SomeIpSdEntries
	_parent *SomeIpSdEntries_SdEntry
}
func NewSomeIpSdEntries_SdEntry_SdEntryHeader() *SomeIpSdEntries_SdEntry_SdEntryHeader {
	return &SomeIpSdEntries_SdEntry_SdEntryHeader{
	}
}

func (this *SomeIpSdEntries_SdEntry_SdEntryHeader) Read(io *kaitai.Stream, parent *SomeIpSdEntries_SdEntry, root *SomeIpSdEntries) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = SomeIpSdEntries_SdEntry_EntryTypes(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IndexFirstOptions = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IndexSecondOptions = tmp10
	tmp11, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.NumberFirstOptions = tmp11
	tmp12, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.NumberSecondOptions = tmp12
	this._io.AlignToByte()
	tmp13, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ServiceId = uint16(tmp13)
	tmp14, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.InstanceId = uint16(tmp14)
	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MajorVersion = tmp15
	tmp16, err := this._io.ReadBitsIntBe(24)
	if err != nil {
		return err
	}
	this.Ttl = tmp16
	return err
}
type SomeIpSdEntries_SdEntry_SdServiceEntry struct {
	MinorVersion uint32
	_io *kaitai.Stream
	_root *SomeIpSdEntries
	_parent *SomeIpSdEntries_SdEntry
}
func NewSomeIpSdEntries_SdEntry_SdServiceEntry() *SomeIpSdEntries_SdEntry_SdServiceEntry {
	return &SomeIpSdEntries_SdEntry_SdServiceEntry{
	}
}

func (this *SomeIpSdEntries_SdEntry_SdServiceEntry) Read(io *kaitai.Stream, parent *SomeIpSdEntries_SdEntry, root *SomeIpSdEntries) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MinorVersion = uint32(tmp17)
	return err
}
type SomeIpSdEntries_SdEntry_SdEventgroupEntry struct {
	Reserved uint8
	InitialDataRequested bool
	Reserved2 uint64
	Counter uint64
	EventGroupId uint16
	_io *kaitai.Stream
	_root *SomeIpSdEntries
	_parent *SomeIpSdEntries_SdEntry
}
func NewSomeIpSdEntries_SdEntry_SdEventgroupEntry() *SomeIpSdEntries_SdEntry_SdEventgroupEntry {
	return &SomeIpSdEntries_SdEntry_SdEventgroupEntry{
	}
}

func (this *SomeIpSdEntries_SdEntry_SdEventgroupEntry) Read(io *kaitai.Stream, parent *SomeIpSdEntries_SdEntry, root *SomeIpSdEntries) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp18
	tmp19, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.InitialDataRequested = tmp19 != 0
	tmp20, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp20
	tmp21, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Counter = tmp21
	this._io.AlignToByte()
	tmp22, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.EventGroupId = uint16(tmp22)
	return err
}
