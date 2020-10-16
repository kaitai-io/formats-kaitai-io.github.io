import kaitai_struct_nim_runtime
import options

type
  Gif* = ref object of KaitaiStruct
    `hdr`*: Gif_Header
    `logicalScreenDescriptor`*: Gif_LogicalScreenDescriptorStruct
    `globalColorTable`*: Gif_ColorTable
    `blocks`*: seq[Gif_Block]
    `parent`*: KaitaiStruct
    `rawGlobalColorTable`*: seq[byte]
  Gif_BlockType* = enum
    extension = 33
    local_image_descriptor = 44
    end_of_file = 59
  Gif_ExtensionLabel* = enum
    graphic_control = 249
    comment = 254
    application = 255
  Gif_ImageData* = ref object of KaitaiStruct
    `lzwMinCodeSize`*: uint8
    `subblocks`*: Gif_Subblocks
    `parent`*: Gif_LocalImageDescriptor
  Gif_ColorTableEntry* = ref object of KaitaiStruct
    `red`*: uint8
    `green`*: uint8
    `blue`*: uint8
    `parent`*: Gif_ColorTable
  Gif_LogicalScreenDescriptorStruct* = ref object of KaitaiStruct
    `screenWidth`*: uint16
    `screenHeight`*: uint16
    `flags`*: uint8
    `bgColorIndex`*: uint8
    `pixelAspectRatio`*: uint8
    `parent`*: Gif
    `hasColorTableInst`*: bool
    `colorTableSizeInst`*: int
  Gif_LocalImageDescriptor* = ref object of KaitaiStruct
    `left`*: uint16
    `top`*: uint16
    `width`*: uint16
    `height`*: uint16
    `flags`*: uint8
    `localColorTable`*: Gif_ColorTable
    `imageData`*: Gif_ImageData
    `parent`*: Gif_Block
    `rawLocalColorTable`*: seq[byte]
    `hasColorTableInst`*: bool
    `hasInterlaceInst`*: bool
    `hasSortedColorTableInst`*: bool
    `colorTableSizeInst`*: int
  Gif_Block* = ref object of KaitaiStruct
    `blockType`*: Gif_BlockType
    `body`*: KaitaiStruct
    `parent`*: Gif
  Gif_ColorTable* = ref object of KaitaiStruct
    `entries`*: seq[Gif_ColorTableEntry]
    `parent`*: KaitaiStruct
  Gif_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: string
    `parent`*: Gif
  Gif_ExtGraphicControl* = ref object of KaitaiStruct
    `blockSize`*: seq[byte]
    `flags`*: uint8
    `delayTime`*: uint16
    `transparentIdx`*: uint8
    `terminator`*: seq[byte]
    `parent`*: Gif_Extension
    `transparentColorFlagInst`*: bool
    `userInputFlagInst`*: bool
  Gif_Subblock* = ref object of KaitaiStruct
    `lenBytes`*: uint8
    `bytes`*: seq[byte]
    `parent`*: KaitaiStruct
  Gif_ExtApplication* = ref object of KaitaiStruct
    `applicationId`*: Gif_Subblock
    `subblocks`*: seq[Gif_Subblock]
    `parent`*: Gif_Extension
  Gif_Subblocks* = ref object of KaitaiStruct
    `entries`*: seq[Gif_Subblock]
    `parent`*: KaitaiStruct
  Gif_Extension* = ref object of KaitaiStruct
    `label`*: Gif_ExtensionLabel
    `body`*: KaitaiStruct
    `parent`*: Gif_Block

proc read*(_: typedesc[Gif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif
proc read*(_: typedesc[Gif_ImageData], io: KaitaiStream, root: KaitaiStruct, parent: Gif_LocalImageDescriptor): Gif_ImageData
proc read*(_: typedesc[Gif_ColorTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gif_ColorTable): Gif_ColorTableEntry
proc read*(_: typedesc[Gif_LogicalScreenDescriptorStruct], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_LogicalScreenDescriptorStruct
proc read*(_: typedesc[Gif_LocalImageDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Block): Gif_LocalImageDescriptor
proc read*(_: typedesc[Gif_Block], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_Block
proc read*(_: typedesc[Gif_ColorTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_ColorTable
proc read*(_: typedesc[Gif_Header], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_Header
proc read*(_: typedesc[Gif_ExtGraphicControl], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Extension): Gif_ExtGraphicControl
proc read*(_: typedesc[Gif_Subblock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_Subblock
proc read*(_: typedesc[Gif_ExtApplication], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Extension): Gif_ExtApplication
proc read*(_: typedesc[Gif_Subblocks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_Subblocks
proc read*(_: typedesc[Gif_Extension], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Block): Gif_Extension

proc hasColorTable*(this: Gif_LogicalScreenDescriptorStruct): bool
proc colorTableSize*(this: Gif_LogicalScreenDescriptorStruct): int
proc hasColorTable*(this: Gif_LocalImageDescriptor): bool
proc hasInterlace*(this: Gif_LocalImageDescriptor): bool
proc hasSortedColorTable*(this: Gif_LocalImageDescriptor): bool
proc colorTableSize*(this: Gif_LocalImageDescriptor): int
proc transparentColorFlag*(this: Gif_ExtGraphicControl): bool
proc userInputFlag*(this: Gif_ExtGraphicControl): bool


##[
GIF (Graphics Interchange Format) is an image file format, developed
in 1987. It became popular in 1990s as one of the main image formats
used in World Wide Web.

GIF format allows encoding of palette-based images up to 256 colors
(each of the colors can be chosen from a 24-bit RGB
colorspace). Image data stream uses LZW (Lempel–Ziv–Welch) lossless
compression.

Over the years, several version of the format were published and
several extensions to it were made, namely, a popular Netscape
extension that allows to store several images in one file, switching
between them, which produces crude form of animation.

Structurally, format consists of several mandatory headers and then
a stream of blocks follows. Blocks can carry additional
metainformation or image data.

]##
proc read*(_: typedesc[Gif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif =
  template this: untyped = result
  this = new(Gif)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hdrExpr = Gif_Header.read(this.io, this.root, this)
  this.hdr = hdrExpr
  let logicalScreenDescriptorExpr = Gif_LogicalScreenDescriptorStruct.read(this.io, this.root, this)
  this.logicalScreenDescriptor = logicalScreenDescriptorExpr

  ##[
  @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
  ]##
  if this.logicalScreenDescriptor.hasColorTable:
    let rawGlobalColorTableExpr = this.io.readBytes(int((this.logicalScreenDescriptor.colorTableSize * 3)))
    this.rawGlobalColorTable = rawGlobalColorTableExpr
    let rawGlobalColorTableIo = newKaitaiStream(rawGlobalColorTableExpr)
    let globalColorTableExpr = Gif_ColorTable.read(rawGlobalColorTableIo, this.root, this)
    this.globalColorTable = globalColorTableExpr
  block:
    var i: int
    while true:
      let it = Gif_Block.read(this.io, this.root, this)
      this.blocks.add(it)
      if  ((this.io.isEof) or (it.blockType == gif.end_of_file)) :
        break
      inc i

proc fromFile*(_: typedesc[Gif], filename: string): Gif =
  Gif.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 22</a>
]##
proc read*(_: typedesc[Gif_ImageData], io: KaitaiStream, root: KaitaiStruct, parent: Gif_LocalImageDescriptor): Gif_ImageData =
  template this: untyped = result
  this = new(Gif_ImageData)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lzwMinCodeSizeExpr = this.io.readU1()
  this.lzwMinCodeSize = lzwMinCodeSizeExpr
  let subblocksExpr = Gif_Subblocks.read(this.io, this.root, this)
  this.subblocks = subblocksExpr

proc fromFile*(_: typedesc[Gif_ImageData], filename: string): Gif_ImageData =
  Gif_ImageData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_ColorTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: Gif_ColorTable): Gif_ColorTableEntry =
  template this: untyped = result
  this = new(Gif_ColorTableEntry)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let redExpr = this.io.readU1()
  this.red = redExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr
  let blueExpr = this.io.readU1()
  this.blue = blueExpr

proc fromFile*(_: typedesc[Gif_ColorTableEntry], filename: string): Gif_ColorTableEntry =
  Gif_ColorTableEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
]##
proc read*(_: typedesc[Gif_LogicalScreenDescriptorStruct], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_LogicalScreenDescriptorStruct =
  template this: untyped = result
  this = new(Gif_LogicalScreenDescriptorStruct)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let screenWidthExpr = this.io.readU2le()
  this.screenWidth = screenWidthExpr
  let screenHeightExpr = this.io.readU2le()
  this.screenHeight = screenHeightExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let bgColorIndexExpr = this.io.readU1()
  this.bgColorIndex = bgColorIndexExpr
  let pixelAspectRatioExpr = this.io.readU1()
  this.pixelAspectRatio = pixelAspectRatioExpr

proc hasColorTable(this: Gif_LogicalScreenDescriptorStruct): bool = 
  if this.hasColorTableInst != nil:
    return this.hasColorTableInst
  let hasColorTableInstExpr = bool((this.flags and 128) != 0)
  this.hasColorTableInst = hasColorTableInstExpr
  if this.hasColorTableInst != nil:
    return this.hasColorTableInst

proc colorTableSize(this: Gif_LogicalScreenDescriptorStruct): int = 
  if this.colorTableSizeInst != nil:
    return this.colorTableSizeInst
  let colorTableSizeInstExpr = int((2 shl (this.flags and 7)))
  this.colorTableSizeInst = colorTableSizeInstExpr
  if this.colorTableSizeInst != nil:
    return this.colorTableSizeInst

proc fromFile*(_: typedesc[Gif_LogicalScreenDescriptorStruct], filename: string): Gif_LogicalScreenDescriptorStruct =
  Gif_LogicalScreenDescriptorStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_LocalImageDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Block): Gif_LocalImageDescriptor =
  template this: untyped = result
  this = new(Gif_LocalImageDescriptor)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = this.io.readU2le()
  this.left = leftExpr
  let topExpr = this.io.readU2le()
  this.top = topExpr
  let widthExpr = this.io.readU2le()
  this.width = widthExpr
  let heightExpr = this.io.readU2le()
  this.height = heightExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  if this.hasColorTable:
    let rawLocalColorTableExpr = this.io.readBytes(int((this.colorTableSize * 3)))
    this.rawLocalColorTable = rawLocalColorTableExpr
    let rawLocalColorTableIo = newKaitaiStream(rawLocalColorTableExpr)
    let localColorTableExpr = Gif_ColorTable.read(rawLocalColorTableIo, this.root, this)
    this.localColorTable = localColorTableExpr
  let imageDataExpr = Gif_ImageData.read(this.io, this.root, this)
  this.imageData = imageDataExpr

proc hasColorTable(this: Gif_LocalImageDescriptor): bool = 
  if this.hasColorTableInst != nil:
    return this.hasColorTableInst
  let hasColorTableInstExpr = bool((this.flags and 128) != 0)
  this.hasColorTableInst = hasColorTableInstExpr
  if this.hasColorTableInst != nil:
    return this.hasColorTableInst

proc hasInterlace(this: Gif_LocalImageDescriptor): bool = 
  if this.hasInterlaceInst != nil:
    return this.hasInterlaceInst
  let hasInterlaceInstExpr = bool((this.flags and 64) != 0)
  this.hasInterlaceInst = hasInterlaceInstExpr
  if this.hasInterlaceInst != nil:
    return this.hasInterlaceInst

proc hasSortedColorTable(this: Gif_LocalImageDescriptor): bool = 
  if this.hasSortedColorTableInst != nil:
    return this.hasSortedColorTableInst
  let hasSortedColorTableInstExpr = bool((this.flags and 32) != 0)
  this.hasSortedColorTableInst = hasSortedColorTableInstExpr
  if this.hasSortedColorTableInst != nil:
    return this.hasSortedColorTableInst

proc colorTableSize(this: Gif_LocalImageDescriptor): int = 
  if this.colorTableSizeInst != nil:
    return this.colorTableSizeInst
  let colorTableSizeInstExpr = int((2 shl (this.flags and 7)))
  this.colorTableSizeInst = colorTableSizeInstExpr
  if this.colorTableSizeInst != nil:
    return this.colorTableSizeInst

proc fromFile*(_: typedesc[Gif_LocalImageDescriptor], filename: string): Gif_LocalImageDescriptor =
  Gif_LocalImageDescriptor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_Block], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_Block =
  template this: untyped = result
  this = new(Gif_Block)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blockTypeExpr = Gif_BlockType(this.io.readU1())
  this.blockType = blockTypeExpr
  block:
    let on = this.blockType
    if on == gif.extension:
      let bodyExpr = Gif_Extension.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == gif.local_image_descriptor:
      let bodyExpr = Gif_LocalImageDescriptor.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Gif_Block], filename: string): Gif_Block =
  Gif_Block.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 19</a>
]##
proc read*(_: typedesc[Gif_ColorTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_ColorTable =
  template this: untyped = result
  this = new(Gif_ColorTable)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Gif_ColorTableEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Gif_ColorTable], filename: string): Gif_ColorTable =
  Gif_ColorTable.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 17</a>
]##
proc read*(_: typedesc[Gif_Header], io: KaitaiStream, root: KaitaiStruct, parent: Gif): Gif_Header =
  template this: untyped = result
  this = new(Gif_Header)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(3))
  this.magic = magicExpr
  let versionExpr = encode(this.io.readBytes(int(3)), "ASCII")
  this.version = versionExpr

proc fromFile*(_: typedesc[Gif_Header], filename: string): Gif_Header =
  Gif_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 23</a>
]##
proc read*(_: typedesc[Gif_ExtGraphicControl], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Extension): Gif_ExtGraphicControl =
  template this: untyped = result
  this = new(Gif_ExtGraphicControl)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blockSizeExpr = this.io.readBytes(int(1))
  this.blockSize = blockSizeExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let delayTimeExpr = this.io.readU2le()
  this.delayTime = delayTimeExpr
  let transparentIdxExpr = this.io.readU1()
  this.transparentIdx = transparentIdxExpr
  let terminatorExpr = this.io.readBytes(int(1))
  this.terminator = terminatorExpr

proc transparentColorFlag(this: Gif_ExtGraphicControl): bool = 
  if this.transparentColorFlagInst != nil:
    return this.transparentColorFlagInst
  let transparentColorFlagInstExpr = bool((this.flags and 1) != 0)
  this.transparentColorFlagInst = transparentColorFlagInstExpr
  if this.transparentColorFlagInst != nil:
    return this.transparentColorFlagInst

proc userInputFlag(this: Gif_ExtGraphicControl): bool = 
  if this.userInputFlagInst != nil:
    return this.userInputFlagInst
  let userInputFlagInstExpr = bool((this.flags and 2) != 0)
  this.userInputFlagInst = userInputFlagInstExpr
  if this.userInputFlagInst != nil:
    return this.userInputFlagInst

proc fromFile*(_: typedesc[Gif_ExtGraphicControl], filename: string): Gif_ExtGraphicControl =
  Gif_ExtGraphicControl.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_Subblock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_Subblock =
  template this: untyped = result
  this = new(Gif_Subblock)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenBytesExpr = this.io.readU1()
  this.lenBytes = lenBytesExpr
  let bytesExpr = this.io.readBytes(int(this.lenBytes))
  this.bytes = bytesExpr

proc fromFile*(_: typedesc[Gif_Subblock], filename: string): Gif_Subblock =
  Gif_Subblock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_ExtApplication], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Extension): Gif_ExtApplication =
  template this: untyped = result
  this = new(Gif_ExtApplication)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let applicationIdExpr = Gif_Subblock.read(this.io, this.root, this)
  this.applicationId = applicationIdExpr
  block:
    var i: int
    while true:
      let it = Gif_Subblock.read(this.io, this.root, this)
      this.subblocks.add(it)
      if it.lenBytes == 0:
        break
      inc i

proc fromFile*(_: typedesc[Gif_ExtApplication], filename: string): Gif_ExtApplication =
  Gif_ExtApplication.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_Subblocks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gif_Subblocks =
  template this: untyped = result
  this = new(Gif_Subblocks)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = Gif_Subblock.read(this.io, this.root, this)
      this.entries.add(it)
      if it.lenBytes == 0:
        break
      inc i

proc fromFile*(_: typedesc[Gif_Subblocks], filename: string): Gif_Subblocks =
  Gif_Subblocks.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gif_Extension], io: KaitaiStream, root: KaitaiStruct, parent: Gif_Block): Gif_Extension =
  template this: untyped = result
  this = new(Gif_Extension)
  let root = if root == nil: cast[Gif](this) else: cast[Gif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let labelExpr = Gif_ExtensionLabel(this.io.readU1())
  this.label = labelExpr
  block:
    let on = this.label
    if on == gif.application:
      let bodyExpr = Gif_ExtApplication.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == gif.comment:
      let bodyExpr = Gif_Subblocks.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == gif.graphic_control:
      let bodyExpr = Gif_ExtGraphicControl.read(this.io, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = Gif_Subblocks.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Gif_Extension], filename: string): Gif_Extension =
  Gif_Extension.read(newKaitaiFileStream(filename), nil, nil)

