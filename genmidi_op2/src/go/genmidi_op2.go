// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * GENMIDI.OP2 is a sound bank file used by players based on DMX sound
 * library to play MIDI files with General MIDI instruments using OPL2
 * sound chip (which was commonly installed on popular AdLib and Sound
 * Blaster sound cards).
 * 
 * Major users of DMX sound library include:
 * 
 * * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
 * * Raptor: Call of the Shadows
 * @see <a href="http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip">Source</a>
 * @see <a href="http://doom.wikia.com/wiki/GENMIDI">Source</a>
 * @see <a href="http://www.shikadi.net/moddingwiki/OP2_Bank_Format">Source</a>
 */
type GenmidiOp2 struct {
	Magic []byte
	Instruments []*GenmidiOp2_InstrumentEntry
	InstrumentNames []string
	_io *kaitai.Stream
	_root *GenmidiOp2
	_parent interface{}
}
func NewGenmidiOp2() *GenmidiOp2 {
	return &GenmidiOp2{
	}
}

func (this *GenmidiOp2) Read(io *kaitai.Stream, parent interface{}, root *GenmidiOp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{35, 79, 80, 76, 95, 73, 73, 35})) {
		return kaitai.NewValidationNotEqualError([]uint8{35, 79, 80, 76, 95, 73, 73, 35}, this.Magic, this._io, "/seq/0")
	}
	this.Instruments = make([]*GenmidiOp2_InstrumentEntry, 175)
	for i := range this.Instruments {
		tmp2 := NewGenmidiOp2_InstrumentEntry()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Instruments[i] = tmp2
	}
	this.InstrumentNames = make([]string, 175)
	for i := range this.InstrumentNames {
		tmp3, err := this._io.ReadBytes(int(32))
		if err != nil {
			return err
		}
		tmp3 = kaitai.BytesTerminate(kaitai.BytesStripRight(tmp3, 0), 0, false)
		this.InstrumentNames[i] = string(tmp3)
	}
	return err
}
type GenmidiOp2_InstrumentEntry struct {
	Flags uint16
	Finetune uint8
	Note uint8
	Instruments []*GenmidiOp2_Instrument
	_io *kaitai.Stream
	_root *GenmidiOp2
	_parent *GenmidiOp2
}
func NewGenmidiOp2_InstrumentEntry() *GenmidiOp2_InstrumentEntry {
	return &GenmidiOp2_InstrumentEntry{
	}
}

func (this *GenmidiOp2_InstrumentEntry) Read(io *kaitai.Stream, parent *GenmidiOp2, root *GenmidiOp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp4)
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Finetune = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Note = tmp6
	this.Instruments = make([]*GenmidiOp2_Instrument, 2)
	for i := range this.Instruments {
		tmp7 := NewGenmidiOp2_Instrument()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Instruments[i] = tmp7
	}
	return err
}

/**
 * MIDI note for fixed instruments, 0 otherwise
 */
type GenmidiOp2_Instrument struct {
	Op1 *GenmidiOp2_OpSettings
	Feedback uint8
	Op2 *GenmidiOp2_OpSettings
	Unused uint8
	BaseNote int16
	_io *kaitai.Stream
	_root *GenmidiOp2
	_parent *GenmidiOp2_InstrumentEntry
}
func NewGenmidiOp2_Instrument() *GenmidiOp2_Instrument {
	return &GenmidiOp2_Instrument{
	}
}

func (this *GenmidiOp2_Instrument) Read(io *kaitai.Stream, parent *GenmidiOp2_InstrumentEntry, root *GenmidiOp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8 := NewGenmidiOp2_OpSettings()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Op1 = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Feedback = tmp9
	tmp10 := NewGenmidiOp2_OpSettings()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Op2 = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unused = tmp11
	tmp12, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.BaseNote = int16(tmp12)
	return err
}

/**
 * Feedback/AM-FM (both operators)
 */

/**
 * Base note offset
 */

/**
 * OPL2 settings for one operator (carrier or modulator)
 */
type GenmidiOp2_OpSettings struct {
	TremVibr uint8
	AttDec uint8
	SustRel uint8
	Wave uint8
	Scale uint8
	Level uint8
	_io *kaitai.Stream
	_root *GenmidiOp2
	_parent *GenmidiOp2_Instrument
}
func NewGenmidiOp2_OpSettings() *GenmidiOp2_OpSettings {
	return &GenmidiOp2_OpSettings{
	}
}

func (this *GenmidiOp2_OpSettings) Read(io *kaitai.Stream, parent *GenmidiOp2_Instrument, root *GenmidiOp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.TremVibr = tmp13
	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.AttDec = tmp14
	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SustRel = tmp15
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Wave = tmp16
	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Scale = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Level = tmp18
	return err
}

/**
 * Tremolo/vibrato/sustain/KSR/multi
 */

/**
 * Attack rate/decay rate
 */

/**
 * Sustain level/release rate
 */

/**
 * Waveform select
 */

/**
 * Key scale level
 */

/**
 * Output level
 */
