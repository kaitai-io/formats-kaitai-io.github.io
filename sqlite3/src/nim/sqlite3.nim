import kaitai_struct_nim_runtime
import options
import /common/vlq_base128_be

import "vlq_base128_be"
type
  Sqlite3* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenPageMod`*: uint16
    `writeVersion`*: Sqlite3_Versions
    `readVersion`*: Sqlite3_Versions
    `reservedSpace`*: uint8
    `maxPayloadFrac`*: uint8
    `minPayloadFrac`*: uint8
    `leafPayloadFrac`*: uint8
    `fileChangeCounter`*: uint32
    `numPages`*: uint32
    `firstFreelistTrunkPage`*: uint32
    `numFreelistPages`*: uint32
    `schemaCookie`*: uint32
    `schemaFormat`*: uint32
    `defPageCacheSize`*: uint32
    `largestRootPage`*: uint32
    `textEncoding`*: Sqlite3_Encodings
    `userVersion`*: uint32
    `isIncrementalVacuum`*: uint32
    `applicationId`*: uint32
    `reserved`*: seq[byte]
    `versionValidFor`*: uint32
    `sqliteVersionNumber`*: uint32
    `rootPage`*: Sqlite3_BtreePage
    `parent`*: KaitaiStruct
    `lenPageInst`: int
    `lenPageInstFlag`: bool
  Sqlite3_Versions* = enum
    legacy = 1
    wal = 2
  Sqlite3_Encodings* = enum
    utf_8 = 1
    utf_16le = 2
    utf_16be = 3
  Sqlite3_Serial* = ref object of KaitaiStruct
    `code`*: VlqBase128Be
    `parent`*: KaitaiStruct
    `isBlobInst`: bool
    `isBlobInstFlag`: bool
    `isStringInst`: bool
    `isStringInstFlag`: bool
    `lenContentInst`: int
    `lenContentInstFlag`: bool
  Sqlite3_BtreePage* = ref object of KaitaiStruct
    `pageType`*: uint8
    `firstFreeblock`*: uint16
    `numCells`*: uint16
    `ofsCells`*: uint16
    `numFragFreeBytes`*: uint8
    `rightPtr`*: uint32
    `cells`*: seq[Sqlite3_RefCell]
    `parent`*: Sqlite3
  Sqlite3_CellIndexLeaf* = ref object of KaitaiStruct
    `lenPayload`*: VlqBase128Be
    `payload`*: Sqlite3_CellPayload
    `parent`*: Sqlite3_RefCell
    `rawPayload`*: seq[byte]
  Sqlite3_Serials* = ref object of KaitaiStruct
    `entries`*: seq[VlqBase128Be]
    `parent`*: Sqlite3_CellPayload
  Sqlite3_CellTableLeaf* = ref object of KaitaiStruct
    `lenPayload`*: VlqBase128Be
    `rowId`*: VlqBase128Be
    `payload`*: Sqlite3_CellPayload
    `parent`*: Sqlite3_RefCell
    `rawPayload`*: seq[byte]
  Sqlite3_CellPayload* = ref object of KaitaiStruct
    `lenHeaderAndLen`*: VlqBase128Be
    `columnSerials`*: Sqlite3_Serials
    `columnContents`*: seq[Sqlite3_ColumnContent]
    `parent`*: KaitaiStruct
    `rawColumnSerials`*: seq[byte]
  Sqlite3_CellTableInterior* = ref object of KaitaiStruct
    `leftChildPage`*: uint32
    `rowId`*: VlqBase128Be
    `parent`*: Sqlite3_RefCell
  Sqlite3_CellIndexInterior* = ref object of KaitaiStruct
    `leftChildPage`*: uint32
    `lenPayload`*: VlqBase128Be
    `payload`*: Sqlite3_CellPayload
    `parent`*: Sqlite3_RefCell
    `rawPayload`*: seq[byte]
  Sqlite3_ColumnContent* = ref object of KaitaiStruct
    `asInt`*: int
    `asFloat`*: float64
    `asBlob`*: seq[byte]
    `asStr`*: string
    `ser`*: KaitaiStruct
    `parent`*: Sqlite3_CellPayload
    `serialTypeInst`: Sqlite3_Serial
    `serialTypeInstFlag`: bool
  Sqlite3_RefCell* = ref object of KaitaiStruct
    `ofsBody`*: uint16
    `parent`*: Sqlite3_BtreePage
    `bodyInst`: KaitaiStruct
    `bodyInstFlag`: bool

proc read*(_: typedesc[Sqlite3], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3
proc read*(_: typedesc[Sqlite3_Serial], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3_Serial
proc read*(_: typedesc[Sqlite3_BtreePage], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3): Sqlite3_BtreePage
proc read*(_: typedesc[Sqlite3_CellIndexLeaf], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellIndexLeaf
proc read*(_: typedesc[Sqlite3_Serials], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_CellPayload): Sqlite3_Serials
proc read*(_: typedesc[Sqlite3_CellTableLeaf], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellTableLeaf
proc read*(_: typedesc[Sqlite3_CellPayload], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3_CellPayload
proc read*(_: typedesc[Sqlite3_CellTableInterior], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellTableInterior
proc read*(_: typedesc[Sqlite3_CellIndexInterior], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellIndexInterior
proc read*(_: typedesc[Sqlite3_ColumnContent], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_CellPayload, ser: any): Sqlite3_ColumnContent
proc read*(_: typedesc[Sqlite3_RefCell], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_BtreePage): Sqlite3_RefCell

proc lenPage*(this: Sqlite3): int
proc isBlob*(this: Sqlite3_Serial): bool
proc isString*(this: Sqlite3_Serial): bool
proc lenContent*(this: Sqlite3_Serial): int
proc serialType*(this: Sqlite3_ColumnContent): Sqlite3_Serial
proc body*(this: Sqlite3_RefCell): KaitaiStruct


##[
SQLite3 is a popular serverless SQL engine, implemented as a library
to be used within other applications. It keeps its databases as
regular disk files.

Every database file is segmented into pages. First page (starting at
the very beginning) is special: it contains a file-global header
which specifies some data relevant to proper parsing (i.e. format
versions, size of page, etc). After the header, normal contents of
the first page follow.

Each page would be of some type, and generally, they would be
reached via the links starting from the first page. First page type
(`root_page`) is always "btree_page".

@see <a href="https://www.sqlite.org/fileformat.html">Source</a>
]##
proc read*(_: typedesc[Sqlite3], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3 =
  template this: untyped = result
  this = new(Sqlite3)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(16))
  this.magic = magicExpr

  ##[
  The database page size in bytes. Must be a power of two between
512 and 32768 inclusive, or the value 1 representing a page size
of 65536.

  ]##
  let lenPageModExpr = this.io.readU2be()
  this.lenPageMod = lenPageModExpr
  let writeVersionExpr = Sqlite3_Versions(this.io.readU1())
  this.writeVersion = writeVersionExpr
  let readVersionExpr = Sqlite3_Versions(this.io.readU1())
  this.readVersion = readVersionExpr

  ##[
  Bytes of unused "reserved" space at the end of each page. Usually 0.
  ]##
  let reservedSpaceExpr = this.io.readU1()
  this.reservedSpace = reservedSpaceExpr

  ##[
  Maximum embedded payload fraction. Must be 64.
  ]##
  let maxPayloadFracExpr = this.io.readU1()
  this.maxPayloadFrac = maxPayloadFracExpr

  ##[
  Minimum embedded payload fraction. Must be 32.
  ]##
  let minPayloadFracExpr = this.io.readU1()
  this.minPayloadFrac = minPayloadFracExpr

  ##[
  Leaf payload fraction. Must be 32.
  ]##
  let leafPayloadFracExpr = this.io.readU1()
  this.leafPayloadFrac = leafPayloadFracExpr
  let fileChangeCounterExpr = this.io.readU4be()
  this.fileChangeCounter = fileChangeCounterExpr

  ##[
  Size of the database file in pages. The "in-header database size".
  ]##
  let numPagesExpr = this.io.readU4be()
  this.numPages = numPagesExpr

  ##[
  Page number of the first freelist trunk page.
  ]##
  let firstFreelistTrunkPageExpr = this.io.readU4be()
  this.firstFreelistTrunkPage = firstFreelistTrunkPageExpr

  ##[
  Total number of freelist pages.
  ]##
  let numFreelistPagesExpr = this.io.readU4be()
  this.numFreelistPages = numFreelistPagesExpr
  let schemaCookieExpr = this.io.readU4be()
  this.schemaCookie = schemaCookieExpr

  ##[
  The schema format number. Supported schema formats are 1, 2, 3, and 4.
  ]##
  let schemaFormatExpr = this.io.readU4be()
  this.schemaFormat = schemaFormatExpr

  ##[
  Default page cache size.
  ]##
  let defPageCacheSizeExpr = this.io.readU4be()
  this.defPageCacheSize = defPageCacheSizeExpr

  ##[
  The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
  ]##
  let largestRootPageExpr = this.io.readU4be()
  this.largestRootPage = largestRootPageExpr

  ##[
  The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
  ]##
  let textEncodingExpr = Sqlite3_Encodings(this.io.readU4be())
  this.textEncoding = textEncodingExpr

  ##[
  The "user version" as read and set by the user_version pragma.
  ]##
  let userVersionExpr = this.io.readU4be()
  this.userVersion = userVersionExpr

  ##[
  True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
  ]##
  let isIncrementalVacuumExpr = this.io.readU4be()
  this.isIncrementalVacuum = isIncrementalVacuumExpr

  ##[
  The "Application ID" set by PRAGMA application_id.
  ]##
  let applicationIdExpr = this.io.readU4be()
  this.applicationId = applicationIdExpr
  let reservedExpr = this.io.readBytes(int(20))
  this.reserved = reservedExpr
  let versionValidForExpr = this.io.readU4be()
  this.versionValidFor = versionValidForExpr
  let sqliteVersionNumberExpr = this.io.readU4be()
  this.sqliteVersionNumber = sqliteVersionNumberExpr
  let rootPageExpr = Sqlite3_BtreePage.read(this.io, this.root, this)
  this.rootPage = rootPageExpr

proc lenPage(this: Sqlite3): int = 
  if this.lenPageInstFlag:
    return this.lenPageInst
  let lenPageInstExpr = int((if this.lenPageMod == 1: 65536 else: this.lenPageMod))
  this.lenPageInst = lenPageInstExpr
  this.lenPageInstFlag = true
  return this.lenPageInst

proc fromFile*(_: typedesc[Sqlite3], filename: string): Sqlite3 =
  Sqlite3.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Sqlite3_Serial], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3_Serial =
  template this: untyped = result
  this = new(Sqlite3_Serial)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = VlqBase128Be.read(this.io, this.root, this)
  this.code = codeExpr

proc isBlob(this: Sqlite3_Serial): bool = 
  if this.isBlobInstFlag:
    return this.isBlobInst
  let isBlobInstExpr = bool( ((this.code.value >= 12) and ((this.code.value %%% 2) == 0)) )
  this.isBlobInst = isBlobInstExpr
  this.isBlobInstFlag = true
  return this.isBlobInst

proc isString(this: Sqlite3_Serial): bool = 
  if this.isStringInstFlag:
    return this.isStringInst
  let isStringInstExpr = bool( ((this.code.value >= 13) and ((this.code.value %%% 2) == 1)) )
  this.isStringInst = isStringInstExpr
  this.isStringInstFlag = true
  return this.isStringInst

proc lenContent(this: Sqlite3_Serial): int = 
  if this.lenContentInstFlag:
    return this.lenContentInst
  if this.code.value >= 12:
    let lenContentInstExpr = int(((this.code.value - 12) div 2))
    this.lenContentInst = lenContentInstExpr
  this.lenContentInstFlag = true
  return this.lenContentInst

proc fromFile*(_: typedesc[Sqlite3_Serial], filename: string): Sqlite3_Serial =
  Sqlite3_Serial.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Sqlite3_BtreePage], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3): Sqlite3_BtreePage =
  template this: untyped = result
  this = new(Sqlite3_BtreePage)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pageTypeExpr = this.io.readU1()
  this.pageType = pageTypeExpr
  let firstFreeblockExpr = this.io.readU2be()
  this.firstFreeblock = firstFreeblockExpr
  let numCellsExpr = this.io.readU2be()
  this.numCells = numCellsExpr
  let ofsCellsExpr = this.io.readU2be()
  this.ofsCells = ofsCellsExpr
  let numFragFreeBytesExpr = this.io.readU1()
  this.numFragFreeBytes = numFragFreeBytesExpr
  if  ((this.pageType == 2) or (this.pageType == 5)) :
    let rightPtrExpr = this.io.readU4be()
    this.rightPtr = rightPtrExpr
  for i in 0 ..< int(this.numCells):
    let it = Sqlite3_RefCell.read(this.io, this.root, this)
    this.cells.add(it)

proc fromFile*(_: typedesc[Sqlite3_BtreePage], filename: string): Sqlite3_BtreePage =
  Sqlite3_BtreePage.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
]##
proc read*(_: typedesc[Sqlite3_CellIndexLeaf], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellIndexLeaf =
  template this: untyped = result
  this = new(Sqlite3_CellIndexLeaf)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenPayloadExpr = VlqBase128Be.read(this.io, this.root, this)
  this.lenPayload = lenPayloadExpr
  let rawPayloadExpr = this.io.readBytes(int(this.lenPayload.value))
  this.rawPayload = rawPayloadExpr
  let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
  let payloadExpr = Sqlite3_CellPayload.read(rawPayloadIo, this.root, this)
  this.payload = payloadExpr

proc fromFile*(_: typedesc[Sqlite3_CellIndexLeaf], filename: string): Sqlite3_CellIndexLeaf =
  Sqlite3_CellIndexLeaf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Sqlite3_Serials], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_CellPayload): Sqlite3_Serials =
  template this: untyped = result
  this = new(Sqlite3_Serials)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = VlqBase128Be.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Sqlite3_Serials], filename: string): Sqlite3_Serials =
  Sqlite3_Serials.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
]##
proc read*(_: typedesc[Sqlite3_CellTableLeaf], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellTableLeaf =
  template this: untyped = result
  this = new(Sqlite3_CellTableLeaf)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenPayloadExpr = VlqBase128Be.read(this.io, this.root, this)
  this.lenPayload = lenPayloadExpr
  let rowIdExpr = VlqBase128Be.read(this.io, this.root, this)
  this.rowId = rowIdExpr
  let rawPayloadExpr = this.io.readBytes(int(this.lenPayload.value))
  this.rawPayload = rawPayloadExpr
  let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
  let payloadExpr = Sqlite3_CellPayload.read(rawPayloadIo, this.root, this)
  this.payload = payloadExpr

proc fromFile*(_: typedesc[Sqlite3_CellTableLeaf], filename: string): Sqlite3_CellTableLeaf =
  Sqlite3_CellTableLeaf.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://sqlite.org/fileformat2.html#record_format">Source</a>
]##
proc read*(_: typedesc[Sqlite3_CellPayload], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Sqlite3_CellPayload =
  template this: untyped = result
  this = new(Sqlite3_CellPayload)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenHeaderAndLenExpr = VlqBase128Be.read(this.io, this.root, this)
  this.lenHeaderAndLen = lenHeaderAndLenExpr
  let rawColumnSerialsExpr = this.io.readBytes(int((this.lenHeaderAndLen.value - 1)))
  this.rawColumnSerials = rawColumnSerialsExpr
  let rawColumnSerialsIo = newKaitaiStream(rawColumnSerialsExpr)
  let columnSerialsExpr = Sqlite3_Serials.read(rawColumnSerialsIo, this.root, this)
  this.columnSerials = columnSerialsExpr
  for i in 0 ..< int(len(this.columnSerials.entries)):
    let it = Sqlite3_ColumnContent.read(this.io, this.root, this, this.columnSerials.entries[i])
    this.columnContents.add(it)

proc fromFile*(_: typedesc[Sqlite3_CellPayload], filename: string): Sqlite3_CellPayload =
  Sqlite3_CellPayload.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
]##
proc read*(_: typedesc[Sqlite3_CellTableInterior], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellTableInterior =
  template this: untyped = result
  this = new(Sqlite3_CellTableInterior)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftChildPageExpr = this.io.readU4be()
  this.leftChildPage = leftChildPageExpr
  let rowIdExpr = VlqBase128Be.read(this.io, this.root, this)
  this.rowId = rowIdExpr

proc fromFile*(_: typedesc[Sqlite3_CellTableInterior], filename: string): Sqlite3_CellTableInterior =
  Sqlite3_CellTableInterior.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
]##
proc read*(_: typedesc[Sqlite3_CellIndexInterior], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_RefCell): Sqlite3_CellIndexInterior =
  template this: untyped = result
  this = new(Sqlite3_CellIndexInterior)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftChildPageExpr = this.io.readU4be()
  this.leftChildPage = leftChildPageExpr
  let lenPayloadExpr = VlqBase128Be.read(this.io, this.root, this)
  this.lenPayload = lenPayloadExpr
  let rawPayloadExpr = this.io.readBytes(int(this.lenPayload.value))
  this.rawPayload = rawPayloadExpr
  let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
  let payloadExpr = Sqlite3_CellPayload.read(rawPayloadIo, this.root, this)
  this.payload = payloadExpr

proc fromFile*(_: typedesc[Sqlite3_CellIndexInterior], filename: string): Sqlite3_CellIndexInterior =
  Sqlite3_CellIndexInterior.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Sqlite3_ColumnContent], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_CellPayload, ser: any): Sqlite3_ColumnContent =
  template this: untyped = result
  this = new(Sqlite3_ColumnContent)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent
  let serExpr = KaitaiStruct(ser)
  this.ser = serExpr

  if  ((this.serialType.code.value >= 1) and (this.serialType.code.value <= 6)) :
    block:
      let on = this.serialType.code.value
      if on == 4:
        let asIntExpr = int(this.io.readU4be())
        this.asInt = asIntExpr
      elif on == 6:
        let asIntExpr = int(this.io.readU8be())
        this.asInt = asIntExpr
      elif on == 1:
        let asIntExpr = int(this.io.readU1())
        this.asInt = asIntExpr
      elif on == 3:
        let asIntExpr = int(this.io.readBitsIntBe(24))
        this.asInt = asIntExpr
      elif on == 5:
        let asIntExpr = int(this.io.readBitsIntBe(48))
        this.asInt = asIntExpr
      elif on == 2:
        let asIntExpr = int(this.io.readU2be())
        this.asInt = asIntExpr
  if this.serialType.code.value == 7:
    let asFloatExpr = this.io.readF8be()
    this.asFloat = asFloatExpr
  if this.serialType.isBlob:
    let asBlobExpr = this.io.readBytes(int(this.serialType.lenContent))
    this.asBlob = asBlobExpr
  let asStrExpr = encode(this.io.readBytes(int(this.serialType.lenContent)), "UTF-8")
  this.asStr = asStrExpr

proc serialType(this: Sqlite3_ColumnContent): Sqlite3_Serial = 
  if this.serialTypeInstFlag:
    return this.serialTypeInst
  let serialTypeInstExpr = Sqlite3_Serial((Sqlite3_Serial(this.ser)))
  this.serialTypeInst = serialTypeInstExpr
  this.serialTypeInstFlag = true
  return this.serialTypeInst

proc fromFile*(_: typedesc[Sqlite3_ColumnContent], filename: string): Sqlite3_ColumnContent =
  Sqlite3_ColumnContent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Sqlite3_RefCell], io: KaitaiStream, root: KaitaiStruct, parent: Sqlite3_BtreePage): Sqlite3_RefCell =
  template this: untyped = result
  this = new(Sqlite3_RefCell)
  let root = if root == nil: cast[Sqlite3](this) else: cast[Sqlite3](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsBodyExpr = this.io.readU2be()
  this.ofsBody = ofsBodyExpr

proc body(this: Sqlite3_RefCell): KaitaiStruct = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsBody))
  block:
    let on = this.parent.pageType
    if on == 13:
      let bodyInstExpr = Sqlite3_CellTableLeaf.read(this.io, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == 5:
      let bodyInstExpr = Sqlite3_CellTableInterior.read(this.io, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == 10:
      let bodyInstExpr = Sqlite3_CellIndexLeaf.read(this.io, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == 2:
      let bodyInstExpr = Sqlite3_CellIndexInterior.read(this.io, this.root, this)
      this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[Sqlite3_RefCell], filename: string): Sqlite3_RefCell =
  Sqlite3_RefCell.read(newKaitaiFileStream(filename), nil, nil)

