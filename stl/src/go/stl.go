// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * STL files are used to represent simple 3D models, defined using
 * triangular 3D faces.
 * 
 * Initially it was introduced as native format for 3D Systems
 * Stereolithography CAD system, but due to its extreme simplicity, it
 * was adopted by a wide range of 3D modelling, CAD, rapid prototyping
 * and 3D printing applications as the simplest 3D model exchange
 * format.
 * 
 * STL is extremely bare-bones format: there are no complex headers, no
 * texture / color support, no units specifications, no distinct vertex
 * arrays. Whole model is specified as a collection of triangular
 * faces.
 * 
 * There are two versions of the format (text and binary), this spec
 * describes binary version.
 */
type Stl struct {
	Header []byte
	NumTriangles uint32
	Triangles []*Stl_Triangle
	_io *kaitai.Stream
	_root *Stl
	_parent interface{}
}
func NewStl() *Stl {
	return &Stl{
	}
}

func (this *Stl) Read(io *kaitai.Stream, parent interface{}, root *Stl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(80))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Header = tmp1
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumTriangles = uint32(tmp2)
	this.Triangles = make([]*Stl_Triangle, this.NumTriangles)
	for i := range this.Triangles {
		tmp3 := NewStl_Triangle()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Triangles[i] = tmp3
	}
	return err
}

/**
 * Each STL triangle is defined by its 3 points in 3D space and a
 * normal vector, which is generally used to determine where is
 * "inside" and "outside" of the model.
 */
type Stl_Triangle struct {
	Normal *Stl_Vec3d
	Vertices []*Stl_Vec3d
	Abr uint16
	_io *kaitai.Stream
	_root *Stl
	_parent *Stl
}
func NewStl_Triangle() *Stl_Triangle {
	return &Stl_Triangle{
	}
}

func (this *Stl_Triangle) Read(io *kaitai.Stream, parent *Stl, root *Stl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4 := NewStl_Vec3d()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Normal = tmp4
	this.Vertices = make([]*Stl_Vec3d, 3)
	for i := range this.Vertices {
		tmp5 := NewStl_Vec3d()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vertices[i] = tmp5
	}
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Abr = uint16(tmp6)
	return err
}

/**
 * In theory (per standard), it's "attribute byte count" with
 * no other details given on what "attribute" is and what
 * should be stored in this field.
 * 
 * In practice, software dealing with STL either expected to
 * see 0 here, or uses this 16-bit field per se to store
 * additional attributes (such as RGB color of a vertex or
 * color index).
 */
type Stl_Vec3d struct {
	X float32
	Y float32
	Z float32
	_io *kaitai.Stream
	_root *Stl
	_parent *Stl_Triangle
}
func NewStl_Vec3d() *Stl_Vec3d {
	return &Stl_Vec3d{
	}
}

func (this *Stl_Vec3d) Read(io *kaitai.Stream, parent *Stl_Triangle, root *Stl) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.X = float32(tmp7)
	tmp8, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Y = float32(tmp8)
	tmp9, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Z = float32(tmp9)
	return err
}
