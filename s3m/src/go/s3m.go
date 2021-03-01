// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 * @see <a href="http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt">Source</a>
 */
type S3m struct {
	SongName []byte
	Magic1 []byte
	FileType uint8
	Reserved1 []byte
	NumOrders uint16
	NumInstruments uint16
	NumPatterns uint16
	Flags uint16
	Version uint16
	SamplesFormat uint16
	Magic2 []byte
	GlobalVolume uint8
	InitialSpeed uint8
	InitialTempo uint8
	IsStereo bool
	MasterVolume uint64
	UltraClickRemoval uint8
	HasCustomPan uint8
	Reserved2 []byte
	OfsSpecial uint16
	Channels []*S3m_Channel
	Orders []byte
	Instruments []*S3m_InstrumentPtr
	Patterns []*S3m_PatternPtr
	ChannelPans []*S3m_ChannelPan
	_io *kaitai.Stream
	_root *S3m
	_parent interface{}
}
func NewS3m() *S3m {
	return &S3m{
	}
}

func (this *S3m) Read(io *kaitai.Stream, parent interface{}, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(28))
	if err != nil {
		return err
	}
	tmp1 = kaitai.BytesTerminate(tmp1, 0, false)
	this.SongName = tmp1
	tmp2, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Magic1 = tmp2
	if !(bytes.Equal(this.Magic1, []uint8{26})) {
		return kaitai.NewValidationNotEqualError([]uint8{26}, this.Magic1, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FileType = tmp3
	tmp4, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Reserved1 = tmp4
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumOrders = uint16(tmp5)
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumInstruments = uint16(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPatterns = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SamplesFormat = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Magic2 = tmp11
	if !(bytes.Equal(this.Magic2, []uint8{83, 67, 82, 77})) {
		return kaitai.NewValidationNotEqualError([]uint8{83, 67, 82, 77}, this.Magic2, this._io, "/seq/10")
	}
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.GlobalVolume = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InitialSpeed = tmp13
	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InitialTempo = tmp14
	tmp15, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsStereo = tmp15 != 0
	tmp16, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.MasterVolume = tmp16
	this._io.AlignToByte()
	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.UltraClickRemoval = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HasCustomPan = tmp18
	tmp19, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Reserved2 = tmp19
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OfsSpecial = uint16(tmp20)
	this.Channels = make([]*S3m_Channel, 32)
	for i := range this.Channels {
		tmp21 := NewS3m_Channel()
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Channels[i] = tmp21
	}
	tmp22, err := this._io.ReadBytes(int(this.NumOrders))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Orders = tmp22
	this.Instruments = make([]*S3m_InstrumentPtr, this.NumInstruments)
	for i := range this.Instruments {
		tmp23 := NewS3m_InstrumentPtr()
		err = tmp23.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Instruments[i] = tmp23
	}
	this.Patterns = make([]*S3m_PatternPtr, this.NumPatterns)
	for i := range this.Patterns {
		tmp24 := NewS3m_PatternPtr()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Patterns[i] = tmp24
	}
	if (this.HasCustomPan == 252) {
		this.ChannelPans = make([]*S3m_ChannelPan, 32)
		for i := range this.ChannelPans {
			tmp25 := NewS3m_ChannelPan()
			err = tmp25.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ChannelPans[i] = tmp25
		}
	}
	return err
}

/**
 * Number of orders in a song
 */

/**
 * Number of instruments in a song
 */

/**
 * Number of patterns in a song
 */

/**
 * Scream Tracker version that was used to save this file
 */

/**
 * 1 = signed samples, 2 = unsigned samples
 */

/**
 * Offset of special data, not used by Scream Tracker directly.
 */
type S3m_ChannelPan struct {
	Reserved1 uint64
	HasCustomPan bool
	Reserved2 bool
	Pan uint64
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m
}
func NewS3m_ChannelPan() *S3m_ChannelPan {
	return &S3m_ChannelPan{
	}
}

func (this *S3m_ChannelPan) Read(io *kaitai.Stream, parent *S3m, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp26
	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasCustomPan = tmp27 != 0
	tmp28, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reserved2 = tmp28 != 0
	tmp29, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Pan = tmp29
	return err
}

/**
 * If true, then use a custom pan setting provided in the `pan`
 * field. If false, the channel would use the default setting
 * (0x7 for mono, 0x3 or 0xc for stereo).
 */
type S3m_PatternCell struct {
	HasFx bool
	HasVolume bool
	HasNoteAndInstrument bool
	ChannelNum uint64
	Note uint8
	Instrument uint8
	Volume uint8
	FxType uint8
	FxValue uint8
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_PatternCells
}
func NewS3m_PatternCell() *S3m_PatternCell {
	return &S3m_PatternCell{
	}
}

func (this *S3m_PatternCell) Read(io *kaitai.Stream, parent *S3m_PatternCells, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasFx = tmp30 != 0
	tmp31, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasVolume = tmp31 != 0
	tmp32, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasNoteAndInstrument = tmp32 != 0
	tmp33, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.ChannelNum = tmp33
	this._io.AlignToByte()
	if (this.HasNoteAndInstrument) {
		tmp34, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Note = tmp34
	}
	if (this.HasNoteAndInstrument) {
		tmp35, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Instrument = tmp35
	}
	if (this.HasVolume) {
		tmp36, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Volume = tmp36
	}
	if (this.HasFx) {
		tmp37, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.FxType = tmp37
	}
	if (this.HasFx) {
		tmp38, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.FxValue = tmp38
	}
	return err
}
type S3m_PatternCells struct {
	Cells []*S3m_PatternCell
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_Pattern
}
func NewS3m_PatternCells() *S3m_PatternCells {
	return &S3m_PatternCells{
	}
}

func (this *S3m_PatternCells) Read(io *kaitai.Stream, parent *S3m_Pattern, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp39, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp39 {
			break
		}
		tmp40 := NewS3m_PatternCell()
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Cells = append(this.Cells, tmp40)
	}
	return err
}
type S3m_Channel struct {
	IsDisabled bool
	ChType uint64
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m
}
func NewS3m_Channel() *S3m_Channel {
	return &S3m_Channel{
	}
}

func (this *S3m_Channel) Read(io *kaitai.Stream, parent *S3m, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsDisabled = tmp41 != 0
	tmp42, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.ChType = tmp42
	return err
}

/**
 * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
 */

/**
 * Custom 3-byte integer, stored in mixed endian manner.
 */
type S3m_SwappedU3 struct {
	Hi uint8
	Lo uint16
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_Instrument_Sampled
	_f_value bool
	value int
}
func NewS3m_SwappedU3() *S3m_SwappedU3 {
	return &S3m_SwappedU3{
	}
}

func (this *S3m_SwappedU3) Read(io *kaitai.Stream, parent *S3m_Instrument_Sampled, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Hi = tmp43
	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Lo = uint16(tmp44)
	return err
}
func (this *S3m_SwappedU3) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int((this.Lo | (this.Hi << 16)))
	this._f_value = true
	return this.value, nil
}
type S3m_Pattern struct {
	Size uint16
	Body *S3m_PatternCells
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_PatternPtr
	_raw_Body []byte
}
func NewS3m_Pattern() *S3m_Pattern {
	return &S3m_Pattern{
	}
}

func (this *S3m_Pattern) Read(io *kaitai.Stream, parent *S3m_PatternPtr, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Size = uint16(tmp45)
	tmp46, err := this._io.ReadBytes(int((this.Size - 2)))
	if err != nil {
		return err
	}
	tmp46 = tmp46
	this._raw_Body = tmp46
	_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
	tmp47 := NewS3m_PatternCells()
	err = tmp47.Read(_io__raw_Body, this, this._root)
	if err != nil {
		return err
	}
	this.Body = tmp47
	return err
}
type S3m_PatternPtr struct {
	Paraptr uint16
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m
	_f_body bool
	body *S3m_Pattern
}
func NewS3m_PatternPtr() *S3m_PatternPtr {
	return &S3m_PatternPtr{
	}
}

func (this *S3m_PatternPtr) Read(io *kaitai.Stream, parent *S3m, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Paraptr = uint16(tmp48)
	return err
}
func (this *S3m_PatternPtr) Body() (v *S3m_Pattern, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.Paraptr * 16)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp49 := NewS3m_Pattern()
	err = tmp49.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.body = tmp49
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type S3m_InstrumentPtr struct {
	Paraptr uint16
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m
	_f_body bool
	body *S3m_Instrument
}
func NewS3m_InstrumentPtr() *S3m_InstrumentPtr {
	return &S3m_InstrumentPtr{
	}
}

func (this *S3m_InstrumentPtr) Read(io *kaitai.Stream, parent *S3m, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Paraptr = uint16(tmp50)
	return err
}
func (this *S3m_InstrumentPtr) Body() (v *S3m_Instrument, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.Paraptr * 16)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp51 := NewS3m_Instrument()
	err = tmp51.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.body = tmp51
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

type S3m_Instrument_InstTypes int
const (
	S3m_Instrument_InstTypes__Sample S3m_Instrument_InstTypes = 1
	S3m_Instrument_InstTypes__Melodic S3m_Instrument_InstTypes = 2
	S3m_Instrument_InstTypes__BassDrum S3m_Instrument_InstTypes = 3
	S3m_Instrument_InstTypes__SnareDrum S3m_Instrument_InstTypes = 4
	S3m_Instrument_InstTypes__Tom S3m_Instrument_InstTypes = 5
	S3m_Instrument_InstTypes__Cymbal S3m_Instrument_InstTypes = 6
	S3m_Instrument_InstTypes__Hihat S3m_Instrument_InstTypes = 7
)
type S3m_Instrument struct {
	Type S3m_Instrument_InstTypes
	Filename []byte
	Body interface{}
	TuningHz uint32
	Reserved2 []byte
	SampleName []byte
	Magic []byte
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_InstrumentPtr
}
func NewS3m_Instrument() *S3m_Instrument {
	return &S3m_Instrument{
	}
}

func (this *S3m_Instrument) Read(io *kaitai.Stream, parent *S3m_InstrumentPtr, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = S3m_Instrument_InstTypes(tmp52)
	tmp53, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp53 = kaitai.BytesTerminate(tmp53, 0, false)
	this.Filename = tmp53
	switch (this.Type) {
	case S3m_Instrument_InstTypes__Sample:
		tmp54 := NewS3m_Instrument_Sampled()
		err = tmp54.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp54
	default:
		tmp55 := NewS3m_Instrument_Adlib()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp55
	}
	tmp56, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TuningHz = uint32(tmp56)
	tmp57, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp57 = tmp57
	this.Reserved2 = tmp57
	tmp58, err := this._io.ReadBytes(int(28))
	if err != nil {
		return err
	}
	tmp58 = kaitai.BytesTerminate(tmp58, 0, false)
	this.SampleName = tmp58
	tmp59, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp59 = tmp59
	this.Magic = tmp59
	if !(bytes.Equal(this.Magic, []uint8{83, 67, 82, 83})) {
		return kaitai.NewValidationNotEqualError([]uint8{83, 67, 82, 83}, this.Magic, this._io, "/types/instrument/seq/6")
	}
	return err
}
type S3m_Instrument_Sampled struct {
	ParaptrSample *S3m_SwappedU3
	LenSample uint32
	LoopBegin uint32
	LoopEnd uint32
	DefaultVolume uint8
	Reserved1 uint8
	IsPacked uint8
	Flags uint8
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_Instrument
	_f_sample bool
	sample []byte
}
func NewS3m_Instrument_Sampled() *S3m_Instrument_Sampled {
	return &S3m_Instrument_Sampled{
	}
}

func (this *S3m_Instrument_Sampled) Read(io *kaitai.Stream, parent *S3m_Instrument, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60 := NewS3m_SwappedU3()
	err = tmp60.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ParaptrSample = tmp60
	tmp61, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenSample = uint32(tmp61)
	tmp62, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LoopBegin = uint32(tmp62)
	tmp63, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LoopEnd = uint32(tmp63)
	tmp64, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DefaultVolume = tmp64
	tmp65, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved1 = tmp65
	tmp66, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.IsPacked = tmp66
	tmp67, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp67
	return err
}
func (this *S3m_Instrument_Sampled) Sample() (v []byte, err error) {
	if (this._f_sample) {
		return this.sample, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp68, err := this.ParaptrSample.Value()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp68 * 16)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp69, err := this._io.ReadBytes(int(this.LenSample))
	if err != nil {
		return nil, err
	}
	tmp69 = tmp69
	this.sample = tmp69
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_sample = true
	this._f_sample = true
	return this.sample, nil
}

/**
 * Default volume
 */

/**
 * 0 = unpacked, 1 = DP30ADPCM packing
 */
type S3m_Instrument_Adlib struct {
	Reserved1 []byte
	_unnamed1 []byte
	_io *kaitai.Stream
	_root *S3m
	_parent *S3m_Instrument
}
func NewS3m_Instrument_Adlib() *S3m_Instrument_Adlib {
	return &S3m_Instrument_Adlib{
	}
}

func (this *S3m_Instrument_Adlib) Read(io *kaitai.Stream, parent *S3m_Instrument, root *S3m) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp70, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp70 = tmp70
	this.Reserved1 = tmp70
	if !(bytes.Equal(this.Reserved1, []uint8{0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0}, this.Reserved1, this._io, "/types/instrument/types/adlib/seq/0")
	}
	tmp71, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp71 = tmp71
	this._unnamed1 = tmp71
	return err
}
