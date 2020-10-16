// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */

type Websocket_Opcode int
const (
	Websocket_Opcode__Continuation Websocket_Opcode = 0
	Websocket_Opcode__Text Websocket_Opcode = 1
	Websocket_Opcode__Binary Websocket_Opcode = 2
	Websocket_Opcode__Reserved3 Websocket_Opcode = 3
	Websocket_Opcode__Reserved4 Websocket_Opcode = 4
	Websocket_Opcode__Reserved5 Websocket_Opcode = 5
	Websocket_Opcode__Reserved6 Websocket_Opcode = 6
	Websocket_Opcode__Reserved7 Websocket_Opcode = 7
	Websocket_Opcode__Close Websocket_Opcode = 8
	Websocket_Opcode__Ping Websocket_Opcode = 9
	Websocket_Opcode__Pong Websocket_Opcode = 10
	Websocket_Opcode__ReservedControlB Websocket_Opcode = 11
	Websocket_Opcode__ReservedControlC Websocket_Opcode = 12
	Websocket_Opcode__ReservedControlD Websocket_Opcode = 13
	Websocket_Opcode__ReservedControlE Websocket_Opcode = 14
	Websocket_Opcode__ReservedControlF Websocket_Opcode = 15
)
type Websocket struct {
	InitialFrame *Websocket_InitialFrame
	TrailingFrames []*Websocket_Dataframe
	_io *kaitai.Stream
	_root *Websocket
	_parent interface{}
}
func NewWebsocket() *Websocket {
	return &Websocket{
	}
}

func (this *Websocket) Read(io *kaitai.Stream, parent interface{}, root *Websocket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewWebsocket_InitialFrame()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.InitialFrame = tmp1
	if (this.InitialFrame.Header.Finished != true) {
		for i := 1;; i++ {
			tmp2 := NewWebsocket_Dataframe()
			err = tmp2.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			_it := tmp2
			this.TrailingFrames = append(this.TrailingFrames, _it)
			if _it.Header.Finished {
				break
			}
		}
	}
	return err
}
type Websocket_FrameHeader struct {
	Finished bool
	Reserved uint64
	Opcode Websocket_Opcode
	IsMasked bool
	LenPayloadPrimary uint64
	LenPayloadExtended1 uint16
	LenPayloadExtended2 uint32
	MaskKey uint32
	_io *kaitai.Stream
	_root *Websocket
	_parent interface{}
	_f_lenPayload bool
	lenPayload int
}
func NewWebsocket_FrameHeader() *Websocket_FrameHeader {
	return &Websocket_FrameHeader{
	}
}

func (this *Websocket_FrameHeader) Read(io *kaitai.Stream, parent interface{}, root *Websocket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Finished = tmp3 != 0
	tmp4, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.Reserved = tmp4
	tmp5, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Opcode = Websocket_Opcode(tmp5)
	tmp6, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsMasked = tmp6 != 0
	tmp7, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.LenPayloadPrimary = tmp7
	this._io.AlignToByte()
	if (this.LenPayloadPrimary == 126) {
		tmp8, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.LenPayloadExtended1 = uint16(tmp8)
	}
	if (this.LenPayloadPrimary == 127) {
		tmp9, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.LenPayloadExtended2 = uint32(tmp9)
	}
	if (this.IsMasked) {
		tmp10, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.MaskKey = uint32(tmp10)
	}
	return err
}
func (this *Websocket_FrameHeader) LenPayload() (v int, err error) {
	if (this._f_lenPayload) {
		return this.lenPayload, nil
	}
	var tmp11 uint64;
	if (this.LenPayloadPrimary <= 125) {
		tmp11 = this.LenPayloadPrimary
	} else {
		var tmp12 uint16;
		if (this.LenPayloadPrimary == 126) {
			tmp12 = this.LenPayloadExtended1
		} else {
			tmp12 = this.LenPayloadExtended2
		}
		tmp11 = tmp12
	}
	this.lenPayload = int(tmp11)
	this._f_lenPayload = true
	return this.lenPayload, nil
}
type Websocket_InitialFrame struct {
	Header *Websocket_FrameHeader
	PayloadBytes []byte
	PayloadText string
	_io *kaitai.Stream
	_root *Websocket
	_parent *Websocket
}
func NewWebsocket_InitialFrame() *Websocket_InitialFrame {
	return &Websocket_InitialFrame{
	}
}

func (this *Websocket_InitialFrame) Read(io *kaitai.Stream, parent *Websocket, root *Websocket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13 := NewWebsocket_FrameHeader()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp13
	if (this.Header.Opcode != Websocket_Opcode__Text) {
		tmp14, err := this.Header.LenPayload()
		if err != nil {
			return err
		}
		tmp15, err := this._io.ReadBytes(int(tmp14))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this.PayloadBytes = tmp15
	}
	if (this.Header.Opcode == Websocket_Opcode__Text) {
		tmp16, err := this.Header.LenPayload()
		if err != nil {
			return err
		}
		tmp17, err := this._io.ReadBytes(int(tmp16))
		if err != nil {
			return err
		}
		tmp17 = tmp17
		this.PayloadText = string(tmp17)
	}
	return err
}
type Websocket_Dataframe struct {
	Header *Websocket_FrameHeader
	PayloadBytes []byte
	PayloadText string
	_io *kaitai.Stream
	_root *Websocket
	_parent *Websocket
}
func NewWebsocket_Dataframe() *Websocket_Dataframe {
	return &Websocket_Dataframe{
	}
}

func (this *Websocket_Dataframe) Read(io *kaitai.Stream, parent *Websocket, root *Websocket) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18 := NewWebsocket_FrameHeader()
	err = tmp18.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp18
	if (this._root.InitialFrame.Header.Opcode != Websocket_Opcode__Text) {
		tmp19, err := this.Header.LenPayload()
		if err != nil {
			return err
		}
		tmp20, err := this._io.ReadBytes(int(tmp19))
		if err != nil {
			return err
		}
		tmp20 = tmp20
		this.PayloadBytes = tmp20
	}
	if (this._root.InitialFrame.Header.Opcode == Websocket_Opcode__Text) {
		tmp21, err := this.Header.LenPayload()
		if err != nil {
			return err
		}
		tmp22, err := this._io.ReadBytes(int(tmp21))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this.PayloadText = string(tmp22)
	}
	return err
}
