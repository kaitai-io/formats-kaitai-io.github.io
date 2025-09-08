import kaitai_struct_nim_runtime
import options

type
  AndroidBootldrHuawei* = ref object of KaitaiStruct
    `metaHeader`*: AndroidBootldrHuawei_MetaHdr
    `headerExt`*: seq[byte]
    `imageHeader`*: AndroidBootldrHuawei_ImageHdr
    `parent`*: KaitaiStruct
    `rawImageHeader`*: seq[byte]
  AndroidBootldrHuawei_ImageHdr* = ref object of KaitaiStruct
    `entries`*: seq[AndroidBootldrHuawei_ImageHdrEntry]
    `parent`*: AndroidBootldrHuawei
  AndroidBootldrHuawei_ImageHdrEntry* = ref object of KaitaiStruct
    `name`*: string
    `ofsBody`*: uint32
    `lenBody`*: uint32
    `parent`*: AndroidBootldrHuawei_ImageHdr
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
    `isUsedInst`: bool
    `isUsedInstFlag`: bool
  AndroidBootldrHuawei_MetaHdr* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: AndroidBootldrHuawei_Version
    `imageVersion`*: string
    `lenMetaHeader`*: uint16
    `lenImageHeader`*: uint16
    `parent`*: AndroidBootldrHuawei
  AndroidBootldrHuawei_Version* = ref object of KaitaiStruct
    `major`*: uint16
    `minor`*: uint16
    `parent`*: AndroidBootldrHuawei_MetaHdr

proc read*(_: typedesc[AndroidBootldrHuawei], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidBootldrHuawei
proc read*(_: typedesc[AndroidBootldrHuawei_ImageHdr], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei): AndroidBootldrHuawei_ImageHdr
proc read*(_: typedesc[AndroidBootldrHuawei_ImageHdrEntry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei_ImageHdr): AndroidBootldrHuawei_ImageHdrEntry
proc read*(_: typedesc[AndroidBootldrHuawei_MetaHdr], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei): AndroidBootldrHuawei_MetaHdr
proc read*(_: typedesc[AndroidBootldrHuawei_Version], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei_MetaHdr): AndroidBootldrHuawei_Version

proc body*(this: AndroidBootldrHuawei_ImageHdrEntry): seq[byte]
proc isUsed*(this: AndroidBootldrHuawei_ImageHdrEntry): bool


##[
Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:

* Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
  [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)

[sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
[others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files

All image versions can be found in factory images at
<https://developers.google.com/android/images> for the specific device. To
avoid having to download an entire ZIP archive when you only need one file
from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
use its [command line
tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
members in the archive and then to download only the file you want.

@see <a href="https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py">Source</a>
@see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
@see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
]##
proc read*(_: typedesc[AndroidBootldrHuawei], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidBootldrHuawei =
  template this: untyped = result
  this = new(AndroidBootldrHuawei)
  let root = if root == nil: cast[AndroidBootldrHuawei](this) else: cast[AndroidBootldrHuawei](root)
  this.io = io
  this.root = root
  this.parent = parent

  let metaHeaderExpr = AndroidBootldrHuawei_MetaHdr.read(this.io, this.root, this)
  this.metaHeader = metaHeaderExpr
  let headerExtExpr = this.io.readBytes(int(this.metaHeader.lenMetaHeader - 76))
  this.headerExt = headerExtExpr
  let rawImageHeaderExpr = this.io.readBytes(int(this.metaHeader.lenImageHeader))
  this.rawImageHeader = rawImageHeaderExpr
  let rawImageHeaderIo = newKaitaiStream(rawImageHeaderExpr)
  let imageHeaderExpr = AndroidBootldrHuawei_ImageHdr.read(rawImageHeaderIo, this.root, this)
  this.imageHeader = imageHeaderExpr

proc fromFile*(_: typedesc[AndroidBootldrHuawei], filename: string): AndroidBootldrHuawei =
  AndroidBootldrHuawei.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidBootldrHuawei_ImageHdr], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei): AndroidBootldrHuawei_ImageHdr =
  template this: untyped = result
  this = new(AndroidBootldrHuawei_ImageHdr)
  let root = if root == nil: cast[AndroidBootldrHuawei](this) else: cast[AndroidBootldrHuawei](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The C generator program defines `img_header` as a [fixed size
array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
defined as `16`).

This means that technically there will always be 16 `image_hdr`
entries, the first *n* entries being used (filled with real values)
and the rest left unused with all bytes zero.

To check if an entry is used, use the `is_used` attribute.

  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = AndroidBootldrHuawei_ImageHdrEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[AndroidBootldrHuawei_ImageHdr], filename: string): AndroidBootldrHuawei_ImageHdr =
  AndroidBootldrHuawei_ImageHdr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidBootldrHuawei_ImageHdrEntry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei_ImageHdr): AndroidBootldrHuawei_ImageHdrEntry =
  template this: untyped = result
  this = new(AndroidBootldrHuawei_ImageHdrEntry)
  let root = if root == nil: cast[AndroidBootldrHuawei](this) else: cast[AndroidBootldrHuawei](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  partition name
  ]##
  let nameExpr = encode(this.io.readBytes(int(72)).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr
  let ofsBodyExpr = this.io.readU4le()
  this.ofsBody = ofsBodyExpr
  let lenBodyExpr = this.io.readU4le()
  this.lenBody = lenBodyExpr

proc body(this: AndroidBootldrHuawei_ImageHdrEntry): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  if this.isUsed:
    let io = AndroidBootldrHuawei(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsBody))
    let bodyInstExpr = io.readBytes(int(this.lenBody))
    this.bodyInst = bodyInstExpr
    io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc isUsed(this: AndroidBootldrHuawei_ImageHdrEntry): bool = 

  ##[
  @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85#n119">Source</a>
  ]##
  if this.isUsedInstFlag:
    return this.isUsedInst
  let isUsedInstExpr = bool( ((this.ofsBody != 0) and (this.lenBody != 0)) )
  this.isUsedInst = isUsedInstExpr
  this.isUsedInstFlag = true
  return this.isUsedInst

proc fromFile*(_: typedesc[AndroidBootldrHuawei_ImageHdrEntry], filename: string): AndroidBootldrHuawei_ImageHdrEntry =
  AndroidBootldrHuawei_ImageHdrEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidBootldrHuawei_MetaHdr], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei): AndroidBootldrHuawei_MetaHdr =
  template this: untyped = result
  this = new(AndroidBootldrHuawei_MetaHdr)
  let root = if root == nil: cast[AndroidBootldrHuawei](this) else: cast[AndroidBootldrHuawei](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = AndroidBootldrHuawei_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let imageVersionExpr = encode(this.io.readBytes(int(64)).bytesTerminate(0, false), "ASCII")
  this.imageVersion = imageVersionExpr
  let lenMetaHeaderExpr = this.io.readU2le()
  this.lenMetaHeader = lenMetaHeaderExpr
  let lenImageHeaderExpr = this.io.readU2le()
  this.lenImageHeader = lenImageHeaderExpr

proc fromFile*(_: typedesc[AndroidBootldrHuawei_MetaHdr], filename: string): AndroidBootldrHuawei_MetaHdr =
  AndroidBootldrHuawei_MetaHdr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidBootldrHuawei_Version], io: KaitaiStream, root: KaitaiStruct, parent: AndroidBootldrHuawei_MetaHdr): AndroidBootldrHuawei_Version =
  template this: untyped = result
  this = new(AndroidBootldrHuawei_Version)
  let root = if root == nil: cast[AndroidBootldrHuawei](this) else: cast[AndroidBootldrHuawei](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU2le()
  this.major = majorExpr
  let minorExpr = this.io.readU2le()
  this.minor = minorExpr

proc fromFile*(_: typedesc[AndroidBootldrHuawei_Version], filename: string): AndroidBootldrHuawei_Version =
  AndroidBootldrHuawei_Version.read(newKaitaiFileStream(filename), nil, nil)

