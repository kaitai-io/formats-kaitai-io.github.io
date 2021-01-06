// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */
type Ogg struct {
	Pages []*Ogg_Page
	_io *kaitai.Stream
	_root *Ogg
	_parent interface{}
}
func NewOgg() *Ogg {
	return &Ogg{
	}
}

func (this *Ogg) Read(io *kaitai.Stream, parent interface{}, root *Ogg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewOgg_Page()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Pages = append(this.Pages, tmp2)
	}
	return err
}

/**
 * Ogg page is a basic unit of data in an Ogg bitstream, usually
 * it's around 4-8 KB, with a maximum size of 65307 bytes.
 */
type Ogg_Page struct {
	SyncCode []byte
	Version []byte
	Reserved1 uint64
	IsEndOfStream bool
	IsBeginningOfStream bool
	IsContinuation bool
	GranulePos uint64
	BitstreamSerial uint32
	PageSeqNum uint32
	Crc32 uint32
	NumSegments uint8
	LenSegments []uint8
	Segments [][]byte
	_io *kaitai.Stream
	_root *Ogg
	_parent *Ogg
}
func NewOgg_Page() *Ogg_Page {
	return &Ogg_Page{
	}
}

func (this *Ogg_Page) Read(io *kaitai.Stream, parent *Ogg, root *Ogg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.SyncCode = tmp3
	if !(bytes.Equal(this.SyncCode, []uint8{79, 103, 103, 83})) {
		return kaitai.NewValidationNotEqualError([]uint8{79, 103, 103, 83}, this.SyncCode, this._io, "/types/page/seq/0")
	}
	tmp4, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Version = tmp4
	if !(bytes.Equal(this.Version, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Version, this._io, "/types/page/seq/1")
	}
	tmp5, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp5
	tmp6, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsEndOfStream = tmp6 != 0
	tmp7, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsBeginningOfStream = tmp7 != 0
	tmp8, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsContinuation = tmp8 != 0
	this._io.AlignToByte()
	tmp9, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.GranulePos = uint64(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BitstreamSerial = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PageSeqNum = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp12)
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumSegments = tmp13
	this.LenSegments = make([]uint8, this.NumSegments)
	for i := range this.LenSegments {
		tmp14, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.LenSegments[i] = tmp14
	}
	this.Segments = make([][]byte, this.NumSegments)
	for i := range this.Segments {
		tmp15, err := this._io.ReadBytes(int(this.LenSegments[i]))
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this.Segments[i] = tmp15
	}
	return err
}

/**
 * Version of the Ogg bitstream format. Currently must be 0.
 */

/**
 * EOS (End Of Stream) mark. This page is the last page in the
 * logical bitstream. The EOS flag must be set on the final page of
 * every logical bitstream, and must not be set on any other page.
 */

/**
 * BOS (Beginning Of Stream) mark. This page is the first page in
 * the logical bitstream. The BOS flag must be set on the first
 * page of every logical bitstream, and must not be set on any
 * other page.
 */

/**
 * The first packet on this page is a continuation of the previous
 * packet in the logical bitstream.
 */

/**
 * "Granule position" is the time marker in Ogg files. It is an
 * abstract value, whose meaning is determined by the codec. It
 * may, for example, be a count of the number of samples, the
 * number of frames or a more complex scheme.
 */

/**
 * Serial number that identifies a page as belonging to a
 * particular logical bitstream. Each logical bitstream in a file
 * has a unique value, and this field allows implementations to
 * deliver the pages to the appropriate decoder. In a typical
 * Vorbis and Theora file, one stream is the audio (Vorbis), and
 * the other is the video (Theora).
 */

/**
 * Sequential number of page, guaranteed to be monotonically
 * increasing for each logical bitstream. The first page is 0, the
 * second 1, etc. This allows implementations to detect when data
 * has been lost.
 */

/**
 * This field provides a CRC32 checksum of the data in the entire
 * page (including the page header, calculated with the checksum
 * field set to 0). This allows verification that the data has not
 * been corrupted since it was created. Pages that fail the
 * checksum should be discarded. The checksum is generated using a
 * polynomial value of 0x04C11DB7.
 */

/**
 * The number of segments that exist in this page. There can be a
 * maximum of 255 segments in any one page.
 */

/**
 * Table of lengths of segments.
 */

/**
 * Segment content bytes make up the rest of the Ogg page.
 */
