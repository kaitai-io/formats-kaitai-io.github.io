// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


/**
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * @see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf">Source</a>
 */

type MacOsResourceSnd_CmdType int
const (
	MacOsResourceSnd_CmdType__NullCmd MacOsResourceSnd_CmdType = 0
	MacOsResourceSnd_CmdType__QuietCmd MacOsResourceSnd_CmdType = 3
	MacOsResourceSnd_CmdType__FlushCmd MacOsResourceSnd_CmdType = 4
	MacOsResourceSnd_CmdType__ReInitCmd MacOsResourceSnd_CmdType = 5
	MacOsResourceSnd_CmdType__WaitCmd MacOsResourceSnd_CmdType = 10
	MacOsResourceSnd_CmdType__PauseCmd MacOsResourceSnd_CmdType = 11
	MacOsResourceSnd_CmdType__ResumeCmd MacOsResourceSnd_CmdType = 12
	MacOsResourceSnd_CmdType__CallBackCmd MacOsResourceSnd_CmdType = 13
	MacOsResourceSnd_CmdType__SyncCmd MacOsResourceSnd_CmdType = 14
	MacOsResourceSnd_CmdType__EmptyCmd MacOsResourceSnd_CmdType = 15
	MacOsResourceSnd_CmdType__AvailableCmd MacOsResourceSnd_CmdType = 24
	MacOsResourceSnd_CmdType__VersionCmd MacOsResourceSnd_CmdType = 25
	MacOsResourceSnd_CmdType__TotalLoadCmd MacOsResourceSnd_CmdType = 26
	MacOsResourceSnd_CmdType__LoadCmd MacOsResourceSnd_CmdType = 27
	MacOsResourceSnd_CmdType__FreqDurationCmd MacOsResourceSnd_CmdType = 40
	MacOsResourceSnd_CmdType__RestCmd MacOsResourceSnd_CmdType = 41
	MacOsResourceSnd_CmdType__FreqCmd MacOsResourceSnd_CmdType = 42
	MacOsResourceSnd_CmdType__AmpCmd MacOsResourceSnd_CmdType = 43
	MacOsResourceSnd_CmdType__TimbreCmd MacOsResourceSnd_CmdType = 44
	MacOsResourceSnd_CmdType__GetAmpCmd MacOsResourceSnd_CmdType = 45
	MacOsResourceSnd_CmdType__VolumeCmd MacOsResourceSnd_CmdType = 46
	MacOsResourceSnd_CmdType__GetVolumeCmd MacOsResourceSnd_CmdType = 47
	MacOsResourceSnd_CmdType__WaveTableCmd MacOsResourceSnd_CmdType = 60
	MacOsResourceSnd_CmdType__PhaseCmd MacOsResourceSnd_CmdType = 61
	MacOsResourceSnd_CmdType__SoundCmd MacOsResourceSnd_CmdType = 80
	MacOsResourceSnd_CmdType__BufferCmd MacOsResourceSnd_CmdType = 81
	MacOsResourceSnd_CmdType__RateCmd MacOsResourceSnd_CmdType = 82
	MacOsResourceSnd_CmdType__GetRateCmd MacOsResourceSnd_CmdType = 85
)

type MacOsResourceSnd_SoundHeaderType int
const (
	MacOsResourceSnd_SoundHeaderType__Standard MacOsResourceSnd_SoundHeaderType = 0
	MacOsResourceSnd_SoundHeaderType__Compressed MacOsResourceSnd_SoundHeaderType = 254
	MacOsResourceSnd_SoundHeaderType__Extended MacOsResourceSnd_SoundHeaderType = 255
)

type MacOsResourceSnd_DataType int
const (
	MacOsResourceSnd_DataType__SquareWaveSynth MacOsResourceSnd_DataType = 1
	MacOsResourceSnd_DataType__WaveTableSynth MacOsResourceSnd_DataType = 3
	MacOsResourceSnd_DataType__SampledSynth MacOsResourceSnd_DataType = 5
)

type MacOsResourceSnd_WaveInitOption int
const (
	MacOsResourceSnd_WaveInitOption__Channel0 MacOsResourceSnd_WaveInitOption = 4
	MacOsResourceSnd_WaveInitOption__Channel1 MacOsResourceSnd_WaveInitOption = 5
	MacOsResourceSnd_WaveInitOption__Channel2 MacOsResourceSnd_WaveInitOption = 6
	MacOsResourceSnd_WaveInitOption__Channel3 MacOsResourceSnd_WaveInitOption = 7
)

type MacOsResourceSnd_InitOption int
const (
	MacOsResourceSnd_InitOption__ChanLeft MacOsResourceSnd_InitOption = 2
	MacOsResourceSnd_InitOption__ChanRight MacOsResourceSnd_InitOption = 3
	MacOsResourceSnd_InitOption__NoInterp MacOsResourceSnd_InitOption = 4
	MacOsResourceSnd_InitOption__NoDrop MacOsResourceSnd_InitOption = 8
	MacOsResourceSnd_InitOption__Mono MacOsResourceSnd_InitOption = 128
	MacOsResourceSnd_InitOption__Stereo MacOsResourceSnd_InitOption = 192
	MacOsResourceSnd_InitOption__Mace3 MacOsResourceSnd_InitOption = 768
	MacOsResourceSnd_InitOption__Mace6 MacOsResourceSnd_InitOption = 1024
)

type MacOsResourceSnd_CompressionTypeEnum int
const (
	MacOsResourceSnd_CompressionTypeEnum__VariableCompression MacOsResourceSnd_CompressionTypeEnum = -2
	MacOsResourceSnd_CompressionTypeEnum__FixedCompression MacOsResourceSnd_CompressionTypeEnum = -1
	MacOsResourceSnd_CompressionTypeEnum__NotCompressed MacOsResourceSnd_CompressionTypeEnum = 0
	MacOsResourceSnd_CompressionTypeEnum__TwoToOne MacOsResourceSnd_CompressionTypeEnum = 1
	MacOsResourceSnd_CompressionTypeEnum__EightToThree MacOsResourceSnd_CompressionTypeEnum = 2
	MacOsResourceSnd_CompressionTypeEnum__ThreeToOne MacOsResourceSnd_CompressionTypeEnum = 3
	MacOsResourceSnd_CompressionTypeEnum__SixToOne MacOsResourceSnd_CompressionTypeEnum = 4
)
type MacOsResourceSnd struct {
	Format uint16
	NumDataFormats uint16
	DataFormats []*MacOsResourceSnd_DataFormat
	ReferenceCount uint16
	NumSoundCommands uint16
	SoundCommands []*MacOsResourceSnd_SoundCommand
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent interface{}
	_f_midiNoteToFrequency bool
	midiNoteToFrequency []float64
}
func NewMacOsResourceSnd() *MacOsResourceSnd {
	return &MacOsResourceSnd{
	}
}

func (this *MacOsResourceSnd) Read(io *kaitai.Stream, parent interface{}, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Format = uint16(tmp1)
	if (this.Format == 1) {
		tmp2, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.NumDataFormats = uint16(tmp2)
	}
	if (this.Format == 1) {
		this.DataFormats = make([]*MacOsResourceSnd_DataFormat, this.NumDataFormats)
		for i := range this.DataFormats {
			tmp3 := NewMacOsResourceSnd_DataFormat()
			err = tmp3.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.DataFormats[i] = tmp3
		}
	}
	if (this.Format == 2) {
		tmp4, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.ReferenceCount = uint16(tmp4)
	}
	tmp5, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumSoundCommands = uint16(tmp5)
	this.SoundCommands = make([]*MacOsResourceSnd_SoundCommand, this.NumSoundCommands)
	for i := range this.SoundCommands {
		tmp6 := NewMacOsResourceSnd_SoundCommand()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SoundCommands[i] = tmp6
	}
	return err
}

/**
 * Lookup table to convert a MIDI note into a frequency in Hz
 * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
 * @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
 */
func (this *MacOsResourceSnd) MidiNoteToFrequency() (v []float64, err error) {
	if (this._f_midiNoteToFrequency) {
		return this.midiNoteToFrequency, nil
	}
	this.midiNoteToFrequency = []float64([]float64{8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85})
	this._f_midiNoteToFrequency = true
	return this.midiNoteToFrequency, nil
}
type MacOsResourceSnd_Extended struct {
	InstrumentChunkPtr uint32
	AesRecordingPtr uint32
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd_ExtendedOrCompressed
}
func NewMacOsResourceSnd_Extended() *MacOsResourceSnd_Extended {
	return &MacOsResourceSnd_Extended{
	}
}

func (this *MacOsResourceSnd_Extended) Read(io *kaitai.Stream, parent *MacOsResourceSnd_ExtendedOrCompressed, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.InstrumentChunkPtr = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.AesRecordingPtr = uint32(tmp8)
	return err
}

/**
 * pointer to instrument info
 */

/**
 * pointer to audio info
 */
type MacOsResourceSnd_SoundHeader struct {
	_unnamed0 []byte
	SamplePtr uint32
	NumSamples uint32
	NumChannels uint32
	SampleRate *MacOsResourceSnd_UnsignedFixedPoint
	LoopStart uint32
	LoopEnd uint32
	Encode MacOsResourceSnd_SoundHeaderType
	MidiNote uint8
	ExtendedOrCompressed *MacOsResourceSnd_ExtendedOrCompressed
	SampleArea []byte
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd_SoundCommand
	_f_startOfs bool
	startOfs int
	_f_baseFreqeuncy bool
	baseFreqeuncy float64
	_f_soundHeaderType bool
	soundHeaderType MacOsResourceSnd_SoundHeaderType
}
func NewMacOsResourceSnd_SoundHeader() *MacOsResourceSnd_SoundHeader {
	return &MacOsResourceSnd_SoundHeader{
	}
}

func (this *MacOsResourceSnd_SoundHeader) Read(io *kaitai.Stream, parent *MacOsResourceSnd_SoundCommand, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this.StartOfs()
	if err != nil {
		return err
	}
	if (tmp9 < 0) {
		tmp10, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this._unnamed0 = tmp10
	}
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SamplePtr = uint32(tmp11)
	tmp12, err := this.SoundHeaderType()
	if err != nil {
		return err
	}
	if (tmp12 == MacOsResourceSnd_SoundHeaderType__Standard) {
		tmp13, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.NumSamples = uint32(tmp13)
	}
	tmp14, err := this.SoundHeaderType()
	if err != nil {
		return err
	}
	tmp15, err := this.SoundHeaderType()
	if err != nil {
		return err
	}
	if ( ((tmp14 == MacOsResourceSnd_SoundHeaderType__Extended) || (tmp15 == MacOsResourceSnd_SoundHeaderType__Compressed)) ) {
		tmp16, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.NumChannels = uint32(tmp16)
	}
	tmp17 := NewMacOsResourceSnd_UnsignedFixedPoint()
	err = tmp17.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SampleRate = tmp17
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LoopStart = uint32(tmp18)
	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LoopEnd = uint32(tmp19)
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Encode = MacOsResourceSnd_SoundHeaderType(tmp20)
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MidiNote = tmp21
	tmp22, err := this.SoundHeaderType()
	if err != nil {
		return err
	}
	tmp23, err := this.SoundHeaderType()
	if err != nil {
		return err
	}
	if ( ((tmp22 == MacOsResourceSnd_SoundHeaderType__Extended) || (tmp23 == MacOsResourceSnd_SoundHeaderType__Compressed)) ) {
		tmp24 := NewMacOsResourceSnd_ExtendedOrCompressed()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ExtendedOrCompressed = tmp24
	}
	if (this.SamplePtr == 0) {
		var tmp25 uint32;
		tmp26, err := this.SoundHeaderType()
		if err != nil {
			return err
		}
		if (tmp26 == MacOsResourceSnd_SoundHeaderType__Standard) {
			tmp25 = this.NumSamples
		} else {
			var tmp27 int;
			tmp28, err := this.SoundHeaderType()
			if err != nil {
				return err
			}
			if (tmp28 == MacOsResourceSnd_SoundHeaderType__Extended) {
				tmp27 = (((this.ExtendedOrCompressed.NumFrames * this.NumChannels) * this.ExtendedOrCompressed.BitsPerSample) / 8)
			} else {
				tmp29, err := this._io.Size()
				if err != nil {
					return err
				}
				tmp30, err := this._io.Pos()
				if err != nil {
					return err
				}
				tmp27 = (tmp29 - tmp30)
			}
			tmp25 = tmp27
		}
		tmp31, err := this._io.ReadBytes(int(tmp25))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this.SampleArea = tmp31
	}
	return err
}
func (this *MacOsResourceSnd_SoundHeader) StartOfs() (v int, err error) {
	if (this._f_startOfs) {
		return this.startOfs, nil
	}
	tmp32, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.startOfs = int(tmp32)
	this._f_startOfs = true
	return this.startOfs, nil
}

/**
 * base frequency of sample in Hz
 * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
 * @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
 */
func (this *MacOsResourceSnd_SoundHeader) BaseFreqeuncy() (v float64, err error) {
	if (this._f_baseFreqeuncy) {
		return this.baseFreqeuncy, nil
	}
	if ( ((this.MidiNote >= 0) && (this.MidiNote < 128)) ) {
		tmp33, err := this._root.MidiNoteToFrequency()
		if err != nil {
			return 0, err
		}
		this.baseFreqeuncy = float64(tmp33[this.MidiNote])
	}
	this._f_baseFreqeuncy = true
	return this.baseFreqeuncy, nil
}
func (this *MacOsResourceSnd_SoundHeader) SoundHeaderType() (v MacOsResourceSnd_SoundHeaderType, err error) {
	if (this._f_soundHeaderType) {
		return this.soundHeaderType, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp34, err := this.StartOfs()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp34 + 20)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp35, err := this._io.ReadU1()
	if err != nil {
		return nil, err
	}
	this.soundHeaderType = MacOsResourceSnd_SoundHeaderType(tmp35)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_soundHeaderType = true
	this._f_soundHeaderType = true
	return this.soundHeaderType, nil
}

/**
 * pointer to samples (or 0 if samples follow data structure)
 */

/**
 * number of samples
 */

/**
 * number of channels in sample
 */

/**
 * The rate at which the sample was originally recorded.
 */

/**
 * loop point beginning
 */

/**
 * loop point ending
 */

/**
 * sample's encoding option
 */

/**
 * base frequency of sample, expressed as MIDI note values, 60 is middle C
 */

/**
 * sampled-sound data
 */
type MacOsResourceSnd_UnsignedFixedPoint struct {
	IntegerPart uint16
	FractionPart uint16
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd_SoundHeader
	_f_value bool
	value float64
}
func NewMacOsResourceSnd_UnsignedFixedPoint() *MacOsResourceSnd_UnsignedFixedPoint {
	return &MacOsResourceSnd_UnsignedFixedPoint{
	}
}

func (this *MacOsResourceSnd_UnsignedFixedPoint) Read(io *kaitai.Stream, parent *MacOsResourceSnd_SoundHeader, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.IntegerPart = uint16(tmp36)
	tmp37, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FractionPart = uint16(tmp37)
	return err
}
func (this *MacOsResourceSnd_UnsignedFixedPoint) Value() (v float64, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = float64((this.IntegerPart + (this.FractionPart / 65535.0)))
	this._f_value = true
	return this.value, nil
}
type MacOsResourceSnd_SoundCommand struct {
	IsDataOffset bool
	Cmd MacOsResourceSnd_CmdType
	Param1 uint16
	Param2 uint32
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd
	_f_soundHeader bool
	soundHeader *MacOsResourceSnd_SoundHeader
}
func NewMacOsResourceSnd_SoundCommand() *MacOsResourceSnd_SoundCommand {
	return &MacOsResourceSnd_SoundCommand{
	}
}

func (this *MacOsResourceSnd_SoundCommand) Read(io *kaitai.Stream, parent *MacOsResourceSnd, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsDataOffset = tmp38 != 0
	tmp39, err := this._io.ReadBitsIntBe(15)
	if err != nil {
		return err
	}
	this.Cmd = MacOsResourceSnd_CmdType(tmp39)
	this._io.AlignToByte()
	tmp40, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Param1 = uint16(tmp40)
	tmp41, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Param2 = uint32(tmp41)
	return err
}
func (this *MacOsResourceSnd_SoundCommand) SoundHeader() (v *MacOsResourceSnd_SoundHeader, err error) {
	if (this._f_soundHeader) {
		return this.soundHeader, nil
	}
	if ( ((this.IsDataOffset) && (this.Cmd == MacOsResourceSnd_CmdType__BufferCmd)) ) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.Param2), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp42 := NewMacOsResourceSnd_SoundHeader()
		err = tmp42.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.soundHeader = tmp42
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_soundHeader = true
	}
	this._f_soundHeader = true
	return this.soundHeader, nil
}
type MacOsResourceSnd_Compressed struct {
	Format string
	Reserved []byte
	StateVarsPtr uint32
	LeftOverSamplesPtr uint32
	CompressionId int16
	PacketSize uint16
	SynthesizerId uint16
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd_ExtendedOrCompressed
	_f_compressionType bool
	compressionType MacOsResourceSnd_CompressionTypeEnum
}
func NewMacOsResourceSnd_Compressed() *MacOsResourceSnd_Compressed {
	return &MacOsResourceSnd_Compressed{
	}
}

func (this *MacOsResourceSnd_Compressed) Read(io *kaitai.Stream, parent *MacOsResourceSnd_ExtendedOrCompressed, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.Format = string(tmp43)
	tmp44, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Reserved = tmp44
	tmp45, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StateVarsPtr = uint32(tmp45)
	tmp46, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LeftOverSamplesPtr = uint32(tmp46)
	tmp47, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.CompressionId = int16(tmp47)
	tmp48, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.PacketSize = uint16(tmp48)
	tmp49, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SynthesizerId = uint16(tmp49)
	return err
}
func (this *MacOsResourceSnd_Compressed) CompressionType() (v MacOsResourceSnd_CompressionTypeEnum, err error) {
	if (this._f_compressionType) {
		return this.compressionType, nil
	}
	this.compressionType = MacOsResourceSnd_CompressionTypeEnum(MacOsResourceSnd_CompressionTypeEnum(this.CompressionId))
	this._f_compressionType = true
	return this.compressionType, nil
}

/**
 * data format type
 */

/**
 * pointer to StateBlock
 */

/**
 * pointer to LeftOverBlock
 */

/**
 * ID of compression algorithm
 */

/**
 * number of bits per packet
 */

/**
 * Latest Sound Manager documentation specifies this field as:
 * This field is unused. You should set it to 0.
 * Inside Macintosh (Volume VI, 1991) specifies it as:
 * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
 * @see <a href="https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf">Page 22-49, absolute page number 1169 in the PDF</a>
 */
type MacOsResourceSnd_ExtendedOrCompressed struct {
	NumFrames uint32
	AiffSampleRate []byte
	MarkerChunk uint32
	Extended *MacOsResourceSnd_Extended
	Compressed *MacOsResourceSnd_Compressed
	BitsPerSample uint16
	Reserved []byte
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd_SoundHeader
}
func NewMacOsResourceSnd_ExtendedOrCompressed() *MacOsResourceSnd_ExtendedOrCompressed {
	return &MacOsResourceSnd_ExtendedOrCompressed{
	}
}

func (this *MacOsResourceSnd_ExtendedOrCompressed) Read(io *kaitai.Stream, parent *MacOsResourceSnd_SoundHeader, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumFrames = uint32(tmp50)
	tmp51, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp51 = tmp51
	this.AiffSampleRate = tmp51
	tmp52, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MarkerChunk = uint32(tmp52)
	tmp53, err := this._parent.SoundHeaderType()
	if err != nil {
		return err
	}
	if (tmp53 == MacOsResourceSnd_SoundHeaderType__Extended) {
		tmp54 := NewMacOsResourceSnd_Extended()
		err = tmp54.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Extended = tmp54
	}
	tmp55, err := this._parent.SoundHeaderType()
	if err != nil {
		return err
	}
	if (tmp55 == MacOsResourceSnd_SoundHeaderType__Compressed) {
		tmp56 := NewMacOsResourceSnd_Compressed()
		err = tmp56.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Compressed = tmp56
	}
	tmp57, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.BitsPerSample = uint16(tmp57)
	tmp58, err := this._parent.SoundHeaderType()
	if err != nil {
		return err
	}
	if (tmp58 == MacOsResourceSnd_SoundHeaderType__Extended) {
		tmp59, err := this._io.ReadBytes(int(14))
		if err != nil {
			return err
		}
		tmp59 = tmp59
		this.Reserved = tmp59
	}
	return err
}

/**
 * rate of original sample (Extended80)
 */

/**
 * reserved
 */

/**
 * number of bits per sample
 */

/**
 * reserved
 */
type MacOsResourceSnd_DataFormat struct {
	Id MacOsResourceSnd_DataType
	Options uint32
	_io *kaitai.Stream
	_root *MacOsResourceSnd
	_parent *MacOsResourceSnd
	_f_initPanMask bool
	initPanMask int8
	_f_waveInitChannelMask bool
	waveInitChannelMask int8
	_f_initStereoMask bool
	initStereoMask uint8
	_f_waveInit bool
	waveInit MacOsResourceSnd_WaveInitOption
	_f_panInit bool
	panInit MacOsResourceSnd_InitOption
	_f_initCompMask bool
	initCompMask int
	_f_stereoInit bool
	stereoInit MacOsResourceSnd_InitOption
	_f_compInit bool
	compInit MacOsResourceSnd_InitOption
}
func NewMacOsResourceSnd_DataFormat() *MacOsResourceSnd_DataFormat {
	return &MacOsResourceSnd_DataFormat{
	}
}

func (this *MacOsResourceSnd_DataFormat) Read(io *kaitai.Stream, parent *MacOsResourceSnd, root *MacOsResourceSnd) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp60, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Id = MacOsResourceSnd_DataType(tmp60)
	tmp61, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Options = uint32(tmp61)
	return err
}

/**
 * mask for right/left pan values
 */
func (this *MacOsResourceSnd_DataFormat) InitPanMask() (v int8, err error) {
	if (this._f_initPanMask) {
		return this.initPanMask, nil
	}
	this.initPanMask = int8(3)
	this._f_initPanMask = true
	return this.initPanMask, nil
}

/**
 * wave table only, Sound Manager 2.0 and earlier
 */
func (this *MacOsResourceSnd_DataFormat) WaveInitChannelMask() (v int8, err error) {
	if (this._f_waveInitChannelMask) {
		return this.waveInitChannelMask, nil
	}
	this.waveInitChannelMask = int8(7)
	this._f_waveInitChannelMask = true
	return this.waveInitChannelMask, nil
}

/**
 * mask for mono/stereo values
 */
func (this *MacOsResourceSnd_DataFormat) InitStereoMask() (v uint8, err error) {
	if (this._f_initStereoMask) {
		return this.initStereoMask, nil
	}
	this.initStereoMask = uint8(192)
	this._f_initStereoMask = true
	return this.initStereoMask, nil
}
func (this *MacOsResourceSnd_DataFormat) WaveInit() (v MacOsResourceSnd_WaveInitOption, err error) {
	if (this._f_waveInit) {
		return this.waveInit, nil
	}
	if (this.Id == MacOsResourceSnd_DataType__WaveTableSynth) {
		tmp62, err := this.WaveInitChannelMask()
		if err != nil {
			return nil, err
		}
		this.waveInit = MacOsResourceSnd_WaveInitOption(MacOsResourceSnd_WaveInitOption((this.Options & tmp62)))
	}
	this._f_waveInit = true
	return this.waveInit, nil
}
func (this *MacOsResourceSnd_DataFormat) PanInit() (v MacOsResourceSnd_InitOption, err error) {
	if (this._f_panInit) {
		return this.panInit, nil
	}
	tmp63, err := this.InitPanMask()
	if err != nil {
		return nil, err
	}
	this.panInit = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption((this.Options & tmp63)))
	this._f_panInit = true
	return this.panInit, nil
}

/**
 * mask for compression IDs
 */
func (this *MacOsResourceSnd_DataFormat) InitCompMask() (v int, err error) {
	if (this._f_initCompMask) {
		return this.initCompMask, nil
	}
	this.initCompMask = int(65280)
	this._f_initCompMask = true
	return this.initCompMask, nil
}
func (this *MacOsResourceSnd_DataFormat) StereoInit() (v MacOsResourceSnd_InitOption, err error) {
	if (this._f_stereoInit) {
		return this.stereoInit, nil
	}
	tmp64, err := this.InitStereoMask()
	if err != nil {
		return nil, err
	}
	this.stereoInit = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption((this.Options & tmp64)))
	this._f_stereoInit = true
	return this.stereoInit, nil
}
func (this *MacOsResourceSnd_DataFormat) CompInit() (v MacOsResourceSnd_InitOption, err error) {
	if (this._f_compInit) {
		return this.compInit, nil
	}
	tmp65, err := this.InitCompMask()
	if err != nil {
		return nil, err
	}
	this.compInit = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption((this.Options & tmp65)))
	this._f_compInit = true
	return this.compInit, nil
}

/**
 * contains initialisation options for the SndNewChannel function
 */
