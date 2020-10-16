import kaitai_struct_nim_runtime
import options

type
  BytesWithIo* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[BytesWithIo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BytesWithIo



##[
Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.

]##
proc read*(_: typedesc[BytesWithIo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BytesWithIo =
  template this: untyped = result
  this = new(BytesWithIo)
  let root = if root == nil: cast[BytesWithIo](this) else: cast[BytesWithIo](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The actual data.
  ]##
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[BytesWithIo], filename: string): BytesWithIo =
  BytesWithIo.read(newKaitaiFileStream(filename), nil, nil)

