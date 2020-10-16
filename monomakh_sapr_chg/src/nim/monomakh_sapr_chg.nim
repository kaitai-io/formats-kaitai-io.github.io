import kaitai_struct_nim_runtime
import options

type
  MonomakhSaprChg* = ref object of KaitaiStruct
    `title`*: string
    `ent`*: seq[MonomakhSaprChg_Block]
    `parent`*: KaitaiStruct
  MonomakhSaprChg_Block* = ref object of KaitaiStruct
    `header`*: string
    `fileSize`*: uint64
    `file`*: seq[byte]
    `parent`*: MonomakhSaprChg

proc read*(_: typedesc[MonomakhSaprChg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MonomakhSaprChg
proc read*(_: typedesc[MonomakhSaprChg_Block], io: KaitaiStream, root: KaitaiStruct, parent: MonomakhSaprChg): MonomakhSaprChg_Block



##[
CHG is a container format file used by
[MONOMAKH-SAPR](https://www.liraland.com/mono/index.php), a software
package for analysis & design of reinforced concrete multi-storey
buildings with arbitrary configuration in plan.

CHG is a simple container, which bundles several project files
together.

Written and tested by Vladimir Shulzhitskiy, 2017

]##
proc read*(_: typedesc[MonomakhSaprChg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MonomakhSaprChg =
  template this: untyped = result
  this = new(MonomakhSaprChg)
  let root = if root == nil: cast[MonomakhSaprChg](this) else: cast[MonomakhSaprChg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let titleExpr = encode(this.io.readBytes(int(10)), "ascii")
  this.title = titleExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = MonomakhSaprChg_Block.read(this.io, this.root, this)
      this.ent.add(it)
      inc i

proc fromFile*(_: typedesc[MonomakhSaprChg], filename: string): MonomakhSaprChg =
  MonomakhSaprChg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MonomakhSaprChg_Block], io: KaitaiStream, root: KaitaiStruct, parent: MonomakhSaprChg): MonomakhSaprChg_Block =
  template this: untyped = result
  this = new(MonomakhSaprChg_Block)
  let root = if root == nil: cast[MonomakhSaprChg](this) else: cast[MonomakhSaprChg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = encode(this.io.readBytes(int(13)), "ascii")
  this.header = headerExpr
  let fileSizeExpr = this.io.readU8le()
  this.fileSize = fileSizeExpr
  let fileExpr = this.io.readBytes(int(this.fileSize))
  this.file = fileExpr

proc fromFile*(_: typedesc[MonomakhSaprChg_Block], filename: string): MonomakhSaprChg_Block =
  MonomakhSaprChg_Block.read(newKaitaiFileStream(filename), nil, nil)

