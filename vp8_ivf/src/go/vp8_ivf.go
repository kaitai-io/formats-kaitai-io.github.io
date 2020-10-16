// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * IVF is a simple container format for raw VP8 data, which is an open
 * and royalty-free video compression format, currently developed by
 * Google.
 * 
 * Test .ivf files are available at https://chromium.googlesource.com/webm/vp8-test-vectors
 * @see <a href="https://wiki.multimedia.cx/index.php/IVF">Source</a>
 */
type Vp8Ivf struct {
	Magic1 []byte
	Version uint16
	LenHeader uint16
	Codec []byte
	Width uint16
	Height uint16
	Framerate uint32
	Timescale uint32
	NumFrames uint32
	Unused uint32
	ImageData []*Vp8Ivf_Blocks
	_io *kaitai.Stream
	_root *Vp8Ivf
	_parent interface{}
}
func NewVp8Ivf() *Vp8Ivf {
	return &Vp8Ivf{
	}
}

func (this *Vp8Ivf) Read(io *kaitai.Stream, parent interface{}, root *Vp8Ivf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic1 = tmp1
	if !(bytes.Equal(this.Magic1, []uint8{68, 75, 73, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{68, 75, 73, 70}, this.Magic1, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenHeader = uint16(tmp3)
	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Codec = tmp4
	if !(bytes.Equal(this.Codec, []uint8{86, 80, 56, 48})) {
		return kaitai.NewValidationNotEqualError([]uint8{86, 80, 56, 48}, this.Codec, this._io, "/seq/3")
	}
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp5)
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Framerate = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timescale = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumFrames = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unused = uint32(tmp10)
	this.ImageData = make([]*Vp8Ivf_Blocks, this.NumFrames)
	for i := range this.ImageData {
		tmp11 := NewVp8Ivf_Blocks()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ImageData[i] = tmp11
	}
	return err
}

/**
 * Magic Number of IVF Files
 */

/**
 * This should be 0
 */

/**
 * Normally the header length is 32 byte
 */

/**
 * Name of the codec e.g. 'VP80' for VP8
 */

/**
 * The (initial) width of the video, every keyframe may change the resolution
 */

/**
 * The (initial) height of the video, every keyframe may change the resolution
 */

/**
 * the (framerate * timescale) e.g. for 30 fps -> 30000
 */

/**
 * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
 */

/**
 * the number of frames (if not a camera stream)
 */
type Vp8Ivf_Blocks struct {
	Entries *Vp8Ivf_Block
	_io *kaitai.Stream
	_root *Vp8Ivf
	_parent *Vp8Ivf
}
func NewVp8Ivf_Blocks() *Vp8Ivf_Blocks {
	return &Vp8Ivf_Blocks{
	}
}

func (this *Vp8Ivf_Blocks) Read(io *kaitai.Stream, parent *Vp8Ivf, root *Vp8Ivf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12 := NewVp8Ivf_Block()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Entries = tmp12
	return err
}
type Vp8Ivf_Block struct {
	LenFrame uint32
	Timestamp uint64
	Framedata []byte
	_io *kaitai.Stream
	_root *Vp8Ivf
	_parent *Vp8Ivf_Blocks
}
func NewVp8Ivf_Block() *Vp8Ivf_Block {
	return &Vp8Ivf_Block{
	}
}

func (this *Vp8Ivf_Block) Read(io *kaitai.Stream, parent *Vp8Ivf_Blocks, root *Vp8Ivf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFrame = uint32(tmp13)
	tmp14, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Timestamp = uint64(tmp14)
	tmp15, err := this._io.ReadBytes(int(this.LenFrame))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Framedata = tmp15
	return err
}

/**
 * size of the frame data
 */
