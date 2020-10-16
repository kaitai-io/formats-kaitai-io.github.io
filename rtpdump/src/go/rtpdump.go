// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * @see <a href="https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h">Source</a>
 */
type Rtpdump struct {
	FileHeader *Rtpdump_HeaderT
	Packets []*Rtpdump_PacketT
	_io *kaitai.Stream
	_root *Rtpdump
	_parent interface{}
}
func NewRtpdump() *Rtpdump {
	return &Rtpdump{
	}
}

func (this *Rtpdump) Read(io *kaitai.Stream, parent interface{}, root *Rtpdump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewRtpdump_HeaderT()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FileHeader = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewRtpdump_PacketT()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Packets = append(this.Packets, tmp3)
	}
	return err
}
type Rtpdump_HeaderT struct {
	Shebang []byte
	Space []byte
	Ip string
	Port string
	StartSec uint32
	StartUsec uint32
	Ip2 uint32
	Port2 uint16
	Padding uint16
	_io *kaitai.Stream
	_root *Rtpdump
	_parent *Rtpdump
}
func NewRtpdump_HeaderT() *Rtpdump_HeaderT {
	return &Rtpdump_HeaderT{
	}
}

func (this *Rtpdump_HeaderT) Read(io *kaitai.Stream, parent *Rtpdump, root *Rtpdump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Shebang = tmp4
	if !(bytes.Equal(this.Shebang, []uint8{35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48})) {
		return kaitai.NewValidationNotEqualError([]uint8{35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48}, this.Shebang, this._io, "/types/header_t/seq/0")
	}
	tmp5, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Space = tmp5
	if !(bytes.Equal(this.Space, []uint8{32})) {
		return kaitai.NewValidationNotEqualError([]uint8{32}, this.Space, this._io, "/types/header_t/seq/1")
	}
	tmp6, err := this._io.ReadBytesTerm(47, false, true, true)
	if err != nil {
		return err
	}
	this.Ip = string(tmp6)
	tmp7, err := this._io.ReadBytesTerm(10, false, true, true)
	if err != nil {
		return err
	}
	this.Port = string(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StartSec = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StartUsec = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ip2 = uint32(tmp10)
	tmp11, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Port2 = uint16(tmp11)
	tmp12, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Padding = uint16(tmp12)
	return err
}

/**
 * start of recording, the seconds part.
 */

/**
 * start of recording, the microseconds part.
 */

/**
 * network source.
 */

/**
 * port.
 */

/**
 * 2 bytes padding.
 */
type Rtpdump_PacketT struct {
	Length uint16
	LenBody uint16
	PacketUsec uint32
	Body *RtpPacket
	_io *kaitai.Stream
	_root *Rtpdump
	_parent *Rtpdump
	_raw_Body []byte
}
func NewRtpdump_PacketT() *Rtpdump_PacketT {
	return &Rtpdump_PacketT{
	}
}

func (this *Rtpdump_PacketT) Read(io *kaitai.Stream, parent *Rtpdump, root *Rtpdump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp13)
	tmp14, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenBody = uint16(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PacketUsec = uint32(tmp15)
	tmp16, err := this._io.ReadBytes(int(this.LenBody))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this._raw_Body = tmp16
	_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
	tmp17 := NewRtpPacket()
	err = tmp17.Read(_io__raw_Body, this, nil)
	if err != nil {
		return err
	}
	this.Body = tmp17
	return err
}

/**
 * packet length (including this header).
 */

/**
 * payload length.
 */

/**
 * timestamp of packet since the start.
 */
