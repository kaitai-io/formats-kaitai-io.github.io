// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 * @see <a href="http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf">Source</a>
 */

type Wmf_Func int
const (
	Wmf_Func__Eof Wmf_Func = 0
	Wmf_Func__Savedc Wmf_Func = 30
	Wmf_Func__Realizepalette Wmf_Func = 53
	Wmf_Func__Setpalentries Wmf_Func = 55
	Wmf_Func__Createpalette Wmf_Func = 247
	Wmf_Func__Setbkmode Wmf_Func = 258
	Wmf_Func__Setmapmode Wmf_Func = 259
	Wmf_Func__Setrop2 Wmf_Func = 260
	Wmf_Func__Setrelabs Wmf_Func = 261
	Wmf_Func__Setpolyfillmode Wmf_Func = 262
	Wmf_Func__Setstretchbltmode Wmf_Func = 263
	Wmf_Func__Settextcharextra Wmf_Func = 264
	Wmf_Func__Restoredc Wmf_Func = 295
	Wmf_Func__Invertregion Wmf_Func = 298
	Wmf_Func__Paintregion Wmf_Func = 299
	Wmf_Func__Selectclipregion Wmf_Func = 300
	Wmf_Func__Selectobject Wmf_Func = 301
	Wmf_Func__Settextalign Wmf_Func = 302
	Wmf_Func__Resizepalette Wmf_Func = 313
	Wmf_Func__Dibcreatepatternbrush Wmf_Func = 322
	Wmf_Func__Setlayout Wmf_Func = 329
	Wmf_Func__Deleteobject Wmf_Func = 496
	Wmf_Func__Createpatternbrush Wmf_Func = 505
	Wmf_Func__Setbkcolor Wmf_Func = 513
	Wmf_Func__Settextcolor Wmf_Func = 521
	Wmf_Func__Settextjustification Wmf_Func = 522
	Wmf_Func__Setwindoworg Wmf_Func = 523
	Wmf_Func__Setwindowext Wmf_Func = 524
	Wmf_Func__Setviewportorg Wmf_Func = 525
	Wmf_Func__Setviewportext Wmf_Func = 526
	Wmf_Func__Offsetwindoworg Wmf_Func = 527
	Wmf_Func__Offsetviewportorg Wmf_Func = 529
	Wmf_Func__Lineto Wmf_Func = 531
	Wmf_Func__Moveto Wmf_Func = 532
	Wmf_Func__Offsetcliprgn Wmf_Func = 544
	Wmf_Func__Fillregion Wmf_Func = 552
	Wmf_Func__Setmapperflags Wmf_Func = 561
	Wmf_Func__Selectpalette Wmf_Func = 564
	Wmf_Func__Createpenindirect Wmf_Func = 762
	Wmf_Func__Createfontindirect Wmf_Func = 763
	Wmf_Func__Createbrushindirect Wmf_Func = 764
	Wmf_Func__Polygon Wmf_Func = 804
	Wmf_Func__Polyline Wmf_Func = 805
	Wmf_Func__Scalewindowext Wmf_Func = 1040
	Wmf_Func__Scaleviewportext Wmf_Func = 1042
	Wmf_Func__Excludecliprect Wmf_Func = 1045
	Wmf_Func__Intersectcliprect Wmf_Func = 1046
	Wmf_Func__Ellipse Wmf_Func = 1048
	Wmf_Func__Floodfill Wmf_Func = 1049
	Wmf_Func__Rectangle Wmf_Func = 1051
	Wmf_Func__Setpixel Wmf_Func = 1055
	Wmf_Func__Frameregion Wmf_Func = 1065
	Wmf_Func__Animatepalette Wmf_Func = 1078
	Wmf_Func__Textout Wmf_Func = 1313
	Wmf_Func__Polypolygon Wmf_Func = 1336
	Wmf_Func__Extfloodfill Wmf_Func = 1352
	Wmf_Func__Roundrect Wmf_Func = 1564
	Wmf_Func__Patblt Wmf_Func = 1565
	Wmf_Func__Escape Wmf_Func = 1574
	Wmf_Func__Createregion Wmf_Func = 1791
	Wmf_Func__Arc Wmf_Func = 2071
	Wmf_Func__Pie Wmf_Func = 2074
	Wmf_Func__Chord Wmf_Func = 2096
	Wmf_Func__Bitblt Wmf_Func = 2338
	Wmf_Func__Dibbitblt Wmf_Func = 2368
	Wmf_Func__Exttextout Wmf_Func = 2610
	Wmf_Func__Stretchblt Wmf_Func = 2851
	Wmf_Func__Dibstretchblt Wmf_Func = 2881
	Wmf_Func__Setdibtodev Wmf_Func = 3379
	Wmf_Func__Stretchdib Wmf_Func = 3907
)

type Wmf_BinRasterOp int
const (
	Wmf_BinRasterOp__Black Wmf_BinRasterOp = 1
	Wmf_BinRasterOp__Notmergepen Wmf_BinRasterOp = 2
	Wmf_BinRasterOp__Masknotpen Wmf_BinRasterOp = 3
	Wmf_BinRasterOp__Notcopypen Wmf_BinRasterOp = 4
	Wmf_BinRasterOp__Maskpennot Wmf_BinRasterOp = 5
	Wmf_BinRasterOp__Not Wmf_BinRasterOp = 6
	Wmf_BinRasterOp__Xorpen Wmf_BinRasterOp = 7
	Wmf_BinRasterOp__Notmaskpen Wmf_BinRasterOp = 8
	Wmf_BinRasterOp__Maskpen Wmf_BinRasterOp = 9
	Wmf_BinRasterOp__Notxorpen Wmf_BinRasterOp = 10
	Wmf_BinRasterOp__Nop Wmf_BinRasterOp = 11
	Wmf_BinRasterOp__Mergenotpen Wmf_BinRasterOp = 12
	Wmf_BinRasterOp__Copypen Wmf_BinRasterOp = 13
	Wmf_BinRasterOp__Mergepennot Wmf_BinRasterOp = 14
	Wmf_BinRasterOp__Mergepen Wmf_BinRasterOp = 15
	Wmf_BinRasterOp__White Wmf_BinRasterOp = 16
)

type Wmf_MixMode int
const (
	Wmf_MixMode__Transparent Wmf_MixMode = 1
	Wmf_MixMode__Opaque Wmf_MixMode = 2
)

type Wmf_PolyFillMode int
const (
	Wmf_PolyFillMode__Alternate Wmf_PolyFillMode = 1
	Wmf_PolyFillMode__Winding Wmf_PolyFillMode = 2
)
type Wmf struct {
	SpecialHeader *Wmf_SpecialHeader
	Header *Wmf_Header
	Records []*Wmf_Record
	_io *kaitai.Stream
	_root *Wmf
	_parent interface{}
}
func NewWmf() *Wmf {
	return &Wmf{
	}
}

func (this *Wmf) Read(io *kaitai.Stream, parent interface{}, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewWmf_SpecialHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SpecialHeader = tmp1
	tmp2 := NewWmf_Header()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp2
	for i := 1;; i++ {
		tmp3 := NewWmf_Record()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp3
		this.Records = append(this.Records, _it)
		if _it.Function == Wmf_Func__Eof {
			break
		}
	}
	return err
}

/**
 * @see "section 2.3.5.31"
 */
type Wmf_ParamsSetwindoworg struct {
	Y int16
	X int16
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsSetwindoworg() *Wmf_ParamsSetwindoworg {
	return &Wmf_ParamsSetwindoworg{
	}
}

func (this *Wmf_ParamsSetwindoworg) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Y = int16(tmp4)
	tmp5, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.X = int16(tmp5)
	return err
}

/**
 * Y coordinate of the window origin, in logical units.
 */

/**
 * X coordinate of the window origin, in logical units.
 */

/**
 * @see "section 2.3.5.15"
 */
type Wmf_ParamsSetbkmode struct {
	BkMode Wmf_MixMode
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsSetbkmode() *Wmf_ParamsSetbkmode {
	return &Wmf_ParamsSetbkmode{
	}
}

func (this *Wmf_ParamsSetbkmode) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BkMode = Wmf_MixMode(tmp6)
	return err
}

/**
 * Defines current graphic context background mix mode.
 */

/**
 * @see "section 2.2.1.12"
 */
type Wmf_PointS struct {
	X int16
	Y int16
	_io *kaitai.Stream
	_root *Wmf
	_parent interface{}
}
func NewWmf_PointS() *Wmf_PointS {
	return &Wmf_PointS{
	}
}

func (this *Wmf_PointS) Read(io *kaitai.Stream, parent interface{}, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.X = int16(tmp7)
	tmp8, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Y = int16(tmp8)
	return err
}

/**
 * X coordinate of the point, in logical units.
 */

/**
 * Y coordinate of the point, in logical units.
 */

/**
 * @see "section 2.3.5.30"
 */
type Wmf_ParamsSetwindowext struct {
	Y int16
	X int16
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsSetwindowext() *Wmf_ParamsSetwindowext {
	return &Wmf_ParamsSetwindowext{
	}
}

func (this *Wmf_ParamsSetwindowext) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Y = int16(tmp9)
	tmp10, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.X = int16(tmp10)
	return err
}

/**
 * Vertical extent of the window in logical units.
 */

/**
 * Horizontal extent of the window in logical units.
 */

/**
 * @see "section 2.3.3.15 = params_polyline"
 */
type Wmf_ParamsPolygon struct {
	NumPoints int16
	Points []*Wmf_PointS
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsPolygon() *Wmf_ParamsPolygon {
	return &Wmf_ParamsPolygon{
	}
}

func (this *Wmf_ParamsPolygon) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.NumPoints = int16(tmp11)
	this.Points = make([]*Wmf_PointS, this.NumPoints)
	for i := range this.Points {
		tmp12 := NewWmf_PointS()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp12
	}
	return err
}

type Wmf_Header_MetafileType int
const (
	Wmf_Header_MetafileType__MemoryMetafile Wmf_Header_MetafileType = 1
	Wmf_Header_MetafileType__DiskMetafile Wmf_Header_MetafileType = 2
)
type Wmf_Header struct {
	MetafileType Wmf_Header_MetafileType
	HeaderSize uint16
	Version uint16
	Size uint32
	NumberOfObjects uint16
	MaxRecord uint32
	NumberOfMembers uint16
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf
}
func NewWmf_Header() *Wmf_Header {
	return &Wmf_Header{
	}
}

func (this *Wmf_Header) Read(io *kaitai.Stream, parent *Wmf, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MetafileType = Wmf_Header_MetafileType(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint16(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfObjects = uint16(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MaxRecord = uint32(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumberOfMembers = uint16(tmp19)
	return err
}

/**
 * @see "section 2.2.1.7"
 */
type Wmf_ColorRef struct {
	Red uint8
	Green uint8
	Blue uint8
	Reserved uint8
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ColorRef() *Wmf_ColorRef {
	return &Wmf_ColorRef{
	}
}

func (this *Wmf_ColorRef) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Red = tmp20
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Green = tmp21
	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Blue = tmp22
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp23
	return err
}

/**
 * @see "section 2.3.5.22"
 */
type Wmf_ParamsSetrop2 struct {
	DrawMode Wmf_BinRasterOp
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsSetrop2() *Wmf_ParamsSetrop2 {
	return &Wmf_ParamsSetrop2{
	}
}

func (this *Wmf_ParamsSetrop2) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DrawMode = Wmf_BinRasterOp(tmp24)
	return err
}

/**
 * Defines current foreground binary raster operation mixing mode.
 */

/**
 * @see "section 2.3.5.20"
 */
type Wmf_ParamsSetpolyfillmode struct {
	PolyFillMode Wmf_PolyFillMode
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsSetpolyfillmode() *Wmf_ParamsSetpolyfillmode {
	return &Wmf_ParamsSetpolyfillmode{
	}
}

func (this *Wmf_ParamsSetpolyfillmode) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PolyFillMode = Wmf_PolyFillMode(tmp25)
	return err
}

/**
 * Defines current polygon fill mode.
 */

/**
 * @see "section 2.3.3.14"
 */
type Wmf_ParamsPolyline struct {
	NumPoints int16
	Points []*Wmf_PointS
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf_Record
}
func NewWmf_ParamsPolyline() *Wmf_ParamsPolyline {
	return &Wmf_ParamsPolyline{
	}
}

func (this *Wmf_ParamsPolyline) Read(io *kaitai.Stream, parent *Wmf_Record, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.NumPoints = int16(tmp26)
	this.Points = make([]*Wmf_PointS, this.NumPoints)
	for i := range this.Points {
		tmp27 := NewWmf_PointS()
		err = tmp27.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp27
	}
	return err
}
type Wmf_SpecialHeader struct {
	Magic []byte
	Handle []byte
	Left int16
	Top int16
	Right int16
	Bottom int16
	Inch uint16
	Reserved []byte
	Checksum uint16
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf
}
func NewWmf_SpecialHeader() *Wmf_SpecialHeader {
	return &Wmf_SpecialHeader{
	}
}

func (this *Wmf_SpecialHeader) Read(io *kaitai.Stream, parent *Wmf, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Magic = tmp28
	if !(bytes.Equal(this.Magic, []uint8{215, 205, 198, 154})) {
		return kaitai.NewValidationNotEqualError([]uint8{215, 205, 198, 154}, this.Magic, this._io, "/types/special_header/seq/0")
	}
	tmp29, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp29 = tmp29
	this.Handle = tmp29
	if !(bytes.Equal(this.Handle, []uint8{0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0}, this.Handle, this._io, "/types/special_header/seq/1")
	}
	tmp30, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Left = int16(tmp30)
	tmp31, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Top = int16(tmp31)
	tmp32, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Right = int16(tmp32)
	tmp33, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Bottom = int16(tmp33)
	tmp34, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Inch = uint16(tmp34)
	tmp35, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp35 = tmp35
	this.Reserved = tmp35
	if !(bytes.Equal(this.Reserved, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.Reserved, this._io, "/types/special_header/seq/7")
	}
	tmp36, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Checksum = uint16(tmp36)
	return err
}
type Wmf_Record struct {
	Size uint32
	Function Wmf_Func
	Params interface{}
	_io *kaitai.Stream
	_root *Wmf
	_parent *Wmf
	_raw_Params []byte
}
func NewWmf_Record() *Wmf_Record {
	return &Wmf_Record{
	}
}

func (this *Wmf_Record) Read(io *kaitai.Stream, parent *Wmf, root *Wmf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp37)
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Function = Wmf_Func(tmp38)
	switch (this.Function) {
	case Wmf_Func__Setbkmode:
		tmp39, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp39 = tmp39
		this._raw_Params = tmp39
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp40 := NewWmf_ParamsSetbkmode()
		err = tmp40.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp40
	case Wmf_Func__Polygon:
		tmp41, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp41 = tmp41
		this._raw_Params = tmp41
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp42 := NewWmf_ParamsPolygon()
		err = tmp42.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp42
	case Wmf_Func__Setbkcolor:
		tmp43, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this._raw_Params = tmp43
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp44 := NewWmf_ColorRef()
		err = tmp44.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp44
	case Wmf_Func__Setpolyfillmode:
		tmp45, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp45 = tmp45
		this._raw_Params = tmp45
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp46 := NewWmf_ParamsSetpolyfillmode()
		err = tmp46.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp46
	case Wmf_Func__Setwindoworg:
		tmp47, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp47 = tmp47
		this._raw_Params = tmp47
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp48 := NewWmf_ParamsSetwindoworg()
		err = tmp48.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp48
	case Wmf_Func__Setrop2:
		tmp49, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp49 = tmp49
		this._raw_Params = tmp49
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp50 := NewWmf_ParamsSetrop2()
		err = tmp50.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp50
	case Wmf_Func__Setwindowext:
		tmp51, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp51 = tmp51
		this._raw_Params = tmp51
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp52 := NewWmf_ParamsSetwindowext()
		err = tmp52.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp52
	case Wmf_Func__Polyline:
		tmp53, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp53 = tmp53
		this._raw_Params = tmp53
		_io__raw_Params := kaitai.NewStream(bytes.NewReader(this._raw_Params))
		tmp54 := NewWmf_ParamsPolyline()
		err = tmp54.Read(_io__raw_Params, this, this._root)
		if err != nil {
			return err
		}
		this.Params = tmp54
	default:
		tmp55, err := this._io.ReadBytes(int(((this.Size - 3) * 2)))
		if err != nil {
			return err
		}
		tmp55 = tmp55
		this._raw_Params = tmp55
	}
	return err
}
