import kaitai_struct_nim_runtime
import options

type
  AndesFirmware* = ref object of KaitaiStruct
    `imageHeader`*: AndesFirmware_ImageHeader
    `ilm`*: seq[byte]
    `dlm`*: seq[byte]
    `parent`*: KaitaiStruct
    `rawImageHeader`*: seq[byte]
  AndesFirmware_ImageHeader* = ref object of KaitaiStruct
    `ilmLen`*: uint32
    `dlmLen`*: uint32
    `fwVer`*: uint16
    `buildVer`*: uint16
    `extra`*: uint32
    `buildTime`*: string
    `parent`*: AndesFirmware

proc read*(_: typedesc[AndesFirmware], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndesFirmware
proc read*(_: typedesc[AndesFirmware_ImageHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndesFirmware): AndesFirmware_ImageHeader



##[
Firmware image found with MediaTek MT76xx wifi chipsets.
]##
proc read*(_: typedesc[AndesFirmware], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndesFirmware =
  template this: untyped = result
  this = new(AndesFirmware)
  let root = if root == nil: cast[AndesFirmware](this) else: cast[AndesFirmware](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawImageHeaderExpr = this.io.readBytes(int(32))
  this.rawImageHeader = rawImageHeaderExpr
  let rawImageHeaderIo = newKaitaiStream(rawImageHeaderExpr)
  let imageHeaderExpr = AndesFirmware_ImageHeader.read(rawImageHeaderIo, this.root, this)
  this.imageHeader = imageHeaderExpr
  let ilmExpr = this.io.readBytes(int(this.imageHeader.ilmLen))
  this.ilm = ilmExpr
  let dlmExpr = this.io.readBytes(int(this.imageHeader.dlmLen))
  this.dlm = dlmExpr

proc fromFile*(_: typedesc[AndesFirmware], filename: string): AndesFirmware =
  AndesFirmware.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndesFirmware_ImageHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndesFirmware): AndesFirmware_ImageHeader =
  template this: untyped = result
  this = new(AndesFirmware_ImageHeader)
  let root = if root == nil: cast[AndesFirmware](this) else: cast[AndesFirmware](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ilmLenExpr = this.io.readU4le()
  this.ilmLen = ilmLenExpr
  let dlmLenExpr = this.io.readU4le()
  this.dlmLen = dlmLenExpr
  let fwVerExpr = this.io.readU2le()
  this.fwVer = fwVerExpr
  let buildVerExpr = this.io.readU2le()
  this.buildVer = buildVerExpr
  let extraExpr = this.io.readU4le()
  this.extra = extraExpr
  let buildTimeExpr = encode(this.io.readBytes(int(16)), "UTF-8")
  this.buildTime = buildTimeExpr

proc fromFile*(_: typedesc[AndesFirmware_ImageHeader], filename: string): AndesFirmware_ImageHeader =
  AndesFirmware_ImageHeader.read(newKaitaiFileStream(filename), nil, nil)

