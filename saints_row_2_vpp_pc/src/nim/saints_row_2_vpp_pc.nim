import kaitai_struct_nim_runtime
import options

type
  SaintsRow2VppPc* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `pad1`*: seq[byte]
    `numFiles`*: int32
    `containerSize`*: int32
    `lenOffsets`*: int32
    `lenFilenames`*: int32
    `lenExtensions`*: int32
    `smth5`*: int32
    `smth6`*: int32
    `smth7`*: int32
    `smth8`*: int32
    `smth9`*: int32
    `parent`*: KaitaiStruct
    `rawFilenamesInst`*: seq[byte]
    `rawFilesInst`*: seq[byte]
    `rawExtensionsInst`*: seq[byte]
    `filenamesInst`*: SaintsRow2VppPc_Strings
    `ofsExtensionsInst`*: int
    `filesInst`*: SaintsRow2VppPc_Offsets
    `dataStartInst`*: int
    `extensionsInst`*: SaintsRow2VppPc_Strings
    `ofsFilenamesInst`*: int
  SaintsRow2VppPc_Offsets* = ref object of KaitaiStruct
    `entries`*: seq[SaintsRow2VppPc_Offsets_Offset]
    `parent`*: SaintsRow2VppPc
  SaintsRow2VppPc_Offsets_Offset* = ref object of KaitaiStruct
    `nameOfs`*: uint32
    `extOfs`*: uint32
    `smth2`*: int32
    `ofsBody`*: int32
    `lenBody`*: int32
    `alwaysMinus1`*: int32
    `alwaysZero`*: int32
    `parent`*: SaintsRow2VppPc_Offsets
    `filenameInst`*: string
    `extInst`*: string
    `bodyInst`*: seq[byte]
  SaintsRow2VppPc_Strings* = ref object of KaitaiStruct
    `entries`*: seq[string]
    `parent`*: SaintsRow2VppPc

proc read*(_: typedesc[SaintsRow2VppPc], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SaintsRow2VppPc
proc read*(_: typedesc[SaintsRow2VppPc_Offsets], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc): SaintsRow2VppPc_Offsets
proc read*(_: typedesc[SaintsRow2VppPc_Offsets_Offset], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc_Offsets): SaintsRow2VppPc_Offsets_Offset
proc read*(_: typedesc[SaintsRow2VppPc_Strings], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc): SaintsRow2VppPc_Strings

proc filenames*(this: SaintsRow2VppPc): SaintsRow2VppPc_Strings
proc ofsExtensions*(this: SaintsRow2VppPc): int
proc files*(this: SaintsRow2VppPc): SaintsRow2VppPc_Offsets
proc dataStart*(this: SaintsRow2VppPc): int
proc extensions*(this: SaintsRow2VppPc): SaintsRow2VppPc_Strings
proc ofsFilenames*(this: SaintsRow2VppPc): int
proc filename*(this: SaintsRow2VppPc_Offsets_Offset): string
proc ext*(this: SaintsRow2VppPc_Offsets_Offset): string
proc body*(this: SaintsRow2VppPc_Offsets_Offset): seq[byte]

proc read*(_: typedesc[SaintsRow2VppPc], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SaintsRow2VppPc =
  template this: untyped = result
  this = new(SaintsRow2VppPc)
  let root = if root == nil: cast[SaintsRow2VppPc](this) else: cast[SaintsRow2VppPc](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(5))
  this.magic = magicExpr
  let pad1Expr = this.io.readBytes(int(335))
  this.pad1 = pad1Expr
  let numFilesExpr = this.io.readS4le()
  this.numFiles = numFilesExpr
  let containerSizeExpr = this.io.readS4le()
  this.containerSize = containerSizeExpr
  let lenOffsetsExpr = this.io.readS4le()
  this.lenOffsets = lenOffsetsExpr
  let lenFilenamesExpr = this.io.readS4le()
  this.lenFilenames = lenFilenamesExpr
  let lenExtensionsExpr = this.io.readS4le()
  this.lenExtensions = lenExtensionsExpr
  let smth5Expr = this.io.readS4le()
  this.smth5 = smth5Expr
  let smth6Expr = this.io.readS4le()
  this.smth6 = smth6Expr
  let smth7Expr = this.io.readS4le()
  this.smth7 = smth7Expr
  let smth8Expr = this.io.readS4le()
  this.smth8 = smth8Expr
  let smth9Expr = this.io.readS4le()
  this.smth9 = smth9Expr

proc filenames(this: SaintsRow2VppPc): SaintsRow2VppPc_Strings = 
  if this.filenamesInst != nil:
    return this.filenamesInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsFilenames))
  let rawFilenamesInstExpr = this.io.readBytes(int(this.lenFilenames))
  this.rawFilenamesInst = rawFilenamesInstExpr
  let rawFilenamesInstIo = newKaitaiStream(rawFilenamesInstExpr)
  let filenamesInstExpr = SaintsRow2VppPc_Strings.read(rawFilenamesInstIo, this.root, this)
  this.filenamesInst = filenamesInstExpr
  this.io.seek(pos)
  if this.filenamesInst != nil:
    return this.filenamesInst

proc ofsExtensions(this: SaintsRow2VppPc): int = 
  if this.ofsExtensionsInst != nil:
    return this.ofsExtensionsInst
  let ofsExtensionsInstExpr = int((((this.ofsFilenames + this.lenFilenames) and 4294965248'i64) + 2048))
  this.ofsExtensionsInst = ofsExtensionsInstExpr
  if this.ofsExtensionsInst != nil:
    return this.ofsExtensionsInst

proc files(this: SaintsRow2VppPc): SaintsRow2VppPc_Offsets = 
  if this.filesInst != nil:
    return this.filesInst
  let pos = this.io.pos()
  this.io.seek(int(2048))
  let rawFilesInstExpr = this.io.readBytes(int(this.lenOffsets))
  this.rawFilesInst = rawFilesInstExpr
  let rawFilesInstIo = newKaitaiStream(rawFilesInstExpr)
  let filesInstExpr = SaintsRow2VppPc_Offsets.read(rawFilesInstIo, this.root, this)
  this.filesInst = filesInstExpr
  this.io.seek(pos)
  if this.filesInst != nil:
    return this.filesInst

proc dataStart(this: SaintsRow2VppPc): int = 
  if this.dataStartInst != nil:
    return this.dataStartInst
  let dataStartInstExpr = int((((this.ofsExtensions + this.lenExtensions) and 4294965248'i64) + 2048))
  this.dataStartInst = dataStartInstExpr
  if this.dataStartInst != nil:
    return this.dataStartInst

proc extensions(this: SaintsRow2VppPc): SaintsRow2VppPc_Strings = 
  if this.extensionsInst != nil:
    return this.extensionsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsExtensions))
  let rawExtensionsInstExpr = this.io.readBytes(int(this.lenExtensions))
  this.rawExtensionsInst = rawExtensionsInstExpr
  let rawExtensionsInstIo = newKaitaiStream(rawExtensionsInstExpr)
  let extensionsInstExpr = SaintsRow2VppPc_Strings.read(rawExtensionsInstIo, this.root, this)
  this.extensionsInst = extensionsInstExpr
  this.io.seek(pos)
  if this.extensionsInst != nil:
    return this.extensionsInst

proc ofsFilenames(this: SaintsRow2VppPc): int = 
  if this.ofsFilenamesInst != nil:
    return this.ofsFilenamesInst
  let ofsFilenamesInstExpr = int((((2048 + this.lenOffsets) and 4294965248'i64) + 2048))
  this.ofsFilenamesInst = ofsFilenamesInstExpr
  if this.ofsFilenamesInst != nil:
    return this.ofsFilenamesInst

proc fromFile*(_: typedesc[SaintsRow2VppPc], filename: string): SaintsRow2VppPc =
  SaintsRow2VppPc.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SaintsRow2VppPc_Offsets], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc): SaintsRow2VppPc_Offsets =
  template this: untyped = result
  this = new(SaintsRow2VppPc_Offsets)
  let root = if root == nil: cast[SaintsRow2VppPc](this) else: cast[SaintsRow2VppPc](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SaintsRow2VppPc_Offsets_Offset.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[SaintsRow2VppPc_Offsets], filename: string): SaintsRow2VppPc_Offsets =
  SaintsRow2VppPc_Offsets.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SaintsRow2VppPc_Offsets_Offset], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc_Offsets): SaintsRow2VppPc_Offsets_Offset =
  template this: untyped = result
  this = new(SaintsRow2VppPc_Offsets_Offset)
  let root = if root == nil: cast[SaintsRow2VppPc](this) else: cast[SaintsRow2VppPc](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameOfsExpr = this.io.readU4le()
  this.nameOfs = nameOfsExpr
  let extOfsExpr = this.io.readU4le()
  this.extOfs = extOfsExpr
  let smth2Expr = this.io.readS4le()
  this.smth2 = smth2Expr
  let ofsBodyExpr = this.io.readS4le()
  this.ofsBody = ofsBodyExpr
  let lenBodyExpr = this.io.readS4le()
  this.lenBody = lenBodyExpr
  let alwaysMinus1Expr = this.io.readS4le()
  this.alwaysMinus1 = alwaysMinus1Expr
  let alwaysZeroExpr = this.io.readS4le()
  this.alwaysZero = alwaysZeroExpr

proc filename(this: SaintsRow2VppPc_Offsets_Offset): string = 
  if this.filenameInst.len != 0:
    return this.filenameInst
  let io = SaintsRow2VppPc(this.root).filenames.io
  let pos = io.pos()
  io.seek(int(this.nameOfs))
  let filenameInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
  this.filenameInst = filenameInstExpr
  io.seek(pos)
  if this.filenameInst.len != 0:
    return this.filenameInst

proc ext(this: SaintsRow2VppPc_Offsets_Offset): string = 
  if this.extInst.len != 0:
    return this.extInst
  let io = SaintsRow2VppPc(this.root).extensions.io
  let pos = io.pos()
  io.seek(int(this.extOfs))
  let extInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
  this.extInst = extInstExpr
  io.seek(pos)
  if this.extInst.len != 0:
    return this.extInst

proc body(this: SaintsRow2VppPc_Offsets_Offset): seq[byte] = 
  if this.bodyInst.len != 0:
    return this.bodyInst
  let io = SaintsRow2VppPc(this.root).io
  let pos = io.pos()
  io.seek(int((SaintsRow2VppPc(this.root).dataStart + this.ofsBody)))
  let bodyInstExpr = io.readBytes(int(this.lenBody))
  this.bodyInst = bodyInstExpr
  io.seek(pos)
  if this.bodyInst.len != 0:
    return this.bodyInst

proc fromFile*(_: typedesc[SaintsRow2VppPc_Offsets_Offset], filename: string): SaintsRow2VppPc_Offsets_Offset =
  SaintsRow2VppPc_Offsets_Offset.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SaintsRow2VppPc_Strings], io: KaitaiStream, root: KaitaiStruct, parent: SaintsRow2VppPc): SaintsRow2VppPc_Strings =
  template this: untyped = result
  this = new(SaintsRow2VppPc_Strings)
  let root = if root == nil: cast[SaintsRow2VppPc](this) else: cast[SaintsRow2VppPc](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[SaintsRow2VppPc_Strings], filename: string): SaintsRow2VppPc_Strings =
  SaintsRow2VppPc_Strings.read(newKaitaiFileStream(filename), nil, nil)

