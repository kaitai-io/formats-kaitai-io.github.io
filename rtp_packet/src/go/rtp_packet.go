// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


/**
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */

type RtpPacket_PayloadTypeEnum int
const (
	RtpPacket_PayloadTypeEnum__Pcmu RtpPacket_PayloadTypeEnum = 0
	RtpPacket_PayloadTypeEnum__Reserved1 RtpPacket_PayloadTypeEnum = 1
	RtpPacket_PayloadTypeEnum__Reserved2 RtpPacket_PayloadTypeEnum = 2
	RtpPacket_PayloadTypeEnum__Gsm RtpPacket_PayloadTypeEnum = 3
	RtpPacket_PayloadTypeEnum__G723 RtpPacket_PayloadTypeEnum = 4
	RtpPacket_PayloadTypeEnum__Dvi41 RtpPacket_PayloadTypeEnum = 5
	RtpPacket_PayloadTypeEnum__Dvi42 RtpPacket_PayloadTypeEnum = 6
	RtpPacket_PayloadTypeEnum__Lpc RtpPacket_PayloadTypeEnum = 7
	RtpPacket_PayloadTypeEnum__Pama RtpPacket_PayloadTypeEnum = 8
	RtpPacket_PayloadTypeEnum__G722 RtpPacket_PayloadTypeEnum = 9
	RtpPacket_PayloadTypeEnum__L161 RtpPacket_PayloadTypeEnum = 10
	RtpPacket_PayloadTypeEnum__L162 RtpPacket_PayloadTypeEnum = 11
	RtpPacket_PayloadTypeEnum__Qcelp RtpPacket_PayloadTypeEnum = 12
	RtpPacket_PayloadTypeEnum__Cn RtpPacket_PayloadTypeEnum = 13
	RtpPacket_PayloadTypeEnum__Mpa RtpPacket_PayloadTypeEnum = 14
	RtpPacket_PayloadTypeEnum__G728 RtpPacket_PayloadTypeEnum = 15
	RtpPacket_PayloadTypeEnum__Dvi43 RtpPacket_PayloadTypeEnum = 16
	RtpPacket_PayloadTypeEnum__Dvi44 RtpPacket_PayloadTypeEnum = 17
	RtpPacket_PayloadTypeEnum__G729 RtpPacket_PayloadTypeEnum = 18
	RtpPacket_PayloadTypeEnum__Reserved3 RtpPacket_PayloadTypeEnum = 19
	RtpPacket_PayloadTypeEnum__Unassigned1 RtpPacket_PayloadTypeEnum = 20
	RtpPacket_PayloadTypeEnum__Unassigned2 RtpPacket_PayloadTypeEnum = 21
	RtpPacket_PayloadTypeEnum__Unassigned3 RtpPacket_PayloadTypeEnum = 22
	RtpPacket_PayloadTypeEnum__Unassigned4 RtpPacket_PayloadTypeEnum = 23
	RtpPacket_PayloadTypeEnum__Unassigned5 RtpPacket_PayloadTypeEnum = 24
	RtpPacket_PayloadTypeEnum__Celb RtpPacket_PayloadTypeEnum = 25
	RtpPacket_PayloadTypeEnum__Jpeg RtpPacket_PayloadTypeEnum = 26
	RtpPacket_PayloadTypeEnum__Unassigned6 RtpPacket_PayloadTypeEnum = 27
	RtpPacket_PayloadTypeEnum__Nv RtpPacket_PayloadTypeEnum = 28
	RtpPacket_PayloadTypeEnum__Unassigned7 RtpPacket_PayloadTypeEnum = 29
	RtpPacket_PayloadTypeEnum__Unassigned8 RtpPacket_PayloadTypeEnum = 30
	RtpPacket_PayloadTypeEnum__H261 RtpPacket_PayloadTypeEnum = 31
	RtpPacket_PayloadTypeEnum__Mpv RtpPacket_PayloadTypeEnum = 32
	RtpPacket_PayloadTypeEnum__Mp2t RtpPacket_PayloadTypeEnum = 33
	RtpPacket_PayloadTypeEnum__H263 RtpPacket_PayloadTypeEnum = 34
	RtpPacket_PayloadTypeEnum__MpegPs RtpPacket_PayloadTypeEnum = 96
)
type RtpPacket struct {
	Version uint64
	HasPadding bool
	HasExtension bool
	CsrcCount uint64
	Marker bool
	PayloadType RtpPacket_PayloadTypeEnum
	SequenceNumber uint16
	Timestamp uint32
	Ssrc uint32
	HeaderExtension *RtpPacket_HeaderExtention
	Data []byte
	Padding []byte
	_io *kaitai.Stream
	_root *RtpPacket
	_parent interface{}
	_f_lenPaddingIfExists bool
	lenPaddingIfExists uint8
	_f_lenPadding bool
	lenPadding uint8
}
func NewRtpPacket() *RtpPacket {
	return &RtpPacket{
	}
}

func (this *RtpPacket) Read(io *kaitai.Stream, parent interface{}, root *RtpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Version = tmp1
	tmp2, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasPadding = tmp2 != 0
	tmp3, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasExtension = tmp3 != 0
	tmp4, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.CsrcCount = tmp4
	tmp5, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Marker = tmp5 != 0
	tmp6, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.PayloadType = RtpPacket_PayloadTypeEnum(tmp6)
	this._io.AlignToByte()
	tmp7, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SequenceNumber = uint16(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp9)
	if (this.HasExtension) {
		tmp10 := NewRtpPacket_HeaderExtention()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.HeaderExtension = tmp10
	}
	tmp11, err := this._io.Size()
	if err != nil {
		return err
	}
	tmp12, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp13, err := this.LenPadding()
	if err != nil {
		return err
	}
	tmp14, err := this._io.ReadBytes(int(((tmp11 - tmp12) - tmp13)))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Data = tmp14
	tmp15, err := this.LenPadding()
	if err != nil {
		return err
	}
	tmp16, err := this._io.ReadBytes(int(tmp15))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Padding = tmp16
	return err
}

/**
 * If padding bit is enabled, last byte of data contains number of
 * bytes appended to the payload as padding.
 */
func (this *RtpPacket) LenPaddingIfExists() (v uint8, err error) {
	if (this._f_lenPaddingIfExists) {
		return this.lenPaddingIfExists, nil
	}
	if (this.HasPadding) {
		_pos, err := this._io.Pos()
		if err != nil {
			return 0, err
		}
		tmp17, err := this._io.Size()
		if err != nil {
			return 0, err
		}
		_, err = this._io.Seek(int64((tmp17 - 1)), io.SeekStart)
		if err != nil {
			return 0, err
		}
		tmp18, err := this._io.ReadU1()
		if err != nil {
			return 0, err
		}
		this.lenPaddingIfExists = tmp18
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return 0, err
		}
		this._f_lenPaddingIfExists = true
	}
	this._f_lenPaddingIfExists = true
	return this.lenPaddingIfExists, nil
}

/**
 * Always returns number of padding bytes to in the payload.
 */
func (this *RtpPacket) LenPadding() (v uint8, err error) {
	if (this._f_lenPadding) {
		return this.lenPadding, nil
	}
	var tmp19 uint8;
	if (this.HasPadding) {
		tmp20, err := this.LenPaddingIfExists()
		if err != nil {
			return 0, err
		}
		tmp19 = tmp20
	} else {
		tmp19 = 0
	}
	this.lenPadding = uint8(tmp19)
	this._f_lenPadding = true
	return this.lenPadding, nil
}

/**
 * Payload without padding.
 */
type RtpPacket_HeaderExtention struct {
	Id uint16
	Length uint16
	_io *kaitai.Stream
	_root *RtpPacket
	_parent *RtpPacket
}
func NewRtpPacket_HeaderExtention() *RtpPacket_HeaderExtention {
	return &RtpPacket_HeaderExtention{
	}
}

func (this *RtpPacket_HeaderExtention) Read(io *kaitai.Stream, parent *RtpPacket, root *RtpPacket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp21)
	tmp22, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp22)
	return err
}
