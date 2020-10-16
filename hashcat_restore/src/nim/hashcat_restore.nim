import kaitai_struct_nim_runtime
import options

type
  HashcatRestore* = ref object of KaitaiStruct
    `version`*: uint32
    `cwd`*: string
    `dictsPos`*: uint32
    `masksPos`*: uint32
    `padding`*: seq[byte]
    `currentRestorePoint`*: uint64
    `argc`*: uint32
    `padding2`*: seq[byte]
    `argv`*: seq[string]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[HashcatRestore], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HashcatRestore



##[
@see <a href="https://hashcat.net/wiki/doku.php?id=restore">Source</a>
]##
proc read*(_: typedesc[HashcatRestore], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HashcatRestore =
  template this: untyped = result
  this = new(HashcatRestore)
  let root = if root == nil: cast[HashcatRestore](this) else: cast[HashcatRestore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU4le()
  this.version = versionExpr
  let cwdExpr = encode(this.io.readBytes(int(256)).bytesTerminate(0, false), "UTF-8")
  this.cwd = cwdExpr
  let dictsPosExpr = this.io.readU4le()
  this.dictsPos = dictsPosExpr
  let masksPosExpr = this.io.readU4le()
  this.masksPos = masksPosExpr
  let paddingExpr = this.io.readBytes(int(4))
  this.padding = paddingExpr
  let currentRestorePointExpr = this.io.readU8le()
  this.currentRestorePoint = currentRestorePointExpr
  let argcExpr = this.io.readU4le()
  this.argc = argcExpr
  let padding2Expr = this.io.readBytes(int(12))
  this.padding2 = padding2Expr
  for i in 0 ..< int(this.argc):
    let it = encode(this.io.readBytesTerm(10, false, true, true), "UTF-8")
    this.argv.add(it)

proc fromFile*(_: typedesc[HashcatRestore], filename: string): HashcatRestore =
  HashcatRestore.read(newKaitaiFileStream(filename), nil, nil)

