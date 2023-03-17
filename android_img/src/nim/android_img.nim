import kaitai_struct_nim_runtime
import options

type
  AndroidImg* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `kernel`*: AndroidImg_Load
    `ramdisk`*: AndroidImg_Load
    `second`*: AndroidImg_Load
    `tagsLoad`*: uint32
    `pageSize`*: uint32
    `headerVersion`*: uint32
    `osVersion`*: AndroidImg_OsVersion
    `name`*: string
    `cmdline`*: string
    `sha`*: seq[byte]
    `extraCmdline`*: string
    `recoveryDtbo`*: AndroidImg_SizeOffset
    `bootHeaderSize`*: uint32
    `dtb`*: AndroidImg_LoadLong
    `parent`*: KaitaiStruct
    `kernelImgInst`: seq[byte]
    `kernelImgInstFlag`: bool
    `tagsOffsetInst`: int
    `tagsOffsetInstFlag`: bool
    `ramdiskOffsetInst`: int
    `ramdiskOffsetInstFlag`: bool
    `secondOffsetInst`: int
    `secondOffsetInstFlag`: bool
    `kernelOffsetInst`: int
    `kernelOffsetInstFlag`: bool
    `dtbOffsetInst`: int
    `dtbOffsetInstFlag`: bool
    `dtbImgInst`: seq[byte]
    `dtbImgInstFlag`: bool
    `ramdiskImgInst`: seq[byte]
    `ramdiskImgInstFlag`: bool
    `recoveryDtboImgInst`: seq[byte]
    `recoveryDtboImgInstFlag`: bool
    `secondImgInst`: seq[byte]
    `secondImgInstFlag`: bool
    `baseInst`: int
    `baseInstFlag`: bool
  AndroidImg_Load* = ref object of KaitaiStruct
    `size`*: uint32
    `addr`*: uint32
    `parent`*: AndroidImg
  AndroidImg_LoadLong* = ref object of KaitaiStruct
    `size`*: uint32
    `addr`*: uint64
    `parent`*: AndroidImg
  AndroidImg_SizeOffset* = ref object of KaitaiStruct
    `size`*: uint32
    `offset`*: uint64
    `parent`*: AndroidImg
  AndroidImg_OsVersion* = ref object of KaitaiStruct
    `version`*: uint32
    `parent`*: AndroidImg
    `monthInst`: int
    `monthInstFlag`: bool
    `patchInst`: int
    `patchInstFlag`: bool
    `yearInst`: int
    `yearInstFlag`: bool
    `majorInst`: int
    `majorInstFlag`: bool
    `minorInst`: int
    `minorInstFlag`: bool

proc read*(_: typedesc[AndroidImg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidImg
proc read*(_: typedesc[AndroidImg_Load], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_Load
proc read*(_: typedesc[AndroidImg_LoadLong], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_LoadLong
proc read*(_: typedesc[AndroidImg_SizeOffset], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_SizeOffset
proc read*(_: typedesc[AndroidImg_OsVersion], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_OsVersion

proc kernelImg*(this: AndroidImg): seq[byte]
proc tagsOffset*(this: AndroidImg): int
proc ramdiskOffset*(this: AndroidImg): int
proc secondOffset*(this: AndroidImg): int
proc kernelOffset*(this: AndroidImg): int
proc dtbOffset*(this: AndroidImg): int
proc dtbImg*(this: AndroidImg): seq[byte]
proc ramdiskImg*(this: AndroidImg): seq[byte]
proc recoveryDtboImg*(this: AndroidImg): seq[byte]
proc secondImg*(this: AndroidImg): seq[byte]
proc base*(this: AndroidImg): int
proc month*(this: AndroidImg_OsVersion): int
proc patch*(this: AndroidImg_OsVersion): int
proc year*(this: AndroidImg_OsVersion): int
proc major*(this: AndroidImg_OsVersion): int
proc minor*(this: AndroidImg_OsVersion): int


##[
@see <a href="https://source.android.com/docs/core/architecture/bootloader/boot-image-header">Source</a>
]##
proc read*(_: typedesc[AndroidImg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidImg =
  template this: untyped = result
  this = new(AndroidImg)
  let root = if root == nil: cast[AndroidImg](this) else: cast[AndroidImg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  let kernelExpr = AndroidImg_Load.read(this.io, this.root, this)
  this.kernel = kernelExpr
  let ramdiskExpr = AndroidImg_Load.read(this.io, this.root, this)
  this.ramdisk = ramdiskExpr
  let secondExpr = AndroidImg_Load.read(this.io, this.root, this)
  this.second = secondExpr
  let tagsLoadExpr = this.io.readU4le()
  this.tagsLoad = tagsLoadExpr
  let pageSizeExpr = this.io.readU4le()
  this.pageSize = pageSizeExpr
  let headerVersionExpr = this.io.readU4le()
  this.headerVersion = headerVersionExpr
  let osVersionExpr = AndroidImg_OsVersion.read(this.io, this.root, this)
  this.osVersion = osVersionExpr
  let nameExpr = encode(this.io.readBytes(int(16)).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr
  let cmdlineExpr = encode(this.io.readBytes(int(512)).bytesTerminate(0, false), "ASCII")
  this.cmdline = cmdlineExpr
  let shaExpr = this.io.readBytes(int(32))
  this.sha = shaExpr
  let extraCmdlineExpr = encode(this.io.readBytes(int(1024)).bytesTerminate(0, false), "ASCII")
  this.extraCmdline = extraCmdlineExpr
  if this.headerVersion > 0:
    let recoveryDtboExpr = AndroidImg_SizeOffset.read(this.io, this.root, this)
    this.recoveryDtbo = recoveryDtboExpr
  if this.headerVersion > 0:
    let bootHeaderSizeExpr = this.io.readU4le()
    this.bootHeaderSize = bootHeaderSizeExpr
  if this.headerVersion > 1:
    let dtbExpr = AndroidImg_LoadLong.read(this.io, this.root, this)
    this.dtb = dtbExpr

proc kernelImg(this: AndroidImg): seq[byte] = 
  if this.kernelImgInstFlag:
    return this.kernelImgInst
  let pos = this.io.pos()
  this.io.seek(int(this.pageSize))
  let kernelImgInstExpr = this.io.readBytes(int(this.kernel.size))
  this.kernelImgInst = kernelImgInstExpr
  this.io.seek(pos)
  this.kernelImgInstFlag = true
  return this.kernelImgInst

proc tagsOffset(this: AndroidImg): int = 

  ##[
  tags offset from base
  ]##
  if this.tagsOffsetInstFlag:
    return this.tagsOffsetInst
  let tagsOffsetInstExpr = int((this.tagsLoad - this.base))
  this.tagsOffsetInst = tagsOffsetInstExpr
  this.tagsOffsetInstFlag = true
  return this.tagsOffsetInst

proc ramdiskOffset(this: AndroidImg): int = 

  ##[
  ramdisk offset from base
  ]##
  if this.ramdiskOffsetInstFlag:
    return this.ramdiskOffsetInst
  let ramdiskOffsetInstExpr = int((if this.ramdisk.addr > 0: (this.ramdisk.addr - this.base) else: 0))
  this.ramdiskOffsetInst = ramdiskOffsetInstExpr
  this.ramdiskOffsetInstFlag = true
  return this.ramdiskOffsetInst

proc secondOffset(this: AndroidImg): int = 

  ##[
  2nd bootloader offset from base
  ]##
  if this.secondOffsetInstFlag:
    return this.secondOffsetInst
  let secondOffsetInstExpr = int((if this.second.addr > 0: (this.second.addr - this.base) else: 0))
  this.secondOffsetInst = secondOffsetInstExpr
  this.secondOffsetInstFlag = true
  return this.secondOffsetInst

proc kernelOffset(this: AndroidImg): int = 

  ##[
  kernel offset from base
  ]##
  if this.kernelOffsetInstFlag:
    return this.kernelOffsetInst
  let kernelOffsetInstExpr = int((this.kernel.addr - this.base))
  this.kernelOffsetInst = kernelOffsetInstExpr
  this.kernelOffsetInstFlag = true
  return this.kernelOffsetInst

proc dtbOffset(this: AndroidImg): int = 

  ##[
  dtb offset from base
  ]##
  if this.dtbOffsetInstFlag:
    return this.dtbOffsetInst
  if this.headerVersion > 1:
    let dtbOffsetInstExpr = int((if this.dtb.addr > 0: (this.dtb.addr - this.base) else: 0))
    this.dtbOffsetInst = dtbOffsetInstExpr
  this.dtbOffsetInstFlag = true
  return this.dtbOffsetInst

proc dtbImg(this: AndroidImg): seq[byte] = 
  if this.dtbImgInstFlag:
    return this.dtbImgInst
  if  ((this.headerVersion > 1) and (this.dtb.size > 0)) :
    let pos = this.io.pos()
    this.io.seek(int(((((((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.second.size) + this.recoveryDtbo.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let dtbImgInstExpr = this.io.readBytes(int(this.dtb.size))
    this.dtbImgInst = dtbImgInstExpr
    this.io.seek(pos)
  this.dtbImgInstFlag = true
  return this.dtbImgInst

proc ramdiskImg(this: AndroidImg): seq[byte] = 
  if this.ramdiskImgInstFlag:
    return this.ramdiskImgInst
  if this.ramdisk.size > 0:
    let pos = this.io.pos()
    this.io.seek(int((((((this.pageSize + this.kernel.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let ramdiskImgInstExpr = this.io.readBytes(int(this.ramdisk.size))
    this.ramdiskImgInst = ramdiskImgInstExpr
    this.io.seek(pos)
  this.ramdiskImgInstFlag = true
  return this.ramdiskImgInst

proc recoveryDtboImg(this: AndroidImg): seq[byte] = 
  if this.recoveryDtboImgInstFlag:
    return this.recoveryDtboImgInst
  if  ((this.headerVersion > 0) and (this.recoveryDtbo.size > 0)) :
    let pos = this.io.pos()
    this.io.seek(int(this.recoveryDtbo.offset))
    let recoveryDtboImgInstExpr = this.io.readBytes(int(this.recoveryDtbo.size))
    this.recoveryDtboImgInst = recoveryDtboImgInstExpr
    this.io.seek(pos)
  this.recoveryDtboImgInstFlag = true
  return this.recoveryDtboImgInst

proc secondImg(this: AndroidImg): seq[byte] = 
  if this.secondImgInstFlag:
    return this.secondImgInst
  if this.second.size > 0:
    let pos = this.io.pos()
    this.io.seek(int(((((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let secondImgInstExpr = this.io.readBytes(int(this.second.size))
    this.secondImgInst = secondImgInstExpr
    this.io.seek(pos)
  this.secondImgInstFlag = true
  return this.secondImgInst

proc base(this: AndroidImg): int = 

  ##[
  base loading address
  ]##
  if this.baseInstFlag:
    return this.baseInst
  let baseInstExpr = int((this.kernel.addr - 32768))
  this.baseInst = baseInstExpr
  this.baseInstFlag = true
  return this.baseInst

proc fromFile*(_: typedesc[AndroidImg], filename: string): AndroidImg =
  AndroidImg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidImg_Load], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_Load =
  template this: untyped = result
  this = new(AndroidImg_Load)
  let root = if root == nil: cast[AndroidImg](this) else: cast[AndroidImg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let addrExpr = this.io.readU4le()
  this.addr = addrExpr

proc fromFile*(_: typedesc[AndroidImg_Load], filename: string): AndroidImg_Load =
  AndroidImg_Load.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidImg_LoadLong], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_LoadLong =
  template this: untyped = result
  this = new(AndroidImg_LoadLong)
  let root = if root == nil: cast[AndroidImg](this) else: cast[AndroidImg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let addrExpr = this.io.readU8le()
  this.addr = addrExpr

proc fromFile*(_: typedesc[AndroidImg_LoadLong], filename: string): AndroidImg_LoadLong =
  AndroidImg_LoadLong.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidImg_SizeOffset], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_SizeOffset =
  template this: untyped = result
  this = new(AndroidImg_SizeOffset)
  let root = if root == nil: cast[AndroidImg](this) else: cast[AndroidImg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

proc fromFile*(_: typedesc[AndroidImg_SizeOffset], filename: string): AndroidImg_SizeOffset =
  AndroidImg_SizeOffset.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidImg_OsVersion], io: KaitaiStream, root: KaitaiStruct, parent: AndroidImg): AndroidImg_OsVersion =
  template this: untyped = result
  this = new(AndroidImg_OsVersion)
  let root = if root == nil: cast[AndroidImg](this) else: cast[AndroidImg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU4le()
  this.version = versionExpr

proc month(this: AndroidImg_OsVersion): int = 
  if this.monthInstFlag:
    return this.monthInst
  let monthInstExpr = int((this.version and 15))
  this.monthInst = monthInstExpr
  this.monthInstFlag = true
  return this.monthInst

proc patch(this: AndroidImg_OsVersion): int = 
  if this.patchInstFlag:
    return this.patchInst
  let patchInstExpr = int(((this.version shr 11) and 127))
  this.patchInst = patchInstExpr
  this.patchInstFlag = true
  return this.patchInst

proc year(this: AndroidImg_OsVersion): int = 
  if this.yearInstFlag:
    return this.yearInst
  let yearInstExpr = int((((this.version shr 4) and 127) + 2000))
  this.yearInst = yearInstExpr
  this.yearInstFlag = true
  return this.yearInst

proc major(this: AndroidImg_OsVersion): int = 
  if this.majorInstFlag:
    return this.majorInst
  let majorInstExpr = int(((this.version shr 25) and 127))
  this.majorInst = majorInstExpr
  this.majorInstFlag = true
  return this.majorInst

proc minor(this: AndroidImg_OsVersion): int = 
  if this.minorInstFlag:
    return this.minorInst
  let minorInstExpr = int(((this.version shr 18) and 127))
  this.minorInst = minorInstExpr
  this.minorInstFlag = true
  return this.minorInst

proc fromFile*(_: typedesc[AndroidImg_OsVersion], filename: string): AndroidImg_OsVersion =
  AndroidImg_OsVersion.read(newKaitaiFileStream(filename), nil, nil)

