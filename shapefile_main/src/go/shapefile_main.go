// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type ShapefileMain_ShapeType int
const (
	ShapefileMain_ShapeType__NullShape ShapefileMain_ShapeType = 0
	ShapefileMain_ShapeType__Point ShapefileMain_ShapeType = 1
	ShapefileMain_ShapeType__PolyLine ShapefileMain_ShapeType = 3
	ShapefileMain_ShapeType__Polygon ShapefileMain_ShapeType = 5
	ShapefileMain_ShapeType__MultiPoint ShapefileMain_ShapeType = 8
	ShapefileMain_ShapeType__PointZ ShapefileMain_ShapeType = 11
	ShapefileMain_ShapeType__PolyLineZ ShapefileMain_ShapeType = 13
	ShapefileMain_ShapeType__PolygonZ ShapefileMain_ShapeType = 15
	ShapefileMain_ShapeType__MultiPointZ ShapefileMain_ShapeType = 18
	ShapefileMain_ShapeType__PointM ShapefileMain_ShapeType = 21
	ShapefileMain_ShapeType__PolyLineM ShapefileMain_ShapeType = 23
	ShapefileMain_ShapeType__PolygonM ShapefileMain_ShapeType = 25
	ShapefileMain_ShapeType__MultiPointM ShapefileMain_ShapeType = 28
	ShapefileMain_ShapeType__MultiPatch ShapefileMain_ShapeType = 31
)

type ShapefileMain_PartType int
const (
	ShapefileMain_PartType__TriangleStrip ShapefileMain_PartType = 0
	ShapefileMain_PartType__TriangleFan ShapefileMain_PartType = 1
	ShapefileMain_PartType__OuterRing ShapefileMain_PartType = 2
	ShapefileMain_PartType__InnerRing ShapefileMain_PartType = 3
	ShapefileMain_PartType__FirstRing ShapefileMain_PartType = 4
	ShapefileMain_PartType__Ring ShapefileMain_PartType = 5
)
type ShapefileMain struct {
	Header *ShapefileMain_FileHeader
	Records []*ShapefileMain_Record
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent interface{}
}
func NewShapefileMain() *ShapefileMain {
	return &ShapefileMain{
	}
}

func (this *ShapefileMain) Read(io *kaitai.Stream, parent interface{}, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewShapefileMain_FileHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewShapefileMain_Record()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp3)
	}
	return err
}

/**
 * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
 */
type ShapefileMain_MultiPointM struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfPoints int32
	Points []*ShapefileMain_Point
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_MultiPointM() *ShapefileMain_MultiPointM {
	return &ShapefileMain_MultiPointM{
	}
}

func (this *ShapefileMain_MultiPointM) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4 := NewShapefileMain_BoundingBoxXY()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp4
	tmp5, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp5)
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp6 := NewShapefileMain_Point()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp6
	}
	tmp7 := NewShapefileMain_BoundsMinMax()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp7
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp8, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp8
	}
	return err
}
type ShapefileMain_BoundingBoxXYZM struct {
	X *ShapefileMain_BoundsMinMax
	Y *ShapefileMain_BoundsMinMax
	Z *ShapefileMain_BoundsMinMax
	M *ShapefileMain_BoundsMinMax
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_FileHeader
}
func NewShapefileMain_BoundingBoxXYZM() *ShapefileMain_BoundingBoxXYZM {
	return &ShapefileMain_BoundingBoxXYZM{
	}
}

func (this *ShapefileMain_BoundingBoxXYZM) Read(io *kaitai.Stream, parent *ShapefileMain_FileHeader, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9 := NewShapefileMain_BoundsMinMax()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.X = tmp9
	tmp10 := NewShapefileMain_BoundsMinMax()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Y = tmp10
	tmp11 := NewShapefileMain_BoundsMinMax()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Z = tmp11
	tmp12 := NewShapefileMain_BoundsMinMax()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.M = tmp12
	return err
}
type ShapefileMain_Point struct {
	X float64
	Y float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent interface{}
}
func NewShapefileMain_Point() *ShapefileMain_Point {
	return &ShapefileMain_Point{
	}
}

func (this *ShapefileMain_Point) Read(io *kaitai.Stream, parent interface{}, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.X = float64(tmp13)
	tmp14, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Y = float64(tmp14)
	return err
}
type ShapefileMain_Polygon struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_Polygon() *ShapefileMain_Polygon {
	return &ShapefileMain_Polygon{
	}
}

func (this *ShapefileMain_Polygon) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15 := NewShapefileMain_BoundingBoxXY()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp15
	tmp16, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp16)
	tmp17, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp17)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp18, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp18
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp19 := NewShapefileMain_Point()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp19
	}
	return err
}
type ShapefileMain_BoundsMinMax struct {
	Min float64
	Max float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent interface{}
}
func NewShapefileMain_BoundsMinMax() *ShapefileMain_BoundsMinMax {
	return &ShapefileMain_BoundsMinMax{
	}
}

func (this *ShapefileMain_BoundsMinMax) Read(io *kaitai.Stream, parent interface{}, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Min = float64(tmp20)
	tmp21, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Max = float64(tmp21)
	return err
}
type ShapefileMain_PolyLine struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PolyLine() *ShapefileMain_PolyLine {
	return &ShapefileMain_PolyLine{
	}
}

func (this *ShapefileMain_PolyLine) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22 := NewShapefileMain_BoundingBoxXY()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp22
	tmp23, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp23)
	tmp24, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp24)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp25, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp25
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp26 := NewShapefileMain_Point()
		err = tmp26.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp26
	}
	return err
}
type ShapefileMain_MultiPointZ struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfPoints int32
	Points []*ShapefileMain_Point
	ZRange *ShapefileMain_BoundsMinMax
	ZValues []float64
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_MultiPointZ() *ShapefileMain_MultiPointZ {
	return &ShapefileMain_MultiPointZ{
	}
}

func (this *ShapefileMain_MultiPointZ) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27 := NewShapefileMain_BoundingBoxXY()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp27
	tmp28, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp28)
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp29 := NewShapefileMain_Point()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp29
	}
	tmp30 := NewShapefileMain_BoundsMinMax()
	err = tmp30.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ZRange = tmp30
	this.ZValues = make([]float64, this.NumberOfPoints)
	for i := range this.ZValues {
		tmp31, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.ZValues[i] = tmp31
	}
	tmp32 := NewShapefileMain_BoundsMinMax()
	err = tmp32.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp32
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp33, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp33
	}
	return err
}
type ShapefileMain_PolyLineZ struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	ZRange *ShapefileMain_BoundsMinMax
	ZValues []float64
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PolyLineZ() *ShapefileMain_PolyLineZ {
	return &ShapefileMain_PolyLineZ{
	}
}

func (this *ShapefileMain_PolyLineZ) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34 := NewShapefileMain_BoundingBoxXY()
	err = tmp34.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp34
	tmp35, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp35)
	tmp36, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp36)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp37, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp37
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp38 := NewShapefileMain_Point()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp38
	}
	tmp39 := NewShapefileMain_BoundsMinMax()
	err = tmp39.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ZRange = tmp39
	this.ZValues = make([]float64, this.NumberOfPoints)
	for i := range this.ZValues {
		tmp40, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.ZValues[i] = tmp40
	}
	tmp41 := NewShapefileMain_BoundsMinMax()
	err = tmp41.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp41
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp42, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp42
	}
	return err
}
type ShapefileMain_PolygonZ struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	ZRange *ShapefileMain_BoundsMinMax
	ZValues []float64
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PolygonZ() *ShapefileMain_PolygonZ {
	return &ShapefileMain_PolygonZ{
	}
}

func (this *ShapefileMain_PolygonZ) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43 := NewShapefileMain_BoundingBoxXY()
	err = tmp43.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp43
	tmp44, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp44)
	tmp45, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp45)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp46, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp46
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp47 := NewShapefileMain_Point()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp47
	}
	tmp48 := NewShapefileMain_BoundsMinMax()
	err = tmp48.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ZRange = tmp48
	this.ZValues = make([]float64, this.NumberOfPoints)
	for i := range this.ZValues {
		tmp49, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.ZValues[i] = tmp49
	}
	tmp50 := NewShapefileMain_BoundsMinMax()
	err = tmp50.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp50
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp51, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp51
	}
	return err
}
type ShapefileMain_BoundingBoxXY struct {
	X *ShapefileMain_BoundsMinMax
	Y *ShapefileMain_BoundsMinMax
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent interface{}
}
func NewShapefileMain_BoundingBoxXY() *ShapefileMain_BoundingBoxXY {
	return &ShapefileMain_BoundingBoxXY{
	}
}

func (this *ShapefileMain_BoundingBoxXY) Read(io *kaitai.Stream, parent interface{}, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52 := NewShapefileMain_BoundsMinMax()
	err = tmp52.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.X = tmp52
	tmp53 := NewShapefileMain_BoundsMinMax()
	err = tmp53.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Y = tmp53
	return err
}
type ShapefileMain_PointM struct {
	X float64
	Y float64
	M float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PointM() *ShapefileMain_PointM {
	return &ShapefileMain_PointM{
	}
}

func (this *ShapefileMain_PointM) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp54, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.X = float64(tmp54)
	tmp55, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Y = float64(tmp55)
	tmp56, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.M = float64(tmp56)
	return err
}
type ShapefileMain_PolygonM struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PolygonM() *ShapefileMain_PolygonM {
	return &ShapefileMain_PolygonM{
	}
}

func (this *ShapefileMain_PolygonM) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp57 := NewShapefileMain_BoundingBoxXY()
	err = tmp57.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp57
	tmp58, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp58)
	tmp59, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp59)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp60, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp60
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp61 := NewShapefileMain_Point()
		err = tmp61.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp61
	}
	tmp62 := NewShapefileMain_BoundsMinMax()
	err = tmp62.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp62
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp63, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp63
	}
	return err
}
type ShapefileMain_RecordHeader struct {
	RecordNumber int32
	ContentLength int32
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_Record
}
func NewShapefileMain_RecordHeader() *ShapefileMain_RecordHeader {
	return &ShapefileMain_RecordHeader{
	}
}

func (this *ShapefileMain_RecordHeader) Read(io *kaitai.Stream, parent *ShapefileMain_Record, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp64, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.RecordNumber = int32(tmp64)
	tmp65, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.ContentLength = int32(tmp65)
	return err
}
type ShapefileMain_MultiPoint struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfPoints int32
	Points []*ShapefileMain_Point
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_MultiPoint() *ShapefileMain_MultiPoint {
	return &ShapefileMain_MultiPoint{
	}
}

func (this *ShapefileMain_MultiPoint) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp66 := NewShapefileMain_BoundingBoxXY()
	err = tmp66.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp66
	tmp67, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp67)
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp68 := NewShapefileMain_Point()
		err = tmp68.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp68
	}
	return err
}
type ShapefileMain_FileHeader struct {
	FileCode []byte
	UnusedField1 []byte
	UnusedField2 []byte
	UnusedField3 []byte
	UnusedField4 []byte
	UnusedField5 []byte
	FileLength int32
	Version []byte
	ShapeType ShapefileMain_ShapeType
	BoundingBox *ShapefileMain_BoundingBoxXYZM
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain
}
func NewShapefileMain_FileHeader() *ShapefileMain_FileHeader {
	return &ShapefileMain_FileHeader{
	}
}

func (this *ShapefileMain_FileHeader) Read(io *kaitai.Stream, parent *ShapefileMain, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp69, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.FileCode = tmp69
	if !(bytes.Equal(this.FileCode, []uint8{0, 0, 39, 10})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 39, 10}, this.FileCode, this._io, "/types/file_header/seq/0")
	}
	tmp70, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp70 = tmp70
	this.UnusedField1 = tmp70
	if !(bytes.Equal(this.UnusedField1, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField1, this._io, "/types/file_header/seq/1")
	}
	tmp71, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp71 = tmp71
	this.UnusedField2 = tmp71
	if !(bytes.Equal(this.UnusedField2, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField2, this._io, "/types/file_header/seq/2")
	}
	tmp72, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp72 = tmp72
	this.UnusedField3 = tmp72
	if !(bytes.Equal(this.UnusedField3, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField3, this._io, "/types/file_header/seq/3")
	}
	tmp73, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.UnusedField4 = tmp73
	if !(bytes.Equal(this.UnusedField4, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField4, this._io, "/types/file_header/seq/4")
	}
	tmp74, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp74 = tmp74
	this.UnusedField5 = tmp74
	if !(bytes.Equal(this.UnusedField5, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField5, this._io, "/types/file_header/seq/5")
	}
	tmp75, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.FileLength = int32(tmp75)
	tmp76, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp76 = tmp76
	this.Version = tmp76
	if !(bytes.Equal(this.Version, []uint8{232, 3, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{232, 3, 0, 0}, this.Version, this._io, "/types/file_header/seq/7")
	}
	tmp77, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.ShapeType = ShapefileMain_ShapeType(tmp77)
	tmp78 := NewShapefileMain_BoundingBoxXYZM()
	err = tmp78.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp78
	return err
}

/**
 * corresponds to s4be value of 9994
 */

/**
 * corresponds to s4le value of 1000
 */
type ShapefileMain_PointZ struct {
	X float64
	Y float64
	Z float64
	M float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PointZ() *ShapefileMain_PointZ {
	return &ShapefileMain_PointZ{
	}
}

func (this *ShapefileMain_PointZ) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp79, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.X = float64(tmp79)
	tmp80, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Y = float64(tmp80)
	tmp81, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.Z = float64(tmp81)
	tmp82, err := this._io.ReadF8le()
	if err != nil {
		return err
	}
	this.M = float64(tmp82)
	return err
}
type ShapefileMain_Record struct {
	Header *ShapefileMain_RecordHeader
	Contents *ShapefileMain_RecordContents
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain
}
func NewShapefileMain_Record() *ShapefileMain_Record {
	return &ShapefileMain_Record{
	}
}

func (this *ShapefileMain_Record) Read(io *kaitai.Stream, parent *ShapefileMain, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp83 := NewShapefileMain_RecordHeader()
	err = tmp83.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp83
	tmp84 := NewShapefileMain_RecordContents()
	err = tmp84.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Contents = tmp84
	return err
}

/**
 * the size of this contents section in bytes must equal header.content_length * 2
 */
type ShapefileMain_RecordContents struct {
	ShapeType ShapefileMain_ShapeType
	ShapeParameters interface{}
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_Record
}
func NewShapefileMain_RecordContents() *ShapefileMain_RecordContents {
	return &ShapefileMain_RecordContents{
	}
}

func (this *ShapefileMain_RecordContents) Read(io *kaitai.Stream, parent *ShapefileMain_Record, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp85, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.ShapeType = ShapefileMain_ShapeType(tmp85)
	if (this.ShapeType != ShapefileMain_ShapeType__NullShape) {
		switch (this.ShapeType) {
		case ShapefileMain_ShapeType__PolyLineZ:
			tmp86 := NewShapefileMain_PolyLineZ()
			err = tmp86.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp86
		case ShapefileMain_ShapeType__MultiPatch:
			tmp87 := NewShapefileMain_MultiPatch()
			err = tmp87.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp87
		case ShapefileMain_ShapeType__PolyLineM:
			tmp88 := NewShapefileMain_PolyLineM()
			err = tmp88.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp88
		case ShapefileMain_ShapeType__Polygon:
			tmp89 := NewShapefileMain_Polygon()
			err = tmp89.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp89
		case ShapefileMain_ShapeType__PolygonZ:
			tmp90 := NewShapefileMain_PolygonZ()
			err = tmp90.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp90
		case ShapefileMain_ShapeType__PointZ:
			tmp91 := NewShapefileMain_PointZ()
			err = tmp91.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp91
		case ShapefileMain_ShapeType__PolyLine:
			tmp92 := NewShapefileMain_PolyLine()
			err = tmp92.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp92
		case ShapefileMain_ShapeType__PointM:
			tmp93 := NewShapefileMain_PointM()
			err = tmp93.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp93
		case ShapefileMain_ShapeType__PolygonM:
			tmp94 := NewShapefileMain_PolygonM()
			err = tmp94.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp94
		case ShapefileMain_ShapeType__MultiPoint:
			tmp95 := NewShapefileMain_MultiPoint()
			err = tmp95.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp95
		case ShapefileMain_ShapeType__Point:
			tmp96 := NewShapefileMain_Point()
			err = tmp96.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp96
		case ShapefileMain_ShapeType__MultiPointM:
			tmp97 := NewShapefileMain_MultiPointM()
			err = tmp97.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp97
		case ShapefileMain_ShapeType__MultiPointZ:
			tmp98 := NewShapefileMain_MultiPointZ()
			err = tmp98.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ShapeParameters = tmp98
		}
	}
	return err
}
type ShapefileMain_MultiPatch struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	PartTypes []ShapefileMain_PartType
	Points []*ShapefileMain_Point
	ZRange *ShapefileMain_BoundsMinMax
	ZValues []float64
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_MultiPatch() *ShapefileMain_MultiPatch {
	return &ShapefileMain_MultiPatch{
	}
}

func (this *ShapefileMain_MultiPatch) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp99 := NewShapefileMain_BoundingBoxXY()
	err = tmp99.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp99
	tmp100, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp100)
	tmp101, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp101)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp102, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp102
	}
	this.PartTypes = make([]ShapefileMain_PartType, this.NumberOfParts)
	for i := range this.PartTypes {
		tmp103, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.PartTypes[i] = ShapefileMain_PartType(tmp103)
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp104 := NewShapefileMain_Point()
		err = tmp104.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp104
	}
	tmp105 := NewShapefileMain_BoundsMinMax()
	err = tmp105.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ZRange = tmp105
	this.ZValues = make([]float64, this.NumberOfPoints)
	for i := range this.ZValues {
		tmp106, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.ZValues[i] = tmp106
	}
	tmp107 := NewShapefileMain_BoundsMinMax()
	err = tmp107.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp107
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp108, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp108
	}
	return err
}
type ShapefileMain_PolyLineM struct {
	BoundingBox *ShapefileMain_BoundingBoxXY
	NumberOfParts int32
	NumberOfPoints int32
	Parts []int32
	Points []*ShapefileMain_Point
	MRange *ShapefileMain_BoundsMinMax
	MValues []float64
	_io *kaitai.Stream
	_root *ShapefileMain
	_parent *ShapefileMain_RecordContents
}
func NewShapefileMain_PolyLineM() *ShapefileMain_PolyLineM {
	return &ShapefileMain_PolyLineM{
	}
}

func (this *ShapefileMain_PolyLineM) Read(io *kaitai.Stream, parent *ShapefileMain_RecordContents, root *ShapefileMain) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp109 := NewShapefileMain_BoundingBoxXY()
	err = tmp109.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp109
	tmp110, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfParts = int32(tmp110)
	tmp111, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumberOfPoints = int32(tmp111)
	this.Parts = make([]int32, this.NumberOfParts)
	for i := range this.Parts {
		tmp112, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Parts[i] = tmp112
	}
	this.Points = make([]*ShapefileMain_Point, this.NumberOfPoints)
	for i := range this.Points {
		tmp113 := NewShapefileMain_Point()
		err = tmp113.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Points[i] = tmp113
	}
	tmp114 := NewShapefileMain_BoundsMinMax()
	err = tmp114.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MRange = tmp114
	this.MValues = make([]float64, this.NumberOfPoints)
	for i := range this.MValues {
		tmp115, err := this._io.ReadF8le()
		if err != nil {
			return err
		}
		this.MValues[i] = tmp115
	}
	return err
}
