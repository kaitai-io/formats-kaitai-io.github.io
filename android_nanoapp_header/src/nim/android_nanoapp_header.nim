import kaitai_struct_nim_runtime
import options

type
  AndroidNanoappHeader* = ref object of KaitaiStruct
    `headerVersion`*: uint32
    `magic`*: seq[byte]
    `appId`*: uint64
    `appVersion`*: uint32
    `flags`*: uint32
    `hubType`*: uint64
    `chreApiMajorVersion`*: uint8
    `chreApiMinorVersion`*: uint8
    `reserved`*: seq[byte]
    `parent`*: KaitaiStruct
    `isSignedInst`*: bool
    `isEncryptedInst`*: bool
    `isTcmCapableInst`*: bool

proc read*(_: typedesc[AndroidNanoappHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidNanoappHeader

proc isSigned*(this: AndroidNanoappHeader): bool
proc isEncrypted*(this: AndroidNanoappHeader): bool
proc isTcmCapable*(this: AndroidNanoappHeader): bool


##[
@see <a href="https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130">Source</a>
]##
proc read*(_: typedesc[AndroidNanoappHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidNanoappHeader =
  template this: untyped = result
  this = new(AndroidNanoappHeader)
  let root = if root == nil: cast[AndroidNanoappHeader](this) else: cast[AndroidNanoappHeader](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerVersionExpr = this.io.readU4le()
  this.headerVersion = headerVersionExpr
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let appIdExpr = this.io.readU8le()
  this.appId = appIdExpr
  let appVersionExpr = this.io.readU4le()
  this.appVersion = appVersionExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let hubTypeExpr = this.io.readU8le()
  this.hubType = hubTypeExpr
  let chreApiMajorVersionExpr = this.io.readU1()
  this.chreApiMajorVersion = chreApiMajorVersionExpr
  let chreApiMinorVersionExpr = this.io.readU1()
  this.chreApiMinorVersion = chreApiMinorVersionExpr
  let reservedExpr = this.io.readBytes(int(6))
  this.reserved = reservedExpr

proc isSigned(this: AndroidNanoappHeader): bool = 
  if this.isSignedInst != nil:
    return this.isSignedInst
  let isSignedInstExpr = bool((this.flags and 1) != 0)
  this.isSignedInst = isSignedInstExpr
  if this.isSignedInst != nil:
    return this.isSignedInst

proc isEncrypted(this: AndroidNanoappHeader): bool = 
  if this.isEncryptedInst != nil:
    return this.isEncryptedInst
  let isEncryptedInstExpr = bool((this.flags and 2) != 0)
  this.isEncryptedInst = isEncryptedInstExpr
  if this.isEncryptedInst != nil:
    return this.isEncryptedInst

proc isTcmCapable(this: AndroidNanoappHeader): bool = 
  if this.isTcmCapableInst != nil:
    return this.isTcmCapableInst
  let isTcmCapableInstExpr = bool((this.flags and 4) != 0)
  this.isTcmCapableInst = isTcmCapableInstExpr
  if this.isTcmCapableInst != nil:
    return this.isTcmCapableInst

proc fromFile*(_: typedesc[AndroidNanoappHeader], filename: string): AndroidNanoappHeader =
  AndroidNanoappHeader.read(newKaitaiFileStream(filename), nil, nil)

