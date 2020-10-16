// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice">Source</a>
 */

type CreativeVoiceFile_BlockTypes int
const (
	CreativeVoiceFile_BlockTypes__Terminator CreativeVoiceFile_BlockTypes = 0
	CreativeVoiceFile_BlockTypes__SoundData CreativeVoiceFile_BlockTypes = 1
	CreativeVoiceFile_BlockTypes__SoundDataCont CreativeVoiceFile_BlockTypes = 2
	CreativeVoiceFile_BlockTypes__Silence CreativeVoiceFile_BlockTypes = 3
	CreativeVoiceFile_BlockTypes__Marker CreativeVoiceFile_BlockTypes = 4
	CreativeVoiceFile_BlockTypes__Text CreativeVoiceFile_BlockTypes = 5
	CreativeVoiceFile_BlockTypes__RepeatStart CreativeVoiceFile_BlockTypes = 6
	CreativeVoiceFile_BlockTypes__RepeatEnd CreativeVoiceFile_BlockTypes = 7
	CreativeVoiceFile_BlockTypes__ExtraInfo CreativeVoiceFile_BlockTypes = 8
	CreativeVoiceFile_BlockTypes__SoundDataNew CreativeVoiceFile_BlockTypes = 9
)

type CreativeVoiceFile_Codecs int
const (
	CreativeVoiceFile_Codecs__Pcm8bitUnsigned CreativeVoiceFile_Codecs = 0
	CreativeVoiceFile_Codecs__Adpcm4bit CreativeVoiceFile_Codecs = 1
	CreativeVoiceFile_Codecs__Adpcm26bit CreativeVoiceFile_Codecs = 2
	CreativeVoiceFile_Codecs__Adpcm2Bit CreativeVoiceFile_Codecs = 3
	CreativeVoiceFile_Codecs__Pcm16bitSigned CreativeVoiceFile_Codecs = 4
	CreativeVoiceFile_Codecs__Alaw CreativeVoiceFile_Codecs = 6
	CreativeVoiceFile_Codecs__Ulaw CreativeVoiceFile_Codecs = 7
	CreativeVoiceFile_Codecs__Adpcm4To16bit CreativeVoiceFile_Codecs = 512
)
type CreativeVoiceFile struct {
	Magic []byte
	HeaderSize uint16
	Version uint16
	Checksum uint16
	Blocks []*CreativeVoiceFile_Block
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent interface{}
}
func NewCreativeVoiceFile() *CreativeVoiceFile {
	return &CreativeVoiceFile{
	}
}

func (this *CreativeVoiceFile) Read(io *kaitai.Stream, parent interface{}, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26})) {
		return kaitai.NewValidationNotEqualError([]uint8{67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp3)
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp4)
	for i := 1;; i++ {
		tmp5, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp5 {
			break
		}
		tmp6 := NewCreativeVoiceFile_Block()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Blocks = append(this.Blocks, tmp6)
	}
	return err
}

/**
 * Total size of this main header (usually 0x001A)
 */

/**
 * Checksum: this must be equal to ~version + 0x1234
 */

/**
 * Series of blocks that contain the actual audio data
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker">Source</a>
 */
type CreativeVoiceFile_BlockMarker struct {
	MarkerId uint16
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
}
func NewCreativeVoiceFile_BlockMarker() *CreativeVoiceFile_BlockMarker {
	return &CreativeVoiceFile_BlockMarker{
	}
}

func (this *CreativeVoiceFile_BlockMarker) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MarkerId = uint16(tmp7)
	return err
}

/**
 * Marker ID
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence">Source</a>
 */
type CreativeVoiceFile_BlockSilence struct {
	DurationSamples uint16
	FreqDiv uint8
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
	_f_sampleRate bool
	sampleRate float64
	_f_durationSec bool
	durationSec float64
}
func NewCreativeVoiceFile_BlockSilence() *CreativeVoiceFile_BlockSilence {
	return &CreativeVoiceFile_BlockSilence{
	}
}

func (this *CreativeVoiceFile_BlockSilence) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DurationSamples = uint16(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FreqDiv = tmp9
	return err
}
func (this *CreativeVoiceFile_BlockSilence) SampleRate() (v float64, err error) {
	if (this._f_sampleRate) {
		return this.sampleRate, nil
	}
	this.sampleRate = float64((1000000.0 / (256 - this.FreqDiv)))
	this._f_sampleRate = true
	return this.sampleRate, nil
}

/**
 * Duration of silence, in seconds
 */
func (this *CreativeVoiceFile_BlockSilence) DurationSec() (v float64, err error) {
	if (this._f_durationSec) {
		return this.durationSec, nil
	}
	tmp10, err := this.SampleRate()
	if err != nil {
		return 0, err
	}
	this.durationSec = float64((this.DurationSamples / tmp10))
	this._f_durationSec = true
	return this.durationSec, nil
}

/**
 * Duration of silence, in samples
 */

/**
 * Frequency divisor, used to determine sample rate
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29">Source</a>
 */
type CreativeVoiceFile_BlockSoundDataNew struct {
	SampleRate uint32
	BitsPerSample uint8
	NumChannels uint8
	Codec CreativeVoiceFile_Codecs
	Reserved []byte
	Wave []byte
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
}
func NewCreativeVoiceFile_BlockSoundDataNew() *CreativeVoiceFile_BlockSoundDataNew {
	return &CreativeVoiceFile_BlockSoundDataNew{
	}
}

func (this *CreativeVoiceFile_BlockSoundDataNew) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SampleRate = uint32(tmp11)
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BitsPerSample = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumChannels = tmp13
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Codec = CreativeVoiceFile_Codecs(tmp14)
	tmp15, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Reserved = tmp15
	tmp16, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Wave = tmp16
	return err
}
type CreativeVoiceFile_Block struct {
	BlockType CreativeVoiceFile_BlockTypes
	BodySize1 uint16
	BodySize2 uint8
	Body interface{}
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile
	_raw_Body []byte
	_f_bodySize bool
	bodySize int
}
func NewCreativeVoiceFile_Block() *CreativeVoiceFile_Block {
	return &CreativeVoiceFile_Block{
	}
}

func (this *CreativeVoiceFile_Block) Read(io *kaitai.Stream, parent *CreativeVoiceFile, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlockType = CreativeVoiceFile_BlockTypes(tmp17)
	if (this.BlockType != CreativeVoiceFile_BlockTypes__Terminator) {
		tmp18, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.BodySize1 = uint16(tmp18)
	}
	if (this.BlockType != CreativeVoiceFile_BlockTypes__Terminator) {
		tmp19, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.BodySize2 = tmp19
	}
	if (this.BlockType != CreativeVoiceFile_BlockTypes__Terminator) {
		switch (this.BlockType) {
		case CreativeVoiceFile_BlockTypes__SoundDataNew:
			tmp20, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp21, err := this._io.ReadBytes(int(tmp20))
			if err != nil {
				return err
			}
			tmp21 = tmp21
			this._raw_Body = tmp21
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp22 := NewCreativeVoiceFile_BlockSoundDataNew()
			err = tmp22.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp22
		case CreativeVoiceFile_BlockTypes__RepeatStart:
			tmp23, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp24, err := this._io.ReadBytes(int(tmp23))
			if err != nil {
				return err
			}
			tmp24 = tmp24
			this._raw_Body = tmp24
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp25 := NewCreativeVoiceFile_BlockRepeatStart()
			err = tmp25.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp25
		case CreativeVoiceFile_BlockTypes__Marker:
			tmp26, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp27, err := this._io.ReadBytes(int(tmp26))
			if err != nil {
				return err
			}
			tmp27 = tmp27
			this._raw_Body = tmp27
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp28 := NewCreativeVoiceFile_BlockMarker()
			err = tmp28.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp28
		case CreativeVoiceFile_BlockTypes__SoundData:
			tmp29, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp30, err := this._io.ReadBytes(int(tmp29))
			if err != nil {
				return err
			}
			tmp30 = tmp30
			this._raw_Body = tmp30
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp31 := NewCreativeVoiceFile_BlockSoundData()
			err = tmp31.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp31
		case CreativeVoiceFile_BlockTypes__ExtraInfo:
			tmp32, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp33, err := this._io.ReadBytes(int(tmp32))
			if err != nil {
				return err
			}
			tmp33 = tmp33
			this._raw_Body = tmp33
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp34 := NewCreativeVoiceFile_BlockExtraInfo()
			err = tmp34.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp34
		case CreativeVoiceFile_BlockTypes__Silence:
			tmp35, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp36, err := this._io.ReadBytes(int(tmp35))
			if err != nil {
				return err
			}
			tmp36 = tmp36
			this._raw_Body = tmp36
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp37 := NewCreativeVoiceFile_BlockSilence()
			err = tmp37.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp37
		default:
			tmp38, err := this.BodySize()
			if err != nil {
				return err
			}
			tmp39, err := this._io.ReadBytes(int(tmp38))
			if err != nil {
				return err
			}
			tmp39 = tmp39
			this._raw_Body = tmp39
		}
	}
	return err
}

/**
 * body_size is a 24-bit little-endian integer, so we're
 * emulating that by adding two standard-sized integers
 * (body_size1 and body_size2).
 */
func (this *CreativeVoiceFile_Block) BodySize() (v int, err error) {
	if (this._f_bodySize) {
		return this.bodySize, nil
	}
	if (this.BlockType != CreativeVoiceFile_BlockTypes__Terminator) {
		this.bodySize = int((this.BodySize1 + (this.BodySize2 << 16)))
	}
	this._f_bodySize = true
	return this.bodySize, nil
}

/**
 * Byte that determines type of block content
 */

/**
 * Block body, type depends on block type byte
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start">Source</a>
 */
type CreativeVoiceFile_BlockRepeatStart struct {
	RepeatCount1 uint16
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
}
func NewCreativeVoiceFile_BlockRepeatStart() *CreativeVoiceFile_BlockRepeatStart {
	return &CreativeVoiceFile_BlockRepeatStart{
	}
}

func (this *CreativeVoiceFile_BlockRepeatStart) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp40, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.RepeatCount1 = uint16(tmp40)
	return err
}

/**
 * Number of repetitions minus 1; 0xffff means infinite repetitions
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data">Source</a>
 */
type CreativeVoiceFile_BlockSoundData struct {
	FreqDiv uint8
	Codec CreativeVoiceFile_Codecs
	Wave []byte
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
	_f_sampleRate bool
	sampleRate float64
}
func NewCreativeVoiceFile_BlockSoundData() *CreativeVoiceFile_BlockSoundData {
	return &CreativeVoiceFile_BlockSoundData{
	}
}

func (this *CreativeVoiceFile_BlockSoundData) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FreqDiv = tmp41
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Codec = CreativeVoiceFile_Codecs(tmp42)
	tmp43, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp43 = tmp43
	this.Wave = tmp43
	return err
}
func (this *CreativeVoiceFile_BlockSoundData) SampleRate() (v float64, err error) {
	if (this._f_sampleRate) {
		return this.sampleRate, nil
	}
	this.sampleRate = float64((1000000.0 / (256 - this.FreqDiv)))
	this._f_sampleRate = true
	return this.sampleRate, nil
}

/**
 * Frequency divisor, used to determine sample rate
 */

/**
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info">Source</a>
 */
type CreativeVoiceFile_BlockExtraInfo struct {
	FreqDiv uint16
	Codec CreativeVoiceFile_Codecs
	NumChannels1 uint8
	_io *kaitai.Stream
	_root *CreativeVoiceFile
	_parent *CreativeVoiceFile_Block
	_f_numChannels bool
	numChannels int
	_f_sampleRate bool
	sampleRate float64
}
func NewCreativeVoiceFile_BlockExtraInfo() *CreativeVoiceFile_BlockExtraInfo {
	return &CreativeVoiceFile_BlockExtraInfo{
	}
}

func (this *CreativeVoiceFile_BlockExtraInfo) Read(io *kaitai.Stream, parent *CreativeVoiceFile_Block, root *CreativeVoiceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FreqDiv = uint16(tmp44)
	tmp45, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Codec = CreativeVoiceFile_Codecs(tmp45)
	tmp46, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumChannels1 = tmp46
	return err
}

/**
 * Number of channels (1 = mono, 2 = stereo)
 */
func (this *CreativeVoiceFile_BlockExtraInfo) NumChannels() (v int, err error) {
	if (this._f_numChannels) {
		return this.numChannels, nil
	}
	this.numChannels = int((this.NumChannels1 + 1))
	this._f_numChannels = true
	return this.numChannels, nil
}
func (this *CreativeVoiceFile_BlockExtraInfo) SampleRate() (v float64, err error) {
	if (this._f_sampleRate) {
		return this.sampleRate, nil
	}
	tmp47, err := this.NumChannels()
	if err != nil {
		return 0, err
	}
	this.sampleRate = float64((256000000.0 / (tmp47 * (65536 - this.FreqDiv))))
	this._f_sampleRate = true
	return this.sampleRate, nil
}

/**
 * Frequency divisor
 */

/**
 * Number of channels minus 1 (0 = mono, 1 = stereo)
 */
