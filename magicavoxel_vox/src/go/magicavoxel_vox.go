// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://ephtracy.github.io/">MagicaVoxel Homepage</a>
 * @see <a href="https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt">Format Description</a>
 */

type MagicavoxelVox_ChunkType int
const (
	MagicavoxelVox_ChunkType__Main MagicavoxelVox_ChunkType = 1296124238
	MagicavoxelVox_ChunkType__Matt MagicavoxelVox_ChunkType = 1296127060
	MagicavoxelVox_ChunkType__Pack MagicavoxelVox_ChunkType = 1346454347
	MagicavoxelVox_ChunkType__Rgba MagicavoxelVox_ChunkType = 1380401729
	MagicavoxelVox_ChunkType__Size MagicavoxelVox_ChunkType = 1397316165
	MagicavoxelVox_ChunkType__Xyzi MagicavoxelVox_ChunkType = 1482250825
)

type MagicavoxelVox_MaterialType int
const (
	MagicavoxelVox_MaterialType__Diffuse MagicavoxelVox_MaterialType = 0
	MagicavoxelVox_MaterialType__Metal MagicavoxelVox_MaterialType = 1
	MagicavoxelVox_MaterialType__Glass MagicavoxelVox_MaterialType = 2
	MagicavoxelVox_MaterialType__Emissive MagicavoxelVox_MaterialType = 3
)

type MagicavoxelVox_PropertyBitsType int
const (
	MagicavoxelVox_PropertyBitsType__Plastic MagicavoxelVox_PropertyBitsType = 1
	MagicavoxelVox_PropertyBitsType__Roughness MagicavoxelVox_PropertyBitsType = 2
	MagicavoxelVox_PropertyBitsType__Specular MagicavoxelVox_PropertyBitsType = 4
	MagicavoxelVox_PropertyBitsType__Ior MagicavoxelVox_PropertyBitsType = 8
	MagicavoxelVox_PropertyBitsType__Attenuation MagicavoxelVox_PropertyBitsType = 16
	MagicavoxelVox_PropertyBitsType__Power MagicavoxelVox_PropertyBitsType = 32
	MagicavoxelVox_PropertyBitsType__Glow MagicavoxelVox_PropertyBitsType = 64
	MagicavoxelVox_PropertyBitsType__IsTotalPower MagicavoxelVox_PropertyBitsType = 128
)
type MagicavoxelVox struct {
	Magic []byte
	Version uint32
	Main *MagicavoxelVox_Chunk
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent interface{}
}
func NewMagicavoxelVox() *MagicavoxelVox {
	return &MagicavoxelVox{
	}
}

func (this *MagicavoxelVox) Read(io *kaitai.Stream, parent interface{}, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{86, 79, 88, 32})) {
		return kaitai.NewValidationNotEqualError([]uint8{86, 79, 88, 32}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp2)
	tmp3 := NewMagicavoxelVox_Chunk()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Main = tmp3
	return err
}

/**
 * 150 expected
 */
type MagicavoxelVox_Chunk struct {
	ChunkId MagicavoxelVox_ChunkType
	NumBytesOfChunkContent uint32
	NumBytesOfChildrenChunks uint32
	ChunkContent interface{}
	ChildrenChunks []*MagicavoxelVox_Chunk
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent interface{}
	_raw_ChunkContent []byte
}
func NewMagicavoxelVox_Chunk() *MagicavoxelVox_Chunk {
	return &MagicavoxelVox_Chunk{
	}
}

func (this *MagicavoxelVox_Chunk) Read(io *kaitai.Stream, parent interface{}, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ChunkId = MagicavoxelVox_ChunkType(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumBytesOfChunkContent = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumBytesOfChildrenChunks = uint32(tmp6)
	if (this.NumBytesOfChunkContent != 0) {
		switch (this.ChunkId) {
		case MagicavoxelVox_ChunkType__Size:
			tmp7, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp7 = tmp7
			this._raw_ChunkContent = tmp7
			_io__raw_ChunkContent := kaitai.NewStream(bytes.NewReader(this._raw_ChunkContent))
			tmp8 := NewMagicavoxelVox_Size()
			err = tmp8.Read(_io__raw_ChunkContent, this, this._root)
			if err != nil {
				return err
			}
			this.ChunkContent = tmp8
		case MagicavoxelVox_ChunkType__Matt:
			tmp9, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp9 = tmp9
			this._raw_ChunkContent = tmp9
			_io__raw_ChunkContent := kaitai.NewStream(bytes.NewReader(this._raw_ChunkContent))
			tmp10 := NewMagicavoxelVox_Matt()
			err = tmp10.Read(_io__raw_ChunkContent, this, this._root)
			if err != nil {
				return err
			}
			this.ChunkContent = tmp10
		case MagicavoxelVox_ChunkType__Rgba:
			tmp11, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp11 = tmp11
			this._raw_ChunkContent = tmp11
			_io__raw_ChunkContent := kaitai.NewStream(bytes.NewReader(this._raw_ChunkContent))
			tmp12 := NewMagicavoxelVox_Rgba()
			err = tmp12.Read(_io__raw_ChunkContent, this, this._root)
			if err != nil {
				return err
			}
			this.ChunkContent = tmp12
		case MagicavoxelVox_ChunkType__Xyzi:
			tmp13, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp13 = tmp13
			this._raw_ChunkContent = tmp13
			_io__raw_ChunkContent := kaitai.NewStream(bytes.NewReader(this._raw_ChunkContent))
			tmp14 := NewMagicavoxelVox_Xyzi()
			err = tmp14.Read(_io__raw_ChunkContent, this, this._root)
			if err != nil {
				return err
			}
			this.ChunkContent = tmp14
		case MagicavoxelVox_ChunkType__Pack:
			tmp15, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp15 = tmp15
			this._raw_ChunkContent = tmp15
			_io__raw_ChunkContent := kaitai.NewStream(bytes.NewReader(this._raw_ChunkContent))
			tmp16 := NewMagicavoxelVox_Pack()
			err = tmp16.Read(_io__raw_ChunkContent, this, this._root)
			if err != nil {
				return err
			}
			this.ChunkContent = tmp16
		default:
			tmp17, err := this._io.ReadBytes(int(this.NumBytesOfChunkContent))
			if err != nil {
				return err
			}
			tmp17 = tmp17
			this._raw_ChunkContent = tmp17
		}
	}
	if (this.NumBytesOfChildrenChunks != 0) {
		for i := 1;; i++ {
			tmp18, err := this._io.EOF()
			if err != nil {
				return err
			}
			if tmp18 {
				break
			}
			tmp19 := NewMagicavoxelVox_Chunk()
			err = tmp19.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.ChildrenChunks = append(this.ChildrenChunks, tmp19)
		}
	}
	return err
}
type MagicavoxelVox_Size struct {
	SizeX uint32
	SizeY uint32
	SizeZ uint32
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Chunk
}
func NewMagicavoxelVox_Size() *MagicavoxelVox_Size {
	return &MagicavoxelVox_Size{
	}
}

func (this *MagicavoxelVox_Size) Read(io *kaitai.Stream, parent *MagicavoxelVox_Chunk, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeX = uint32(tmp20)
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeY = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SizeZ = uint32(tmp22)
	return err
}
type MagicavoxelVox_Rgba struct {
	Colors []*MagicavoxelVox_Color
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Chunk
}
func NewMagicavoxelVox_Rgba() *MagicavoxelVox_Rgba {
	return &MagicavoxelVox_Rgba{
	}
}

func (this *MagicavoxelVox_Rgba) Read(io *kaitai.Stream, parent *MagicavoxelVox_Chunk, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Colors = make([]*MagicavoxelVox_Color, 256)
	for i := range this.Colors {
		tmp23 := NewMagicavoxelVox_Color()
		err = tmp23.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Colors[i] = tmp23
	}
	return err
}
type MagicavoxelVox_Pack struct {
	NumModels uint32
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Chunk
}
func NewMagicavoxelVox_Pack() *MagicavoxelVox_Pack {
	return &MagicavoxelVox_Pack{
	}
}

func (this *MagicavoxelVox_Pack) Read(io *kaitai.Stream, parent *MagicavoxelVox_Chunk, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumModels = uint32(tmp24)
	return err
}
type MagicavoxelVox_Matt struct {
	Id uint32
	MaterialType MagicavoxelVox_MaterialType
	MaterialWeight float32
	PropertyBits uint32
	Plastic float32
	Roughness float32
	Specular float32
	Ior float32
	Attenuation float32
	Power float32
	Glow float32
	IsTotalPower float32
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Chunk
	_f_hasIsTotalPower bool
	hasIsTotalPower bool
	_f_hasPlastic bool
	hasPlastic bool
	_f_hasAttenuation bool
	hasAttenuation bool
	_f_hasPower bool
	hasPower bool
	_f_hasRoughness bool
	hasRoughness bool
	_f_hasSpecular bool
	hasSpecular bool
	_f_hasIor bool
	hasIor bool
	_f_hasGlow bool
	hasGlow bool
}
func NewMagicavoxelVox_Matt() *MagicavoxelVox_Matt {
	return &MagicavoxelVox_Matt{
	}
}

func (this *MagicavoxelVox_Matt) Read(io *kaitai.Stream, parent *MagicavoxelVox_Chunk, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Id = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MaterialType = MagicavoxelVox_MaterialType(tmp26)
	tmp27, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.MaterialWeight = float32(tmp27)
	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PropertyBits = uint32(tmp28)
	tmp29, err := this.HasPlastic()
	if err != nil {
		return err
	}
	if (tmp29) {
		tmp30, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Plastic = float32(tmp30)
	}
	tmp31, err := this.HasRoughness()
	if err != nil {
		return err
	}
	if (tmp31) {
		tmp32, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Roughness = float32(tmp32)
	}
	tmp33, err := this.HasSpecular()
	if err != nil {
		return err
	}
	if (tmp33) {
		tmp34, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Specular = float32(tmp34)
	}
	tmp35, err := this.HasIor()
	if err != nil {
		return err
	}
	if (tmp35) {
		tmp36, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Ior = float32(tmp36)
	}
	tmp37, err := this.HasAttenuation()
	if err != nil {
		return err
	}
	if (tmp37) {
		tmp38, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Attenuation = float32(tmp38)
	}
	tmp39, err := this.HasPower()
	if err != nil {
		return err
	}
	if (tmp39) {
		tmp40, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Power = float32(tmp40)
	}
	tmp41, err := this.HasGlow()
	if err != nil {
		return err
	}
	if (tmp41) {
		tmp42, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Glow = float32(tmp42)
	}
	tmp43, err := this.HasIsTotalPower()
	if err != nil {
		return err
	}
	if (tmp43) {
		tmp44, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.IsTotalPower = float32(tmp44)
	}
	return err
}
func (this *MagicavoxelVox_Matt) HasIsTotalPower() (v bool, err error) {
	if (this._f_hasIsTotalPower) {
		return this.hasIsTotalPower, nil
	}
	this.hasIsTotalPower = bool((this.PropertyBits & 128) != 0)
	this._f_hasIsTotalPower = true
	return this.hasIsTotalPower, nil
}
func (this *MagicavoxelVox_Matt) HasPlastic() (v bool, err error) {
	if (this._f_hasPlastic) {
		return this.hasPlastic, nil
	}
	this.hasPlastic = bool((this.PropertyBits & 1) != 0)
	this._f_hasPlastic = true
	return this.hasPlastic, nil
}
func (this *MagicavoxelVox_Matt) HasAttenuation() (v bool, err error) {
	if (this._f_hasAttenuation) {
		return this.hasAttenuation, nil
	}
	this.hasAttenuation = bool((this.PropertyBits & 16) != 0)
	this._f_hasAttenuation = true
	return this.hasAttenuation, nil
}
func (this *MagicavoxelVox_Matt) HasPower() (v bool, err error) {
	if (this._f_hasPower) {
		return this.hasPower, nil
	}
	this.hasPower = bool((this.PropertyBits & 32) != 0)
	this._f_hasPower = true
	return this.hasPower, nil
}
func (this *MagicavoxelVox_Matt) HasRoughness() (v bool, err error) {
	if (this._f_hasRoughness) {
		return this.hasRoughness, nil
	}
	this.hasRoughness = bool((this.PropertyBits & 2) != 0)
	this._f_hasRoughness = true
	return this.hasRoughness, nil
}
func (this *MagicavoxelVox_Matt) HasSpecular() (v bool, err error) {
	if (this._f_hasSpecular) {
		return this.hasSpecular, nil
	}
	this.hasSpecular = bool((this.PropertyBits & 4) != 0)
	this._f_hasSpecular = true
	return this.hasSpecular, nil
}
func (this *MagicavoxelVox_Matt) HasIor() (v bool, err error) {
	if (this._f_hasIor) {
		return this.hasIor, nil
	}
	this.hasIor = bool((this.PropertyBits & 8) != 0)
	this._f_hasIor = true
	return this.hasIor, nil
}
func (this *MagicavoxelVox_Matt) HasGlow() (v bool, err error) {
	if (this._f_hasGlow) {
		return this.hasGlow, nil
	}
	this.hasGlow = bool((this.PropertyBits & 64) != 0)
	this._f_hasGlow = true
	return this.hasGlow, nil
}
type MagicavoxelVox_Xyzi struct {
	NumVoxels uint32
	Voxels []*MagicavoxelVox_Voxel
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Chunk
}
func NewMagicavoxelVox_Xyzi() *MagicavoxelVox_Xyzi {
	return &MagicavoxelVox_Xyzi{
	}
}

func (this *MagicavoxelVox_Xyzi) Read(io *kaitai.Stream, parent *MagicavoxelVox_Chunk, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumVoxels = uint32(tmp45)
	this.Voxels = make([]*MagicavoxelVox_Voxel, this.NumVoxels)
	for i := range this.Voxels {
		tmp46 := NewMagicavoxelVox_Voxel()
		err = tmp46.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Voxels[i] = tmp46
	}
	return err
}
type MagicavoxelVox_Color struct {
	R uint8
	G uint8
	B uint8
	A uint8
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Rgba
}
func NewMagicavoxelVox_Color() *MagicavoxelVox_Color {
	return &MagicavoxelVox_Color{
	}
}

func (this *MagicavoxelVox_Color) Read(io *kaitai.Stream, parent *MagicavoxelVox_Rgba, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp47, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.R = tmp47
	tmp48, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.G = tmp48
	tmp49, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp49
	tmp50, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.A = tmp50
	return err
}
type MagicavoxelVox_Voxel struct {
	X uint8
	Y uint8
	Z uint8
	ColorIndex uint8
	_io *kaitai.Stream
	_root *MagicavoxelVox
	_parent *MagicavoxelVox_Xyzi
}
func NewMagicavoxelVox_Voxel() *MagicavoxelVox_Voxel {
	return &MagicavoxelVox_Voxel{
	}
}

func (this *MagicavoxelVox_Voxel) Read(io *kaitai.Stream, parent *MagicavoxelVox_Xyzi, root *MagicavoxelVox) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp51, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.X = tmp51
	tmp52, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Y = tmp52
	tmp53, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Z = tmp53
	tmp54, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ColorIndex = tmp54
	return err
}
