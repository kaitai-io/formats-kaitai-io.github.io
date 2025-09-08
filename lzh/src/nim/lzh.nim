import kaitai_struct_nim_runtime
import options
import dos_datetime

type
  Lzh* = ref object of KaitaiStruct
    `entries`*: seq[Lzh_Record]
    `parent`*: KaitaiStruct
  Lzh_FileRecord* = ref object of KaitaiStruct
    `header`*: Lzh_Header
    `fileUncomprCrc16`*: uint16
    `body`*: seq[byte]
    `parent`*: Lzh_Record
    `rawHeader`*: seq[byte]
  Lzh_Header* = ref object of KaitaiStruct
    `header1`*: Lzh_Header1
    `filenameLen`*: uint8
    `filename`*: string
    `fileUncomprCrc16`*: uint16
    `os`*: uint8
    `extHeaderSize`*: uint16
    `parent`*: Lzh_FileRecord
  Lzh_Header1* = ref object of KaitaiStruct
    `headerChecksum`*: uint8
    `methodId`*: string
    `fileSizeCompr`*: uint32
    `fileSizeUncompr`*: uint32
    `fileTimestamp`*: DosDatetime
    `attr`*: uint8
    `lhaLevel`*: uint8
    `parent`*: Lzh_Header
    `rawFileTimestamp`*: seq[byte]
  Lzh_Record* = ref object of KaitaiStruct
    `headerLen`*: uint8
    `fileRecord`*: Lzh_FileRecord
    `parent`*: Lzh

proc read*(_: typedesc[Lzh], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lzh
proc read*(_: typedesc[Lzh_FileRecord], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_Record): Lzh_FileRecord
proc read*(_: typedesc[Lzh_Header], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_FileRecord): Lzh_Header
proc read*(_: typedesc[Lzh_Header1], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_Header): Lzh_Header1
proc read*(_: typedesc[Lzh_Record], io: KaitaiStream, root: KaitaiStruct, parent: Lzh): Lzh_Record



##[
LHA (LHarc, LZH) is a file format used by a popular freeware
eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
years, many ports and implementations were developed, sporting many
extensions to original 1988 LZH.

File format is pretty simple and essentially consists of a stream of
records.

]##
proc read*(_: typedesc[Lzh], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lzh =
  template this: untyped = result
  this = new(Lzh)
  let root = if root == nil: cast[Lzh](this) else: cast[Lzh](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Lzh_Record.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Lzh], filename: string): Lzh =
  Lzh.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lzh_FileRecord], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_Record): Lzh_FileRecord =
  template this: untyped = result
  this = new(Lzh_FileRecord)
  let root = if root == nil: cast[Lzh](this) else: cast[Lzh](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHeaderExpr = this.io.readBytes(int(this.parent.headerLen - 1))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Lzh_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  if this.header.header1.lhaLevel == 0:
    let fileUncomprCrc16Expr = this.io.readU2le()
    this.fileUncomprCrc16 = fileUncomprCrc16Expr
  let bodyExpr = this.io.readBytes(int(this.header.header1.fileSizeCompr))
  this.body = bodyExpr

proc fromFile*(_: typedesc[Lzh_FileRecord], filename: string): Lzh_FileRecord =
  Lzh_FileRecord.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lzh_Header], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_FileRecord): Lzh_Header =
  template this: untyped = result
  this = new(Lzh_Header)
  let root = if root == nil: cast[Lzh](this) else: cast[Lzh](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.

  ]##
  let header1Expr = Lzh_Header1.read(this.io, this.root, this)
  this.header1 = header1Expr
  if this.header1.lhaLevel == 0:
    let filenameLenExpr = this.io.readU1()
    this.filenameLen = filenameLenExpr
  if this.header1.lhaLevel == 0:
    let filenameExpr = encode(this.io.readBytes(int(this.filenameLen)), "ASCII")
    this.filename = filenameExpr
  if this.header1.lhaLevel == 2:
    let fileUncomprCrc16Expr = this.io.readU2le()
    this.fileUncomprCrc16 = fileUncomprCrc16Expr
  if this.header1.lhaLevel == 2:
    let osExpr = this.io.readU1()
    this.os = osExpr
  if this.header1.lhaLevel == 2:
    let extHeaderSizeExpr = this.io.readU2le()
    this.extHeaderSize = extHeaderSizeExpr

proc fromFile*(_: typedesc[Lzh_Header], filename: string): Lzh_Header =
  Lzh_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lzh_Header1], io: KaitaiStream, root: KaitaiStruct, parent: Lzh_Header): Lzh_Header1 =
  template this: untyped = result
  this = new(Lzh_Header1)
  let root = if root == nil: cast[Lzh](this) else: cast[Lzh](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerChecksumExpr = this.io.readU1()
  this.headerChecksum = headerChecksumExpr
  let methodIdExpr = encode(this.io.readBytes(int(5)), "ASCII")
  this.methodId = methodIdExpr

  ##[
  Compressed file size
  ]##
  let fileSizeComprExpr = this.io.readU4le()
  this.fileSizeCompr = fileSizeComprExpr

  ##[
  Uncompressed file size
  ]##
  let fileSizeUncomprExpr = this.io.readU4le()
  this.fileSizeUncompr = fileSizeUncomprExpr

  ##[
  Original file date/time
  ]##
  let rawFileTimestampExpr = this.io.readBytes(int(4))
  this.rawFileTimestamp = rawFileTimestampExpr
  let rawFileTimestampIo = newKaitaiStream(rawFileTimestampExpr)
  let fileTimestampExpr = DosDatetime.read(rawFileTimestampIo, nil, nil)
  this.fileTimestamp = fileTimestampExpr

  ##[
  File or directory attribute
  ]##
  let attrExpr = this.io.readU1()
  this.attr = attrExpr
  let lhaLevelExpr = this.io.readU1()
  this.lhaLevel = lhaLevelExpr

proc fromFile*(_: typedesc[Lzh_Header1], filename: string): Lzh_Header1 =
  Lzh_Header1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lzh_Record], io: KaitaiStream, root: KaitaiStruct, parent: Lzh): Lzh_Record =
  template this: untyped = result
  this = new(Lzh_Record)
  let root = if root == nil: cast[Lzh](this) else: cast[Lzh](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerLenExpr = this.io.readU1()
  this.headerLen = headerLenExpr
  if this.headerLen > 0:
    let fileRecordExpr = Lzh_FileRecord.read(this.io, this.root, this)
    this.fileRecord = fileRecordExpr

proc fromFile*(_: typedesc[Lzh_Record], filename: string): Lzh_Record =
  Lzh_Record.read(newKaitaiFileStream(filename), nil, nil)

