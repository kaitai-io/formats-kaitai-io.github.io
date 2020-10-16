// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * RTCP is the Real-Time Control Protocol
 * @see <a href="https://tools.ietf.org/html/rfc3550">Source</a>
 */

type RtcpPayload_PayloadType int
const (
	RtcpPayload_PayloadType__Fir RtcpPayload_PayloadType = 192
	RtcpPayload_PayloadType__Nack RtcpPayload_PayloadType = 193
	RtcpPayload_PayloadType__Ij RtcpPayload_PayloadType = 195
	RtcpPayload_PayloadType__Sr RtcpPayload_PayloadType = 200
	RtcpPayload_PayloadType__Rr RtcpPayload_PayloadType = 201
	RtcpPayload_PayloadType__Sdes RtcpPayload_PayloadType = 202
	RtcpPayload_PayloadType__Bye RtcpPayload_PayloadType = 203
	RtcpPayload_PayloadType__App RtcpPayload_PayloadType = 204
	RtcpPayload_PayloadType__Rtpfb RtcpPayload_PayloadType = 205
	RtcpPayload_PayloadType__Psfb RtcpPayload_PayloadType = 206
	RtcpPayload_PayloadType__Xr RtcpPayload_PayloadType = 207
	RtcpPayload_PayloadType__Avb RtcpPayload_PayloadType = 208
	RtcpPayload_PayloadType__Rsi RtcpPayload_PayloadType = 209
)

type RtcpPayload_SdesSubtype int
const (
	RtcpPayload_SdesSubtype__Pad RtcpPayload_SdesSubtype = 0
	RtcpPayload_SdesSubtype__Cname RtcpPayload_SdesSubtype = 1
	RtcpPayload_SdesSubtype__Name RtcpPayload_SdesSubtype = 2
	RtcpPayload_SdesSubtype__Email RtcpPayload_SdesSubtype = 3
	RtcpPayload_SdesSubtype__Phone RtcpPayload_SdesSubtype = 4
	RtcpPayload_SdesSubtype__Loc RtcpPayload_SdesSubtype = 5
	RtcpPayload_SdesSubtype__Tool RtcpPayload_SdesSubtype = 6
	RtcpPayload_SdesSubtype__Note RtcpPayload_SdesSubtype = 7
	RtcpPayload_SdesSubtype__Priv RtcpPayload_SdesSubtype = 8
)

type RtcpPayload_PsfbSubtype int
const (
	RtcpPayload_PsfbSubtype__Pli RtcpPayload_PsfbSubtype = 1
	RtcpPayload_PsfbSubtype__Sli RtcpPayload_PsfbSubtype = 2
	RtcpPayload_PsfbSubtype__Rpsi RtcpPayload_PsfbSubtype = 3
	RtcpPayload_PsfbSubtype__Fir RtcpPayload_PsfbSubtype = 4
	RtcpPayload_PsfbSubtype__Tstr RtcpPayload_PsfbSubtype = 5
	RtcpPayload_PsfbSubtype__Tstn RtcpPayload_PsfbSubtype = 6
	RtcpPayload_PsfbSubtype__Vbcm RtcpPayload_PsfbSubtype = 7
	RtcpPayload_PsfbSubtype__Afb RtcpPayload_PsfbSubtype = 15
)

type RtcpPayload_RtpfbSubtype int
const (
	RtcpPayload_RtpfbSubtype__Nack RtcpPayload_RtpfbSubtype = 1
	RtcpPayload_RtpfbSubtype__Tmmbr RtcpPayload_RtpfbSubtype = 3
	RtcpPayload_RtpfbSubtype__Tmmbn RtcpPayload_RtpfbSubtype = 4
	RtcpPayload_RtpfbSubtype__Rrr RtcpPayload_RtpfbSubtype = 5
	RtcpPayload_RtpfbSubtype__TransportFeedback RtcpPayload_RtpfbSubtype = 15
)
type RtcpPayload struct {
	RtcpPackets []*RtcpPayload_RtcpPacket
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent interface{}
}
func NewRtcpPayload() *RtcpPayload {
	return &RtcpPayload{
	}
}

func (this *RtcpPayload) Read(io *kaitai.Stream, parent interface{}, root *RtcpPayload) (err error) {
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
		tmp2 := NewRtcpPayload_RtcpPacket()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RtcpPackets = append(this.RtcpPackets, tmp2)
	}
	return err
}
type RtcpPayload_PsfbAfbRembPacket struct {
	NumSsrc uint8
	BrExp uint64
	BrMantissa uint64
	SsrcList []uint32
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_PsfbAfbPacket
	_f_maxTotalBitrate bool
	maxTotalBitrate int
}
func NewRtcpPayload_PsfbAfbRembPacket() *RtcpPayload_PsfbAfbRembPacket {
	return &RtcpPayload_PsfbAfbRembPacket{
	}
}

func (this *RtcpPayload_PsfbAfbRembPacket) Read(io *kaitai.Stream, parent *RtcpPayload_PsfbAfbPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumSsrc = tmp3
	tmp4, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.BrExp = tmp4
	tmp5, err := this._io.ReadBitsIntBe(18)
	if err != nil {
		return err
	}
	this.BrMantissa = tmp5
	this._io.AlignToByte()
	this.SsrcList = make([]uint32, this.NumSsrc)
	for i := range this.SsrcList {
		tmp6, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.SsrcList[i] = tmp6
	}
	return err
}
func (this *RtcpPayload_PsfbAfbRembPacket) MaxTotalBitrate() (v int, err error) {
	if (this._f_maxTotalBitrate) {
		return this.maxTotalBitrate, nil
	}
	this.maxTotalBitrate = int((this.BrMantissa * (1 << this.BrExp)))
	this._f_maxTotalBitrate = true
	return this.maxTotalBitrate, nil
}
type RtcpPayload_SrPacket struct {
	Ssrc uint32
	NtpMsw uint32
	NtpLsw uint32
	RtpTimestamp uint32
	SenderPacketCount uint32
	SenderOctetCount uint32
	ReportBlock []*RtcpPayload_ReportBlock
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtcpPacket
	_f_ntp bool
	ntp int
}
func NewRtcpPayload_SrPacket() *RtcpPayload_SrPacket {
	return &RtcpPayload_SrPacket{
	}
}

func (this *RtcpPayload_SrPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtcpPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NtpMsw = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NtpLsw = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.RtpTimestamp = uint32(tmp10)
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SenderPacketCount = uint32(tmp11)
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SenderOctetCount = uint32(tmp12)
	this.ReportBlock = make([]*RtcpPayload_ReportBlock, this._parent.Subtype)
	for i := range this.ReportBlock {
		tmp13 := NewRtcpPayload_ReportBlock()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ReportBlock[i] = tmp13
	}
	return err
}
func (this *RtcpPayload_SrPacket) Ntp() (v int, err error) {
	if (this._f_ntp) {
		return this.ntp, nil
	}
	this.ntp = int(((this.NtpMsw << 32) & this.NtpLsw))
	this._f_ntp = true
	return this.ntp, nil
}
type RtcpPayload_RrPacket struct {
	Ssrc uint32
	ReportBlock []*RtcpPayload_ReportBlock
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtcpPacket
}
func NewRtcpPayload_RrPacket() *RtcpPayload_RrPacket {
	return &RtcpPayload_RrPacket{
	}
}

func (this *RtcpPayload_RrPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtcpPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp14)
	this.ReportBlock = make([]*RtcpPayload_ReportBlock, this._parent.Subtype)
	for i := range this.ReportBlock {
		tmp15 := NewRtcpPayload_ReportBlock()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ReportBlock[i] = tmp15
	}
	return err
}
type RtcpPayload_RtcpPacket struct {
	Version uint64
	Padding bool
	Subtype uint64
	PayloadType RtcpPayload_PayloadType
	Length uint16
	Body interface{}
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload
	_raw_Body []byte
}
func NewRtcpPayload_RtcpPacket() *RtcpPayload_RtcpPacket {
	return &RtcpPayload_RtcpPacket{
	}
}

func (this *RtcpPayload_RtcpPacket) Read(io *kaitai.Stream, parent *RtcpPayload, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Version = tmp16
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Padding = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Subtype = tmp18
	this._io.AlignToByte()
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PayloadType = RtcpPayload_PayloadType(tmp19)
	tmp20, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp20)
	switch (this.PayloadType) {
	case RtcpPayload_PayloadType__Sr:
		tmp21, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp21 = tmp21
		this._raw_Body = tmp21
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp22 := NewRtcpPayload_SrPacket()
		err = tmp22.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp22
	case RtcpPayload_PayloadType__Psfb:
		tmp23, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp23 = tmp23
		this._raw_Body = tmp23
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp24 := NewRtcpPayload_PsfbPacket()
		err = tmp24.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp24
	case RtcpPayload_PayloadType__Rr:
		tmp25, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Body = tmp25
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp26 := NewRtcpPayload_RrPacket()
		err = tmp26.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp26
	case RtcpPayload_PayloadType__Rtpfb:
		tmp27, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Body = tmp27
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp28 := NewRtcpPayload_RtpfbPacket()
		err = tmp28.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp28
	case RtcpPayload_PayloadType__Sdes:
		tmp29, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_Body = tmp29
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp30 := NewRtcpPayload_SdesPacket()
		err = tmp30.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp30
	default:
		tmp31, err := this._io.ReadBytes(int((4 * this.Length)))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Body = tmp31
	}
	return err
}
type RtcpPayload_SdesTlv struct {
	Type RtcpPayload_SdesSubtype
	Length uint8
	Value []byte
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_SourceChunk
}
func NewRtcpPayload_SdesTlv() *RtcpPayload_SdesTlv {
	return &RtcpPayload_SdesTlv{
	}
}

func (this *RtcpPayload_SdesTlv) Read(io *kaitai.Stream, parent *RtcpPayload_SourceChunk, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = RtcpPayload_SdesSubtype(tmp32)
	if (this.Type != RtcpPayload_SdesSubtype__Pad) {
		tmp33, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Length = tmp33
	}
	if (this.Type != RtcpPayload_SdesSubtype__Pad) {
		tmp34, err := this._io.ReadBytes(int(this.Length))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this.Value = tmp34
	}
	return err
}
type RtcpPayload_ReportBlock struct {
	SsrcSource uint32
	LostVal uint8
	HighestSeqNumReceived uint32
	InterarrivalJitter uint32
	Lsr uint32
	Dlsr uint32
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent interface{}
	_f_fractionLost bool
	fractionLost int
	_f_cumulativePacketsLost bool
	cumulativePacketsLost int
}
func NewRtcpPayload_ReportBlock() *RtcpPayload_ReportBlock {
	return &RtcpPayload_ReportBlock{
	}
}

func (this *RtcpPayload_ReportBlock) Read(io *kaitai.Stream, parent interface{}, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SsrcSource = uint32(tmp35)
	tmp36, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LostVal = tmp36
	tmp37, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.HighestSeqNumReceived = uint32(tmp37)
	tmp38, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.InterarrivalJitter = uint32(tmp38)
	tmp39, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Lsr = uint32(tmp39)
	tmp40, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Dlsr = uint32(tmp40)
	return err
}
func (this *RtcpPayload_ReportBlock) FractionLost() (v int, err error) {
	if (this._f_fractionLost) {
		return this.fractionLost, nil
	}
	this.fractionLost = int((this.LostVal >> 24))
	this._f_fractionLost = true
	return this.fractionLost, nil
}
func (this *RtcpPayload_ReportBlock) CumulativePacketsLost() (v int, err error) {
	if (this._f_cumulativePacketsLost) {
		return this.cumulativePacketsLost, nil
	}
	this.cumulativePacketsLost = int((this.LostVal & 16777215))
	this._f_cumulativePacketsLost = true
	return this.cumulativePacketsLost, nil
}
type RtcpPayload_RtpfbTransportFeedbackPacket struct {
	BaseSequenceNumber uint16
	PacketStatusCount uint16
	B4 uint32
	Remaining []byte
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtpfbPacket
	_f_referenceTime bool
	referenceTime int
	_f_fbPktCount bool
	fbPktCount int
	_f_packetStatus bool
	packetStatus []byte
	_f_recvDelta bool
	recvDelta []byte
}
func NewRtcpPayload_RtpfbTransportFeedbackPacket() *RtcpPayload_RtpfbTransportFeedbackPacket {
	return &RtcpPayload_RtpfbTransportFeedbackPacket{
	}
}

func (this *RtcpPayload_RtpfbTransportFeedbackPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtpfbPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.BaseSequenceNumber = uint16(tmp41)
	tmp42, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.PacketStatusCount = uint16(tmp42)
	tmp43, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.B4 = uint32(tmp43)
	tmp44, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Remaining = tmp44
	return err
}
func (this *RtcpPayload_RtpfbTransportFeedbackPacket) ReferenceTime() (v int, err error) {
	if (this._f_referenceTime) {
		return this.referenceTime, nil
	}
	this.referenceTime = int((this.B4 >> 8))
	this._f_referenceTime = true
	return this.referenceTime, nil
}
func (this *RtcpPayload_RtpfbTransportFeedbackPacket) FbPktCount() (v int, err error) {
	if (this._f_fbPktCount) {
		return this.fbPktCount, nil
	}
	this.fbPktCount = int((this.B4 & 255))
	this._f_fbPktCount = true
	return this.fbPktCount, nil
}
func (this *RtcpPayload_RtpfbTransportFeedbackPacket) PacketStatus() (v []byte, err error) {
	if (this._f_packetStatus) {
		return this.packetStatus, nil
	}
	tmp45, err := this._io.ReadBytes(int(0))
	if err != nil {
		return nil, err
	}
	tmp45 = tmp45
	this.packetStatus = tmp45
	this._f_packetStatus = true
	this._f_packetStatus = true
	return this.packetStatus, nil
}
func (this *RtcpPayload_RtpfbTransportFeedbackPacket) RecvDelta() (v []byte, err error) {
	if (this._f_recvDelta) {
		return this.recvDelta, nil
	}
	tmp46, err := this._io.ReadBytes(int(0))
	if err != nil {
		return nil, err
	}
	tmp46 = tmp46
	this.recvDelta = tmp46
	this._f_recvDelta = true
	this._f_recvDelta = true
	return this.recvDelta, nil
}
type RtcpPayload_PsfbPacket struct {
	Ssrc uint32
	SsrcMediaSource uint32
	FciBlock interface{}
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtcpPacket
	_raw_FciBlock []byte
	_f_fmt bool
	fmt RtcpPayload_PsfbSubtype
}
func NewRtcpPayload_PsfbPacket() *RtcpPayload_PsfbPacket {
	return &RtcpPayload_PsfbPacket{
	}
}

func (this *RtcpPayload_PsfbPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtcpPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp47, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp47)
	tmp48, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SsrcMediaSource = uint32(tmp48)
	tmp49, err := this.Fmt()
	if err != nil {
		return err
	}
	switch (tmp49) {
	case RtcpPayload_PsfbSubtype__Afb:
		tmp50, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp50 = tmp50
		this._raw_FciBlock = tmp50
		_io__raw_FciBlock := kaitai.NewStream(bytes.NewReader(this._raw_FciBlock))
		tmp51 := NewRtcpPayload_PsfbAfbPacket()
		err = tmp51.Read(_io__raw_FciBlock, this, this._root)
		if err != nil {
			return err
		}
		this.FciBlock = tmp51
	default:
		tmp52, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp52 = tmp52
		this._raw_FciBlock = tmp52
	}
	return err
}
func (this *RtcpPayload_PsfbPacket) Fmt() (v RtcpPayload_PsfbSubtype, err error) {
	if (this._f_fmt) {
		return this.fmt, nil
	}
	this.fmt = RtcpPayload_PsfbSubtype(RtcpPayload_PsfbSubtype(this._parent.Subtype))
	this._f_fmt = true
	return this.fmt, nil
}
type RtcpPayload_SourceChunk struct {
	Ssrc uint32
	SdesTlv []*RtcpPayload_SdesTlv
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_SdesPacket
}
func NewRtcpPayload_SourceChunk() *RtcpPayload_SourceChunk {
	return &RtcpPayload_SourceChunk{
	}
}

func (this *RtcpPayload_SourceChunk) Read(io *kaitai.Stream, parent *RtcpPayload_SdesPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp53, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp53)
	for i := 1;; i++ {
		tmp54, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp54 {
			break
		}
		tmp55 := NewRtcpPayload_SdesTlv()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SdesTlv = append(this.SdesTlv, tmp55)
	}
	return err
}
type RtcpPayload_SdesPacket struct {
	SourceChunk []*RtcpPayload_SourceChunk
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtcpPacket
	_f_sourceCount bool
	sourceCount uint64
}
func NewRtcpPayload_SdesPacket() *RtcpPayload_SdesPacket {
	return &RtcpPayload_SdesPacket{
	}
}

func (this *RtcpPayload_SdesPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtcpPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp56, err := this.SourceCount()
	if err != nil {
		return err
	}
	this.SourceChunk = make([]*RtcpPayload_SourceChunk, tmp56)
	for i := range this.SourceChunk {
		tmp57 := NewRtcpPayload_SourceChunk()
		err = tmp57.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SourceChunk[i] = tmp57
	}
	return err
}
func (this *RtcpPayload_SdesPacket) SourceCount() (v uint64, err error) {
	if (this._f_sourceCount) {
		return this.sourceCount, nil
	}
	this.sourceCount = uint64(this._parent.Subtype)
	this._f_sourceCount = true
	return this.sourceCount, nil
}
type RtcpPayload_RtpfbPacket struct {
	Ssrc uint32
	SsrcMediaSource uint32
	FciBlock interface{}
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_RtcpPacket
	_raw_FciBlock []byte
	_f_fmt bool
	fmt RtcpPayload_RtpfbSubtype
}
func NewRtcpPayload_RtpfbPacket() *RtcpPayload_RtpfbPacket {
	return &RtcpPayload_RtpfbPacket{
	}
}

func (this *RtcpPayload_RtpfbPacket) Read(io *kaitai.Stream, parent *RtcpPayload_RtcpPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ssrc = uint32(tmp58)
	tmp59, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SsrcMediaSource = uint32(tmp59)
	tmp60, err := this.Fmt()
	if err != nil {
		return err
	}
	switch (tmp60) {
	case RtcpPayload_RtpfbSubtype__TransportFeedback:
		tmp61, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp61 = tmp61
		this._raw_FciBlock = tmp61
		_io__raw_FciBlock := kaitai.NewStream(bytes.NewReader(this._raw_FciBlock))
		tmp62 := NewRtcpPayload_RtpfbTransportFeedbackPacket()
		err = tmp62.Read(_io__raw_FciBlock, this, this._root)
		if err != nil {
			return err
		}
		this.FciBlock = tmp62
	default:
		tmp63, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp63 = tmp63
		this._raw_FciBlock = tmp63
	}
	return err
}
func (this *RtcpPayload_RtpfbPacket) Fmt() (v RtcpPayload_RtpfbSubtype, err error) {
	if (this._f_fmt) {
		return this.fmt, nil
	}
	this.fmt = RtcpPayload_RtpfbSubtype(RtcpPayload_RtpfbSubtype(this._parent.Subtype))
	this._f_fmt = true
	return this.fmt, nil
}
type RtcpPayload_PacketStatusChunk struct {
	T bool
	S2 uint64
	S1 bool
	Rle uint64
	SymbolList uint64
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent interface{}
	_f_s bool
	s int
}
func NewRtcpPayload_PacketStatusChunk() *RtcpPayload_PacketStatusChunk {
	return &RtcpPayload_PacketStatusChunk{
	}
}

func (this *RtcpPayload_PacketStatusChunk) Read(io *kaitai.Stream, parent interface{}, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp64, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.T = tmp64 != 0
	tmp65 := 0
	if this.T {
		tmp65 = 1
	}
	if (tmp65 == 0) {
		tmp66, err := this._io.ReadBitsIntBe(2)
		if err != nil {
			return err
		}
		this.S2 = tmp66
	}
	tmp67 := 0
	if this.T {
		tmp67 = 1
	}
	if (tmp67 == 1) {
		tmp68, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.S1 = tmp68 != 0
	}
	tmp69 := 0
	if this.T {
		tmp69 = 1
	}
	if (tmp69 == 0) {
		tmp70, err := this._io.ReadBitsIntBe(13)
		if err != nil {
			return err
		}
		this.Rle = tmp70
	}
	tmp71 := 0
	if this.T {
		tmp71 = 1
	}
	if (tmp71 == 1) {
		tmp72, err := this._io.ReadBitsIntBe(14)
		if err != nil {
			return err
		}
		this.SymbolList = tmp72
	}
	return err
}
func (this *RtcpPayload_PacketStatusChunk) S() (v int, err error) {
	if (this._f_s) {
		return this.s, nil
	}
	var tmp73 uint64;
	tmp74 := 0
	if this.T {
		tmp74 = 1
	}
	if (tmp74 == 0) {
		tmp73 = this.S2
	} else {
		var tmp75 int8;
		tmp76 := 0
		if this.S1 {
			tmp76 = 1
		}
		if (tmp76 == 0) {
			tmp75 = 1
		} else {
			tmp75 = 0
		}
		tmp73 = tmp75
	}
	this.s = int(tmp73)
	this._f_s = true
	return this.s, nil
}
type RtcpPayload_PsfbAfbPacket struct {
	Uid uint32
	Contents interface{}
	_io *kaitai.Stream
	_root *RtcpPayload
	_parent *RtcpPayload_PsfbPacket
	_raw_Contents []byte
}
func NewRtcpPayload_PsfbAfbPacket() *RtcpPayload_PsfbAfbPacket {
	return &RtcpPayload_PsfbAfbPacket{
	}
}

func (this *RtcpPayload_PsfbAfbPacket) Read(io *kaitai.Stream, parent *RtcpPayload_PsfbPacket, root *RtcpPayload) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp77, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Uid = uint32(tmp77)
	switch (this.Uid) {
	case 1380273474:
		tmp78, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp78 = tmp78
		this._raw_Contents = tmp78
		_io__raw_Contents := kaitai.NewStream(bytes.NewReader(this._raw_Contents))
		tmp79 := NewRtcpPayload_PsfbAfbRembPacket()
		err = tmp79.Read(_io__raw_Contents, this, this._root)
		if err != nil {
			return err
		}
		this.Contents = tmp79
	default:
		tmp80, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp80 = tmp80
		this._raw_Contents = tmp80
	}
	return err
}
