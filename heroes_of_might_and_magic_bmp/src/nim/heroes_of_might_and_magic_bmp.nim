import kaitai_struct_nim_runtime
import options

type
  HeroesOfMightAndMagicBmp* = ref object of KaitaiStruct
    `magic`*: uint16
    `width`*: uint16
    `height`*: uint16
    `data`*: seq[byte]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[HeroesOfMightAndMagicBmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeroesOfMightAndMagicBmp


proc read*(_: typedesc[HeroesOfMightAndMagicBmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeroesOfMightAndMagicBmp =
  template this: untyped = result
  this = new(HeroesOfMightAndMagicBmp)
  let root = if root == nil: cast[HeroesOfMightAndMagicBmp](this) else: cast[HeroesOfMightAndMagicBmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readU2le()
  this.magic = magicExpr
  let widthExpr = this.io.readU2le()
  this.width = widthExpr
  let heightExpr = this.io.readU2le()
  this.height = heightExpr
  let dataExpr = this.io.readBytes(int((this.width * this.height)))
  this.data = dataExpr

proc fromFile*(_: typedesc[HeroesOfMightAndMagicBmp], filename: string): HeroesOfMightAndMagicBmp =
  HeroesOfMightAndMagicBmp.read(newKaitaiFileStream(filename), nil, nil)

