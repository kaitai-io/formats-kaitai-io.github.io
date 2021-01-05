// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture: https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=Http.cap
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3</a>
 */

type PacketPpi_PfhType int
const (
	PacketPpi_PfhType__Radio80211Common PacketPpi_PfhType = 2
	PacketPpi_PfhType__Radio80211nMacExt PacketPpi_PfhType = 3
	PacketPpi_PfhType__Radio80211nMacPhyExt PacketPpi_PfhType = 4
	PacketPpi_PfhType__SpectrumMap PacketPpi_PfhType = 5
	PacketPpi_PfhType__ProcessInfo PacketPpi_PfhType = 6
	PacketPpi_PfhType__CaptureInfo PacketPpi_PfhType = 7
)

type PacketPpi_Linktype int
const (
	PacketPpi_Linktype__NullLinktype PacketPpi_Linktype = 0
	PacketPpi_Linktype__Ethernet PacketPpi_Linktype = 1
	PacketPpi_Linktype__Ax25 PacketPpi_Linktype = 3
	PacketPpi_Linktype__Ieee8025 PacketPpi_Linktype = 6
	PacketPpi_Linktype__ArcnetBsd PacketPpi_Linktype = 7
	PacketPpi_Linktype__Slip PacketPpi_Linktype = 8
	PacketPpi_Linktype__Ppp PacketPpi_Linktype = 9
	PacketPpi_Linktype__Fddi PacketPpi_Linktype = 10
	PacketPpi_Linktype__PppHdlc PacketPpi_Linktype = 50
	PacketPpi_Linktype__PppEther PacketPpi_Linktype = 51
	PacketPpi_Linktype__AtmRfc1483 PacketPpi_Linktype = 100
	PacketPpi_Linktype__Raw PacketPpi_Linktype = 101
	PacketPpi_Linktype__CHdlc PacketPpi_Linktype = 104
	PacketPpi_Linktype__Ieee80211 PacketPpi_Linktype = 105
	PacketPpi_Linktype__Frelay PacketPpi_Linktype = 107
	PacketPpi_Linktype__Loop PacketPpi_Linktype = 108
	PacketPpi_Linktype__LinuxSll PacketPpi_Linktype = 113
	PacketPpi_Linktype__Ltalk PacketPpi_Linktype = 114
	PacketPpi_Linktype__Pflog PacketPpi_Linktype = 117
	PacketPpi_Linktype__Ieee80211Prism PacketPpi_Linktype = 119
	PacketPpi_Linktype__IpOverFc PacketPpi_Linktype = 122
	PacketPpi_Linktype__Sunatm PacketPpi_Linktype = 123
	PacketPpi_Linktype__Ieee80211Radiotap PacketPpi_Linktype = 127
	PacketPpi_Linktype__ArcnetLinux PacketPpi_Linktype = 129
	PacketPpi_Linktype__AppleIpOverIeee1394 PacketPpi_Linktype = 138
	PacketPpi_Linktype__Mtp2WithPhdr PacketPpi_Linktype = 139
	PacketPpi_Linktype__Mtp2 PacketPpi_Linktype = 140
	PacketPpi_Linktype__Mtp3 PacketPpi_Linktype = 141
	PacketPpi_Linktype__Sccp PacketPpi_Linktype = 142
	PacketPpi_Linktype__Docsis PacketPpi_Linktype = 143
	PacketPpi_Linktype__LinuxIrda PacketPpi_Linktype = 144
	PacketPpi_Linktype__User0 PacketPpi_Linktype = 147
	PacketPpi_Linktype__User1 PacketPpi_Linktype = 148
	PacketPpi_Linktype__User2 PacketPpi_Linktype = 149
	PacketPpi_Linktype__User3 PacketPpi_Linktype = 150
	PacketPpi_Linktype__User4 PacketPpi_Linktype = 151
	PacketPpi_Linktype__User5 PacketPpi_Linktype = 152
	PacketPpi_Linktype__User6 PacketPpi_Linktype = 153
	PacketPpi_Linktype__User7 PacketPpi_Linktype = 154
	PacketPpi_Linktype__User8 PacketPpi_Linktype = 155
	PacketPpi_Linktype__User9 PacketPpi_Linktype = 156
	PacketPpi_Linktype__User10 PacketPpi_Linktype = 157
	PacketPpi_Linktype__User11 PacketPpi_Linktype = 158
	PacketPpi_Linktype__User12 PacketPpi_Linktype = 159
	PacketPpi_Linktype__User13 PacketPpi_Linktype = 160
	PacketPpi_Linktype__User14 PacketPpi_Linktype = 161
	PacketPpi_Linktype__User15 PacketPpi_Linktype = 162
	PacketPpi_Linktype__Ieee80211Avs PacketPpi_Linktype = 163
	PacketPpi_Linktype__BacnetMsTp PacketPpi_Linktype = 165
	PacketPpi_Linktype__PppPppd PacketPpi_Linktype = 166
	PacketPpi_Linktype__GprsLlc PacketPpi_Linktype = 169
	PacketPpi_Linktype__GpfT PacketPpi_Linktype = 170
	PacketPpi_Linktype__GpfF PacketPpi_Linktype = 171
	PacketPpi_Linktype__LinuxLapd PacketPpi_Linktype = 177
	PacketPpi_Linktype__BluetoothHciH4 PacketPpi_Linktype = 187
	PacketPpi_Linktype__UsbLinux PacketPpi_Linktype = 189
	PacketPpi_Linktype__Ppi PacketPpi_Linktype = 192
	PacketPpi_Linktype__Ieee802154 PacketPpi_Linktype = 195
	PacketPpi_Linktype__Sita PacketPpi_Linktype = 196
	PacketPpi_Linktype__Erf PacketPpi_Linktype = 197
	PacketPpi_Linktype__BluetoothHciH4WithPhdr PacketPpi_Linktype = 201
	PacketPpi_Linktype__Ax25Kiss PacketPpi_Linktype = 202
	PacketPpi_Linktype__Lapd PacketPpi_Linktype = 203
	PacketPpi_Linktype__PppWithDir PacketPpi_Linktype = 204
	PacketPpi_Linktype__CHdlcWithDir PacketPpi_Linktype = 205
	PacketPpi_Linktype__FrelayWithDir PacketPpi_Linktype = 206
	PacketPpi_Linktype__IpmbLinux PacketPpi_Linktype = 209
	PacketPpi_Linktype__Ieee802154NonaskPhy PacketPpi_Linktype = 215
	PacketPpi_Linktype__UsbLinuxMmapped PacketPpi_Linktype = 220
	PacketPpi_Linktype__Fc2 PacketPpi_Linktype = 224
	PacketPpi_Linktype__Fc2WithFrameDelims PacketPpi_Linktype = 225
	PacketPpi_Linktype__Ipnet PacketPpi_Linktype = 226
	PacketPpi_Linktype__CanSocketcan PacketPpi_Linktype = 227
	PacketPpi_Linktype__Ipv4 PacketPpi_Linktype = 228
	PacketPpi_Linktype__Ipv6 PacketPpi_Linktype = 229
	PacketPpi_Linktype__Ieee802154Nofcs PacketPpi_Linktype = 230
	PacketPpi_Linktype__Dbus PacketPpi_Linktype = 231
	PacketPpi_Linktype__DvbCi PacketPpi_Linktype = 235
	PacketPpi_Linktype__Mux27010 PacketPpi_Linktype = 236
	PacketPpi_Linktype__Stanag5066DPdu PacketPpi_Linktype = 237
	PacketPpi_Linktype__Nflog PacketPpi_Linktype = 239
	PacketPpi_Linktype__Netanalyzer PacketPpi_Linktype = 240
	PacketPpi_Linktype__NetanalyzerTransparent PacketPpi_Linktype = 241
	PacketPpi_Linktype__Ipoib PacketPpi_Linktype = 242
	PacketPpi_Linktype__Mpeg2Ts PacketPpi_Linktype = 243
	PacketPpi_Linktype__Ng40 PacketPpi_Linktype = 244
	PacketPpi_Linktype__NfcLlcp PacketPpi_Linktype = 245
	PacketPpi_Linktype__Infiniband PacketPpi_Linktype = 247
	PacketPpi_Linktype__Sctp PacketPpi_Linktype = 248
	PacketPpi_Linktype__Usbpcap PacketPpi_Linktype = 249
	PacketPpi_Linktype__RtacSerial PacketPpi_Linktype = 250
	PacketPpi_Linktype__BluetoothLeLl PacketPpi_Linktype = 251
	PacketPpi_Linktype__Netlink PacketPpi_Linktype = 253
	PacketPpi_Linktype__BluetoothLinuxMonitor PacketPpi_Linktype = 254
	PacketPpi_Linktype__BluetoothBredrBb PacketPpi_Linktype = 255
	PacketPpi_Linktype__BluetoothLeLlWithPhdr PacketPpi_Linktype = 256
	PacketPpi_Linktype__ProfibusDl PacketPpi_Linktype = 257
	PacketPpi_Linktype__Pktap PacketPpi_Linktype = 258
	PacketPpi_Linktype__Epon PacketPpi_Linktype = 259
	PacketPpi_Linktype__IpmiHpm2 PacketPpi_Linktype = 260
	PacketPpi_Linktype__ZwaveR1R2 PacketPpi_Linktype = 261
	PacketPpi_Linktype__ZwaveR3 PacketPpi_Linktype = 262
	PacketPpi_Linktype__WattstopperDlm PacketPpi_Linktype = 263
	PacketPpi_Linktype__Iso14443 PacketPpi_Linktype = 264
)
type PacketPpi struct {
	Header *PacketPpi_PacketPpiHeader
	Fields *PacketPpi_PacketPpiFields
	Body interface{}
	_io *kaitai.Stream
	_root *PacketPpi
	_parent interface{}
	_raw_Fields []byte
	_raw_Body []byte
}
func NewPacketPpi() *PacketPpi {
	return &PacketPpi{
	}
}

func (this *PacketPpi) Read(io *kaitai.Stream, parent interface{}, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewPacketPpi_PacketPpiHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this._io.ReadBytes(int((this.Header.PphLen - 8)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Fields = tmp2
	_io__raw_Fields := kaitai.NewStream(bytes.NewReader(this._raw_Fields))
	tmp3 := NewPacketPpi_PacketPpiFields()
	err = tmp3.Read(_io__raw_Fields, this, this._root)
	if err != nil {
		return err
	}
	this.Fields = tmp3
	switch (this.Header.PphDlt) {
	case PacketPpi_Linktype__Ppi:
		tmp4, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_Body = tmp4
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp5 := NewPacketPpi()
		err = tmp5.Read(_io__raw_Body, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp5
	case PacketPpi_Linktype__Ethernet:
		tmp6, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp6 = tmp6
		this._raw_Body = tmp6
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp7 := NewEthernetFrame()
		err = tmp7.Read(_io__raw_Body, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp7
	default:
		tmp8, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp8 = tmp8
		this._raw_Body = tmp8
	}
	return err
}
type PacketPpi_PacketPpiFields struct {
	Entries []*PacketPpi_PacketPpiField
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi
}
func NewPacketPpi_PacketPpiFields() *PacketPpi_PacketPpiFields {
	return &PacketPpi_PacketPpiFields{
	}
}

func (this *PacketPpi_PacketPpiFields) Read(io *kaitai.Stream, parent *PacketPpi, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp9, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp9 {
			break
		}
		tmp10 := NewPacketPpi_PacketPpiField()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp10)
	}
	return err
}

/**
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.3</a>
 */
type PacketPpi_Radio80211nMacExtBody struct {
	Flags *PacketPpi_MacFlags
	AMpduId uint32
	NumDelimiters uint8
	Reserved []byte
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_PacketPpiField
}
func NewPacketPpi_Radio80211nMacExtBody() *PacketPpi_Radio80211nMacExtBody {
	return &PacketPpi_Radio80211nMacExtBody{
	}
}

func (this *PacketPpi_Radio80211nMacExtBody) Read(io *kaitai.Stream, parent *PacketPpi_PacketPpiField, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11 := NewPacketPpi_MacFlags()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp11
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AMpduId = uint32(tmp12)
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumDelimiters = tmp13
	tmp14, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Reserved = tmp14
	return err
}
type PacketPpi_MacFlags struct {
	Unused1 bool
	AggregateDelimiter bool
	MoreAggregates bool
	Aggregate bool
	DupRx bool
	RxShortGuard bool
	IsHt40 bool
	Greenfield bool
	Unused2 []byte
	_io *kaitai.Stream
	_root *PacketPpi
	_parent interface{}
}
func NewPacketPpi_MacFlags() *PacketPpi_MacFlags {
	return &PacketPpi_MacFlags{
	}
}

func (this *PacketPpi_MacFlags) Read(io *kaitai.Stream, parent interface{}, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Unused1 = tmp15 != 0
	tmp16, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.AggregateDelimiter = tmp16 != 0
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.MoreAggregates = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Aggregate = tmp18 != 0
	tmp19, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.DupRx = tmp19 != 0
	tmp20, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.RxShortGuard = tmp20 != 0
	tmp21, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsHt40 = tmp21 != 0
	tmp22, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Greenfield = tmp22 != 0
	this._io.AlignToByte()
	tmp23, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Unused2 = tmp23
	return err
}

/**
 * Aggregate delimiter CRC error after this frame
 */

/**
 * More aggregates
 */

/**
 * Aggregate
 */

/**
 * Duplicate RX
 */

/**
 * RX short guard interval (SGI)
 */

/**
 * true = HT40, false = HT20
 */

/**
 * Greenfield
 */

/**
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
 */
type PacketPpi_PacketPpiHeader struct {
	PphVersion uint8
	PphFlags uint8
	PphLen uint16
	PphDlt PacketPpi_Linktype
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi
}
func NewPacketPpi_PacketPpiHeader() *PacketPpi_PacketPpiHeader {
	return &PacketPpi_PacketPpiHeader{
	}
}

func (this *PacketPpi_PacketPpiHeader) Read(io *kaitai.Stream, parent *PacketPpi, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PphVersion = tmp24
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PphFlags = tmp25
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PphLen = uint16(tmp26)
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PphDlt = PacketPpi_Linktype(tmp27)
	return err
}

/**
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.2</a>
 */
type PacketPpi_Radio80211CommonBody struct {
	TsfTimer uint64
	Flags uint16
	Rate uint16
	ChannelFreq uint16
	ChannelFlags uint16
	FhssHopset uint8
	FhssPattern uint8
	DbmAntsignal int8
	DbmAntnoise int8
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_PacketPpiField
}
func NewPacketPpi_Radio80211CommonBody() *PacketPpi_Radio80211CommonBody {
	return &PacketPpi_Radio80211CommonBody{
	}
}

func (this *PacketPpi_Radio80211CommonBody) Read(io *kaitai.Stream, parent *PacketPpi_PacketPpiField, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TsfTimer = uint64(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp29)
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Rate = uint16(tmp30)
	tmp31, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelFreq = uint16(tmp31)
	tmp32, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelFlags = uint16(tmp32)
	tmp33, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FhssHopset = tmp33
	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FhssPattern = tmp34
	tmp35, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.DbmAntsignal = tmp35
	tmp36, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.DbmAntnoise = tmp36
	return err
}

/**
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
 */
type PacketPpi_PacketPpiField struct {
	PfhType PacketPpi_PfhType
	PfhDatalen uint16
	Body interface{}
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_PacketPpiFields
	_raw_Body []byte
}
func NewPacketPpi_PacketPpiField() *PacketPpi_PacketPpiField {
	return &PacketPpi_PacketPpiField{
	}
}

func (this *PacketPpi_PacketPpiField) Read(io *kaitai.Stream, parent *PacketPpi_PacketPpiFields, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PfhType = PacketPpi_PfhType(tmp37)
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PfhDatalen = uint16(tmp38)
	switch (this.PfhType) {
	case PacketPpi_PfhType__Radio80211Common:
		tmp39, err := this._io.ReadBytes(int(this.PfhDatalen))
		if err != nil {
			return err
		}
		tmp39 = tmp39
		this._raw_Body = tmp39
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp40 := NewPacketPpi_Radio80211CommonBody()
		err = tmp40.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp40
	case PacketPpi_PfhType__Radio80211nMacExt:
		tmp41, err := this._io.ReadBytes(int(this.PfhDatalen))
		if err != nil {
			return err
		}
		tmp41 = tmp41
		this._raw_Body = tmp41
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp42 := NewPacketPpi_Radio80211nMacExtBody()
		err = tmp42.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp42
	case PacketPpi_PfhType__Radio80211nMacPhyExt:
		tmp43, err := this._io.ReadBytes(int(this.PfhDatalen))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this._raw_Body = tmp43
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp44 := NewPacketPpi_Radio80211nMacPhyExtBody()
		err = tmp44.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp44
	default:
		tmp45, err := this._io.ReadBytes(int(this.PfhDatalen))
		if err != nil {
			return err
		}
		tmp45 = tmp45
		this._raw_Body = tmp45
	}
	return err
}

/**
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.4</a>
 */
type PacketPpi_Radio80211nMacPhyExtBody struct {
	Flags *PacketPpi_MacFlags
	AMpduId uint32
	NumDelimiters uint8
	Mcs uint8
	NumStreams uint8
	RssiCombined uint8
	RssiAntCtl []uint8
	RssiAntExt []uint8
	ExtChannelFreq uint16
	ExtChannelFlags *PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags
	RfSignalNoise []*PacketPpi_Radio80211nMacPhyExtBody_SignalNoise
	Evm []uint32
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_PacketPpiField
}
func NewPacketPpi_Radio80211nMacPhyExtBody() *PacketPpi_Radio80211nMacPhyExtBody {
	return &PacketPpi_Radio80211nMacPhyExtBody{
	}
}

func (this *PacketPpi_Radio80211nMacPhyExtBody) Read(io *kaitai.Stream, parent *PacketPpi_PacketPpiField, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46 := NewPacketPpi_MacFlags()
	err = tmp46.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp46
	tmp47, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AMpduId = uint32(tmp47)
	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumDelimiters = tmp48
	tmp49, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Mcs = tmp49
	tmp50, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumStreams = tmp50
	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RssiCombined = tmp51
	this.RssiAntCtl = make([]uint8, 4)
	for i := range this.RssiAntCtl {
		tmp52, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.RssiAntCtl[i] = tmp52
	}
	this.RssiAntExt = make([]uint8, 4)
	for i := range this.RssiAntExt {
		tmp53, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.RssiAntExt[i] = tmp53
	}
	tmp54, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ExtChannelFreq = uint16(tmp54)
	tmp55 := NewPacketPpi_Radio80211nMacPhyExtBody_ChannelFlags()
	err = tmp55.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExtChannelFlags = tmp55
	this.RfSignalNoise = make([]*PacketPpi_Radio80211nMacPhyExtBody_SignalNoise, 4)
	for i := range this.RfSignalNoise {
		tmp56 := NewPacketPpi_Radio80211nMacPhyExtBody_SignalNoise()
		err = tmp56.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RfSignalNoise[i] = tmp56
	}
	this.Evm = make([]uint32, 4)
	for i := range this.Evm {
		tmp57, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Evm[i] = tmp57
	}
	return err
}

/**
 * Modulation Coding Scheme (MCS)
 */

/**
 * Number of spatial streams (0 = unknown)
 */

/**
 * RSSI (Received Signal Strength Indication), combined from all active antennas / channels
 */

/**
 * RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
 */

/**
 * RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
 */

/**
 * Extension channel frequency (MHz)
 */

/**
 * Extension channel flags
 */

/**
 * Signal + noise values for antennas 0-3
 */

/**
 * EVM (Error Vector Magnitude) for chains 0-3
 */
type PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags struct {
	Spectrum2ghz bool
	Ofdm bool
	Cck bool
	Turbo bool
	Unused uint64
	Gfsk bool
	DynCckOfdm bool
	OnlyPassiveScan bool
	Spectrum5ghz bool
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_Radio80211nMacPhyExtBody
}
func NewPacketPpi_Radio80211nMacPhyExtBody_ChannelFlags() *PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
	return &PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags{
	}
}

func (this *PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags) Read(io *kaitai.Stream, parent *PacketPpi_Radio80211nMacPhyExtBody, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Spectrum2ghz = tmp58 != 0
	tmp59, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Ofdm = tmp59 != 0
	tmp60, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Cck = tmp60 != 0
	tmp61, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Turbo = tmp61 != 0
	tmp62, err := this._io.ReadBitsIntBe(8)
	if err != nil {
		return err
	}
	this.Unused = tmp62
	tmp63, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Gfsk = tmp63 != 0
	tmp64, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.DynCckOfdm = tmp64 != 0
	tmp65, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.OnlyPassiveScan = tmp65 != 0
	tmp66, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Spectrum5ghz = tmp66 != 0
	return err
}

/**
 * 2 GHz spectrum
 */

/**
 * OFDM (Orthogonal Frequency-Division Multiplexing)
 */

/**
 * CCK (Complementary Code Keying)
 */

/**
 * Gaussian Frequency Shift Keying
 */

/**
 * Dynamic CCK-OFDM
 */

/**
 * Only passive scan allowed
 */

/**
 * 5 GHz spectrum
 */

/**
 * RF signal + noise pair at a single antenna
 */
type PacketPpi_Radio80211nMacPhyExtBody_SignalNoise struct {
	Signal int8
	Noise int8
	_io *kaitai.Stream
	_root *PacketPpi
	_parent *PacketPpi_Radio80211nMacPhyExtBody
}
func NewPacketPpi_Radio80211nMacPhyExtBody_SignalNoise() *PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
	return &PacketPpi_Radio80211nMacPhyExtBody_SignalNoise{
	}
}

func (this *PacketPpi_Radio80211nMacPhyExtBody_SignalNoise) Read(io *kaitai.Stream, parent *PacketPpi_Radio80211nMacPhyExtBody, root *PacketPpi) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp67, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.Signal = tmp67
	tmp68, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.Noise = tmp68
	return err
}

/**
 * RF signal, dBm
 */

/**
 * RF noise, dBm
 */
