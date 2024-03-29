// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Quake 1 model format is used to store 3D models completely with
 * textures and animations used in the game. Quake 1 engine
 * (retroactively named "idtech2") is a popular 3D engine first used
 * for Quake game by id Software in 1996.
 * 
 * Model is constructed traditionally from vertices in 3D space, faces
 * which connect vertices, textures ("skins", i.e. 2D bitmaps) and
 * texture UV mapping information. As opposed to more modern,
 * bones-based animation formats, Quake model was animated by changing
 * locations of all vertices it included in 3D space, frame by frame.
 * 
 * File format stores:
 * 
 * * "Skins" — effectively 2D bitmaps which will be used as a
 *   texture. Every model can have multiple skins — e.g. these can be
 *   switched to depict various levels of damage to the
 *   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
 *   palette, subject to lighting and gamma adjustment when rendering
 *   in the game using colormap technique.
 * * "Texture coordinates" — UV coordinates, mapping 3D vertices to
 *   skin coordinates.
 * * "Triangles" — triangular faces connecting 3D vertices.
 * * "Frames" — locations of vertices in 3D space; can include more
 *   than one frame, thus allowing representation of different frames
 *   for animation purposes.
 * 
 * Originally, 3D geometry for models for Quake was designed in [Alias
 * PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
 * precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
 * 3D-related part of Quake model format followed closely Alias TRI
 * format, and Quake development utilities included a converter from Alias
 * TRI (`modelgen`).
 * 
 * Skins (textures) where prepared as LBM bitmaps with the help from
 * `texmap` utility in the same development utilities toolkit.
 */
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
	for i := 0; i < int(this.Header.NumSkins); i++ {
		_ = i
		tmp2 := NewQuakeMdl_MdlSkin()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Skins = append(this.Skins, tmp2)
	}
	for i := 0; i < int(this.Header.NumVerts); i++ {
		_ = i
		tmp3 := NewQuakeMdl_MdlTexcoord()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.TextureCoordinates = append(this.TextureCoordinates, tmp3)
	}
	for i := 0; i < int(this.Header.NumTris); i++ {
		_ = i
		tmp4 := NewQuakeMdl_MdlTriangle()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Triangles = append(this.Triangles, tmp4)
	}
	for i := 0; i < int(this.Header.NumFrames); i++ {
		_ = i
		tmp5 := NewQuakeMdl_MdlFrame()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Frames = append(this.Frames, tmp5)
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

	for i := 0; i < int(3); i++ {
		_ = i
		tmp6, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Values = append(this.Values, tmp6)
	}
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NormalIndex = tmp7
	return err
}

/**
 * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83">Source</a>
 * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2">Source</a>
 */
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

/**
 * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75">Source</a>
 * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0">Source</a>
 */
type QuakeMdl_MdlHeader struct {
	Ident []byte
	Version int32
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
	tmp12, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Version = int32(tmp12)
	if !(this.Version == 6) {
		return kaitai.NewValidationNotEqualError(6, this.Version, this._io, "/types/mdl_header/seq/1")
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

/**
 * Skin size in pixels.
 */
func (this *QuakeMdl_MdlHeader) SkinSize() (v int, err error) {
	if (this._f_skinSize) {
		return this.skinSize, nil
	}
	this.skinSize = int((this.SkinWidth * this.SkinHeight))
	this._f_skinSize = true
	return this.skinSize, nil
}

/**
 * Magic signature bytes that every Quake model must
 * have. "IDPO" is short for "IDPOLYHEADER".
 * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133">Source</a>
 */

/**
 * Global scaling factors in 3 dimensions for whole model. When
 * represented in 3D world, this model local coordinates will
 * be multiplied by these factors.
 */

/**
 * Number of skins (=texture bitmaps) included in this model.
 */

/**
 * Width (U coordinate max) of every skin (=texture) in pixels.
 */

/**
 * Height (V coordinate max) of every skin (=texture) in
 * pixels.
 */

/**
 * Number of vertices in this model. Note that this is constant
 * for all the animation frames and all textures.
 */

/**
 * Number of triangles (=triangular faces) in this model.
 */

/**
 * Number of animation frames included in this model.
 */
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
		for i := 0; i < int(this.NumFrames); i++ {
			_ = i
			tmp30, err := this._io.ReadF4le()
			if err != nil {
				return err
			}
			this.FrameTimes = append(this.FrameTimes, tmp30)
		}
	}
	if (this.Group != 0) {
		for i := 0; i < int(this.NumFrames); i++ {
			_ = i
			tmp31, err := this._root.Header.SkinSize()
			if err != nil {
				return err
			}
			tmp32, err := this._io.ReadBytes(int(tmp31))
			if err != nil {
				return err
			}
			tmp32 = tmp32
			this.GroupTextureData = append(this.GroupTextureData, tmp32)
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
		for i := 0; i < int(this.Type); i++ {
			_ = i
			tmp36, err := this._io.ReadF4le()
			if err != nil {
				return err
			}
			this.Time = append(this.Time, tmp36)
		}
	}
	tmp37, err := this.NumSimpleFrames()
	if err != nil {
		return err
	}
	for i := 0; i < int(tmp37); i++ {
		_ = i
		tmp38 := NewQuakeMdl_MdlSimpleFrame()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Frames = append(this.Frames, tmp38)
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
	for i := 0; i < int(this._root.Header.NumVerts); i++ {
		_ = i
		tmp43 := NewQuakeMdl_MdlVertex()
		err = tmp43.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vertices = append(this.Vertices, tmp43)
	}
	return err
}

/**
 * Represents a triangular face, connecting 3 vertices, referenced
 * by their indexes.
 * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88">Source</a>
 * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3">Source</a>
 */
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
	for i := 0; i < int(3); i++ {
		_ = i
		tmp45, err := this._io.ReadS4le()
		if err != nil {
			return err
		}
		this.Vertices = append(this.Vertices, tmp45)
	}
	return err
}

/**
 * Basic 3D vector (x, y, z) using single-precision floating point
 * coordnates. Can be used to specify a point in 3D space,
 * direction, scaling factor, etc.
 */
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
