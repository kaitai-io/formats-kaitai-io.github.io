// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 * @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html">Source</a>
 * @see <a href="http://soundfile.sapp.org/doc/NextFormat/">Source</a>
 * @see <a href="http://soundfile.sapp.org/doc/NextFormat/soundstruct.h">Source</a>
 * @see <a href="https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112">Source</a>
 * @see <a href="https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74">Source</a>
 * @see <a href="https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49">Source</a>
 * @see <a href="https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96">Source</a>
 */

type Au_Encodings int
const (
	Au_Encodings__Mulaw8 Au_Encodings = 1
	Au_Encodings__Linear8 Au_Encodings = 2
	Au_Encodings__Linear16 Au_Encodings = 3
	Au_Encodings__Linear24 Au_Encodings = 4
	Au_Encodings__Linear32 Au_Encodings = 5
	Au_Encodings__Float Au_Encodings = 6
	Au_Encodings__Double Au_Encodings = 7
	Au_Encodings__Fragmented Au_Encodings = 8
	Au_Encodings__Nested Au_Encodings = 9
	Au_Encodings__DspCore Au_Encodings = 10
	Au_Encodings__FixedPoint8 Au_Encodings = 11
	Au_Encodings__FixedPoint16 Au_Encodings = 12
	Au_Encodings__FixedPoint24 Au_Encodings = 13
	Au_Encodings__FixedPoint32 Au_Encodings = 14
	Au_Encodings__Display Au_Encodings = 16
	Au_Encodings__MulawSquelch Au_Encodings = 17
	Au_Encodings__Emphasized Au_Encodings = 18
	Au_Encodings__Compressed Au_Encodings = 19
	Au_Encodings__CompressedEmphasized Au_Encodings = 20
	Au_Encodings__DspCommands Au_Encodings = 21
	Au_Encodings__DspCommandsSamples Au_Encodings = 22
	Au_Encodings__AdpcmG721 Au_Encodings = 23
	Au_Encodings__AdpcmG722 Au_Encodings = 24
	Au_Encodings__AdpcmG7233 Au_Encodings = 25
	Au_Encodings__AdpcmG7235 Au_Encodings = 26
	Au_Encodings__Alaw8 Au_Encodings = 27
	Au_Encodings__Aes Au_Encodings = 28
	Au_Encodings__DeltaMulaw8 Au_Encodings = 29
)
type Au struct {
	Magic []byte
	OfsData uint32
	Header *Au_Header
	_io *kaitai.Stream
	_root *Au
	_parent interface{}
	_raw_Header []byte
	_f_lenData bool
	lenData int
}
func NewAu() *Au {
	return &Au{
	}
}

func (this *Au) Read(io *kaitai.Stream, parent interface{}, root *Au) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{46, 115, 110, 100})) {
		return kaitai.NewValidationNotEqualError([]uint8{46, 115, 110, 100}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsData = uint32(tmp2)
	tmp3, err := this._io.ReadBytes(int(((this.OfsData - 4) - 4)))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this._raw_Header = tmp3
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp4 := NewAu_Header()
	err = tmp4.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp4
	return err
}
func (this *Au) LenData() (v int, err error) {
	if (this._f_lenData) {
		return this.lenData, nil
	}
	var tmp5 int;
	if (this.Header.DataSize == uint32(4294967295)) {
		tmp6, err := this._io.Size()
		if err != nil {
			return 0, err
		}
		tmp5 = (tmp6 - this.OfsData)
	} else {
		tmp5 = this.Header.DataSize
	}
	this.lenData = int(tmp5)
	this._f_lenData = true
	return this.lenData, nil
}
type Au_Header struct {
	DataSize uint32
	Encoding Au_Encodings
	SampleRate uint32
	NumChannels uint32
	Comment string
	_io *kaitai.Stream
	_root *Au
	_parent *Au
}
func NewAu_Header() *Au_Header {
	return &Au_Header{
	}
}

func (this *Au_Header) Read(io *kaitai.Stream, parent *Au, root *Au) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Encoding = Au_Encodings(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SampleRate = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumChannels = uint32(tmp10)
	if !(this.NumChannels >= 1) {
		return kaitai.NewValidationLessThanError(1, this.NumChannels, this._io, "/types/header/seq/3")
	}
	tmp11, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp11 = kaitai.BytesTerminate(tmp11, 0, false)
	this.Comment = string(tmp11)
	return err
}

/**
 * don't read this field, access `_root.len_data` instead
 * 
 * value `0xffff_ffff` means unspecified size
 */

/**
 * number of interleaved channels
 */

/**
 * Most resources claim that this field must be at least 4 bytes long.
 * However, most programs don't enforce it, and [Audacity](
 * https://www.audacityteam.org/) even generates .au files with this field
 * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
 * "NeXT files require that this chunk be at least 4 bytes (chars) long,
 * whereas this chunk may be zerolength in a Sun .au file."
 * 
 * By convention, size should be a multiple of 4 -
 * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
 * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
 * sound playing programs, this field must have an even byte size. So a multiple
 * of 4 is probably best for compatibility.
 * 
 * Must be null-terminated. It is usually an ASCII text string, but this space
 * might be also used to store application-specific binary (i.e. non-ASCII) data.
 */