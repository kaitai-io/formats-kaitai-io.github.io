import kaitai_struct_nim_runtime
import options

type
  AndroidAsusBootldr* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `revision`*: uint16
    `reserved1`*: uint16
    `reserved2`*: uint32
    `images`*: seq[AndroidAsusBootldr_Image]
    `parent`*: KaitaiStruct
  AndroidAsusBootldr_Image* = ref object of KaitaiStruct
    `chunkId`*: string
    `lenBody`*: uint32
    `flags`*: uint8
    `reserved1`*: uint8
    `reserved2`*: uint8
    `reserved3`*: uint8
    `body`*: seq[byte]
    `parent`*: AndroidAsusBootldr
    `fileNameInst`*: string

proc read*(_: typedesc[AndroidAsusBootldr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidAsusBootldr
proc read*(_: typedesc[AndroidAsusBootldr_Image], io: KaitaiStream, root: KaitaiStruct, parent: AndroidAsusBootldr): AndroidAsusBootldr_Image

proc fileName*(this: AndroidAsusBootldr_Image): string


##[
A bootloader image which only seems to have been used on a few ASUS
devices. The encoding is ASCII, because the `releasetools.py` script
is written using Python 2, where the default encoding is ASCII.

A test file can be found in the firmware files for the "fugu" device,
which can be downloaded from <https://developers.google.com/android/images>

@see <a href="https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py">Source</a>
]##
proc read*(_: typedesc[AndroidAsusBootldr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidAsusBootldr =
  template this: untyped = result
  this = new(AndroidAsusBootldr)
  let root = if root == nil: cast[AndroidAsusBootldr](this) else: cast[AndroidAsusBootldr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  let revisionExpr = this.io.readU2le()
  this.revision = revisionExpr
  let reserved1Expr = this.io.readU2le()
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readU4le()
  this.reserved2 = reserved2Expr

  ##[
  Only three images are included: `ifwi.bin`, `droidboot.img`
and `splashscreen.img`

  ]##
  for i in 0 ..< int(3):
    let it = AndroidAsusBootldr_Image.read(this.io, this.root, this)
    this.images.add(it)

proc fromFile*(_: typedesc[AndroidAsusBootldr], filename: string): AndroidAsusBootldr =
  AndroidAsusBootldr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidAsusBootldr_Image], io: KaitaiStream, root: KaitaiStruct, parent: AndroidAsusBootldr): AndroidAsusBootldr_Image =
  template this: untyped = result
  this = new(AndroidAsusBootldr_Image)
  let root = if root == nil: cast[AndroidAsusBootldr](this) else: cast[AndroidAsusBootldr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkIdExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.chunkId = chunkIdExpr
  let lenBodyExpr = this.io.readU4le()
  this.lenBody = lenBodyExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let reserved1Expr = this.io.readU1()
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let reserved3Expr = this.io.readU1()
  this.reserved3 = reserved3Expr
  let bodyExpr = this.io.readBytes(int(this.lenBody))
  this.body = bodyExpr

proc fileName(this: AndroidAsusBootldr_Image): string = 
  if this.fileNameInst.len != 0:
    return this.fileNameInst
  let fileNameInstExpr = string((if this.chunkId == "IFWI!!!!": "ifwi.bin" else: (if this.chunkId == "DROIDBT!": "droidboot.img" else: (if this.chunkId == "SPLASHS!": "splashscreen.img" else: ""))))
  this.fileNameInst = fileNameInstExpr
  if this.fileNameInst.len != 0:
    return this.fileNameInst

proc fromFile*(_: typedesc[AndroidAsusBootldr_Image], filename: string): AndroidAsusBootldr_Image =
  AndroidAsusBootldr_Image.read(newKaitaiFileStream(filename), nil, nil)

