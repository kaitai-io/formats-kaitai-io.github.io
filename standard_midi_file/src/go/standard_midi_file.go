// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Standard MIDI file, typically known just as "MID", is a standard way
 * to serialize series of MIDI events, which is a protocol used in many
 * music synthesizers to transfer music data: notes being played,
 * effects being applied, etc.
 * 
 * Internally, file consists of a header and series of tracks, every
 * track listing MIDI events with certain header designating time these
 * events are happening.
 * 
 * NOTE: Rarely, MIDI files employ certain stateful compression scheme
 * to avoid storing certain elements of further elements, instead
 * reusing them from events which happened earlier in the
 * stream. Kaitai Struct (as of v0.9) is currently unable to parse
 * these, but files employing this mechanism are relatively rare.
 */
type StandardMidiFile struct {
	Hdr *StandardMidiFile_Header
	Tracks []*StandardMidiFile_Track
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent interface{}
}
func NewStandardMidiFile() *StandardMidiFile {
	return &StandardMidiFile{
	}
}

func (this *StandardMidiFile) Read(io *kaitai.Stream, parent interface{}, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewStandardMidiFile_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp1
	this.Tracks = make([]*StandardMidiFile_Track, this.Hdr.NumTracks)
	for i := range this.Tracks {
		tmp2 := NewStandardMidiFile_Track()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tracks[i] = tmp2
	}
	return err
}
type StandardMidiFile_TrackEvents struct {
	Event []*StandardMidiFile_TrackEvent
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_Track
}
func NewStandardMidiFile_TrackEvents() *StandardMidiFile_TrackEvents {
	return &StandardMidiFile_TrackEvents{
	}
}

func (this *StandardMidiFile_TrackEvents) Read(io *kaitai.Stream, parent *StandardMidiFile_Track, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp3, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp3 {
			break
		}
		tmp4 := NewStandardMidiFile_TrackEvent()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Event = append(this.Event, tmp4)
	}
	return err
}
type StandardMidiFile_TrackEvent struct {
	VTime *VlqBase128Be
	EventHeader uint8
	MetaEventBody *StandardMidiFile_MetaEventBody
	SysexBody *StandardMidiFile_SysexEventBody
	EventBody interface{}
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvents
	_f_eventType bool
	eventType int
	_f_channel bool
	channel int
}
func NewStandardMidiFile_TrackEvent() *StandardMidiFile_TrackEvent {
	return &StandardMidiFile_TrackEvent{
	}
}

func (this *StandardMidiFile_TrackEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvents, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5 := NewVlqBase128Be()
	err = tmp5.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.VTime = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.EventHeader = tmp6
	if (this.EventHeader == 255) {
		tmp7 := NewStandardMidiFile_MetaEventBody()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.MetaEventBody = tmp7
	}
	if (this.EventHeader == 240) {
		tmp8 := NewStandardMidiFile_SysexEventBody()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SysexBody = tmp8
	}
	tmp9, err := this.EventType()
	if err != nil {
		return err
	}
	switch (tmp9) {
	case 224:
		tmp10 := NewStandardMidiFile_PitchBendEvent()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp10
	case 144:
		tmp11 := NewStandardMidiFile_NoteOnEvent()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp11
	case 208:
		tmp12 := NewStandardMidiFile_ChannelPressureEvent()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp12
	case 192:
		tmp13 := NewStandardMidiFile_ProgramChangeEvent()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp13
	case 160:
		tmp14 := NewStandardMidiFile_PolyphonicPressureEvent()
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp14
	case 176:
		tmp15 := NewStandardMidiFile_ControllerEvent()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp15
	case 128:
		tmp16 := NewStandardMidiFile_NoteOffEvent()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.EventBody = tmp16
	}
	return err
}
func (this *StandardMidiFile_TrackEvent) EventType() (v int, err error) {
	if (this._f_eventType) {
		return this.eventType, nil
	}
	this.eventType = int((this.EventHeader & 240))
	this._f_eventType = true
	return this.eventType, nil
}
func (this *StandardMidiFile_TrackEvent) Channel() (v int, err error) {
	if (this._f_channel) {
		return this.channel, nil
	}
	tmp17, err := this.EventType()
	if err != nil {
		return 0, err
	}
	if (tmp17 != 240) {
		this.channel = int((this.EventHeader & 15))
	}
	this._f_channel = true
	return this.channel, nil
}
type StandardMidiFile_PitchBendEvent struct {
	B1 uint8
	B2 uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
	_f_bendValue bool
	bendValue int
	_f_adjBendValue bool
	adjBendValue int
}
func NewStandardMidiFile_PitchBendEvent() *StandardMidiFile_PitchBendEvent {
	return &StandardMidiFile_PitchBendEvent{
	}
}

func (this *StandardMidiFile_PitchBendEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp18
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B2 = tmp19
	return err
}
func (this *StandardMidiFile_PitchBendEvent) BendValue() (v int, err error) {
	if (this._f_bendValue) {
		return this.bendValue, nil
	}
	this.bendValue = int((((this.B2 << 7) + this.B1) - 16384))
	this._f_bendValue = true
	return this.bendValue, nil
}
func (this *StandardMidiFile_PitchBendEvent) AdjBendValue() (v int, err error) {
	if (this._f_adjBendValue) {
		return this.adjBendValue, nil
	}
	tmp20, err := this.BendValue()
	if err != nil {
		return 0, err
	}
	this.adjBendValue = int((tmp20 - 16384))
	this._f_adjBendValue = true
	return this.adjBendValue, nil
}
type StandardMidiFile_ProgramChangeEvent struct {
	Program uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_ProgramChangeEvent() *StandardMidiFile_ProgramChangeEvent {
	return &StandardMidiFile_ProgramChangeEvent{
	}
}

func (this *StandardMidiFile_ProgramChangeEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Program = tmp21
	return err
}
type StandardMidiFile_NoteOnEvent struct {
	Note uint8
	Velocity uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_NoteOnEvent() *StandardMidiFile_NoteOnEvent {
	return &StandardMidiFile_NoteOnEvent{
	}
}

func (this *StandardMidiFile_NoteOnEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Note = tmp22
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Velocity = tmp23
	return err
}
type StandardMidiFile_PolyphonicPressureEvent struct {
	Note uint8
	Pressure uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_PolyphonicPressureEvent() *StandardMidiFile_PolyphonicPressureEvent {
	return &StandardMidiFile_PolyphonicPressureEvent{
	}
}

func (this *StandardMidiFile_PolyphonicPressureEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Note = tmp24
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Pressure = tmp25
	return err
}
type StandardMidiFile_Track struct {
	Magic []byte
	LenEvents uint32
	Events *StandardMidiFile_TrackEvents
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile
	_raw_Events []byte
}
func NewStandardMidiFile_Track() *StandardMidiFile_Track {
	return &StandardMidiFile_Track{
	}
}

func (this *StandardMidiFile_Track) Read(io *kaitai.Stream, parent *StandardMidiFile, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Magic = tmp26
	if !(bytes.Equal(this.Magic, []uint8{77, 84, 114, 107})) {
		return kaitai.NewValidationNotEqualError([]uint8{77, 84, 114, 107}, this.Magic, this._io, "/types/track/seq/0")
	}
	tmp27, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenEvents = uint32(tmp27)
	tmp28, err := this._io.ReadBytes(int(this.LenEvents))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this._raw_Events = tmp28
	_io__raw_Events := kaitai.NewStream(bytes.NewReader(this._raw_Events))
	tmp29 := NewStandardMidiFile_TrackEvents()
	err = tmp29.Read(_io__raw_Events, this, this._root)
	if err != nil {
		return err
	}
	this.Events = tmp29
	return err
}

type StandardMidiFile_MetaEventBody_MetaTypeEnum int
const (
	StandardMidiFile_MetaEventBody_MetaTypeEnum__SequenceNumber StandardMidiFile_MetaEventBody_MetaTypeEnum = 0
	StandardMidiFile_MetaEventBody_MetaTypeEnum__TextEvent StandardMidiFile_MetaEventBody_MetaTypeEnum = 1
	StandardMidiFile_MetaEventBody_MetaTypeEnum__Copyright StandardMidiFile_MetaEventBody_MetaTypeEnum = 2
	StandardMidiFile_MetaEventBody_MetaTypeEnum__SequenceTrackName StandardMidiFile_MetaEventBody_MetaTypeEnum = 3
	StandardMidiFile_MetaEventBody_MetaTypeEnum__InstrumentName StandardMidiFile_MetaEventBody_MetaTypeEnum = 4
	StandardMidiFile_MetaEventBody_MetaTypeEnum__LyricText StandardMidiFile_MetaEventBody_MetaTypeEnum = 5
	StandardMidiFile_MetaEventBody_MetaTypeEnum__MarkerText StandardMidiFile_MetaEventBody_MetaTypeEnum = 6
	StandardMidiFile_MetaEventBody_MetaTypeEnum__CuePoint StandardMidiFile_MetaEventBody_MetaTypeEnum = 7
	StandardMidiFile_MetaEventBody_MetaTypeEnum__MidiChannelPrefixAssignment StandardMidiFile_MetaEventBody_MetaTypeEnum = 32
	StandardMidiFile_MetaEventBody_MetaTypeEnum__EndOfTrack StandardMidiFile_MetaEventBody_MetaTypeEnum = 47
	StandardMidiFile_MetaEventBody_MetaTypeEnum__Tempo StandardMidiFile_MetaEventBody_MetaTypeEnum = 81
	StandardMidiFile_MetaEventBody_MetaTypeEnum__SmpteOffset StandardMidiFile_MetaEventBody_MetaTypeEnum = 84
	StandardMidiFile_MetaEventBody_MetaTypeEnum__TimeSignature StandardMidiFile_MetaEventBody_MetaTypeEnum = 88
	StandardMidiFile_MetaEventBody_MetaTypeEnum__KeySignature StandardMidiFile_MetaEventBody_MetaTypeEnum = 89
	StandardMidiFile_MetaEventBody_MetaTypeEnum__SequencerSpecificEvent StandardMidiFile_MetaEventBody_MetaTypeEnum = 127
)
type StandardMidiFile_MetaEventBody struct {
	MetaType StandardMidiFile_MetaEventBody_MetaTypeEnum
	Len *VlqBase128Be
	Body []byte
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_MetaEventBody() *StandardMidiFile_MetaEventBody {
	return &StandardMidiFile_MetaEventBody{
	}
}

func (this *StandardMidiFile_MetaEventBody) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MetaType = StandardMidiFile_MetaEventBody_MetaTypeEnum(tmp30)
	tmp31 := NewVlqBase128Be()
	err = tmp31.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Len = tmp31
	tmp32, err := this.Len.Value()
	if err != nil {
		return err
	}
	tmp33, err := this._io.ReadBytes(int(tmp32))
	if err != nil {
		return err
	}
	tmp33 = tmp33
	this.Body = tmp33
	return err
}
type StandardMidiFile_ControllerEvent struct {
	Controller uint8
	Value uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_ControllerEvent() *StandardMidiFile_ControllerEvent {
	return &StandardMidiFile_ControllerEvent{
	}
}

func (this *StandardMidiFile_ControllerEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Controller = tmp34
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Value = tmp35
	return err
}
type StandardMidiFile_Header struct {
	Magic []byte
	LenHeader uint32
	Format uint16
	NumTracks uint16
	Division int16
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile
}
func NewStandardMidiFile_Header() *StandardMidiFile_Header {
	return &StandardMidiFile_Header{
	}
}

func (this *StandardMidiFile_Header) Read(io *kaitai.Stream, parent *StandardMidiFile, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Magic = tmp36
	if !(bytes.Equal(this.Magic, []uint8{77, 84, 104, 100})) {
		return kaitai.NewValidationNotEqualError([]uint8{77, 84, 104, 100}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp37, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenHeader = uint32(tmp37)
	tmp38, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Format = uint16(tmp38)
	tmp39, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumTracks = uint16(tmp39)
	tmp40, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.Division = int16(tmp40)
	return err
}
type StandardMidiFile_SysexEventBody struct {
	Len *VlqBase128Be
	Data []byte
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_SysexEventBody() *StandardMidiFile_SysexEventBody {
	return &StandardMidiFile_SysexEventBody{
	}
}

func (this *StandardMidiFile_SysexEventBody) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41 := NewVlqBase128Be()
	err = tmp41.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Len = tmp41
	tmp42, err := this.Len.Value()
	if err != nil {
		return err
	}
	tmp43, err := this._io.ReadBytes(int(tmp42))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.Data = tmp43
	return err
}
type StandardMidiFile_NoteOffEvent struct {
	Note uint8
	Velocity uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_NoteOffEvent() *StandardMidiFile_NoteOffEvent {
	return &StandardMidiFile_NoteOffEvent{
	}
}

func (this *StandardMidiFile_NoteOffEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Note = tmp44
	tmp45, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Velocity = tmp45
	return err
}
type StandardMidiFile_ChannelPressureEvent struct {
	Pressure uint8
	_io *kaitai.Stream
	_root *StandardMidiFile
	_parent *StandardMidiFile_TrackEvent
}
func NewStandardMidiFile_ChannelPressureEvent() *StandardMidiFile_ChannelPressureEvent {
	return &StandardMidiFile_ChannelPressureEvent{
	}
}

func (this *StandardMidiFile_ChannelPressureEvent) Read(io *kaitai.Stream, parent *StandardMidiFile_TrackEvent, root *StandardMidiFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Pressure = tmp46
	return err
}
