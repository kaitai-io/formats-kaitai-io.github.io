// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 * @see <a href="https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout">Source</a>
 */

type GltfBinary_ChunkType int
const (
	GltfBinary_ChunkType__Bin GltfBinary_ChunkType = 5130562
	GltfBinary_ChunkType__Json GltfBinary_ChunkType = 1313821514
)
type GltfBinary struct {
	Header *GltfBinary_Header
	Chunks []*GltfBinary_Chunk
	_io *kaitai.Stream
	_root *GltfBinary
	_parent interface{}
}
func NewGltfBinary() *GltfBinary {
	return &GltfBinary{
	}
}

func (this *GltfBinary) Read(io *kaitai.Stream, parent interface{}, root *GltfBinary) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewGltfBinary_Header()
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
		tmp3 := NewGltfBinary_Chunk()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Chunks = append(this.Chunks, tmp3)
	}
	return err
}
type GltfBinary_Header struct {
	Magic []byte
	Version uint32
	Length uint32
	_io *kaitai.Stream
	_root *GltfBinary
	_parent *GltfBinary
}
func NewGltfBinary_Header() *GltfBinary_Header {
	return &GltfBinary_Header{
	}
}

func (this *GltfBinary_Header) Read(io *kaitai.Stream, parent *GltfBinary, root *GltfBinary) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Magic = tmp4
	if !(bytes.Equal(this.Magic, []uint8{103, 108, 84, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{103, 108, 84, 70}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp6)
	return err
}

/**
 * Indicates the version of the Binary glTF container format.
 * For this specification, should be set to 2.
 */

/**
 * Total length of the Binary glTF, including Header and all Chunks, in bytes.
 */
type GltfBinary_Chunk struct {
	LenData uint32
	Type GltfBinary_ChunkType
	Data interface{}
	_io *kaitai.Stream
	_root *GltfBinary
	_parent *GltfBinary
	_raw_Data []byte
}
func NewGltfBinary_Chunk() *GltfBinary_Chunk {
	return &GltfBinary_Chunk{
	}
}

func (this *GltfBinary_Chunk) Read(io *kaitai.Stream, parent *GltfBinary, root *GltfBinary) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = GltfBinary_ChunkType(tmp8)
	switch (this.Type) {
	case GltfBinary_ChunkType__Json:
		tmp9, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return err
		}
		tmp9 = tmp9
		this._raw_Data = tmp9
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp10 := NewGltfBinary_Json()
		err = tmp10.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp10
	case GltfBinary_ChunkType__Bin:
		tmp11, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return err
		}
		tmp11 = tmp11
		this._raw_Data = tmp11
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp12 := NewGltfBinary_Bin()
		err = tmp12.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp12
	default:
		tmp13, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return err
		}
		tmp13 = tmp13
		this._raw_Data = tmp13
	}
	return err
}
type GltfBinary_Json struct {
	Data string
	_io *kaitai.Stream
	_root *GltfBinary
	_parent *GltfBinary_Chunk
}
func NewGltfBinary_Json() *GltfBinary_Json {
	return &GltfBinary_Json{
	}
}

func (this *GltfBinary_Json) Read(io *kaitai.Stream, parent *GltfBinary_Chunk, root *GltfBinary) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Data = string(tmp14)
	return err
}

/**
 * This is where GLB deviates from being an elegant format.
 * To parse the rest of the file, you have to parse the JSON first.
 */
type GltfBinary_Bin struct {
	Data []byte
	_io *kaitai.Stream
	_root *GltfBinary
	_parent *GltfBinary_Chunk
}
func NewGltfBinary_Bin() *GltfBinary_Bin {
	return &GltfBinary_Bin{
	}
}

func (this *GltfBinary_Bin) Read(io *kaitai.Stream, parent *GltfBinary_Chunk, root *GltfBinary) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Data = tmp15
	return err
}