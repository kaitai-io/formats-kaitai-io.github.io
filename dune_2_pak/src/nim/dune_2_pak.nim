import kaitai_struct_nim_runtime
import options

type
  Dune2Pak* = ref object of KaitaiStruct
    `dir`*: Dune2Pak_Files
    `parent`*: KaitaiStruct
    `rawDir`*: seq[byte]
    `dirSizeInst`*: uint32
  Dune2Pak_Files* = ref object of KaitaiStruct
    `files`*: seq[Dune2Pak_File]
    `parent`*: Dune2Pak
  Dune2Pak_File* = ref object of KaitaiStruct
    `ofs`*: uint32
    `fileName`*: string
    `idx`*: uint32
    `parent`*: Dune2Pak_Files
    `nextOfs0Inst`*: uint32
    `nextOfsInst`*: int
    `bodyInst`*: seq[byte]

proc read*(_: typedesc[Dune2Pak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dune2Pak
proc read*(_: typedesc[Dune2Pak_Files], io: KaitaiStream, root: KaitaiStruct, parent: Dune2Pak): Dune2Pak_Files
proc read*(_: typedesc[Dune2Pak_File], io: KaitaiStream, root: KaitaiStruct, parent: Dune2Pak_Files, idx: any): Dune2Pak_File

proc dirSize*(this: Dune2Pak): uint32
proc nextOfs0*(this: Dune2Pak_File): uint32
proc nextOfs*(this: Dune2Pak_File): int
proc body*(this: Dune2Pak_File): seq[byte]


##[
@see <a href="http://www.shikadi.net/moddingwiki/PAK_Format_(Westwood)">Source</a>
]##
proc read*(_: typedesc[Dune2Pak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dune2Pak =
  template this: untyped = result
  this = new(Dune2Pak)
  let root = if root == nil: cast[Dune2Pak](this) else: cast[Dune2Pak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawDirExpr = this.io.readBytes(int(this.dirSize))
  this.rawDir = rawDirExpr
  let rawDirIo = newKaitaiStream(rawDirExpr)
  let dirExpr = Dune2Pak_Files.read(rawDirIo, this.root, this)
  this.dir = dirExpr

proc dirSize(this: Dune2Pak): uint32 = 
  if this.dirSizeInst != nil:
    return this.dirSizeInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let dirSizeInstExpr = this.io.readU4le()
  this.dirSizeInst = dirSizeInstExpr
  this.io.seek(pos)
  if this.dirSizeInst != nil:
    return this.dirSizeInst

proc fromFile*(_: typedesc[Dune2Pak], filename: string): Dune2Pak =
  Dune2Pak.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dune2Pak_Files], io: KaitaiStream, root: KaitaiStruct, parent: Dune2Pak): Dune2Pak_Files =
  template this: untyped = result
  this = new(Dune2Pak_Files)
  let root = if root == nil: cast[Dune2Pak](this) else: cast[Dune2Pak](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Dune2Pak_File.read(this.io, this.root, this, i)
      this.files.add(it)
      inc i

proc fromFile*(_: typedesc[Dune2Pak_Files], filename: string): Dune2Pak_Files =
  Dune2Pak_Files.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dune2Pak_File], io: KaitaiStream, root: KaitaiStruct, parent: Dune2Pak_Files, idx: any): Dune2Pak_File =
  template this: untyped = result
  this = new(Dune2Pak_File)
  let root = if root == nil: cast[Dune2Pak](this) else: cast[Dune2Pak](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint32(idx)
  this.idx = idxExpr

  let ofsExpr = this.io.readU4le()
  this.ofs = ofsExpr
  if this.ofs != 0:
    let fileNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
    this.fileName = fileNameExpr

proc nextOfs0(this: Dune2Pak_File): uint32 = 
  if this.nextOfs0Inst != nil:
    return this.nextOfs0Inst
  if this.ofs != 0:
    let nextOfs0InstExpr = uint32(Dune2Pak(this.root).dir.files[(this.idx + 1)].ofs)
    this.nextOfs0Inst = nextOfs0InstExpr
  if this.nextOfs0Inst != nil:
    return this.nextOfs0Inst

proc nextOfs(this: Dune2Pak_File): int = 
  if this.nextOfsInst != nil:
    return this.nextOfsInst
  if this.ofs != 0:
    let nextOfsInstExpr = int((if this.nextOfs0 == 0: Dune2Pak(this.root).io.size else: this.nextOfs0))
    this.nextOfsInst = nextOfsInstExpr
  if this.nextOfsInst != nil:
    return this.nextOfsInst

proc body(this: Dune2Pak_File): seq[byte] = 
  if this.bodyInst.len != 0:
    return this.bodyInst
  if this.ofs != 0:
    let io = Dune2Pak(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofs))
    let bodyInstExpr = io.readBytes(int((this.nextOfs - this.ofs)))
    this.bodyInst = bodyInstExpr
    io.seek(pos)
  if this.bodyInst.len != 0:
    return this.bodyInst

proc fromFile*(_: typedesc[Dune2Pak_File], filename: string): Dune2Pak_File =
  Dune2Pak_File.read(newKaitaiFileStream(filename), nil, nil)

