// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values">Source</a>
 */

type MicrosoftNetworkMonitorV2_Linktype int
const (
	MicrosoftNetworkMonitorV2_Linktype__NullLinktype MicrosoftNetworkMonitorV2_Linktype = 0
	MicrosoftNetworkMonitorV2_Linktype__Ethernet MicrosoftNetworkMonitorV2_Linktype = 1
	MicrosoftNetworkMonitorV2_Linktype__Ax25 MicrosoftNetworkMonitorV2_Linktype = 3
	MicrosoftNetworkMonitorV2_Linktype__Ieee8025 MicrosoftNetworkMonitorV2_Linktype = 6
	MicrosoftNetworkMonitorV2_Linktype__ArcnetBsd MicrosoftNetworkMonitorV2_Linktype = 7
	MicrosoftNetworkMonitorV2_Linktype__Slip MicrosoftNetworkMonitorV2_Linktype = 8
	MicrosoftNetworkMonitorV2_Linktype__Ppp MicrosoftNetworkMonitorV2_Linktype = 9
	MicrosoftNetworkMonitorV2_Linktype__Fddi MicrosoftNetworkMonitorV2_Linktype = 10
	MicrosoftNetworkMonitorV2_Linktype__PppHdlc MicrosoftNetworkMonitorV2_Linktype = 50
	MicrosoftNetworkMonitorV2_Linktype__PppEther MicrosoftNetworkMonitorV2_Linktype = 51
	MicrosoftNetworkMonitorV2_Linktype__AtmRfc1483 MicrosoftNetworkMonitorV2_Linktype = 100
	MicrosoftNetworkMonitorV2_Linktype__Raw MicrosoftNetworkMonitorV2_Linktype = 101
	MicrosoftNetworkMonitorV2_Linktype__CHdlc MicrosoftNetworkMonitorV2_Linktype = 104
	MicrosoftNetworkMonitorV2_Linktype__Ieee80211 MicrosoftNetworkMonitorV2_Linktype = 105
	MicrosoftNetworkMonitorV2_Linktype__Frelay MicrosoftNetworkMonitorV2_Linktype = 107
	MicrosoftNetworkMonitorV2_Linktype__Loop MicrosoftNetworkMonitorV2_Linktype = 108
	MicrosoftNetworkMonitorV2_Linktype__LinuxSll MicrosoftNetworkMonitorV2_Linktype = 113
	MicrosoftNetworkMonitorV2_Linktype__Ltalk MicrosoftNetworkMonitorV2_Linktype = 114
	MicrosoftNetworkMonitorV2_Linktype__Pflog MicrosoftNetworkMonitorV2_Linktype = 117
	MicrosoftNetworkMonitorV2_Linktype__Ieee80211Prism MicrosoftNetworkMonitorV2_Linktype = 119
	MicrosoftNetworkMonitorV2_Linktype__IpOverFc MicrosoftNetworkMonitorV2_Linktype = 122
	MicrosoftNetworkMonitorV2_Linktype__Sunatm MicrosoftNetworkMonitorV2_Linktype = 123
	MicrosoftNetworkMonitorV2_Linktype__Ieee80211Radiotap MicrosoftNetworkMonitorV2_Linktype = 127
	MicrosoftNetworkMonitorV2_Linktype__ArcnetLinux MicrosoftNetworkMonitorV2_Linktype = 129
	MicrosoftNetworkMonitorV2_Linktype__AppleIpOverIeee1394 MicrosoftNetworkMonitorV2_Linktype = 138
	MicrosoftNetworkMonitorV2_Linktype__Mtp2WithPhdr MicrosoftNetworkMonitorV2_Linktype = 139
	MicrosoftNetworkMonitorV2_Linktype__Mtp2 MicrosoftNetworkMonitorV2_Linktype = 140
	MicrosoftNetworkMonitorV2_Linktype__Mtp3 MicrosoftNetworkMonitorV2_Linktype = 141
	MicrosoftNetworkMonitorV2_Linktype__Sccp MicrosoftNetworkMonitorV2_Linktype = 142
	MicrosoftNetworkMonitorV2_Linktype__Docsis MicrosoftNetworkMonitorV2_Linktype = 143
	MicrosoftNetworkMonitorV2_Linktype__LinuxIrda MicrosoftNetworkMonitorV2_Linktype = 144
	MicrosoftNetworkMonitorV2_Linktype__User0 MicrosoftNetworkMonitorV2_Linktype = 147
	MicrosoftNetworkMonitorV2_Linktype__User1 MicrosoftNetworkMonitorV2_Linktype = 148
	MicrosoftNetworkMonitorV2_Linktype__User2 MicrosoftNetworkMonitorV2_Linktype = 149
	MicrosoftNetworkMonitorV2_Linktype__User3 MicrosoftNetworkMonitorV2_Linktype = 150
	MicrosoftNetworkMonitorV2_Linktype__User4 MicrosoftNetworkMonitorV2_Linktype = 151
	MicrosoftNetworkMonitorV2_Linktype__User5 MicrosoftNetworkMonitorV2_Linktype = 152
	MicrosoftNetworkMonitorV2_Linktype__User6 MicrosoftNetworkMonitorV2_Linktype = 153
	MicrosoftNetworkMonitorV2_Linktype__User7 MicrosoftNetworkMonitorV2_Linktype = 154
	MicrosoftNetworkMonitorV2_Linktype__User8 MicrosoftNetworkMonitorV2_Linktype = 155
	MicrosoftNetworkMonitorV2_Linktype__User9 MicrosoftNetworkMonitorV2_Linktype = 156
	MicrosoftNetworkMonitorV2_Linktype__User10 MicrosoftNetworkMonitorV2_Linktype = 157
	MicrosoftNetworkMonitorV2_Linktype__User11 MicrosoftNetworkMonitorV2_Linktype = 158
	MicrosoftNetworkMonitorV2_Linktype__User12 MicrosoftNetworkMonitorV2_Linktype = 159
	MicrosoftNetworkMonitorV2_Linktype__User13 MicrosoftNetworkMonitorV2_Linktype = 160
	MicrosoftNetworkMonitorV2_Linktype__User14 MicrosoftNetworkMonitorV2_Linktype = 161
	MicrosoftNetworkMonitorV2_Linktype__User15 MicrosoftNetworkMonitorV2_Linktype = 162
	MicrosoftNetworkMonitorV2_Linktype__Ieee80211Avs MicrosoftNetworkMonitorV2_Linktype = 163
	MicrosoftNetworkMonitorV2_Linktype__BacnetMsTp MicrosoftNetworkMonitorV2_Linktype = 165
	MicrosoftNetworkMonitorV2_Linktype__PppPppd MicrosoftNetworkMonitorV2_Linktype = 166
	MicrosoftNetworkMonitorV2_Linktype__GprsLlc MicrosoftNetworkMonitorV2_Linktype = 169
	MicrosoftNetworkMonitorV2_Linktype__GpfT MicrosoftNetworkMonitorV2_Linktype = 170
	MicrosoftNetworkMonitorV2_Linktype__GpfF MicrosoftNetworkMonitorV2_Linktype = 171
	MicrosoftNetworkMonitorV2_Linktype__LinuxLapd MicrosoftNetworkMonitorV2_Linktype = 177
	MicrosoftNetworkMonitorV2_Linktype__BluetoothHciH4 MicrosoftNetworkMonitorV2_Linktype = 187
	MicrosoftNetworkMonitorV2_Linktype__UsbLinux MicrosoftNetworkMonitorV2_Linktype = 189
	MicrosoftNetworkMonitorV2_Linktype__Ppi MicrosoftNetworkMonitorV2_Linktype = 192
	MicrosoftNetworkMonitorV2_Linktype__Ieee802154 MicrosoftNetworkMonitorV2_Linktype = 195
	MicrosoftNetworkMonitorV2_Linktype__Sita MicrosoftNetworkMonitorV2_Linktype = 196
	MicrosoftNetworkMonitorV2_Linktype__Erf MicrosoftNetworkMonitorV2_Linktype = 197
	MicrosoftNetworkMonitorV2_Linktype__BluetoothHciH4WithPhdr MicrosoftNetworkMonitorV2_Linktype = 201
	MicrosoftNetworkMonitorV2_Linktype__Ax25Kiss MicrosoftNetworkMonitorV2_Linktype = 202
	MicrosoftNetworkMonitorV2_Linktype__Lapd MicrosoftNetworkMonitorV2_Linktype = 203
	MicrosoftNetworkMonitorV2_Linktype__PppWithDir MicrosoftNetworkMonitorV2_Linktype = 204
	MicrosoftNetworkMonitorV2_Linktype__CHdlcWithDir MicrosoftNetworkMonitorV2_Linktype = 205
	MicrosoftNetworkMonitorV2_Linktype__FrelayWithDir MicrosoftNetworkMonitorV2_Linktype = 206
	MicrosoftNetworkMonitorV2_Linktype__IpmbLinux MicrosoftNetworkMonitorV2_Linktype = 209
	MicrosoftNetworkMonitorV2_Linktype__Ieee802154NonaskPhy MicrosoftNetworkMonitorV2_Linktype = 215
	MicrosoftNetworkMonitorV2_Linktype__UsbLinuxMmapped MicrosoftNetworkMonitorV2_Linktype = 220
	MicrosoftNetworkMonitorV2_Linktype__Fc2 MicrosoftNetworkMonitorV2_Linktype = 224
	MicrosoftNetworkMonitorV2_Linktype__Fc2WithFrameDelims MicrosoftNetworkMonitorV2_Linktype = 225
	MicrosoftNetworkMonitorV2_Linktype__Ipnet MicrosoftNetworkMonitorV2_Linktype = 226
	MicrosoftNetworkMonitorV2_Linktype__CanSocketcan MicrosoftNetworkMonitorV2_Linktype = 227
	MicrosoftNetworkMonitorV2_Linktype__Ipv4 MicrosoftNetworkMonitorV2_Linktype = 228
	MicrosoftNetworkMonitorV2_Linktype__Ipv6 MicrosoftNetworkMonitorV2_Linktype = 229
	MicrosoftNetworkMonitorV2_Linktype__Ieee802154Nofcs MicrosoftNetworkMonitorV2_Linktype = 230
	MicrosoftNetworkMonitorV2_Linktype__Dbus MicrosoftNetworkMonitorV2_Linktype = 231
	MicrosoftNetworkMonitorV2_Linktype__DvbCi MicrosoftNetworkMonitorV2_Linktype = 235
	MicrosoftNetworkMonitorV2_Linktype__Mux27010 MicrosoftNetworkMonitorV2_Linktype = 236
	MicrosoftNetworkMonitorV2_Linktype__Stanag5066DPdu MicrosoftNetworkMonitorV2_Linktype = 237
	MicrosoftNetworkMonitorV2_Linktype__Nflog MicrosoftNetworkMonitorV2_Linktype = 239
	MicrosoftNetworkMonitorV2_Linktype__Netanalyzer MicrosoftNetworkMonitorV2_Linktype = 240
	MicrosoftNetworkMonitorV2_Linktype__NetanalyzerTransparent MicrosoftNetworkMonitorV2_Linktype = 241
	MicrosoftNetworkMonitorV2_Linktype__Ipoib MicrosoftNetworkMonitorV2_Linktype = 242
	MicrosoftNetworkMonitorV2_Linktype__Mpeg2Ts MicrosoftNetworkMonitorV2_Linktype = 243
	MicrosoftNetworkMonitorV2_Linktype__Ng40 MicrosoftNetworkMonitorV2_Linktype = 244
	MicrosoftNetworkMonitorV2_Linktype__NfcLlcp MicrosoftNetworkMonitorV2_Linktype = 245
	MicrosoftNetworkMonitorV2_Linktype__Infiniband MicrosoftNetworkMonitorV2_Linktype = 247
	MicrosoftNetworkMonitorV2_Linktype__Sctp MicrosoftNetworkMonitorV2_Linktype = 248
	MicrosoftNetworkMonitorV2_Linktype__Usbpcap MicrosoftNetworkMonitorV2_Linktype = 249
	MicrosoftNetworkMonitorV2_Linktype__RtacSerial MicrosoftNetworkMonitorV2_Linktype = 250
	MicrosoftNetworkMonitorV2_Linktype__BluetoothLeLl MicrosoftNetworkMonitorV2_Linktype = 251
	MicrosoftNetworkMonitorV2_Linktype__Netlink MicrosoftNetworkMonitorV2_Linktype = 253
	MicrosoftNetworkMonitorV2_Linktype__BluetoothLinuxMonitor MicrosoftNetworkMonitorV2_Linktype = 254
	MicrosoftNetworkMonitorV2_Linktype__BluetoothBredrBb MicrosoftNetworkMonitorV2_Linktype = 255
	MicrosoftNetworkMonitorV2_Linktype__BluetoothLeLlWithPhdr MicrosoftNetworkMonitorV2_Linktype = 256
	MicrosoftNetworkMonitorV2_Linktype__ProfibusDl MicrosoftNetworkMonitorV2_Linktype = 257
	MicrosoftNetworkMonitorV2_Linktype__Pktap MicrosoftNetworkMonitorV2_Linktype = 258
	MicrosoftNetworkMonitorV2_Linktype__Epon MicrosoftNetworkMonitorV2_Linktype = 259
	MicrosoftNetworkMonitorV2_Linktype__IpmiHpm2 MicrosoftNetworkMonitorV2_Linktype = 260
	MicrosoftNetworkMonitorV2_Linktype__ZwaveR1R2 MicrosoftNetworkMonitorV2_Linktype = 261
	MicrosoftNetworkMonitorV2_Linktype__ZwaveR3 MicrosoftNetworkMonitorV2_Linktype = 262
	MicrosoftNetworkMonitorV2_Linktype__WattstopperDlm MicrosoftNetworkMonitorV2_Linktype = 263
	MicrosoftNetworkMonitorV2_Linktype__Iso14443 MicrosoftNetworkMonitorV2_Linktype = 264
)
type MicrosoftNetworkMonitorV2 struct {
	Signature []byte
	VersionMinor uint8
	VersionMajor uint8
	MacType MicrosoftNetworkMonitorV2_Linktype
	TimeCaptureStart *WindowsSystemtime
	FrameTableOfs uint32
	FrameTableLen uint32
	UserDataOfs uint32
	UserDataLen uint32
	CommentOfs uint32
	CommentLen uint32
	StatisticsOfs uint32
	StatisticsLen uint32
	NetworkInfoOfs uint32
	NetworkInfoLen uint32
	ConversationStatsOfs uint32
	ConversationStatsLen uint32
	_io *kaitai.Stream
	_root *MicrosoftNetworkMonitorV2
	_parent interface{}
	_raw_frameTable []byte
	_f_frameTable bool
	frameTable *MicrosoftNetworkMonitorV2_FrameIndex
}
func NewMicrosoftNetworkMonitorV2() *MicrosoftNetworkMonitorV2 {
	return &MicrosoftNetworkMonitorV2{
	}
}

func (this *MicrosoftNetworkMonitorV2) Read(io *kaitai.Stream, parent interface{}, root *MicrosoftNetworkMonitorV2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Signature = tmp1
	if !(bytes.Equal(this.Signature, []uint8{71, 77, 66, 85})) {
		return kaitai.NewValidationNotEqualError([]uint8{71, 77, 66, 85}, this.Signature, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMinor = tmp2
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMajor = tmp3
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MacType = MicrosoftNetworkMonitorV2_Linktype(tmp4)
	tmp5 := NewWindowsSystemtime()
	err = tmp5.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.TimeCaptureStart = tmp5
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FrameTableOfs = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FrameTableLen = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.UserDataOfs = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.UserDataLen = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CommentOfs = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CommentLen = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StatisticsOfs = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StatisticsLen = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NetworkInfoOfs = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NetworkInfoLen = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ConversationStatsOfs = uint32(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ConversationStatsLen = uint32(tmp17)
	return err
}

/**
 * Index that is used to access individual captured frames
 */
func (this *MicrosoftNetworkMonitorV2) FrameTable() (v *MicrosoftNetworkMonitorV2_FrameIndex, err error) {
	if (this._f_frameTable) {
		return this.frameTable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.FrameTableOfs), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp18, err := this._io.ReadBytes(int(this.FrameTableLen))
	if err != nil {
		return nil, err
	}
	tmp18 = tmp18
	this._raw_frameTable = tmp18
	_io__raw_frameTable := kaitai.NewStream(bytes.NewReader(this._raw_frameTable))
	tmp19 := NewMicrosoftNetworkMonitorV2_FrameIndex()
	err = tmp19.Read(_io__raw_frameTable, this, this._root)
	if err != nil {
		return nil, err
	}
	this.frameTable = tmp19
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_frameTable = true
	this._f_frameTable = true
	return this.frameTable, nil
}

/**
 * Format version (minor), BCD
 */

/**
 * Format version (major), BCD
 */

/**
 * Network topology type of captured data
 */

/**
 * Timestamp of capture start
 */
type MicrosoftNetworkMonitorV2_FrameIndex struct {
	Entries []*MicrosoftNetworkMonitorV2_FrameIndexEntry
	_io *kaitai.Stream
	_root *MicrosoftNetworkMonitorV2
	_parent *MicrosoftNetworkMonitorV2
}
func NewMicrosoftNetworkMonitorV2_FrameIndex() *MicrosoftNetworkMonitorV2_FrameIndex {
	return &MicrosoftNetworkMonitorV2_FrameIndex{
	}
}

func (this *MicrosoftNetworkMonitorV2_FrameIndex) Read(io *kaitai.Stream, parent *MicrosoftNetworkMonitorV2, root *MicrosoftNetworkMonitorV2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp20, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp20 {
			break
		}
		tmp21 := NewMicrosoftNetworkMonitorV2_FrameIndexEntry()
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp21)
	}
	return err
}

/**
 * Each index entry is just a pointer to where the frame data is
 * stored in the file.
 */
type MicrosoftNetworkMonitorV2_FrameIndexEntry struct {
	Ofs uint32
	_io *kaitai.Stream
	_root *MicrosoftNetworkMonitorV2
	_parent *MicrosoftNetworkMonitorV2_FrameIndex
	_f_body bool
	body *MicrosoftNetworkMonitorV2_Frame
}
func NewMicrosoftNetworkMonitorV2_FrameIndexEntry() *MicrosoftNetworkMonitorV2_FrameIndexEntry {
	return &MicrosoftNetworkMonitorV2_FrameIndexEntry{
	}
}

func (this *MicrosoftNetworkMonitorV2_FrameIndexEntry) Read(io *kaitai.Stream, parent *MicrosoftNetworkMonitorV2_FrameIndex, root *MicrosoftNetworkMonitorV2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ofs = uint32(tmp22)
	return err
}

/**
 * Frame body itself
 */
func (this *MicrosoftNetworkMonitorV2_FrameIndexEntry) Body() (v *MicrosoftNetworkMonitorV2_Frame, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Ofs), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp23 := NewMicrosoftNetworkMonitorV2_Frame()
	err = tmp23.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.body = tmp23
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

/**
 * Absolute pointer to frame data in the file
 */

/**
 * A container for actually captured network data. Allow to
 * timestamp individual frames and designates how much data from
 * the original packet was actually written into the file.
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/netmon2/frame">Source</a>
 */
type MicrosoftNetworkMonitorV2_Frame struct {
	TsDelta uint64
	OrigLen uint32
	IncLen uint32
	Body interface{}
	_io *kaitai.Stream
	_root *MicrosoftNetworkMonitorV2
	_parent *MicrosoftNetworkMonitorV2_FrameIndexEntry
	_raw_Body []byte
}
func NewMicrosoftNetworkMonitorV2_Frame() *MicrosoftNetworkMonitorV2_Frame {
	return &MicrosoftNetworkMonitorV2_Frame{
	}
}

func (this *MicrosoftNetworkMonitorV2_Frame) Read(io *kaitai.Stream, parent *MicrosoftNetworkMonitorV2_FrameIndexEntry, root *MicrosoftNetworkMonitorV2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TsDelta = uint64(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OrigLen = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IncLen = uint32(tmp26)
	switch (this._root.MacType) {
	case MicrosoftNetworkMonitorV2_Linktype__Ethernet:
		tmp27, err := this._io.ReadBytes(int(this.IncLen))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Body = tmp27
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp28 := NewEthernetFrame()
		err = tmp28.Read(_io__raw_Body, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp28
	default:
		tmp29, err := this._io.ReadBytes(int(this.IncLen))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_Body = tmp29
	}
	return err
}

/**
 * Time stamp - usecs since start of capture
 */

/**
 * Actual length of packet
 */

/**
 * Number of octets captured in file
 */

/**
 * Actual packet captured from the network
 */
