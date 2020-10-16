import kaitai_struct_nim_runtime
import options

type
  Stl* = ref object of KaitaiStruct
    `header`*: seq[byte]
    `numTriangles`*: uint32
    `triangles`*: seq[Stl_Triangle]
    `parent`*: KaitaiStruct
  Stl_Triangle* = ref object of KaitaiStruct
    `normal`*: Stl_Vec3d
    `vertices`*: seq[Stl_Vec3d]
    `abr`*: uint16
    `parent`*: Stl
  Stl_Vec3d* = ref object of KaitaiStruct
    `x`*: float32
    `y`*: float32
    `z`*: float32
    `parent`*: Stl_Triangle

proc read*(_: typedesc[Stl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Stl
proc read*(_: typedesc[Stl_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: Stl): Stl_Triangle
proc read*(_: typedesc[Stl_Vec3d], io: KaitaiStream, root: KaitaiStruct, parent: Stl_Triangle): Stl_Vec3d



##[
STL files are used to represent simple 3D models, defined using
triangular 3D faces.

Initially it was introduced as native format for 3D Systems
Stereolithography CAD system, but due to its extreme simplicity, it
was adopted by a wide range of 3D modelling, CAD, rapid prototyping
and 3D printing applications as the simplest 3D model exchange
format.

STL is extremely bare-bones format: there are no complex headers, no
texture / color support, no units specifications, no distinct vertex
arrays. Whole model is specified as a collection of triangular
faces.

There are two versions of the format (text and binary), this spec
describes binary version.

]##
proc read*(_: typedesc[Stl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Stl =
  template this: untyped = result
  this = new(Stl)
  let root = if root == nil: cast[Stl](this) else: cast[Stl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = this.io.readBytes(int(80))
  this.header = headerExpr
  let numTrianglesExpr = this.io.readU4le()
  this.numTriangles = numTrianglesExpr
  for i in 0 ..< int(this.numTriangles):
    let it = Stl_Triangle.read(this.io, this.root, this)
    this.triangles.add(it)

proc fromFile*(_: typedesc[Stl], filename: string): Stl =
  Stl.read(newKaitaiFileStream(filename), nil, nil)


##[
Each STL triangle is defined by its 3 points in 3D space and a
normal vector, which is generally used to determine where is
"inside" and "outside" of the model.

]##
proc read*(_: typedesc[Stl_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: Stl): Stl_Triangle =
  template this: untyped = result
  this = new(Stl_Triangle)
  let root = if root == nil: cast[Stl](this) else: cast[Stl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let normalExpr = Stl_Vec3d.read(this.io, this.root, this)
  this.normal = normalExpr
  for i in 0 ..< int(3):
    let it = Stl_Vec3d.read(this.io, this.root, this)
    this.vertices.add(it)

  ##[
  In theory (per standard), it's "attribute byte count" with
no other details given on what "attribute" is and what
should be stored in this field.

In practice, software dealing with STL either expected to
see 0 here, or uses this 16-bit field per se to store
additional attributes (such as RGB color of a vertex or
color index).

  ]##
  let abrExpr = this.io.readU2le()
  this.abr = abrExpr

proc fromFile*(_: typedesc[Stl_Triangle], filename: string): Stl_Triangle =
  Stl_Triangle.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Stl_Vec3d], io: KaitaiStream, root: KaitaiStruct, parent: Stl_Triangle): Stl_Vec3d =
  template this: untyped = result
  this = new(Stl_Vec3d)
  let root = if root == nil: cast[Stl](this) else: cast[Stl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF4le()
  this.x = xExpr
  let yExpr = this.io.readF4le()
  this.y = yExpr
  let zExpr = this.io.readF4le()
  this.z = zExpr

proc fromFile*(_: typedesc[Stl_Vec3d], filename: string): Stl_Vec3d =
  Stl_Vec3d.read(newKaitaiFileStream(filename), nil, nil)

