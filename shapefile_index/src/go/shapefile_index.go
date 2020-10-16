// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type ShapefileIndex_ShapeType int
const (
	ShapefileIndex_ShapeType__NullShape ShapefileIndex_ShapeType = 0
	ShapefileIndex_ShapeType__Point ShapefileIndex_ShapeType = 1
	ShapefileIndex_ShapeType__PolyLine ShapefileIndex_ShapeType = 3
	ShapefileIndex_ShapeType__Polygon ShapefileIndex_ShapeType = 5
	ShapefileIndex_ShapeType__MultiPoint ShapefileIndex_ShapeType = 8
	ShapefileIndex_ShapeType__PointZ ShapefileIndex_ShapeType = 11
	ShapefileIndex_ShapeType__PolyLineZ ShapefileIndex_ShapeType = 13
	ShapefileIndex_ShapeType__PolygonZ ShapefileIndex_ShapeType = 15
	ShapefileIndex_ShapeType__MultiPointZ ShapefileIndex_ShapeType = 18
	ShapefileIndex_ShapeType__PointM ShapefileIndex_ShapeType = 21
	ShapefileIndex_ShapeType__PolyLineM ShapefileIndex_ShapeType = 23
	ShapefileIndex_ShapeType__PolygonM ShapefileIndex_ShapeType = 25
	ShapefileIndex_ShapeType__MultiPointM ShapefileIndex_ShapeType = 28
	ShapefileIndex_ShapeType__MultiPatch ShapefileIndex_ShapeType = 31
)
type ShapefileIndex struct {
	Header *ShapefileIndex_FileHeader
	Records []*ShapefileIndex_Record
	_io *kaitai.Stream
	_root *ShapefileIndex
	_parent interface{}
}
func NewShapefileIndex() *ShapefileIndex {
	return &ShapefileIndex{
	}
}

func (this *ShapefileIndex) Read(io *kaitai.Stream, parent interface{}, root *ShapefileIndex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewShapefileIndex_FileHeader()
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
		tmp3 := NewShapefileIndex_Record()
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
type ShapefileIndex_FileHeader struct {
	FileCode []byte
	UnusedField1 []byte
	UnusedField2 []byte
	UnusedField3 []byte
	UnusedField4 []byte
	UnusedField5 []byte
	FileLength int32
	Version []byte
	ShapeType ShapefileIndex_ShapeType
	BoundingBox *ShapefileIndex_BoundingBoxXYZM
	_io *kaitai.Stream
	_root *ShapefileIndex
	_parent *ShapefileIndex
}
func NewShapefileIndex_FileHeader() *ShapefileIndex_FileHeader {
	return &ShapefileIndex_FileHeader{
	}
}

func (this *ShapefileIndex_FileHeader) Read(io *kaitai.Stream, parent *ShapefileIndex, root *ShapefileIndex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.FileCode = tmp4
	if !(bytes.Equal(this.FileCode, []uint8{0, 0, 39, 10})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 39, 10}, this.FileCode, this._io, "/types/file_header/seq/0")
	}
	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.UnusedField1 = tmp5
	if !(bytes.Equal(this.UnusedField1, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField1, this._io, "/types/file_header/seq/1")
	}
	tmp6, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.UnusedField2 = tmp6
	if !(bytes.Equal(this.UnusedField2, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField2, this._io, "/types/file_header/seq/2")
	}
	tmp7, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.UnusedField3 = tmp7
	if !(bytes.Equal(this.UnusedField3, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField3, this._io, "/types/file_header/seq/3")
	}
	tmp8, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.UnusedField4 = tmp8
	if !(bytes.Equal(this.UnusedField4, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField4, this._io, "/types/file_header/seq/4")
	}
	tmp9, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.UnusedField5 = tmp9
	if !(bytes.Equal(this.UnusedField5, []uint8{0, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0, 0, 0}, this.UnusedField5, this._io, "/types/file_header/seq/5")
	}
	tmp10, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.FileLength = int32(tmp10)
	tmp11, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Version = tmp11
	if !(bytes.Equal(this.Version, []uint8{232, 3, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{232, 3, 0, 0}, this.Version, this._io, "/types/file_header/seq/7")
	}
	tmp12, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.ShapeType = ShapefileIndex_ShapeType(tmp12)
	tmp13 := NewShapefileIndex_BoundingBoxXYZM()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingBox = tmp13
	return err
}

/**
 * corresponds to s4be value of 9994
 */

/**
 * corresponds to s4le value of 1000
 */
type ShapefileIndex_Record struct {
	Offset int32
	ContentLength int32
	_io *kaitai.Stream
	_root *ShapefileIndex
	_parent *ShapefileIndex
}
func NewShapefileIndex_Record() *ShapefileIndex_Record {
	return &ShapefileIndex_Record{
	}
}

func (this *ShapefileIndex_Record) Read(io *kaitai.Stream, parent *ShapefileIndex, root *ShapefileIndex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Offset = int32(tmp14)
	tmp15, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.ContentLength = int32(tmp15)
	return err
}
type ShapefileIndex_BoundingBoxXYZM struct {
	X *ShapefileIndex_BoundsMinMax
	Y *ShapefileIndex_BoundsMinMax
	Z *ShapefileIndex_BoundsMinMax
	M *ShapefileIndex_BoundsMinMax
	_io *kaitai.Stream
	_root *ShapefileIndex
	_parent *ShapefileIndex_FileHeader
}
func NewShapefileIndex_BoundingBoxXYZM() *ShapefileIndex_BoundingBoxXYZM {
	return &ShapefileIndex_BoundingBoxXYZM{
	}
}

func (this *ShapefileIndex_BoundingBoxXYZM) Read(io *kaitai.Stream, parent *ShapefileIndex_FileHeader, root *ShapefileIndex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16 := NewShapefileIndex_BoundsMinMax()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.X = tmp16
	tmp17 := NewShapefileIndex_BoundsMinMax()
	err = tmp17.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Y = tmp17
	tmp18 := NewShapefileIndex_BoundsMinMax()
	err = tmp18.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Z = tmp18
	tmp19 := NewShapefileIndex_BoundsMinMax()
	err = tmp19.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.M = tmp19
	return err
}
type ShapefileIndex_BoundsMinMax struct {
	Min float64
	Max float64
	_io *kaitai.Stream
	_root *ShapefileIndex
	_parent *ShapefileIndex_BoundingBoxXYZM
}
func NewShapefileIndex_BoundsMinMax() *ShapefileIndex_BoundsMinMax {
	return &ShapefileIndex_BoundsMinMax{
	}
}

func (this *ShapefileIndex_BoundsMinMax) Read(io *kaitai.Stream, parent *ShapefileIndex_BoundingBoxXYZM, root *ShapefileIndex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadF8be()
	if err != nil {
		return err
	}
	this.Min = float64(tmp20)
	tmp21, err := this._io.ReadF8be()
	if err != nil {
		return err
	}
	this.Max = float64(tmp21)
	return err
}
