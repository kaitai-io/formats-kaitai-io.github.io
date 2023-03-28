import kaitai_struct_nim_runtime
import options

type
  Respack* = ref object of KaitaiStruct
    `header`*: Respack_Header
    `json`*: string
    `parent`*: KaitaiStruct
  Respack_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `unknown`*: seq[byte]
    `lenJson`*: uint32
    `md5`*: string
    `parent`*: Respack

proc read*(_: typedesc[Respack], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Respack
proc read*(_: typedesc[Respack_Header], io: KaitaiStream, root: KaitaiStruct, parent: Respack): Respack_Header



##[
Resource file found in CPB firmware archives, mostly used on older CoolPad
phones and/or tablets. The only observed files are called "ResPack.cfg".

]##
proc read*(_: typedesc[Respack], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Respack =
  template this: untyped = result
  this = new(Respack)
  let root = if root == nil: cast[Respack](this) else: cast[Respack](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Respack_Header.read(this.io, this.root, this)
  this.header = headerExpr
  let jsonExpr = encode(this.io.readBytes(int(this.header.lenJson)), "UTF-8")
  this.json = jsonExpr

proc fromFile*(_: typedesc[Respack], filename: string): Respack =
  Respack.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Respack_Header], io: KaitaiStream, root: KaitaiStruct, parent: Respack): Respack_Header =
  template this: untyped = result
  this = new(Respack_Header)
  let root = if root == nil: cast[Respack](this) else: cast[Respack](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let unknownExpr = this.io.readBytes(int(8))
  this.unknown = unknownExpr
  let lenJsonExpr = this.io.readU4le()
  this.lenJson = lenJsonExpr

  ##[
  MD5 of data that follows the header
  ]##
  let md5Expr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.md5 = md5Expr

proc fromFile*(_: typedesc[Respack_Header], filename: string): Respack_Header =
  Respack_Header.read(newKaitaiFileStream(filename), nil, nil)

