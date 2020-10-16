// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
 * Flash) to encode rich interactive multimedia content and are,
 * essentially, a container for special bytecode instructions to play
 * back that content. In early 2000s, it was dominant rich multimedia
 * web format (.swf files were integrated into web pages and played
 * back with a browser plugin), but its usage largely declined in
 * 2010s, as HTML5 and performant browser-native solutions
 * (i.e. JavaScript engines and graphical approaches, such as WebGL)
 * emerged.
 * 
 * There are a lot of versions of SWF (~36), format is somewhat
 * documented by Adobe.
 * @see <a href="https://www.adobe.com/content/dam/acom/en/devnet/pdf/swf-file-format-spec.pdf">Source</a>
 */

type Swf_Compressions int
const (
	Swf_Compressions__Zlib Swf_Compressions = 67
	Swf_Compressions__None Swf_Compressions = 70
	Swf_Compressions__Lzma Swf_Compressions = 90
)

type Swf_TagType int
const (
	Swf_TagType__EndOfFile Swf_TagType = 0
	Swf_TagType__PlaceObject Swf_TagType = 4
	Swf_TagType__RemoveObject Swf_TagType = 5
	Swf_TagType__SetBackgroundColor Swf_TagType = 9
	Swf_TagType__DefineSound Swf_TagType = 14
	Swf_TagType__PlaceObject2 Swf_TagType = 26
	Swf_TagType__RemoveObject2 Swf_TagType = 28
	Swf_TagType__FrameLabel Swf_TagType = 43
	Swf_TagType__ExportAssets Swf_TagType = 56
	Swf_TagType__ScriptLimits Swf_TagType = 65
	Swf_TagType__FileAttributes Swf_TagType = 69
	Swf_TagType__PlaceObject3 Swf_TagType = 70
	Swf_TagType__SymbolClass Swf_TagType = 76
	Swf_TagType__Metadata Swf_TagType = 77
	Swf_TagType__DefineScalingGrid Swf_TagType = 78
	Swf_TagType__DoAbc Swf_TagType = 82
	Swf_TagType__DefineSceneAndFrameLabelData Swf_TagType = 86
)
type Swf struct {
	Compression Swf_Compressions
	Signature []byte
	Version uint8
	LenFile uint32
	PlainBody *Swf_SwfBody
	ZlibBody *Swf_SwfBody
	_io *kaitai.Stream
	_root *Swf
	_parent interface{}
	_raw_PlainBody []byte
	_raw_ZlibBody []byte
	_raw__raw_ZlibBody []byte
}
func NewSwf() *Swf {
	return &Swf{
	}
}

func (this *Swf) Read(io *kaitai.Stream, parent interface{}, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Compression = Swf_Compressions(tmp1)
	tmp2, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Signature = tmp2
	if !(bytes.Equal(this.Signature, []uint8{87, 83})) {
		return kaitai.NewValidationNotEqualError([]uint8{87, 83}, this.Signature, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp3
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFile = uint32(tmp4)
	if (this.Compression == Swf_Compressions__None) {
		tmp5, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp5 = tmp5
		this._raw_PlainBody = tmp5
		_io__raw_PlainBody := kaitai.NewStream(bytes.NewReader(this._raw_PlainBody))
		tmp6 := NewSwf_SwfBody()
		err = tmp6.Read(_io__raw_PlainBody, this, this._root)
		if err != nil {
			return err
		}
		this.PlainBody = tmp6
	}
	if (this.Compression == Swf_Compressions__Zlib) {
		tmp7, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this._raw__raw_ZlibBody = tmp7
		tmp8, err := kaitai.ProcessZlib(this._raw__raw_ZlibBody)
		if err != nil {
			return err
		}
		this._raw_ZlibBody = tmp8
		_io__raw_ZlibBody := kaitai.NewStream(bytes.NewReader(this._raw_ZlibBody))
		tmp9 := NewSwf_SwfBody()
		err = tmp9.Read(_io__raw_ZlibBody, this, this._root)
		if err != nil {
			return err
		}
		this.ZlibBody = tmp9
	}
	return err
}
type Swf_Rgb struct {
	R uint8
	G uint8
	B uint8
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
}
func NewSwf_Rgb() *Swf_Rgb {
	return &Swf_Rgb{
	}
}

func (this *Swf_Rgb) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.R = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.G = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp12
	return err
}
type Swf_DoAbcBody struct {
	Flags uint32
	Name string
	Abcdata []byte
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
}
func NewSwf_DoAbcBody() *Swf_DoAbcBody {
	return &Swf_DoAbcBody{
	}
}

func (this *Swf_DoAbcBody) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp13)
	tmp14, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Name = string(tmp14)
	tmp15, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Abcdata = tmp15
	return err
}
type Swf_SwfBody struct {
	Rect *Swf_Rect
	FrameRate uint16
	FrameCount uint16
	FileAttributesTag *Swf_Tag
	Tags []*Swf_Tag
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf
}
func NewSwf_SwfBody() *Swf_SwfBody {
	return &Swf_SwfBody{
	}
}

func (this *Swf_SwfBody) Read(io *kaitai.Stream, parent *Swf, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16 := NewSwf_Rect()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Rect = tmp16
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FrameRate = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FrameCount = uint16(tmp18)
	if (this._root.Version >= 8) {
		tmp19 := NewSwf_Tag()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.FileAttributesTag = tmp19
	}
	for i := 1;; i++ {
		tmp20, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp20 {
			break
		}
		tmp21 := NewSwf_Tag()
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tags = append(this.Tags, tmp21)
	}
	return err
}
type Swf_Rect struct {
	B1 uint8
	Skip []byte
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_SwfBody
	_f_numBits bool
	numBits int
	_f_numBytes bool
	numBytes int
}
func NewSwf_Rect() *Swf_Rect {
	return &Swf_Rect{
	}
}

func (this *Swf_Rect) Read(io *kaitai.Stream, parent *Swf_SwfBody, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp22
	tmp23, err := this.NumBytes()
	if err != nil {
		return err
	}
	tmp24, err := this._io.ReadBytes(int(tmp23))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Skip = tmp24
	return err
}
func (this *Swf_Rect) NumBits() (v int, err error) {
	if (this._f_numBits) {
		return this.numBits, nil
	}
	this.numBits = int((this.B1 >> 3))
	this._f_numBits = true
	return this.numBits, nil
}
func (this *Swf_Rect) NumBytes() (v int, err error) {
	if (this._f_numBytes) {
		return this.numBytes, nil
	}
	tmp25, err := this.NumBits()
	if err != nil {
		return 0, err
	}
	this.numBytes = int(((((tmp25 * 4) - 3) + 7) / 8))
	this._f_numBytes = true
	return this.numBytes, nil
}
type Swf_Tag struct {
	RecordHeader *Swf_RecordHeader
	TagBody interface{}
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_SwfBody
	_raw_TagBody []byte
}
func NewSwf_Tag() *Swf_Tag {
	return &Swf_Tag{
	}
}

func (this *Swf_Tag) Read(io *kaitai.Stream, parent *Swf_SwfBody, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26 := NewSwf_RecordHeader()
	err = tmp26.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.RecordHeader = tmp26
	tmp27, err := this.RecordHeader.TagType()
	if err != nil {
		return err
	}
	switch (tmp27) {
	case Swf_TagType__DefineSound:
		tmp28, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp29, err := this._io.ReadBytes(int(tmp28))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this._raw_TagBody = tmp29
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp30 := NewSwf_DefineSoundBody()
		err = tmp30.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp30
	case Swf_TagType__SetBackgroundColor:
		tmp31, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp32, err := this._io.ReadBytes(int(tmp31))
		if err != nil {
			return err
		}
		tmp32 = tmp32
		this._raw_TagBody = tmp32
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp33 := NewSwf_Rgb()
		err = tmp33.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp33
	case Swf_TagType__ScriptLimits:
		tmp34, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp35, err := this._io.ReadBytes(int(tmp34))
		if err != nil {
			return err
		}
		tmp35 = tmp35
		this._raw_TagBody = tmp35
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp36 := NewSwf_ScriptLimitsBody()
		err = tmp36.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp36
	case Swf_TagType__DoAbc:
		tmp37, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp38, err := this._io.ReadBytes(int(tmp37))
		if err != nil {
			return err
		}
		tmp38 = tmp38
		this._raw_TagBody = tmp38
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp39 := NewSwf_DoAbcBody()
		err = tmp39.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp39
	case Swf_TagType__ExportAssets:
		tmp40, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp41, err := this._io.ReadBytes(int(tmp40))
		if err != nil {
			return err
		}
		tmp41 = tmp41
		this._raw_TagBody = tmp41
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp42 := NewSwf_SymbolClassBody()
		err = tmp42.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp42
	case Swf_TagType__SymbolClass:
		tmp43, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp44, err := this._io.ReadBytes(int(tmp43))
		if err != nil {
			return err
		}
		tmp44 = tmp44
		this._raw_TagBody = tmp44
		_io__raw_TagBody := kaitai.NewStream(bytes.NewReader(this._raw_TagBody))
		tmp45 := NewSwf_SymbolClassBody()
		err = tmp45.Read(_io__raw_TagBody, this, this._root)
		if err != nil {
			return err
		}
		this.TagBody = tmp45
	default:
		tmp46, err := this.RecordHeader.Len()
		if err != nil {
			return err
		}
		tmp47, err := this._io.ReadBytes(int(tmp46))
		if err != nil {
			return err
		}
		tmp47 = tmp47
		this._raw_TagBody = tmp47
	}
	return err
}
type Swf_SymbolClassBody struct {
	NumSymbols uint16
	Symbols []*Swf_SymbolClassBody_Symbol
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
}
func NewSwf_SymbolClassBody() *Swf_SymbolClassBody {
	return &Swf_SymbolClassBody{
	}
}

func (this *Swf_SymbolClassBody) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumSymbols = uint16(tmp48)
	this.Symbols = make([]*Swf_SymbolClassBody_Symbol, this.NumSymbols)
	for i := range this.Symbols {
		tmp49 := NewSwf_SymbolClassBody_Symbol()
		err = tmp49.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Symbols[i] = tmp49
	}
	return err
}
type Swf_SymbolClassBody_Symbol struct {
	Tag uint16
	Name string
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_SymbolClassBody
}
func NewSwf_SymbolClassBody_Symbol() *Swf_SymbolClassBody_Symbol {
	return &Swf_SymbolClassBody_Symbol{
	}
}

func (this *Swf_SymbolClassBody_Symbol) Read(io *kaitai.Stream, parent *Swf_SymbolClassBody, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Tag = uint16(tmp50)
	tmp51, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Name = string(tmp51)
	return err
}

type Swf_DefineSoundBody_SamplingRates int
const (
	Swf_DefineSoundBody_SamplingRates__Rate55Khz Swf_DefineSoundBody_SamplingRates = 0
	Swf_DefineSoundBody_SamplingRates__Rate11Khz Swf_DefineSoundBody_SamplingRates = 1
	Swf_DefineSoundBody_SamplingRates__Rate22Khz Swf_DefineSoundBody_SamplingRates = 2
	Swf_DefineSoundBody_SamplingRates__Rate44Khz Swf_DefineSoundBody_SamplingRates = 3
)

type Swf_DefineSoundBody_Bps int
const (
	Swf_DefineSoundBody_Bps__Sound8Bit Swf_DefineSoundBody_Bps = 0
	Swf_DefineSoundBody_Bps__Sound16Bit Swf_DefineSoundBody_Bps = 1
)

type Swf_DefineSoundBody_Channels int
const (
	Swf_DefineSoundBody_Channels__Mono Swf_DefineSoundBody_Channels = 0
	Swf_DefineSoundBody_Channels__Stereo Swf_DefineSoundBody_Channels = 1
)
type Swf_DefineSoundBody struct {
	Id uint16
	Format uint64
	SamplingRate Swf_DefineSoundBody_SamplingRates
	BitsPerSample Swf_DefineSoundBody_Bps
	NumChannels Swf_DefineSoundBody_Channels
	NumSamples uint32
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
}
func NewSwf_DefineSoundBody() *Swf_DefineSoundBody {
	return &Swf_DefineSoundBody{
	}
}

func (this *Swf_DefineSoundBody) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp52)
	tmp53, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Format = tmp53
	tmp54, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.SamplingRate = Swf_DefineSoundBody_SamplingRates(tmp54)
	tmp55, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BitsPerSample = Swf_DefineSoundBody_Bps(tmp55)
	tmp56, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NumChannels = Swf_DefineSoundBody_Channels(tmp56)
	this._io.AlignToByte()
	tmp57, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumSamples = uint32(tmp57)
	return err
}

/**
 * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
 */
type Swf_RecordHeader struct {
	TagCodeAndLength uint16
	BigLen int32
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
	_f_tagType bool
	tagType Swf_TagType
	_f_smallLen bool
	smallLen int
	_f_len bool
	len int
}
func NewSwf_RecordHeader() *Swf_RecordHeader {
	return &Swf_RecordHeader{
	}
}

func (this *Swf_RecordHeader) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.TagCodeAndLength = uint16(tmp58)
	tmp59, err := this.SmallLen()
	if err != nil {
		return err
	}
	if (tmp59 == 63) {
		tmp60, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.BigLen = int32(tmp60)
	}
	return err
}
func (this *Swf_RecordHeader) TagType() (v Swf_TagType, err error) {
	if (this._f_tagType) {
		return this.tagType, nil
	}
	this.tagType = Swf_TagType(Swf_TagType((this.TagCodeAndLength >> 6)))
	this._f_tagType = true
	return this.tagType, nil
}
func (this *Swf_RecordHeader) SmallLen() (v int, err error) {
	if (this._f_smallLen) {
		return this.smallLen, nil
	}
	this.smallLen = int((this.TagCodeAndLength & 63))
	this._f_smallLen = true
	return this.smallLen, nil
}
func (this *Swf_RecordHeader) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	var tmp61 int32;
	tmp62, err := this.SmallLen()
	if err != nil {
		return 0, err
	}
	if (tmp62 == 63) {
		tmp61 = this.BigLen
	} else {
		tmp63, err := this.SmallLen()
		if err != nil {
			return 0, err
		}
		tmp61 = tmp63
	}
	this.len = int(tmp61)
	this._f_len = true
	return this.len, nil
}
type Swf_ScriptLimitsBody struct {
	MaxRecursionDepth uint16
	ScriptTimeoutSeconds uint16
	_io *kaitai.Stream
	_root *Swf
	_parent *Swf_Tag
}
func NewSwf_ScriptLimitsBody() *Swf_ScriptLimitsBody {
	return &Swf_ScriptLimitsBody{
	}
}

func (this *Swf_ScriptLimitsBody) Read(io *kaitai.Stream, parent *Swf_Tag, root *Swf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp64, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxRecursionDepth = uint16(tmp64)
	tmp65, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ScriptTimeoutSeconds = uint16(tmp65)
	return err
}
