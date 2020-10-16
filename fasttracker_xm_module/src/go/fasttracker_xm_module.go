// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * XM (standing for eXtended Module) is a popular module music file
 * format, that was introduced in 1994 in FastTracker2 by Triton demo
 * group. Akin to MOD files, it bundles both digital samples
 * (instruments) and instructions on which note to play at what time
 * (patterns), which provides good audio quality with relatively small
 * file size. Audio is reproducible without relying on the sound of
 * particular hardware samplers or synths.
 * @see <a href="http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
 * ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
 * ">Source</a>
 */
type FasttrackerXmModule struct {
	Preheader *FasttrackerXmModule_Preheader
	Header *FasttrackerXmModule_Header
	Patterns []*FasttrackerXmModule_Pattern
	Instruments []*FasttrackerXmModule_Instrument
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent interface{}
	_raw_Header []byte
}
func NewFasttrackerXmModule() *FasttrackerXmModule {
	return &FasttrackerXmModule{
	}
}

func (this *FasttrackerXmModule) Read(io *kaitai.Stream, parent interface{}, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewFasttrackerXmModule_Preheader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Preheader = tmp1
	tmp2, err := this._io.ReadBytes(int((this.Preheader.HeaderSize - 4)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Header = tmp2
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp3 := NewFasttrackerXmModule_Header()
	err = tmp3.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	this.Patterns = make([]*FasttrackerXmModule_Pattern, this.Header.NumPatterns)
	for i := range this.Patterns {
		tmp4 := NewFasttrackerXmModule_Pattern()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Patterns[i] = tmp4
	}
	this.Instruments = make([]*FasttrackerXmModule_Instrument, this.Header.NumInstruments)
	for i := range this.Instruments {
		tmp5 := NewFasttrackerXmModule_Instrument()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Instruments[i] = tmp5
	}
	return err
}
type FasttrackerXmModule_Preheader struct {
	Signature0 []byte
	ModuleName string
	Signature1 []byte
	TrackerName string
	VersionNumber *FasttrackerXmModule_Preheader_Version
	HeaderSize uint32
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule
}
func NewFasttrackerXmModule_Preheader() *FasttrackerXmModule_Preheader {
	return &FasttrackerXmModule_Preheader{
	}
}

func (this *FasttrackerXmModule_Preheader) Read(io *kaitai.Stream, parent *FasttrackerXmModule, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadBytes(int(17))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Signature0 = tmp6
	if !(bytes.Equal(this.Signature0, []uint8{69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32})) {
		return kaitai.NewValidationNotEqualError([]uint8{69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32}, this.Signature0, this._io, "/types/preheader/seq/0")
	}
	tmp7, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp7 = kaitai.BytesTerminate(tmp7, 0, false)
	this.ModuleName = string(tmp7)
	tmp8, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Signature1 = tmp8
	if !(bytes.Equal(this.Signature1, []uint8{26})) {
		return kaitai.NewValidationNotEqualError([]uint8{26}, this.Signature1, this._io, "/types/preheader/seq/2")
	}
	tmp9, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp9 = kaitai.BytesTerminate(tmp9, 0, false)
	this.TrackerName = string(tmp9)
	tmp10 := NewFasttrackerXmModule_Preheader_Version()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VersionNumber = tmp10
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp11)
	return err
}

/**
 * Module name, padded with zeroes
 */

/**
 * Tracker name
 */

/**
 * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
 */

/**
 * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
 */
type FasttrackerXmModule_Preheader_Version struct {
	Minor uint8
	Major uint8
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Preheader
	_f_value bool
	value int
}
func NewFasttrackerXmModule_Preheader_Version() *FasttrackerXmModule_Preheader_Version {
	return &FasttrackerXmModule_Preheader_Version{
	}
}

func (this *FasttrackerXmModule_Preheader_Version) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Preheader, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minor = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Major = tmp13
	return err
}
func (this *FasttrackerXmModule_Preheader_Version) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = int(((this.Major << 8) | this.Minor))
	this._f_value = true
	return this.value, nil
}

/**
 * currently 0x04
 */

/**
 * currently 0x01
 */
type FasttrackerXmModule_Pattern struct {
	Header *FasttrackerXmModule_Pattern_Header
	PackedData []byte
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule
}
func NewFasttrackerXmModule_Pattern() *FasttrackerXmModule_Pattern {
	return &FasttrackerXmModule_Pattern{
	}
}

func (this *FasttrackerXmModule_Pattern) Read(io *kaitai.Stream, parent *FasttrackerXmModule, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewFasttrackerXmModule_Pattern_Header()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp14
	tmp15, err := this._io.ReadBytes(int(this.Header.Main.LenPackedPattern))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.PackedData = tmp15
	return err
}
type FasttrackerXmModule_Pattern_Header struct {
	HeaderLength uint32
	Main *FasttrackerXmModule_Pattern_Header_HeaderMain
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Pattern
	_raw_Main []byte
}
func NewFasttrackerXmModule_Pattern_Header() *FasttrackerXmModule_Pattern_Header {
	return &FasttrackerXmModule_Pattern_Header{
	}
}

func (this *FasttrackerXmModule_Pattern_Header) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Pattern, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderLength = uint32(tmp16)
	tmp17, err := this._io.ReadBytes(int((this.HeaderLength - 4)))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this._raw_Main = tmp17
	_io__raw_Main := kaitai.NewStream(bytes.NewReader(this._raw_Main))
	tmp18 := NewFasttrackerXmModule_Pattern_Header_HeaderMain()
	err = tmp18.Read(_io__raw_Main, this, this._root)
	if err != nil {
		return err
	}
	this.Main = tmp18
	return err
}

/**
 * Pattern header length
 */
type FasttrackerXmModule_Pattern_Header_HeaderMain struct {
	PackingType uint8
	NumRowsRaw uint16
	LenPackedPattern uint16
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Pattern_Header
	_f_numRows bool
	numRows int
}
func NewFasttrackerXmModule_Pattern_Header_HeaderMain() *FasttrackerXmModule_Pattern_Header_HeaderMain {
	return &FasttrackerXmModule_Pattern_Header_HeaderMain{
	}
}

func (this *FasttrackerXmModule_Pattern_Header_HeaderMain) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Pattern_Header, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PackingType = tmp19
	tmp20, err := this._root.Preheader.VersionNumber.Value()
	if err != nil {
		return err
	}
	switch (tmp20) {
	case 258:
		tmp21, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.NumRowsRaw = uint16(tmp21)
	default:
		tmp22, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.NumRowsRaw = uint16(tmp22)
	}
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenPackedPattern = uint16(tmp23)
	return err
}
func (this *FasttrackerXmModule_Pattern_Header_HeaderMain) NumRows() (v int, err error) {
	if (this._f_numRows) {
		return this.numRows, nil
	}
	var tmp24 int8;
	tmp25, err := this._root.Preheader.VersionNumber.Value()
	if err != nil {
		return 0, err
	}
	if (tmp25 == 258) {
		tmp24 = 1
	} else {
		tmp24 = 0
	}
	this.numRows = int((this.NumRowsRaw + tmp24))
	this._f_numRows = true
	return this.numRows, nil
}

/**
 * Packing type (always 0)
 */

/**
 * Number of rows in pattern (1..256)
 */

/**
 * Packed pattern data size
 */
type FasttrackerXmModule_Flags struct {
	Reserved uint64
	FreqTableType bool
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Header
}
func NewFasttrackerXmModule_Flags() *FasttrackerXmModule_Flags {
	return &FasttrackerXmModule_Flags{
	}
}

func (this *FasttrackerXmModule_Flags) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Header, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBitsIntBe(15)
	if err != nil {
		return err
	}
	this.Reserved = tmp26
	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FreqTableType = tmp27 != 0
	return err
}

/**
 * 0 = Amiga frequency table (see below); 1 = Linear frequency table
 */
type FasttrackerXmModule_Header struct {
	SongLength uint16
	RestartPosition uint16
	NumChannels uint16
	NumPatterns uint16
	NumInstruments uint16
	Flags *FasttrackerXmModule_Flags
	DefaultTempo uint16
	DefaultBpm uint16
	PatternOrderTable []uint8
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule
}
func NewFasttrackerXmModule_Header() *FasttrackerXmModule_Header {
	return &FasttrackerXmModule_Header{
	}
}

func (this *FasttrackerXmModule_Header) Read(io *kaitai.Stream, parent *FasttrackerXmModule, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SongLength = uint16(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.RestartPosition = uint16(tmp29)
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumChannels = uint16(tmp30)
	tmp31, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPatterns = uint16(tmp31)
	tmp32, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumInstruments = uint16(tmp32)
	tmp33 := NewFasttrackerXmModule_Flags()
	err = tmp33.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp33
	tmp34, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DefaultTempo = uint16(tmp34)
	tmp35, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DefaultBpm = uint16(tmp35)
	this.PatternOrderTable = make([]uint8, 256)
	for i := range this.PatternOrderTable {
		tmp36, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.PatternOrderTable[i] = tmp36
	}
	return err
}

/**
 * Song length (in pattern order table)
 */

/**
 * (2,4,6,8,10,...,32)
 */

/**
 * (max 256)
 */

/**
 * (max 128)
 */

/**
 * max 256
 */

/**
 * XM's notion of "instrument" typically constitutes of a
 * instrument metadata and one or several samples. Metadata
 * includes:
 * 
 * * instrument's name
 * * instruction of which sample to use for which note
 * * volume and panning envelopes and looping instructions
 * * vibrato settings
 */
type FasttrackerXmModule_Instrument struct {
	HeaderSize uint32
	Header *FasttrackerXmModule_Instrument_Header
	SamplesHeaders []*FasttrackerXmModule_Instrument_SampleHeader
	Samples []*FasttrackerXmModule_Instrument_SamplesData
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule
	_raw_Header []byte
}
func NewFasttrackerXmModule_Instrument() *FasttrackerXmModule_Instrument {
	return &FasttrackerXmModule_Instrument{
	}
}

func (this *FasttrackerXmModule_Instrument) Read(io *kaitai.Stream, parent *FasttrackerXmModule, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp37)
	tmp38, err := this._io.ReadBytes(int((this.HeaderSize - 4)))
	if err != nil {
		return err
	}
	tmp38 = tmp38
	this._raw_Header = tmp38
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp39 := NewFasttrackerXmModule_Instrument_Header()
	err = tmp39.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp39
	this.SamplesHeaders = make([]*FasttrackerXmModule_Instrument_SampleHeader, this.Header.NumSamples)
	for i := range this.SamplesHeaders {
		tmp40 := NewFasttrackerXmModule_Instrument_SampleHeader()
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SamplesHeaders[i] = tmp40
	}
	this.Samples = make([]*FasttrackerXmModule_Instrument_SamplesData, this.Header.NumSamples)
	for i := range this.Samples {
		tmp41 := NewFasttrackerXmModule_Instrument_SamplesData(this.SamplesHeaders[i])
		err = tmp41.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Samples[i] = tmp41
	}
	return err
}

/**
 * Instrument size << header that is >>
 * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
 */
type FasttrackerXmModule_Instrument_Header struct {
	Name string
	Type uint8
	NumSamples uint16
	ExtraHeader *FasttrackerXmModule_Instrument_ExtraHeader
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument
}
func NewFasttrackerXmModule_Instrument_Header() *FasttrackerXmModule_Instrument_Header {
	return &FasttrackerXmModule_Instrument_Header{
	}
}

func (this *FasttrackerXmModule_Instrument_Header) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadBytes(int(22))
	if err != nil {
		return err
	}
	tmp42 = kaitai.BytesTerminate(tmp42, 0, false)
	this.Name = string(tmp42)
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp43
	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumSamples = uint16(tmp44)
	if (this.NumSamples > 0) {
		tmp45 := NewFasttrackerXmModule_Instrument_ExtraHeader()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ExtraHeader = tmp45
	}
	return err
}

/**
 * Usually zero, but this seems pretty random, don't assume it's zero
 */

type FasttrackerXmModule_Instrument_ExtraHeader_Type int
const (
	FasttrackerXmModule_Instrument_ExtraHeader_Type__True FasttrackerXmModule_Instrument_ExtraHeader_Type = 0
	FasttrackerXmModule_Instrument_ExtraHeader_Type__Sustain FasttrackerXmModule_Instrument_ExtraHeader_Type = 1
	FasttrackerXmModule_Instrument_ExtraHeader_Type__Loop FasttrackerXmModule_Instrument_ExtraHeader_Type = 2
)
type FasttrackerXmModule_Instrument_ExtraHeader struct {
	LenSampleHeader uint32
	IdxSamplePerNote []uint8
	VolumePoints []*FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint
	PanningPoints []*FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint
	NumVolumePoints uint8
	NumPanningPoints uint8
	VolumeSustainPoint uint8
	VolumeLoopStartPoint uint8
	VolumeLoopEndPoint uint8
	PanningSustainPoint uint8
	PanningLoopStartPoint uint8
	PanningLoopEndPoint uint8
	VolumeType FasttrackerXmModule_Instrument_ExtraHeader_Type
	PanningType FasttrackerXmModule_Instrument_ExtraHeader_Type
	VibratoType uint8
	VibratoSweep uint8
	VibratoDepth uint8
	VibratoRate uint8
	VolumeFadeout uint16
	Reserved uint16
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument_Header
}
func NewFasttrackerXmModule_Instrument_ExtraHeader() *FasttrackerXmModule_Instrument_ExtraHeader {
	return &FasttrackerXmModule_Instrument_ExtraHeader{
	}
}

func (this *FasttrackerXmModule_Instrument_ExtraHeader) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument_Header, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenSampleHeader = uint32(tmp46)
	this.IdxSamplePerNote = make([]uint8, 96)
	for i := range this.IdxSamplePerNote {
		tmp47, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.IdxSamplePerNote[i] = tmp47
	}
	this.VolumePoints = make([]*FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint, 12)
	for i := range this.VolumePoints {
		tmp48 := NewFasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint()
		err = tmp48.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.VolumePoints[i] = tmp48
	}
	this.PanningPoints = make([]*FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint, 12)
	for i := range this.PanningPoints {
		tmp49 := NewFasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint()
		err = tmp49.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.PanningPoints[i] = tmp49
	}
	tmp50, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumVolumePoints = tmp50
	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumPanningPoints = tmp51
	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VolumeSustainPoint = tmp52
	tmp53, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VolumeLoopStartPoint = tmp53
	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VolumeLoopEndPoint = tmp54
	tmp55, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PanningSustainPoint = tmp55
	tmp56, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PanningLoopStartPoint = tmp56
	tmp57, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PanningLoopEndPoint = tmp57
	tmp58, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VolumeType = FasttrackerXmModule_Instrument_ExtraHeader_Type(tmp58)
	tmp59, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PanningType = FasttrackerXmModule_Instrument_ExtraHeader_Type(tmp59)
	tmp60, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VibratoType = tmp60
	tmp61, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VibratoSweep = tmp61
	tmp62, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VibratoDepth = tmp62
	tmp63, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VibratoRate = tmp63
	tmp64, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VolumeFadeout = uint16(tmp64)
	tmp65, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Reserved = uint16(tmp65)
	return err
}

/**
 * Index of sample that should be used for any particular
 * note. In the simplest case, where it's only one sample
 * is available, it's an array of full of zeroes.
 */

/**
 * Points for volume envelope. Only `num_volume_points` will be actually used.
 */

/**
 * Points for panning envelope. Only `num_panning_points` will be actually used.
 */

/**
 * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
 * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
 * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
 * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
 * Of course it does not help if all instruments have the values inside FT2 supported range.
 * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
 */
type FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint struct {
	X uint16
	Y uint16
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument_ExtraHeader
}
func NewFasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint() *FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint {
	return &FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint{
	}
}

func (this *FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument_ExtraHeader, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp66, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.X = uint16(tmp66)
	tmp67, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Y = uint16(tmp67)
	return err
}

/**
 * Frame number of the point
 */

/**
 * Value of the point
 */

/**
 * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
 * Pseudocode for converting the delta-coded data to normal data,
 * old = 0;
 * for i in range(data_len):
 *   new = sample[i] + old;
 *   sample[i] = new;
 *   old = new;
 */
type FasttrackerXmModule_Instrument_SamplesData struct {
	Data []byte
	Header *FasttrackerXmModule_Instrument_SampleHeader
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument
}
func NewFasttrackerXmModule_Instrument_SamplesData(header *FasttrackerXmModule_Instrument_SampleHeader) *FasttrackerXmModule_Instrument_SamplesData {
	return &FasttrackerXmModule_Instrument_SamplesData{
		Header: header,
	}
}

func (this *FasttrackerXmModule_Instrument_SamplesData) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	var tmp68 int8;
	if (this.Header.Type.IsSampleData16Bit) {
		tmp68 = 2
	} else {
		tmp68 = 1
	}
	tmp69, err := this._io.ReadBytes(int((this.Header.SampleLength * tmp68)))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.Data = tmp69
	return err
}
type FasttrackerXmModule_Instrument_SampleHeader struct {
	SampleLength uint32
	SampleLoopStart uint32
	SampleLoopLength uint32
	Volume uint8
	FineTune int8
	Type *FasttrackerXmModule_Instrument_SampleHeader_LoopType
	Panning uint8
	RelativeNoteNumber int8
	Reserved uint8
	Name string
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument
}
func NewFasttrackerXmModule_Instrument_SampleHeader() *FasttrackerXmModule_Instrument_SampleHeader {
	return &FasttrackerXmModule_Instrument_SampleHeader{
	}
}

func (this *FasttrackerXmModule_Instrument_SampleHeader) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp70, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SampleLength = uint32(tmp70)
	tmp71, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SampleLoopStart = uint32(tmp71)
	tmp72, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SampleLoopLength = uint32(tmp72)
	tmp73, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Volume = tmp73
	tmp74, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.FineTune = tmp74
	tmp75 := NewFasttrackerXmModule_Instrument_SampleHeader_LoopType()
	err = tmp75.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Type = tmp75
	tmp76, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Panning = tmp76
	tmp77, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.RelativeNoteNumber = tmp77
	tmp78, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp78
	tmp79, err := this._io.ReadBytes(int(22))
	if err != nil {
		return err
	}
	tmp79 = kaitai.BytesTerminate(tmp79, 0, false)
	this.Name = string(tmp79)
	return err
}

/**
 * -16..+15
 */

/**
 * (0-255)
 */

type FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType int
const (
	FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType__None FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType = 0
	FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType__Forward FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType = 1
	FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType__PingPong FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType = 2
)
type FasttrackerXmModule_Instrument_SampleHeader_LoopType struct {
	Reserved0 uint64
	IsSampleData16Bit bool
	Reserved1 uint64
	LoopType FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType
	_io *kaitai.Stream
	_root *FasttrackerXmModule
	_parent *FasttrackerXmModule_Instrument_SampleHeader
}
func NewFasttrackerXmModule_Instrument_SampleHeader_LoopType() *FasttrackerXmModule_Instrument_SampleHeader_LoopType {
	return &FasttrackerXmModule_Instrument_SampleHeader_LoopType{
	}
}

func (this *FasttrackerXmModule_Instrument_SampleHeader_LoopType) Read(io *kaitai.Stream, parent *FasttrackerXmModule_Instrument_SampleHeader, root *FasttrackerXmModule) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp80, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.Reserved0 = tmp80
	tmp81, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsSampleData16Bit = tmp81 != 0
	tmp82, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp82
	tmp83, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.LoopType = FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType(tmp83)
	return err
}
