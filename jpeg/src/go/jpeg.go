// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type Jpeg_ComponentId int
const (
	Jpeg_ComponentId__Y Jpeg_ComponentId = 1
	Jpeg_ComponentId__Cb Jpeg_ComponentId = 2
	Jpeg_ComponentId__Cr Jpeg_ComponentId = 3
	Jpeg_ComponentId__I Jpeg_ComponentId = 4
	Jpeg_ComponentId__Q Jpeg_ComponentId = 5
)
type Jpeg struct {
	Segments []*Jpeg_Segment
	_io *kaitai.Stream
	_root *Jpeg
	_parent interface{}
}
func NewJpeg() *Jpeg {
	return &Jpeg{
	}
}

func (this *Jpeg) Read(io *kaitai.Stream, parent interface{}, root *Jpeg) (err error) {
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
		tmp2 := NewJpeg_Segment()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Segments = append(this.Segments, tmp2)
	}
	return err
}

type Jpeg_Segment_MarkerEnum int
const (
	Jpeg_Segment_MarkerEnum__Tem Jpeg_Segment_MarkerEnum = 1
	Jpeg_Segment_MarkerEnum__Sof0 Jpeg_Segment_MarkerEnum = 192
	Jpeg_Segment_MarkerEnum__Sof1 Jpeg_Segment_MarkerEnum = 193
	Jpeg_Segment_MarkerEnum__Sof2 Jpeg_Segment_MarkerEnum = 194
	Jpeg_Segment_MarkerEnum__Sof3 Jpeg_Segment_MarkerEnum = 195
	Jpeg_Segment_MarkerEnum__Dht Jpeg_Segment_MarkerEnum = 196
	Jpeg_Segment_MarkerEnum__Sof5 Jpeg_Segment_MarkerEnum = 197
	Jpeg_Segment_MarkerEnum__Sof6 Jpeg_Segment_MarkerEnum = 198
	Jpeg_Segment_MarkerEnum__Sof7 Jpeg_Segment_MarkerEnum = 199
	Jpeg_Segment_MarkerEnum__Soi Jpeg_Segment_MarkerEnum = 216
	Jpeg_Segment_MarkerEnum__Eoi Jpeg_Segment_MarkerEnum = 217
	Jpeg_Segment_MarkerEnum__Sos Jpeg_Segment_MarkerEnum = 218
	Jpeg_Segment_MarkerEnum__Dqt Jpeg_Segment_MarkerEnum = 219
	Jpeg_Segment_MarkerEnum__Dnl Jpeg_Segment_MarkerEnum = 220
	Jpeg_Segment_MarkerEnum__Dri Jpeg_Segment_MarkerEnum = 221
	Jpeg_Segment_MarkerEnum__Dhp Jpeg_Segment_MarkerEnum = 222
	Jpeg_Segment_MarkerEnum__App0 Jpeg_Segment_MarkerEnum = 224
	Jpeg_Segment_MarkerEnum__App1 Jpeg_Segment_MarkerEnum = 225
	Jpeg_Segment_MarkerEnum__App2 Jpeg_Segment_MarkerEnum = 226
	Jpeg_Segment_MarkerEnum__App3 Jpeg_Segment_MarkerEnum = 227
	Jpeg_Segment_MarkerEnum__App4 Jpeg_Segment_MarkerEnum = 228
	Jpeg_Segment_MarkerEnum__App5 Jpeg_Segment_MarkerEnum = 229
	Jpeg_Segment_MarkerEnum__App6 Jpeg_Segment_MarkerEnum = 230
	Jpeg_Segment_MarkerEnum__App7 Jpeg_Segment_MarkerEnum = 231
	Jpeg_Segment_MarkerEnum__App8 Jpeg_Segment_MarkerEnum = 232
	Jpeg_Segment_MarkerEnum__App9 Jpeg_Segment_MarkerEnum = 233
	Jpeg_Segment_MarkerEnum__App10 Jpeg_Segment_MarkerEnum = 234
	Jpeg_Segment_MarkerEnum__App11 Jpeg_Segment_MarkerEnum = 235
	Jpeg_Segment_MarkerEnum__App12 Jpeg_Segment_MarkerEnum = 236
	Jpeg_Segment_MarkerEnum__App13 Jpeg_Segment_MarkerEnum = 237
	Jpeg_Segment_MarkerEnum__App14 Jpeg_Segment_MarkerEnum = 238
	Jpeg_Segment_MarkerEnum__App15 Jpeg_Segment_MarkerEnum = 239
	Jpeg_Segment_MarkerEnum__Com Jpeg_Segment_MarkerEnum = 254
)
type Jpeg_Segment struct {
	Magic []byte
	Marker Jpeg_Segment_MarkerEnum
	Length uint16
	Data interface{}
	ImageData []byte
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg
	_raw_Data []byte
}
func NewJpeg_Segment() *Jpeg_Segment {
	return &Jpeg_Segment{
	}
}

func (this *Jpeg_Segment) Read(io *kaitai.Stream, parent *Jpeg, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{255})) {
		return kaitai.NewValidationNotEqualError([]uint8{255}, this.Magic, this._io, "/types/segment/seq/0")
	}
	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Marker = Jpeg_Segment_MarkerEnum(tmp4)
	if ( ((this.Marker != Jpeg_Segment_MarkerEnum__Soi) && (this.Marker != Jpeg_Segment_MarkerEnum__Eoi)) ) {
		tmp5, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Length = uint16(tmp5)
	}
	if ( ((this.Marker != Jpeg_Segment_MarkerEnum__Soi) && (this.Marker != Jpeg_Segment_MarkerEnum__Eoi)) ) {
		switch (this.Marker) {
		case Jpeg_Segment_MarkerEnum__App1:
			tmp6, err := this._io.ReadBytes(int((this.Length - 2)))
			if err != nil {
				return err
			}
			tmp6 = tmp6
			this._raw_Data = tmp6
			_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
			tmp7 := NewJpeg_SegmentApp1()
			err = tmp7.Read(_io__raw_Data, this, this._root)
			if err != nil {
				return err
			}
			this.Data = tmp7
		case Jpeg_Segment_MarkerEnum__App0:
			tmp8, err := this._io.ReadBytes(int((this.Length - 2)))
			if err != nil {
				return err
			}
			tmp8 = tmp8
			this._raw_Data = tmp8
			_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
			tmp9 := NewJpeg_SegmentApp0()
			err = tmp9.Read(_io__raw_Data, this, this._root)
			if err != nil {
				return err
			}
			this.Data = tmp9
		case Jpeg_Segment_MarkerEnum__Sof0:
			tmp10, err := this._io.ReadBytes(int((this.Length - 2)))
			if err != nil {
				return err
			}
			tmp10 = tmp10
			this._raw_Data = tmp10
			_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
			tmp11 := NewJpeg_SegmentSof0()
			err = tmp11.Read(_io__raw_Data, this, this._root)
			if err != nil {
				return err
			}
			this.Data = tmp11
		case Jpeg_Segment_MarkerEnum__Sos:
			tmp12, err := this._io.ReadBytes(int((this.Length - 2)))
			if err != nil {
				return err
			}
			tmp12 = tmp12
			this._raw_Data = tmp12
			_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
			tmp13 := NewJpeg_SegmentSos()
			err = tmp13.Read(_io__raw_Data, this, this._root)
			if err != nil {
				return err
			}
			this.Data = tmp13
		default:
			tmp14, err := this._io.ReadBytes(int((this.Length - 2)))
			if err != nil {
				return err
			}
			tmp14 = tmp14
			this._raw_Data = tmp14
		}
	}
	if (this.Marker == Jpeg_Segment_MarkerEnum__Sos) {
		tmp15, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp15 = tmp15
		this.ImageData = tmp15
	}
	return err
}
type Jpeg_SegmentSos struct {
	NumComponents uint8
	Components []*Jpeg_SegmentSos_Component
	StartSpectralSelection uint8
	EndSpectral uint8
	ApprBitPos uint8
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_Segment
}
func NewJpeg_SegmentSos() *Jpeg_SegmentSos {
	return &Jpeg_SegmentSos{
	}
}

func (this *Jpeg_SegmentSos) Read(io *kaitai.Stream, parent *Jpeg_Segment, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumComponents = tmp16
	this.Components = make([]*Jpeg_SegmentSos_Component, this.NumComponents)
	for i := range this.Components {
		tmp17 := NewJpeg_SegmentSos_Component()
		err = tmp17.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Components[i] = tmp17
	}
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.StartSpectralSelection = tmp18
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.EndSpectral = tmp19
	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ApprBitPos = tmp20
	return err
}

/**
 * Number of components in scan
 */

/**
 * Scan components specification
 */

/**
 * Start of spectral selection or predictor selection
 */

/**
 * End of spectral selection
 */

/**
 * Successive approximation bit position high + Successive approximation bit position low or point transform
 */
type Jpeg_SegmentSos_Component struct {
	Id Jpeg_ComponentId
	HuffmanTable uint8
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_SegmentSos
}
func NewJpeg_SegmentSos_Component() *Jpeg_SegmentSos_Component {
	return &Jpeg_SegmentSos_Component{
	}
}

func (this *Jpeg_SegmentSos_Component) Read(io *kaitai.Stream, parent *Jpeg_SegmentSos, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Id = Jpeg_ComponentId(tmp21)
	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HuffmanTable = tmp22
	return err
}

/**
 * Scan component selector
 */
type Jpeg_SegmentApp1 struct {
	Magic string
	Body *Jpeg_ExifInJpeg
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_Segment
}
func NewJpeg_SegmentApp1() *Jpeg_SegmentApp1 {
	return &Jpeg_SegmentApp1{
	}
}

func (this *Jpeg_SegmentApp1) Read(io *kaitai.Stream, parent *Jpeg_Segment, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Magic = string(tmp23)
	switch (this.Magic) {
	case "Exif":
		tmp24 := NewJpeg_ExifInJpeg()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp24
	}
	return err
}
type Jpeg_SegmentSof0 struct {
	BitsPerSample uint8
	ImageHeight uint16
	ImageWidth uint16
	NumComponents uint8
	Components []*Jpeg_SegmentSof0_Component
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_Segment
}
func NewJpeg_SegmentSof0() *Jpeg_SegmentSof0 {
	return &Jpeg_SegmentSof0{
	}
}

func (this *Jpeg_SegmentSof0) Read(io *kaitai.Stream, parent *Jpeg_Segment, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BitsPerSample = tmp25
	tmp26, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ImageHeight = uint16(tmp26)
	tmp27, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ImageWidth = uint16(tmp27)
	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumComponents = tmp28
	this.Components = make([]*Jpeg_SegmentSof0_Component, this.NumComponents)
	for i := range this.Components {
		tmp29 := NewJpeg_SegmentSof0_Component()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Components[i] = tmp29
	}
	return err
}
type Jpeg_SegmentSof0_Component struct {
	Id Jpeg_ComponentId
	SamplingFactors uint8
	QuantizationTableId uint8
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_SegmentSof0
	_f_samplingX bool
	samplingX int
	_f_samplingY bool
	samplingY int
}
func NewJpeg_SegmentSof0_Component() *Jpeg_SegmentSof0_Component {
	return &Jpeg_SegmentSof0_Component{
	}
}

func (this *Jpeg_SegmentSof0_Component) Read(io *kaitai.Stream, parent *Jpeg_SegmentSof0, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Id = Jpeg_ComponentId(tmp30)
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SamplingFactors = tmp31
	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.QuantizationTableId = tmp32
	return err
}
func (this *Jpeg_SegmentSof0_Component) SamplingX() (v int, err error) {
	if (this._f_samplingX) {
		return this.samplingX, nil
	}
	this.samplingX = int(((this.SamplingFactors & 240) >> 4))
	this._f_samplingX = true
	return this.samplingX, nil
}
func (this *Jpeg_SegmentSof0_Component) SamplingY() (v int, err error) {
	if (this._f_samplingY) {
		return this.samplingY, nil
	}
	this.samplingY = int((this.SamplingFactors & 15))
	this._f_samplingY = true
	return this.samplingY, nil
}

/**
 * Component selector
 */
type Jpeg_ExifInJpeg struct {
	ExtraZero []byte
	Data *Exif
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_SegmentApp1
	_raw_Data []byte
}
func NewJpeg_ExifInJpeg() *Jpeg_ExifInJpeg {
	return &Jpeg_ExifInJpeg{
	}
}

func (this *Jpeg_ExifInJpeg) Read(io *kaitai.Stream, parent *Jpeg_SegmentApp1, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp33 = tmp33
	this.ExtraZero = tmp33
	if !(bytes.Equal(this.ExtraZero, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.ExtraZero, this._io, "/types/exif_in_jpeg/seq/0")
	}
	tmp34, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this._raw_Data = tmp34
	_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
	tmp35 := NewExif()
	err = tmp35.Read(_io__raw_Data, this, nil)
	if err != nil {
		return err
	}
	this.Data = tmp35
	return err
}

type Jpeg_SegmentApp0_DensityUnit int
const (
	Jpeg_SegmentApp0_DensityUnit__NoUnits Jpeg_SegmentApp0_DensityUnit = 0
	Jpeg_SegmentApp0_DensityUnit__PixelsPerInch Jpeg_SegmentApp0_DensityUnit = 1
	Jpeg_SegmentApp0_DensityUnit__PixelsPerCm Jpeg_SegmentApp0_DensityUnit = 2
)
type Jpeg_SegmentApp0 struct {
	Magic string
	VersionMajor uint8
	VersionMinor uint8
	DensityUnits Jpeg_SegmentApp0_DensityUnit
	DensityX uint16
	DensityY uint16
	ThumbnailX uint8
	ThumbnailY uint8
	Thumbnail []byte
	_io *kaitai.Stream
	_root *Jpeg
	_parent *Jpeg_Segment
}
func NewJpeg_SegmentApp0() *Jpeg_SegmentApp0 {
	return &Jpeg_SegmentApp0{
	}
}

func (this *Jpeg_SegmentApp0) Read(io *kaitai.Stream, parent *Jpeg_Segment, root *Jpeg) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadBytes(int(5))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Magic = string(tmp36)
	tmp37, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMajor = tmp37
	tmp38, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.VersionMinor = tmp38
	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DensityUnits = Jpeg_SegmentApp0_DensityUnit(tmp39)
	tmp40, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DensityX = uint16(tmp40)
	tmp41, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.DensityY = uint16(tmp41)
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ThumbnailX = tmp42
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ThumbnailY = tmp43
	tmp44, err := this._io.ReadBytes(int(((this.ThumbnailX * this.ThumbnailY) * 3)))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Thumbnail = tmp44
	return err
}

/**
 * Horizontal pixel density. Must not be zero.
 */

/**
 * Vertical pixel density. Must not be zero.
 */

/**
 * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
 */

/**
 * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
 */

/**
 * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
 */
