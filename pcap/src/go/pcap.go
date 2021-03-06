// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 * @see <a href="http://wiki.wireshark.org/Development/LibpcapFileFormat">Source</a>
 */

type Pcap_Linktype int
const (
	Pcap_Linktype__NullLinktype Pcap_Linktype = 0
	Pcap_Linktype__Ethernet Pcap_Linktype = 1
	Pcap_Linktype__Ax25 Pcap_Linktype = 3
	Pcap_Linktype__Ieee8025 Pcap_Linktype = 6
	Pcap_Linktype__ArcnetBsd Pcap_Linktype = 7
	Pcap_Linktype__Slip Pcap_Linktype = 8
	Pcap_Linktype__Ppp Pcap_Linktype = 9
	Pcap_Linktype__Fddi Pcap_Linktype = 10
	Pcap_Linktype__PppHdlc Pcap_Linktype = 50
	Pcap_Linktype__PppEther Pcap_Linktype = 51
	Pcap_Linktype__AtmRfc1483 Pcap_Linktype = 100
	Pcap_Linktype__Raw Pcap_Linktype = 101
	Pcap_Linktype__CHdlc Pcap_Linktype = 104
	Pcap_Linktype__Ieee80211 Pcap_Linktype = 105
	Pcap_Linktype__Frelay Pcap_Linktype = 107
	Pcap_Linktype__Loop Pcap_Linktype = 108
	Pcap_Linktype__LinuxSll Pcap_Linktype = 113
	Pcap_Linktype__Ltalk Pcap_Linktype = 114
	Pcap_Linktype__Pflog Pcap_Linktype = 117
	Pcap_Linktype__Ieee80211Prism Pcap_Linktype = 119
	Pcap_Linktype__IpOverFc Pcap_Linktype = 122
	Pcap_Linktype__Sunatm Pcap_Linktype = 123
	Pcap_Linktype__Ieee80211Radiotap Pcap_Linktype = 127
	Pcap_Linktype__ArcnetLinux Pcap_Linktype = 129
	Pcap_Linktype__AppleIpOverIeee1394 Pcap_Linktype = 138
	Pcap_Linktype__Mtp2WithPhdr Pcap_Linktype = 139
	Pcap_Linktype__Mtp2 Pcap_Linktype = 140
	Pcap_Linktype__Mtp3 Pcap_Linktype = 141
	Pcap_Linktype__Sccp Pcap_Linktype = 142
	Pcap_Linktype__Docsis Pcap_Linktype = 143
	Pcap_Linktype__LinuxIrda Pcap_Linktype = 144
	Pcap_Linktype__User0 Pcap_Linktype = 147
	Pcap_Linktype__User1 Pcap_Linktype = 148
	Pcap_Linktype__User2 Pcap_Linktype = 149
	Pcap_Linktype__User3 Pcap_Linktype = 150
	Pcap_Linktype__User4 Pcap_Linktype = 151
	Pcap_Linktype__User5 Pcap_Linktype = 152
	Pcap_Linktype__User6 Pcap_Linktype = 153
	Pcap_Linktype__User7 Pcap_Linktype = 154
	Pcap_Linktype__User8 Pcap_Linktype = 155
	Pcap_Linktype__User9 Pcap_Linktype = 156
	Pcap_Linktype__User10 Pcap_Linktype = 157
	Pcap_Linktype__User11 Pcap_Linktype = 158
	Pcap_Linktype__User12 Pcap_Linktype = 159
	Pcap_Linktype__User13 Pcap_Linktype = 160
	Pcap_Linktype__User14 Pcap_Linktype = 161
	Pcap_Linktype__User15 Pcap_Linktype = 162
	Pcap_Linktype__Ieee80211Avs Pcap_Linktype = 163
	Pcap_Linktype__BacnetMsTp Pcap_Linktype = 165
	Pcap_Linktype__PppPppd Pcap_Linktype = 166
	Pcap_Linktype__GprsLlc Pcap_Linktype = 169
	Pcap_Linktype__GpfT Pcap_Linktype = 170
	Pcap_Linktype__GpfF Pcap_Linktype = 171
	Pcap_Linktype__LinuxLapd Pcap_Linktype = 177
	Pcap_Linktype__BluetoothHciH4 Pcap_Linktype = 187
	Pcap_Linktype__UsbLinux Pcap_Linktype = 189
	Pcap_Linktype__Ppi Pcap_Linktype = 192
	Pcap_Linktype__Ieee802154 Pcap_Linktype = 195
	Pcap_Linktype__Sita Pcap_Linktype = 196
	Pcap_Linktype__Erf Pcap_Linktype = 197
	Pcap_Linktype__BluetoothHciH4WithPhdr Pcap_Linktype = 201
	Pcap_Linktype__Ax25Kiss Pcap_Linktype = 202
	Pcap_Linktype__Lapd Pcap_Linktype = 203
	Pcap_Linktype__PppWithDir Pcap_Linktype = 204
	Pcap_Linktype__CHdlcWithDir Pcap_Linktype = 205
	Pcap_Linktype__FrelayWithDir Pcap_Linktype = 206
	Pcap_Linktype__IpmbLinux Pcap_Linktype = 209
	Pcap_Linktype__Ieee802154NonaskPhy Pcap_Linktype = 215
	Pcap_Linktype__UsbLinuxMmapped Pcap_Linktype = 220
	Pcap_Linktype__Fc2 Pcap_Linktype = 224
	Pcap_Linktype__Fc2WithFrameDelims Pcap_Linktype = 225
	Pcap_Linktype__Ipnet Pcap_Linktype = 226
	Pcap_Linktype__CanSocketcan Pcap_Linktype = 227
	Pcap_Linktype__Ipv4 Pcap_Linktype = 228
	Pcap_Linktype__Ipv6 Pcap_Linktype = 229
	Pcap_Linktype__Ieee802154Nofcs Pcap_Linktype = 230
	Pcap_Linktype__Dbus Pcap_Linktype = 231
	Pcap_Linktype__DvbCi Pcap_Linktype = 235
	Pcap_Linktype__Mux27010 Pcap_Linktype = 236
	Pcap_Linktype__Stanag5066DPdu Pcap_Linktype = 237
	Pcap_Linktype__Nflog Pcap_Linktype = 239
	Pcap_Linktype__Netanalyzer Pcap_Linktype = 240
	Pcap_Linktype__NetanalyzerTransparent Pcap_Linktype = 241
	Pcap_Linktype__Ipoib Pcap_Linktype = 242
	Pcap_Linktype__Mpeg2Ts Pcap_Linktype = 243
	Pcap_Linktype__Ng40 Pcap_Linktype = 244
	Pcap_Linktype__NfcLlcp Pcap_Linktype = 245
	Pcap_Linktype__Infiniband Pcap_Linktype = 247
	Pcap_Linktype__Sctp Pcap_Linktype = 248
	Pcap_Linktype__Usbpcap Pcap_Linktype = 249
	Pcap_Linktype__RtacSerial Pcap_Linktype = 250
	Pcap_Linktype__BluetoothLeLl Pcap_Linktype = 251
	Pcap_Linktype__Netlink Pcap_Linktype = 253
	Pcap_Linktype__BluetoothLinuxMonitor Pcap_Linktype = 254
	Pcap_Linktype__BluetoothBredrBb Pcap_Linktype = 255
	Pcap_Linktype__BluetoothLeLlWithPhdr Pcap_Linktype = 256
	Pcap_Linktype__ProfibusDl Pcap_Linktype = 257
	Pcap_Linktype__Pktap Pcap_Linktype = 258
	Pcap_Linktype__Epon Pcap_Linktype = 259
	Pcap_Linktype__IpmiHpm2 Pcap_Linktype = 260
	Pcap_Linktype__ZwaveR1R2 Pcap_Linktype = 261
	Pcap_Linktype__ZwaveR3 Pcap_Linktype = 262
	Pcap_Linktype__WattstopperDlm Pcap_Linktype = 263
	Pcap_Linktype__Iso14443 Pcap_Linktype = 264
)
type Pcap struct {
	Hdr *Pcap_Header
	Packets []*Pcap_Packet
	_io *kaitai.Stream
	_root *Pcap
	_parent interface{}
}
func NewPcap() *Pcap {
	return &Pcap{
	}
}

func (this *Pcap) Read(io *kaitai.Stream, parent interface{}, root *Pcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewPcap_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewPcap_Packet()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Packets = append(this.Packets, tmp3)
	}
	return err
}

/**
 * @see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header">Source</a>
 */
type Pcap_Header struct {
	MagicNumber []byte
	VersionMajor uint16
	VersionMinor uint16
	Thiszone int32
	Sigfigs uint32
	Snaplen uint32
	Network Pcap_Linktype
	_io *kaitai.Stream
	_root *Pcap
	_parent *Pcap
}
func NewPcap_Header() *Pcap_Header {
	return &Pcap_Header{
	}
}

func (this *Pcap_Header) Read(io *kaitai.Stream, parent *Pcap, root *Pcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.MagicNumber = tmp4
	if !(bytes.Equal(this.MagicNumber, []uint8{212, 195, 178, 161})) {
		return kaitai.NewValidationNotEqualError([]uint8{212, 195, 178, 161}, this.MagicNumber, this._io, "/types/header/seq/0")
	}
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMajor = uint16(tmp5)
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VersionMinor = uint16(tmp6)
	tmp7, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Thiszone = int32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sigfigs = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Snaplen = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Network = Pcap_Linktype(tmp10)
	return err
}

/**
 * Correction time in seconds between UTC and the local
 * timezone of the following packet header timestamps.
 */

/**
 * In theory, the accuracy of time stamps in the capture; in
 * practice, all tools set it to 0.
 */

/**
 * The "snapshot length" for the capture (typically 65535 or
 * even more, but might be limited by the user), see: incl_len
 * vs. orig_len.
 */

/**
 * Link-layer header type, specifying the type of headers at
 * the beginning of the packet.
 */

/**
 * @see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header">Source</a>
 */
type Pcap_Packet struct {
	TsSec uint32
	TsUsec uint32
	InclLen uint32
	OrigLen uint32
	Body interface{}
	_io *kaitai.Stream
	_root *Pcap
	_parent *Pcap
	_raw_Body []byte
}
func NewPcap_Packet() *Pcap_Packet {
	return &Pcap_Packet{
	}
}

func (this *Pcap_Packet) Read(io *kaitai.Stream, parent *Pcap, root *Pcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TsSec = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TsUsec = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InclLen = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OrigLen = uint32(tmp14)
	switch (this._root.Hdr.Network) {
	case Pcap_Linktype__Ppi:
		tmp15, err := this._io.ReadBytes(int(this.InclLen))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this._raw_Body = tmp15
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp16 := NewPacketPpi()
		err = tmp16.Read(_io__raw_Body, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp16
	case Pcap_Linktype__Ethernet:
		tmp17, err := this._io.ReadBytes(int(this.InclLen))
		if err != nil {
			return err
		}
		tmp17 = tmp17
		this._raw_Body = tmp17
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp18 := NewEthernetFrame()
		err = tmp18.Read(_io__raw_Body, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp18
	default:
		tmp19, err := this._io.ReadBytes(int(this.InclLen))
		if err != nil {
			return err
		}
		tmp19 = tmp19
		this._raw_Body = tmp19
	}
	return err
}

/**
 * Number of bytes of packet data actually captured and saved in the file.
 */

/**
 * Length of the packet as it appeared on the network when it was captured.
 */

/**
 * @see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data">Source</a>
 */
