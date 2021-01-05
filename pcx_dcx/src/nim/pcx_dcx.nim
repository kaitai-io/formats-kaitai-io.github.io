import kaitai_struct_nim_runtime
import options
import pcx

import "pcx"
type
  PcxDcx* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `files`*: seq[PcxDcx_PcxOffset]
    `parent`*: KaitaiStruct
  PcxDcx_PcxOffset* = ref object of KaitaiStruct
    `ofsBody`*: uint32
    `parent`*: PcxDcx
    `bodyInst`*: Pcx

proc read*(_: typedesc[PcxDcx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcxDcx
proc read*(_: typedesc[PcxDcx_PcxOffset], io: KaitaiStream, root: KaitaiStruct, parent: PcxDcx): PcxDcx_PcxOffset

proc body*(this: PcxDcx_PcxOffset): Pcx


##[
DCX is a simple extension of PCX image format allowing to bundle
many PCX images (typically, pages of a document) in one file. It saw
some limited use in DOS-era fax software, but was largely
superseded with multi-page TIFFs and PDFs since then.

]##
proc read*(_: typedesc[PcxDcx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcxDcx =
  template this: untyped = result
  this = new(PcxDcx)
  let root = if root == nil: cast[PcxDcx](this) else: cast[PcxDcx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  block:
    var i: int
    while true:
      let it = PcxDcx_PcxOffset.read(this.io, this.root, this)
      this.files.add(it)
      if it.ofsBody == 0:
        break
      inc i

proc fromFile*(_: typedesc[PcxDcx], filename: string): PcxDcx =
  PcxDcx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PcxDcx_PcxOffset], io: KaitaiStream, root: KaitaiStruct, parent: PcxDcx): PcxDcx_PcxOffset =
  template this: untyped = result
  this = new(PcxDcx_PcxOffset)
  let root = if root == nil: cast[PcxDcx](this) else: cast[PcxDcx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsBodyExpr = this.io.readU4le()
  this.ofsBody = ofsBodyExpr

proc body(this: PcxDcx_PcxOffset): Pcx = 
  if this.bodyInst != nil:
    return this.bodyInst
  if this.ofsBody != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.ofsBody))
    let bodyInstExpr = Pcx.read(this.io, this.root, this)
    this.bodyInst = bodyInstExpr
    this.io.seek(pos)
  if this.bodyInst != nil:
    return this.bodyInst

proc fromFile*(_: typedesc[PcxDcx_PcxOffset], filename: string): PcxDcx_PcxOffset =
  PcxDcx_PcxOffset.read(newKaitaiFileStream(filename), nil, nil)

