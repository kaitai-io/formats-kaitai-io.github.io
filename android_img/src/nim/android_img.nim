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
    `kernelImgInst`*: seq[byte]
    `tagsOffsetInst`*: int
    `ramdiskOffsetInst`*: int
    `secondOffsetInst`*: int
    `kernelOffsetInst`*: int
    `dtbOffsetInst`*: int
    `dtbImgInst`*: seq[byte]
    `ramdiskImgInst`*: seq[byte]
    `recoveryDtboImgInst`*: seq[byte]
    `secondImgInst`*: seq[byte]
    `baseInst`*: int
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
    `monthInst`*: int
    `patchInst`*: int
    `yearInst`*: int
    `majorInst`*: int
    `minorInst`*: int

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
@see <a href="https://source.android.com/devices/bootloader/boot-image-header">Source</a>
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
  if this.kernelImgInst.len != 0:
    return this.kernelImgInst
  let pos = this.io.pos()
  this.io.seek(int(this.pageSize))
  let kernelImgInstExpr = this.io.readBytes(int(this.kernel.size))
  this.kernelImgInst = kernelImgInstExpr
  this.io.seek(pos)
  if this.kernelImgInst.len != 0:
    return this.kernelImgInst

proc tagsOffset(this: AndroidImg): int = 

  ##[
  tags offset from base
  ]##
  if this.tagsOffsetInst != nil:
    return this.tagsOffsetInst
  let tagsOffsetInstExpr = int((this.tagsLoad - this.base))
  this.tagsOffsetInst = tagsOffsetInstExpr
  if this.tagsOffsetInst != nil:
    return this.tagsOffsetInst

proc ramdiskOffset(this: AndroidImg): int = 

  ##[
  ramdisk offset from base
  ]##
  if this.ramdiskOffsetInst != nil:
    return this.ramdiskOffsetInst
  let ramdiskOffsetInstExpr = int((if this.ramdisk.addr > 0: (this.ramdisk.addr - this.base) else: 0))
  this.ramdiskOffsetInst = ramdiskOffsetInstExpr
  if this.ramdiskOffsetInst != nil:
    return this.ramdiskOffsetInst

proc secondOffset(this: AndroidImg): int = 

  ##[
  2nd bootloader offset from base
  ]##
  if this.secondOffsetInst != nil:
    return this.secondOffsetInst
  let secondOffsetInstExpr = int((if this.second.addr > 0: (this.second.addr - this.base) else: 0))
  this.secondOffsetInst = secondOffsetInstExpr
  if this.secondOffsetInst != nil:
    return this.secondOffsetInst

proc kernelOffset(this: AndroidImg): int = 

  ##[
  kernel offset from base
  ]##
  if this.kernelOffsetInst != nil:
    return this.kernelOffsetInst
  let kernelOffsetInstExpr = int((this.kernel.addr - this.base))
  this.kernelOffsetInst = kernelOffsetInstExpr
  if this.kernelOffsetInst != nil:
    return this.kernelOffsetInst

proc dtbOffset(this: AndroidImg): int = 

  ##[
  dtb offset from base
  ]##
  if this.dtbOffsetInst != nil:
    return this.dtbOffsetInst
  if this.headerVersion > 1:
    let dtbOffsetInstExpr = int((if this.dtb.addr > 0: (this.dtb.addr - this.base) else: 0))
    this.dtbOffsetInst = dtbOffsetInstExpr
  if this.dtbOffsetInst != nil:
    return this.dtbOffsetInst

proc dtbImg(this: AndroidImg): seq[byte] = 
  if this.dtbImgInst.len != 0:
    return this.dtbImgInst
  if  ((this.headerVersion > 1) and (this.dtb.size > 0)) :
    let pos = this.io.pos()
    this.io.seek(int(((((((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.second.size) + this.recoveryDtbo.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let dtbImgInstExpr = this.io.readBytes(int(this.dtb.size))
    this.dtbImgInst = dtbImgInstExpr
    this.io.seek(pos)
  if this.dtbImgInst.len != 0:
    return this.dtbImgInst

proc ramdiskImg(this: AndroidImg): seq[byte] = 
  if this.ramdiskImgInst.len != 0:
    return this.ramdiskImgInst
  if this.ramdisk.size > 0:
    let pos = this.io.pos()
    this.io.seek(int((((((this.pageSize + this.kernel.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let ramdiskImgInstExpr = this.io.readBytes(int(this.ramdisk.size))
    this.ramdiskImgInst = ramdiskImgInstExpr
    this.io.seek(pos)
  if this.ramdiskImgInst.len != 0:
    return this.ramdiskImgInst

proc recoveryDtboImg(this: AndroidImg): seq[byte] = 
  if this.recoveryDtboImgInst.len != 0:
    return this.recoveryDtboImgInst
  if  ((this.headerVersion > 0) and (this.recoveryDtbo.size > 0)) :
    let pos = this.io.pos()
    this.io.seek(int(this.recoveryDtbo.offset))
    let recoveryDtboImgInstExpr = this.io.readBytes(int(this.recoveryDtbo.size))
    this.recoveryDtboImgInst = recoveryDtboImgInstExpr
    this.io.seek(pos)
  if this.recoveryDtboImgInst.len != 0:
    return this.recoveryDtboImgInst

proc secondImg(this: AndroidImg): seq[byte] = 
  if this.secondImgInst.len != 0:
    return this.secondImgInst
  if this.second.size > 0:
    let pos = this.io.pos()
    this.io.seek(int(((((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.pageSize) - 1) div this.pageSize) * this.pageSize)))
    let secondImgInstExpr = this.io.readBytes(int(this.second.size))
    this.secondImgInst = secondImgInstExpr
    this.io.seek(pos)
  if this.secondImgInst.len != 0:
    return this.secondImgInst

proc base(this: AndroidImg): int = 

  ##[
  base loading address
  ]##
  if this.baseInst != nil:
    return this.baseInst
  let baseInstExpr = int((this.kernel.addr - 32768))
  this.baseInst = baseInstExpr
  if this.baseInst != nil:
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
  if this.monthInst != nil:
    return this.monthInst
  let monthInstExpr = int((this.version and 15))
  this.monthInst = monthInstExpr
  if this.monthInst != nil:
    return this.monthInst

proc patch(this: AndroidImg_OsVersion): int = 
  if this.patchInst != nil:
    return this.patchInst
  let patchInstExpr = int(((this.version shr 11) and 127))
  this.patchInst = patchInstExpr
  if this.patchInst != nil:
    return this.patchInst

proc year(this: AndroidImg_OsVersion): int = 
  if this.yearInst != nil:
    return this.yearInst
  let yearInstExpr = int((((this.version shr 4) and 127) + 2000))
  this.yearInst = yearInstExpr
  if this.yearInst != nil:
    return this.yearInst

proc major(this: AndroidImg_OsVersion): int = 
  if this.majorInst != nil:
    return this.majorInst
  let majorInstExpr = int(((this.version shr 25) and 127))
  this.majorInst = majorInstExpr
  if this.majorInst != nil:
    return this.majorInst

proc minor(this: AndroidImg_OsVersion): int = 
  if this.minorInst != nil:
    return this.minorInst
  let minorInstExpr = int(((this.version shr 18) and 127))
  this.minorInst = minorInstExpr
  if this.minorInst != nil:
    return this.minorInst

proc fromFile*(_: typedesc[AndroidImg_OsVersion], filename: string): AndroidImg_OsVersion =
  AndroidImg_OsVersion.read(newKaitaiFileStream(filename), nil, nil)

