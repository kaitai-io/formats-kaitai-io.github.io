// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)

type QuakeMdl struct {
	Header *QuakeMdl_MdlHeader
	Skins []*QuakeMdl_MdlSkin
	TextureCoordinates []*QuakeMdl_MdlTexcoord
	Triangles []*QuakeMdl_MdlTriangle
	Frames []*QuakeMdl_MdlFrame
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent interface{}
}
func NewQuakeMdl() *QuakeMdl {
	return &QuakeMdl{
	}
}

func (this *QuakeMdl) Read(io *kaitai.Stream, parent interface{}, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewQuakeMdl_MdlHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	this.Skins = make([]*QuakeMdl_MdlSkin, this.Header.NumSkins)
	for i := range this.Skins {
		tmp2 := NewQuakeMdl_MdlSkin()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Skins[i] = tmp2
	}
	this.TextureCoordinates = make([]*QuakeMdl_MdlTexcoord, this.Header.NumVerts)
	for i := range this.TextureCoordinates {
		tmp3 := NewQuakeMdl_MdlTexcoord()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.TextureCoordinates[i] = tmp3
	}
	this.Triangles = make([]*QuakeMdl_MdlTriangle, this.Header.NumTris)
	for i := range this.Triangles {
		tmp4 := NewQuakeMdl_MdlTriangle()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Triangles[i] = tmp4
	}
	this.Frames = make([]*QuakeMdl_MdlFrame, this.Header.NumFrames)
	for i := range this.Frames {
		tmp5 := NewQuakeMdl_MdlFrame()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Frames[i] = tmp5
	}
	return err
}
type QuakeMdl_MdlVertex struct {
	Values []uint8
	NormalIndex uint8
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent interface{}
}
func NewQuakeMdl_MdlVertex() *QuakeMdl_MdlVertex {
	return &QuakeMdl_MdlVertex{
	}
}

func (this *QuakeMdl_MdlVertex) Read(io *kaitai.Stream, parent interface{}, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Values = make([]uint8, 3)
	for i := range this.Values {
		tmp6, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Values[i] = tmp6
	}
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NormalIndex = tmp7
	return err
}
type QuakeMdl_MdlTexcoord struct {
	OnSeam int32
	S int32
	T int32
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl
}
func NewQuakeMdl_MdlTexcoord() *QuakeMdl_MdlTexcoord {
	return &QuakeMdl_MdlTexcoord{
	}
}

func (this *QuakeMdl_MdlTexcoord) Read(io *kaitai.Stream, parent *QuakeMdl, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.OnSeam = int32(tmp8)
	tmp9, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.S = int32(tmp9)
	tmp10, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.T = int32(tmp10)
	return err
}
type QuakeMdl_MdlHeader struct {
	Ident []byte
	VersionMustBe6 []byte
	Scale *QuakeMdl_Vec3
	Origin *QuakeMdl_Vec3
	Radius float32
	EyePosition *QuakeMdl_Vec3
	NumSkins int32
	SkinWidth int32
	SkinHeight int32
	NumVerts int32
	NumTris int32
	NumFrames int32
	Synctype int32
	Flags int32
	Size float32
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl
	_f_version bool
	version int8
	_f_skinSize bool
	skinSize int
}
func NewQuakeMdl_MdlHeader() *QuakeMdl_MdlHeader {
	return &QuakeMdl_MdlHeader{
	}
}

func (this *QuakeMdl_MdlHeader) Read(io *kaitai.Stream, parent *QuakeMdl, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Ident = tmp11
	if !(bytes.Equal(this.Ident, []uint8{73, 68, 80, 79})) {
		return kaitai.NewValidationNotEqualError([]uint8{73, 68, 80, 79}, this.Ident, this._io, "/types/mdl_header/seq/0")
	}
	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.VersionMustBe6 = tmp12
	if !(bytes.Equal(this.VersionMustBe6, []uint8{6, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{6, 0, 0, 0}, this.VersionMustBe6, this._io, "/types/mdl_header/seq/1")
	}
	tmp13 := NewQuakeMdl_Vec3()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Scale = tmp13
	tmp14 := NewQuakeMdl_Vec3()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Origin = tmp14
	tmp15, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Radius = float32(tmp15)
	tmp16 := NewQuakeMdl_Vec3()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.EyePosition = tmp16
	tmp17, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumSkins = int32(tmp17)
	tmp18, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SkinWidth = int32(tmp18)
	tmp19, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.SkinHeight = int32(tmp19)
	tmp20, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumVerts = int32(tmp20)
	tmp21, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumTris = int32(tmp21)
	tmp22, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumFrames = int32(tmp22)
	tmp23, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Synctype = int32(tmp23)
	tmp24, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Flags = int32(tmp24)
	tmp25, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Size = float32(tmp25)
	return err
}
func (this *QuakeMdl_MdlHeader) Version() (v int8, err error) {
	if (this._f_version) {
		return this.version, nil
	}
	this.version = int8(6)
	this._f_version = true
	return this.version, nil
}
func (this *QuakeMdl_MdlHeader) SkinSize() (v int, err error) {
	if (this._f_skinSize) {
		return this.skinSize, nil
	}
	this.skinSize = int((this.SkinWidth * this.SkinHeight))
	this._f_skinSize = true
	return this.skinSize, nil
}
type QuakeMdl_MdlSkin struct {
	Group int32
	SingleTextureData []byte
	NumFrames uint32
	FrameTimes []float32
	GroupTextureData [][]byte
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl
}
func NewQuakeMdl_MdlSkin() *QuakeMdl_MdlSkin {
	return &QuakeMdl_MdlSkin{
	}
}

func (this *QuakeMdl_MdlSkin) Read(io *kaitai.Stream, parent *QuakeMdl, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Group = int32(tmp26)
	if (this.Group == 0) {
		tmp27, err := this._root.Header.SkinSize()
		if err != nil {
			return err
		}
		tmp28, err := this._io.ReadBytes(int(tmp27))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this.SingleTextureData = tmp28
	}
	if (this.Group != 0) {
		tmp29, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.NumFrames = uint32(tmp29)
	}
	if (this.Group != 0) {
		this.FrameTimes = make([]float32, this.NumFrames)
		for i := range this.FrameTimes {
			tmp30, err := this._io.ReadF4le()
			if err != nil {
				return err
			}
			this.FrameTimes[i] = tmp30
		}
	}
	if (this.Group != 0) {
		this.GroupTextureData = make([][]byte, this.NumFrames)
		for i := range this.GroupTextureData {
			tmp31, err := this._root.Header.SkinSize()
			if err != nil {
				return err
			}
			tmp32, err := this._io.ReadBytes(int(tmp31))
			if err != nil {
				return err
			}
			tmp32 = tmp32
			this.GroupTextureData[i] = tmp32
		}
	}
	return err
}
type QuakeMdl_MdlFrame struct {
	Type int32
	Min *QuakeMdl_MdlVertex
	Max *QuakeMdl_MdlVertex
	Time []float32
	Frames []*QuakeMdl_MdlSimpleFrame
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl
	_f_numSimpleFrames bool
	numSimpleFrames int32
}
func NewQuakeMdl_MdlFrame() *QuakeMdl_MdlFrame {
	return &QuakeMdl_MdlFrame{
	}
}

func (this *QuakeMdl_MdlFrame) Read(io *kaitai.Stream, parent *QuakeMdl, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Type = int32(tmp33)
	if (this.Type != 0) {
		tmp34 := NewQuakeMdl_MdlVertex()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Min = tmp34
	}
	if (this.Type != 0) {
		tmp35 := NewQuakeMdl_MdlVertex()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Max = tmp35
	}
	if (this.Type != 0) {
		this.Time = make([]float32, this.Type)
		for i := range this.Time {
			tmp36, err := this._io.ReadF4le()
			if err != nil {
				return err
			}
			this.Time[i] = tmp36
		}
	}
	tmp37, err := this.NumSimpleFrames()
	if err != nil {
		return err
	}
	this.Frames = make([]*QuakeMdl_MdlSimpleFrame, tmp37)
	for i := range this.Frames {
		tmp38 := NewQuakeMdl_MdlSimpleFrame()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Frames[i] = tmp38
	}
	return err
}
func (this *QuakeMdl_MdlFrame) NumSimpleFrames() (v int32, err error) {
	if (this._f_numSimpleFrames) {
		return this.numSimpleFrames, nil
	}
	var tmp39 int8;
	if (this.Type == 0) {
		tmp39 = 1
	} else {
		tmp39 = this.Type
	}
	this.numSimpleFrames = int32(tmp39)
	this._f_numSimpleFrames = true
	return this.numSimpleFrames, nil
}
type QuakeMdl_MdlSimpleFrame struct {
	BboxMin *QuakeMdl_MdlVertex
	BboxMax *QuakeMdl_MdlVertex
	Name string
	Vertices []*QuakeMdl_MdlVertex
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl_MdlFrame
}
func NewQuakeMdl_MdlSimpleFrame() *QuakeMdl_MdlSimpleFrame {
	return &QuakeMdl_MdlSimpleFrame{
	}
}

func (this *QuakeMdl_MdlSimpleFrame) Read(io *kaitai.Stream, parent *QuakeMdl_MdlFrame, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp40 := NewQuakeMdl_MdlVertex()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BboxMin = tmp40
	tmp41 := NewQuakeMdl_MdlVertex()
	err = tmp41.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BboxMax = tmp41
	tmp42, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp42 = kaitai.BytesTerminate(kaitai.BytesStripRight(tmp42, 0), 0, false)
	this.Name = string(tmp42)
	this.Vertices = make([]*QuakeMdl_MdlVertex, this._root.Header.NumVerts)
	for i := range this.Vertices {
		tmp43 := NewQuakeMdl_MdlVertex()
		err = tmp43.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vertices[i] = tmp43
	}
	return err
}
type QuakeMdl_MdlTriangle struct {
	FacesFront int32
	Vertices []int32
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl
}
func NewQuakeMdl_MdlTriangle() *QuakeMdl_MdlTriangle {
	return &QuakeMdl_MdlTriangle{
	}
}

func (this *QuakeMdl_MdlTriangle) Read(io *kaitai.Stream, parent *QuakeMdl, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.FacesFront = int32(tmp44)
	this.Vertices = make([]int32, 3)
	for i := range this.Vertices {
		tmp45, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Vertices[i] = tmp45
	}
	return err
}
type QuakeMdl_Vec3 struct {
	X float32
	Y float32
	Z float32
	_io *kaitai.Stream
	_root *QuakeMdl
	_parent *QuakeMdl_MdlHeader
}
func NewQuakeMdl_Vec3() *QuakeMdl_Vec3 {
	return &QuakeMdl_Vec3{
	}
}

func (this *QuakeMdl_Vec3) Read(io *kaitai.Stream, parent *QuakeMdl_MdlHeader, root *QuakeMdl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.X = float32(tmp46)
	tmp47, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Y = float32(tmp47)
	tmp48, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Z = float32(tmp48)
	return err
}
