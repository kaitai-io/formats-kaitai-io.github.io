import kaitai_struct_nim_runtime
import options

type
  Dbf* = ref object of KaitaiStruct
    `header1`*: Dbf_Header1
    `header2`*: Dbf_Header2
    `records`*: seq[seq[byte]]
    `parent`*: KaitaiStruct
    `rawHeader2`*: seq[byte]
  Dbf_Header2* = ref object of KaitaiStruct
    `headerDbase3`*: Dbf_HeaderDbase3
    `headerDbase7`*: Dbf_HeaderDbase7
    `fields`*: seq[Dbf_Field]
    `parent`*: Dbf
  Dbf_Field* = ref object of KaitaiStruct
    `name`*: string
    `datatype`*: uint8
    `dataAddress`*: uint32
    `length`*: uint8
    `decimalCount`*: uint8
    `reserved1`*: seq[byte]
    `workAreaId`*: uint8
    `reserved2`*: seq[byte]
    `setFieldsFlag`*: uint8
    `reserved3`*: seq[byte]
    `parent`*: Dbf_Header2
  Dbf_Header1* = ref object of KaitaiStruct
    `version`*: uint8
    `lastUpdateY`*: uint8
    `lastUpdateM`*: uint8
    `lastUpdateD`*: uint8
    `numRecords`*: uint32
    `lenHeader`*: uint16
    `lenRecord`*: uint16
    `parent`*: Dbf
    `dbaseLevelInst`*: int
  Dbf_HeaderDbase3* = ref object of KaitaiStruct
    `reserved1`*: seq[byte]
    `reserved2`*: seq[byte]
    `reserved3`*: seq[byte]
    `parent`*: Dbf_Header2
  Dbf_HeaderDbase7* = ref object of KaitaiStruct
    `reserved1`*: seq[byte]
    `hasIncompleteTransaction`*: uint8
    `dbaseIvEncryption`*: uint8
    `reserved2`*: seq[byte]
    `productionMdx`*: uint8
    `languageDriverId`*: uint8
    `reserved3`*: seq[byte]
    `languageDriverName`*: seq[byte]
    `reserved4`*: seq[byte]
    `parent`*: Dbf_Header2

proc read*(_: typedesc[Dbf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dbf
proc read*(_: typedesc[Dbf_Header2], io: KaitaiStream, root: KaitaiStruct, parent: Dbf): Dbf_Header2
proc read*(_: typedesc[Dbf_Field], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_Field
proc read*(_: typedesc[Dbf_Header1], io: KaitaiStream, root: KaitaiStruct, parent: Dbf): Dbf_Header1
proc read*(_: typedesc[Dbf_HeaderDbase3], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_HeaderDbase3
proc read*(_: typedesc[Dbf_HeaderDbase7], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_HeaderDbase7

proc dbaseLevel*(this: Dbf_Header1): int


##[
.dbf is a relational database format introduced in DOS database
management system dBASE in 1982.

One .dbf file corresponds to one table and contains a series of headers,
specification of fields, and a number of fixed-size records.

@see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">Source</a>
]##
proc read*(_: typedesc[Dbf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dbf =
  template this: untyped = result
  this = new(Dbf)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let header1Expr = Dbf_Header1.read(this.io, this.root, this)
  this.header1 = header1Expr
  let rawHeader2Expr = this.io.readBytes(int((this.header1.lenHeader - 12)))
  this.rawHeader2 = rawHeader2Expr
  let rawHeader2Io = newKaitaiStream(rawHeader2Expr)
  let header2Expr = Dbf_Header2.read(rawHeader2Io, this.root, this)
  this.header2 = header2Expr
  for i in 0 ..< int(this.header1.numRecords):
    let it = this.io.readBytes(int(this.header1.lenRecord))
    this.records.add(it)

proc fromFile*(_: typedesc[Dbf], filename: string): Dbf =
  Dbf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dbf_Header2], io: KaitaiStream, root: KaitaiStruct, parent: Dbf): Dbf_Header2 =
  template this: untyped = result
  this = new(Dbf_Header2)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  if Dbf(this.root).header1.dbaseLevel == 3:
    let headerDbase3Expr = Dbf_HeaderDbase3.read(this.io, this.root, this)
    this.headerDbase3 = headerDbase3Expr
  if Dbf(this.root).header1.dbaseLevel == 7:
    let headerDbase7Expr = Dbf_HeaderDbase7.read(this.io, this.root, this)
    this.headerDbase7 = headerDbase7Expr
  for i in 0 ..< int(11):
    let it = Dbf_Field.read(this.io, this.root, this)
    this.fields.add(it)

proc fromFile*(_: typedesc[Dbf_Header2], filename: string): Dbf_Header2 =
  Dbf_Header2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dbf_Field], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_Field =
  template this: untyped = result
  this = new(Dbf_Field)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(11)), "ASCII")
  this.name = nameExpr
  let datatypeExpr = this.io.readU1()
  this.datatype = datatypeExpr
  let dataAddressExpr = this.io.readU4le()
  this.dataAddress = dataAddressExpr
  let lengthExpr = this.io.readU1()
  this.length = lengthExpr
  let decimalCountExpr = this.io.readU1()
  this.decimalCount = decimalCountExpr
  let reserved1Expr = this.io.readBytes(int(2))
  this.reserved1 = reserved1Expr
  let workAreaIdExpr = this.io.readU1()
  this.workAreaId = workAreaIdExpr
  let reserved2Expr = this.io.readBytes(int(2))
  this.reserved2 = reserved2Expr
  let setFieldsFlagExpr = this.io.readU1()
  this.setFieldsFlag = setFieldsFlagExpr
  let reserved3Expr = this.io.readBytes(int(8))
  this.reserved3 = reserved3Expr

proc fromFile*(_: typedesc[Dbf_Field], filename: string): Dbf_Field =
  Dbf_Field.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">- section 1.1</a>
]##
proc read*(_: typedesc[Dbf_Header1], io: KaitaiStream, root: KaitaiStruct, parent: Dbf): Dbf_Header1 =
  template this: untyped = result
  this = new(Dbf_Header1)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let lastUpdateYExpr = this.io.readU1()
  this.lastUpdateY = lastUpdateYExpr
  let lastUpdateMExpr = this.io.readU1()
  this.lastUpdateM = lastUpdateMExpr
  let lastUpdateDExpr = this.io.readU1()
  this.lastUpdateD = lastUpdateDExpr
  let numRecordsExpr = this.io.readU4le()
  this.numRecords = numRecordsExpr
  let lenHeaderExpr = this.io.readU2le()
  this.lenHeader = lenHeaderExpr
  let lenRecordExpr = this.io.readU2le()
  this.lenRecord = lenRecordExpr

proc dbaseLevel(this: Dbf_Header1): int = 
  if this.dbaseLevelInst != nil:
    return this.dbaseLevelInst
  let dbaseLevelInstExpr = int((this.version and 7))
  this.dbaseLevelInst = dbaseLevelInstExpr
  if this.dbaseLevelInst != nil:
    return this.dbaseLevelInst

proc fromFile*(_: typedesc[Dbf_Header1], filename: string): Dbf_Header1 =
  Dbf_Header1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dbf_HeaderDbase3], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_HeaderDbase3 =
  template this: untyped = result
  this = new(Dbf_HeaderDbase3)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBytes(int(3))
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readBytes(int(13))
  this.reserved2 = reserved2Expr
  let reserved3Expr = this.io.readBytes(int(4))
  this.reserved3 = reserved3Expr

proc fromFile*(_: typedesc[Dbf_HeaderDbase3], filename: string): Dbf_HeaderDbase3 =
  Dbf_HeaderDbase3.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dbf_HeaderDbase7], io: KaitaiStream, root: KaitaiStruct, parent: Dbf_Header2): Dbf_HeaderDbase7 =
  template this: untyped = result
  this = new(Dbf_HeaderDbase7)
  let root = if root == nil: cast[Dbf](this) else: cast[Dbf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBytes(int(2))
  this.reserved1 = reserved1Expr
  let hasIncompleteTransactionExpr = this.io.readU1()
  this.hasIncompleteTransaction = hasIncompleteTransactionExpr
  let dbaseIvEncryptionExpr = this.io.readU1()
  this.dbaseIvEncryption = dbaseIvEncryptionExpr
  let reserved2Expr = this.io.readBytes(int(12))
  this.reserved2 = reserved2Expr
  let productionMdxExpr = this.io.readU1()
  this.productionMdx = productionMdxExpr
  let languageDriverIdExpr = this.io.readU1()
  this.languageDriverId = languageDriverIdExpr
  let reserved3Expr = this.io.readBytes(int(2))
  this.reserved3 = reserved3Expr
  let languageDriverNameExpr = this.io.readBytes(int(32))
  this.languageDriverName = languageDriverNameExpr
  let reserved4Expr = this.io.readBytes(int(4))
  this.reserved4 = reserved4Expr

proc fromFile*(_: typedesc[Dbf_HeaderDbase7], filename: string): Dbf_HeaderDbase7 =
  Dbf_HeaderDbase7.read(newKaitaiFileStream(filename), nil, nil)

