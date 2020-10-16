// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
 * tag is appended to the end of file and spans exactly 128 bytes.
 * 
 * This type is supposed to be used on full .mp3 files, seeking to
 * proper position automatically. If you're interesting in parsing only
 * the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
 * @see <a href="http://id3.org/ID3v1">Source</a>
 */
type Id3v11 struct {
	_io *kaitai.Stream
	_root *Id3v11
	_parent interface{}
	_f_id3v1Tag bool
	id3v1Tag *Id3v11_Id3V11Tag
}
func NewId3v11() *Id3v11 {
	return &Id3v11{
	}
}

func (this *Id3v11) Read(io *kaitai.Stream, parent interface{}, root *Id3v11) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Id3v11) Id3v1Tag() (v *Id3v11_Id3V11Tag, err error) {
	if (this._f_id3v1Tag) {
		return this.id3v1Tag, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp1, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp1 - 128)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2 := NewId3v11_Id3V11Tag()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.id3v1Tag = tmp2
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_id3v1Tag = true
	this._f_id3v1Tag = true
	return this.id3v1Tag, nil
}

/**
 * ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
 * several metadata fields as fixed-size strings.
 * 
 * Note that string encoding is not specified by standard, so real
 * encoding used would vary a lot from one implementation to
 * another. Most Windows-based applications tend to use "ANSI"
 * (i.e. locale-dependent encoding, usually one byte per
 * character). Some embedded applications allow selection of
 * charset.
 */

type Id3v11_Id3V11Tag_GenreEnum int
const (
	Id3v11_Id3V11Tag_GenreEnum__Blues Id3v11_Id3V11Tag_GenreEnum = 0
	Id3v11_Id3V11Tag_GenreEnum__ClassicRock Id3v11_Id3V11Tag_GenreEnum = 1
	Id3v11_Id3V11Tag_GenreEnum__Country Id3v11_Id3V11Tag_GenreEnum = 2
	Id3v11_Id3V11Tag_GenreEnum__Dance Id3v11_Id3V11Tag_GenreEnum = 3
	Id3v11_Id3V11Tag_GenreEnum__Disco Id3v11_Id3V11Tag_GenreEnum = 4
	Id3v11_Id3V11Tag_GenreEnum__Funk Id3v11_Id3V11Tag_GenreEnum = 5
	Id3v11_Id3V11Tag_GenreEnum__Grunge Id3v11_Id3V11Tag_GenreEnum = 6
	Id3v11_Id3V11Tag_GenreEnum__HipHop Id3v11_Id3V11Tag_GenreEnum = 7
	Id3v11_Id3V11Tag_GenreEnum__Jazz Id3v11_Id3V11Tag_GenreEnum = 8
	Id3v11_Id3V11Tag_GenreEnum__Metal Id3v11_Id3V11Tag_GenreEnum = 9
	Id3v11_Id3V11Tag_GenreEnum__NewAge Id3v11_Id3V11Tag_GenreEnum = 10
	Id3v11_Id3V11Tag_GenreEnum__Oldies Id3v11_Id3V11Tag_GenreEnum = 11
	Id3v11_Id3V11Tag_GenreEnum__Other Id3v11_Id3V11Tag_GenreEnum = 12
	Id3v11_Id3V11Tag_GenreEnum__Pop Id3v11_Id3V11Tag_GenreEnum = 13
	Id3v11_Id3V11Tag_GenreEnum__Rnb Id3v11_Id3V11Tag_GenreEnum = 14
	Id3v11_Id3V11Tag_GenreEnum__Rap Id3v11_Id3V11Tag_GenreEnum = 15
	Id3v11_Id3V11Tag_GenreEnum__Reggae Id3v11_Id3V11Tag_GenreEnum = 16
	Id3v11_Id3V11Tag_GenreEnum__Rock Id3v11_Id3V11Tag_GenreEnum = 17
	Id3v11_Id3V11Tag_GenreEnum__Techno Id3v11_Id3V11Tag_GenreEnum = 18
	Id3v11_Id3V11Tag_GenreEnum__Industrial Id3v11_Id3V11Tag_GenreEnum = 19
	Id3v11_Id3V11Tag_GenreEnum__Alternative Id3v11_Id3V11Tag_GenreEnum = 20
	Id3v11_Id3V11Tag_GenreEnum__Ska Id3v11_Id3V11Tag_GenreEnum = 21
	Id3v11_Id3V11Tag_GenreEnum__DeathMetal Id3v11_Id3V11Tag_GenreEnum = 22
	Id3v11_Id3V11Tag_GenreEnum__Pranks Id3v11_Id3V11Tag_GenreEnum = 23
	Id3v11_Id3V11Tag_GenreEnum__Soundtrack Id3v11_Id3V11Tag_GenreEnum = 24
	Id3v11_Id3V11Tag_GenreEnum__EuroTechno Id3v11_Id3V11Tag_GenreEnum = 25
	Id3v11_Id3V11Tag_GenreEnum__Ambient Id3v11_Id3V11Tag_GenreEnum = 26
	Id3v11_Id3V11Tag_GenreEnum__TripHop Id3v11_Id3V11Tag_GenreEnum = 27
	Id3v11_Id3V11Tag_GenreEnum__Vocal Id3v11_Id3V11Tag_GenreEnum = 28
	Id3v11_Id3V11Tag_GenreEnum__JazzFunk Id3v11_Id3V11Tag_GenreEnum = 29
	Id3v11_Id3V11Tag_GenreEnum__Fusion Id3v11_Id3V11Tag_GenreEnum = 30
	Id3v11_Id3V11Tag_GenreEnum__Trance Id3v11_Id3V11Tag_GenreEnum = 31
	Id3v11_Id3V11Tag_GenreEnum__Classical Id3v11_Id3V11Tag_GenreEnum = 32
	Id3v11_Id3V11Tag_GenreEnum__Instrumental Id3v11_Id3V11Tag_GenreEnum = 33
	Id3v11_Id3V11Tag_GenreEnum__Acid Id3v11_Id3V11Tag_GenreEnum = 34
	Id3v11_Id3V11Tag_GenreEnum__House Id3v11_Id3V11Tag_GenreEnum = 35
	Id3v11_Id3V11Tag_GenreEnum__Game Id3v11_Id3V11Tag_GenreEnum = 36
	Id3v11_Id3V11Tag_GenreEnum__SoundClip Id3v11_Id3V11Tag_GenreEnum = 37
	Id3v11_Id3V11Tag_GenreEnum__Gospel Id3v11_Id3V11Tag_GenreEnum = 38
	Id3v11_Id3V11Tag_GenreEnum__Noise Id3v11_Id3V11Tag_GenreEnum = 39
	Id3v11_Id3V11Tag_GenreEnum__Alternrock Id3v11_Id3V11Tag_GenreEnum = 40
	Id3v11_Id3V11Tag_GenreEnum__Bass Id3v11_Id3V11Tag_GenreEnum = 41
	Id3v11_Id3V11Tag_GenreEnum__Soul Id3v11_Id3V11Tag_GenreEnum = 42
	Id3v11_Id3V11Tag_GenreEnum__Punk Id3v11_Id3V11Tag_GenreEnum = 43
	Id3v11_Id3V11Tag_GenreEnum__Space Id3v11_Id3V11Tag_GenreEnum = 44
	Id3v11_Id3V11Tag_GenreEnum__Meditative Id3v11_Id3V11Tag_GenreEnum = 45
	Id3v11_Id3V11Tag_GenreEnum__InstrumentalPop Id3v11_Id3V11Tag_GenreEnum = 46
	Id3v11_Id3V11Tag_GenreEnum__InstrumentalRock Id3v11_Id3V11Tag_GenreEnum = 47
	Id3v11_Id3V11Tag_GenreEnum__Ethnic Id3v11_Id3V11Tag_GenreEnum = 48
	Id3v11_Id3V11Tag_GenreEnum__Gothic Id3v11_Id3V11Tag_GenreEnum = 49
	Id3v11_Id3V11Tag_GenreEnum__Darkwave Id3v11_Id3V11Tag_GenreEnum = 50
	Id3v11_Id3V11Tag_GenreEnum__TechnoIndustrial Id3v11_Id3V11Tag_GenreEnum = 51
	Id3v11_Id3V11Tag_GenreEnum__Electronic Id3v11_Id3V11Tag_GenreEnum = 52
	Id3v11_Id3V11Tag_GenreEnum__PopFolk Id3v11_Id3V11Tag_GenreEnum = 53
	Id3v11_Id3V11Tag_GenreEnum__Eurodance Id3v11_Id3V11Tag_GenreEnum = 54
	Id3v11_Id3V11Tag_GenreEnum__Dream Id3v11_Id3V11Tag_GenreEnum = 55
	Id3v11_Id3V11Tag_GenreEnum__SouthernRock Id3v11_Id3V11Tag_GenreEnum = 56
	Id3v11_Id3V11Tag_GenreEnum__Comedy Id3v11_Id3V11Tag_GenreEnum = 57
	Id3v11_Id3V11Tag_GenreEnum__Cult Id3v11_Id3V11Tag_GenreEnum = 58
	Id3v11_Id3V11Tag_GenreEnum__Gangsta Id3v11_Id3V11Tag_GenreEnum = 59
	Id3v11_Id3V11Tag_GenreEnum__Top40 Id3v11_Id3V11Tag_GenreEnum = 60
	Id3v11_Id3V11Tag_GenreEnum__ChristianRap Id3v11_Id3V11Tag_GenreEnum = 61
	Id3v11_Id3V11Tag_GenreEnum__PopFunk Id3v11_Id3V11Tag_GenreEnum = 62
	Id3v11_Id3V11Tag_GenreEnum__Jungle Id3v11_Id3V11Tag_GenreEnum = 63
	Id3v11_Id3V11Tag_GenreEnum__NativeAmerican Id3v11_Id3V11Tag_GenreEnum = 64
	Id3v11_Id3V11Tag_GenreEnum__Cabaret Id3v11_Id3V11Tag_GenreEnum = 65
	Id3v11_Id3V11Tag_GenreEnum__NewWave Id3v11_Id3V11Tag_GenreEnum = 66
	Id3v11_Id3V11Tag_GenreEnum__Psychadelic Id3v11_Id3V11Tag_GenreEnum = 67
	Id3v11_Id3V11Tag_GenreEnum__Rave Id3v11_Id3V11Tag_GenreEnum = 68
	Id3v11_Id3V11Tag_GenreEnum__Showtunes Id3v11_Id3V11Tag_GenreEnum = 69
	Id3v11_Id3V11Tag_GenreEnum__Trailer Id3v11_Id3V11Tag_GenreEnum = 70
	Id3v11_Id3V11Tag_GenreEnum__LoFi Id3v11_Id3V11Tag_GenreEnum = 71
	Id3v11_Id3V11Tag_GenreEnum__Tribal Id3v11_Id3V11Tag_GenreEnum = 72
	Id3v11_Id3V11Tag_GenreEnum__AcidPunk Id3v11_Id3V11Tag_GenreEnum = 73
	Id3v11_Id3V11Tag_GenreEnum__AcidJazz Id3v11_Id3V11Tag_GenreEnum = 74
	Id3v11_Id3V11Tag_GenreEnum__Polka Id3v11_Id3V11Tag_GenreEnum = 75
	Id3v11_Id3V11Tag_GenreEnum__Retro Id3v11_Id3V11Tag_GenreEnum = 76
	Id3v11_Id3V11Tag_GenreEnum__Musical Id3v11_Id3V11Tag_GenreEnum = 77
	Id3v11_Id3V11Tag_GenreEnum__RockNRoll Id3v11_Id3V11Tag_GenreEnum = 78
	Id3v11_Id3V11Tag_GenreEnum__HardRock Id3v11_Id3V11Tag_GenreEnum = 79
	Id3v11_Id3V11Tag_GenreEnum__Folk Id3v11_Id3V11Tag_GenreEnum = 80
	Id3v11_Id3V11Tag_GenreEnum__FolkRock Id3v11_Id3V11Tag_GenreEnum = 81
	Id3v11_Id3V11Tag_GenreEnum__NationalFolk Id3v11_Id3V11Tag_GenreEnum = 82
	Id3v11_Id3V11Tag_GenreEnum__Swing Id3v11_Id3V11Tag_GenreEnum = 83
	Id3v11_Id3V11Tag_GenreEnum__FastFusion Id3v11_Id3V11Tag_GenreEnum = 84
	Id3v11_Id3V11Tag_GenreEnum__Bebob Id3v11_Id3V11Tag_GenreEnum = 85
	Id3v11_Id3V11Tag_GenreEnum__Latin Id3v11_Id3V11Tag_GenreEnum = 86
	Id3v11_Id3V11Tag_GenreEnum__Revival Id3v11_Id3V11Tag_GenreEnum = 87
	Id3v11_Id3V11Tag_GenreEnum__Celtic Id3v11_Id3V11Tag_GenreEnum = 88
	Id3v11_Id3V11Tag_GenreEnum__Bluegrass Id3v11_Id3V11Tag_GenreEnum = 89
	Id3v11_Id3V11Tag_GenreEnum__Avantgarde Id3v11_Id3V11Tag_GenreEnum = 90
	Id3v11_Id3V11Tag_GenreEnum__GothicRock Id3v11_Id3V11Tag_GenreEnum = 91
	Id3v11_Id3V11Tag_GenreEnum__ProgressiveRock Id3v11_Id3V11Tag_GenreEnum = 92
	Id3v11_Id3V11Tag_GenreEnum__PsychedelicRock Id3v11_Id3V11Tag_GenreEnum = 93
	Id3v11_Id3V11Tag_GenreEnum__SymphonicRock Id3v11_Id3V11Tag_GenreEnum = 94
	Id3v11_Id3V11Tag_GenreEnum__SlowRock Id3v11_Id3V11Tag_GenreEnum = 95
	Id3v11_Id3V11Tag_GenreEnum__BigBand Id3v11_Id3V11Tag_GenreEnum = 96
	Id3v11_Id3V11Tag_GenreEnum__Chorus Id3v11_Id3V11Tag_GenreEnum = 97
	Id3v11_Id3V11Tag_GenreEnum__EasyListening Id3v11_Id3V11Tag_GenreEnum = 98
	Id3v11_Id3V11Tag_GenreEnum__Acoustic Id3v11_Id3V11Tag_GenreEnum = 99
	Id3v11_Id3V11Tag_GenreEnum__Humour Id3v11_Id3V11Tag_GenreEnum = 100
	Id3v11_Id3V11Tag_GenreEnum__Speech Id3v11_Id3V11Tag_GenreEnum = 101
	Id3v11_Id3V11Tag_GenreEnum__Chanson Id3v11_Id3V11Tag_GenreEnum = 102
	Id3v11_Id3V11Tag_GenreEnum__Opera Id3v11_Id3V11Tag_GenreEnum = 103
	Id3v11_Id3V11Tag_GenreEnum__ChamberMusic Id3v11_Id3V11Tag_GenreEnum = 104
	Id3v11_Id3V11Tag_GenreEnum__Sonata Id3v11_Id3V11Tag_GenreEnum = 105
	Id3v11_Id3V11Tag_GenreEnum__Symphony Id3v11_Id3V11Tag_GenreEnum = 106
	Id3v11_Id3V11Tag_GenreEnum__BootyBass Id3v11_Id3V11Tag_GenreEnum = 107
	Id3v11_Id3V11Tag_GenreEnum__Primus Id3v11_Id3V11Tag_GenreEnum = 108
	Id3v11_Id3V11Tag_GenreEnum__PornGroove Id3v11_Id3V11Tag_GenreEnum = 109
	Id3v11_Id3V11Tag_GenreEnum__Satire Id3v11_Id3V11Tag_GenreEnum = 110
	Id3v11_Id3V11Tag_GenreEnum__SlowJam Id3v11_Id3V11Tag_GenreEnum = 111
	Id3v11_Id3V11Tag_GenreEnum__Club Id3v11_Id3V11Tag_GenreEnum = 112
	Id3v11_Id3V11Tag_GenreEnum__Tango Id3v11_Id3V11Tag_GenreEnum = 113
	Id3v11_Id3V11Tag_GenreEnum__Samba Id3v11_Id3V11Tag_GenreEnum = 114
	Id3v11_Id3V11Tag_GenreEnum__Folklore Id3v11_Id3V11Tag_GenreEnum = 115
	Id3v11_Id3V11Tag_GenreEnum__Ballad Id3v11_Id3V11Tag_GenreEnum = 116
	Id3v11_Id3V11Tag_GenreEnum__PowerBallad Id3v11_Id3V11Tag_GenreEnum = 117
	Id3v11_Id3V11Tag_GenreEnum__RhythmicSoul Id3v11_Id3V11Tag_GenreEnum = 118
	Id3v11_Id3V11Tag_GenreEnum__Freestyle Id3v11_Id3V11Tag_GenreEnum = 119
	Id3v11_Id3V11Tag_GenreEnum__Duet Id3v11_Id3V11Tag_GenreEnum = 120
	Id3v11_Id3V11Tag_GenreEnum__PunkRock Id3v11_Id3V11Tag_GenreEnum = 121
	Id3v11_Id3V11Tag_GenreEnum__DrumSolo Id3v11_Id3V11Tag_GenreEnum = 122
	Id3v11_Id3V11Tag_GenreEnum__ACapella Id3v11_Id3V11Tag_GenreEnum = 123
	Id3v11_Id3V11Tag_GenreEnum__EuroHouse Id3v11_Id3V11Tag_GenreEnum = 124
	Id3v11_Id3V11Tag_GenreEnum__DanceHall Id3v11_Id3V11Tag_GenreEnum = 125
)
type Id3v11_Id3V11Tag struct {
	Magic []byte
	Title []byte
	Artist []byte
	Album []byte
	Year string
	Comment []byte
	Genre Id3v11_Id3V11Tag_GenreEnum
	_io *kaitai.Stream
	_root *Id3v11
	_parent *Id3v11
}
func NewId3v11_Id3V11Tag() *Id3v11_Id3V11Tag {
	return &Id3v11_Id3V11Tag{
	}
}

func (this *Id3v11_Id3V11Tag) Read(io *kaitai.Stream, parent *Id3v11, root *Id3v11) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{84, 65, 71})) {
		return kaitai.NewValidationNotEqualError([]uint8{84, 65, 71}, this.Magic, this._io, "/types/id3_v1_1_tag/seq/0")
	}
	tmp4, err := this._io.ReadBytes(int(30))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Title = tmp4
	tmp5, err := this._io.ReadBytes(int(30))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Artist = tmp5
	tmp6, err := this._io.ReadBytes(int(30))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Album = tmp6
	tmp7, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Year = string(tmp7)
	tmp8, err := this._io.ReadBytes(int(30))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Comment = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Genre = Id3v11_Id3V11Tag_GenreEnum(tmp9)
	return err
}

/**
 * Song title
 */

/**
 * Artist name
 */

/**
 * Album title
 */

/**
 * Year of release
 */

/**
 * Arbitary comment
 */
