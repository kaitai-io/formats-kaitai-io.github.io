import kaitai_struct_nim_runtime
import options

type
  WindowsEvtLog* = ref object of KaitaiStruct
    `header`*: WindowsEvtLog_Header
    `records`*: seq[WindowsEvtLog_Record]
    `parent`*: KaitaiStruct
  WindowsEvtLog_Header* = ref object of KaitaiStruct
    `lenHeader`*: uint32
    `magic`*: seq[byte]
    `versionMajor`*: uint32
    `versionMinor`*: uint32
    `ofsStart`*: uint32
    `ofsEnd`*: uint32
    `curRecIdx`*: uint32
    `oldestRecIdx`*: uint32
    `lenFileMax`*: uint32
    `flags`*: WindowsEvtLog_Header_Flags
    `retention`*: uint32
    `lenHeader2`*: uint32
    `parent`*: WindowsEvtLog
  WindowsEvtLog_Header_Flags* = ref object of KaitaiStruct
    `reserved`*: uint64
    `archive`*: bool
    `logFull`*: bool
    `wrap`*: bool
    `dirty`*: bool
    `parent`*: WindowsEvtLog_Header
  WindowsEvtLog_Record* = ref object of KaitaiStruct
    `lenRecord`*: uint32
    `type`*: uint32
    `body`*: KaitaiStruct
    `lenRecord2`*: uint32
    `parent`*: WindowsEvtLog
    `rawBody`*: seq[byte]
  WindowsEvtLog_RecordBody* = ref object of KaitaiStruct
    `idx`*: uint32
    `timeGenerated`*: uint32
    `timeWritten`*: uint32
    `eventId`*: uint32
    `eventType`*: WindowsEvtLog_RecordBody_EventTypes
    `numStrings`*: uint16
    `eventCategory`*: uint16
    `reserved`*: seq[byte]
    `ofsStrings`*: uint32
    `lenUserSid`*: uint32
    `ofsUserSid`*: uint32
    `lenData`*: uint32
    `ofsData`*: uint32
    `parent`*: WindowsEvtLog_Record
    `userSidInst`*: seq[byte]
    `dataInst`*: seq[byte]
  WindowsEvtLog_RecordBody_EventTypes* = enum
    error = 1
    audit_failure = 2
    audit_success = 3
    info = 4
    warning = 5
  WindowsEvtLog_CursorRecordBody* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ofsFirstRecord`*: uint32
    `ofsNextRecord`*: uint32
    `idxNextRecord`*: uint32
    `idxFirstRecord`*: uint32
    `parent`*: WindowsEvtLog_Record

proc read*(_: typedesc[WindowsEvtLog], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsEvtLog
proc read*(_: typedesc[WindowsEvtLog_Header], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog): WindowsEvtLog_Header
proc read*(_: typedesc[WindowsEvtLog_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Header): WindowsEvtLog_Header_Flags
proc read*(_: typedesc[WindowsEvtLog_Record], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog): WindowsEvtLog_Record
proc read*(_: typedesc[WindowsEvtLog_RecordBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Record): WindowsEvtLog_RecordBody
proc read*(_: typedesc[WindowsEvtLog_CursorRecordBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Record): WindowsEvtLog_CursorRecordBody

proc userSid*(this: WindowsEvtLog_RecordBody): seq[byte]
proc data*(this: WindowsEvtLog_RecordBody): seq[byte]


##[
EVT files are Windows Event Log files written by older Windows
operating systems (2000, XP, 2003). They are used as binary log
files by several major Windows subsystems and
applications. Typically, several of them can be found in
`%WINDIR%\system32\config` directory:

* Application = `AppEvent.evt`
* System = `SysEvent.evt`
* Security = `SecEvent.evt`

Alternatively, one can export any system event log as distinct .evt
file using relevant option in Event Viewer application.

A Windows application can submit an entry into these logs using
[ReportEventA](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
function of Windows API.

Internally, EVT files consist of a fixed-size header and event
records. There are several usage scenarios (non-wrapping vs wrapping
log files) which result in slightly different organization of
records.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format">Source</a>
]##
proc read*(_: typedesc[WindowsEvtLog], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsEvtLog =
  template this: untyped = result
  this = new(WindowsEvtLog)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = WindowsEvtLog_Header.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = WindowsEvtLog_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[WindowsEvtLog], filename: string): WindowsEvtLog =
  WindowsEvtLog.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)">Source</a>
]##
proc read*(_: typedesc[WindowsEvtLog_Header], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog): WindowsEvtLog_Header =
  template this: untyped = result
  this = new(WindowsEvtLog_Header)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Size of the header structure, must be 0x30.
  ]##
  let lenHeaderExpr = this.io.readU4le()
  this.lenHeader = lenHeaderExpr
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionMajorExpr = this.io.readU4le()
  this.versionMajor = versionMajorExpr
  let versionMinorExpr = this.io.readU4le()
  this.versionMinor = versionMinorExpr

  ##[
  Offset of oldest record kept in this log file.
  ]##
  let ofsStartExpr = this.io.readU4le()
  this.ofsStart = ofsStartExpr

  ##[
  Offset of EOF log record, which is a placeholder for new record.
  ]##
  let ofsEndExpr = this.io.readU4le()
  this.ofsEnd = ofsEndExpr

  ##[
  Index of current record, where a new submission would be
written to (normally there should to EOF log record there).

  ]##
  let curRecIdxExpr = this.io.readU4le()
  this.curRecIdx = curRecIdxExpr

  ##[
  Index of oldest record in the log file
  ]##
  let oldestRecIdxExpr = this.io.readU4le()
  this.oldestRecIdx = oldestRecIdxExpr

  ##[
  Total maximum size of the log file
  ]##
  let lenFileMaxExpr = this.io.readU4le()
  this.lenFileMax = lenFileMaxExpr
  let flagsExpr = WindowsEvtLog_Header_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let retentionExpr = this.io.readU4le()
  this.retention = retentionExpr

  ##[
  Size of the header structure repeated again, and again it must be 0x30.
  ]##
  let lenHeader2Expr = this.io.readU4le()
  this.lenHeader2 = lenHeader2Expr

proc fromFile*(_: typedesc[WindowsEvtLog_Header], filename: string): WindowsEvtLog_Header =
  WindowsEvtLog_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[WindowsEvtLog_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Header): WindowsEvtLog_Header_Flags =
  template this: untyped = result
  this = new(WindowsEvtLog_Header_Flags)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(28)
  this.reserved = reservedExpr

  ##[
  True if archive attribute has been set for this log file.
  ]##
  let archiveExpr = this.io.readBitsIntBe(1) != 0
  this.archive = archiveExpr

  ##[
  True if last write operation failed due to log being full.
  ]##
  let logFullExpr = this.io.readBitsIntBe(1) != 0
  this.logFull = logFullExpr

  ##[
  True if wrapping of record has occured.
  ]##
  let wrapExpr = this.io.readBitsIntBe(1) != 0
  this.wrap = wrapExpr

  ##[
  True if write operation was in progress, but log file
wasn't properly closed.

  ]##
  let dirtyExpr = this.io.readBitsIntBe(1) != 0
  this.dirty = dirtyExpr

proc fromFile*(_: typedesc[WindowsEvtLog_Header_Flags], filename: string): WindowsEvtLog_Header_Flags =
  WindowsEvtLog_Header_Flags.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
]##
proc read*(_: typedesc[WindowsEvtLog_Record], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog): WindowsEvtLog_Record =
  template this: untyped = result
  this = new(WindowsEvtLog_Record)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Size of whole record, including all headers, footers and data
  ]##
  let lenRecordExpr = this.io.readU4le()
  this.lenRecord = lenRecordExpr

  ##[
  Type of record. Normal log records specify "LfLe"
(0x654c664c) in this field, cursor records use 0x11111111.

  ]##
  let typeExpr = this.io.readU4le()
  this.type = typeExpr

  ##[
  Record body interpretation depends on type of record. Body
size is specified in a way that it won't include a 8-byte
"header" (`len_record` + `type`) and a "footer"
(`len_record2`).

  ]##
  block:
    let on = this.type
    if on == 1699505740:
      let rawBodyExpr = this.io.readBytes(int((this.lenRecord - 12)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = WindowsEvtLog_RecordBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == 286331153:
      let rawBodyExpr = this.io.readBytes(int((this.lenRecord - 12)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = WindowsEvtLog_CursorRecordBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int((this.lenRecord - 12)))
      this.body = bodyExpr

  ##[
  Size of whole record again.
  ]##
  let lenRecord2Expr = this.io.readU4le()
  this.lenRecord2 = lenRecord2Expr

proc fromFile*(_: typedesc[WindowsEvtLog_Record], filename: string): WindowsEvtLog_Record =
  WindowsEvtLog_Record.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
]##
proc read*(_: typedesc[WindowsEvtLog_RecordBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Record): WindowsEvtLog_RecordBody =
  template this: untyped = result
  this = new(WindowsEvtLog_RecordBody)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Index of record in the file.
  ]##
  let idxExpr = this.io.readU4le()
  this.idx = idxExpr

  ##[
  Time when this record was generated, POSIX timestamp format.
  ]##
  let timeGeneratedExpr = this.io.readU4le()
  this.timeGenerated = timeGeneratedExpr

  ##[
  Time when thsi record was written into the log file, POSIX timestamp format.
  ]##
  let timeWrittenExpr = this.io.readU4le()
  this.timeWritten = timeWrittenExpr

  ##[
  Identifier of an event, meaning is specific to particular
source of events / event type.

  ]##
  let eventIdExpr = this.io.readU4le()
  this.eventId = eventIdExpr

  ##[
  Type of event.
  @see <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-types">Source</a>
  ]##
  let eventTypeExpr = WindowsEvtLog_RecordBody_EventTypes(this.io.readU2le())
  this.eventType = eventTypeExpr

  ##[
  Number of strings present in the log.
  ]##
  let numStringsExpr = this.io.readU2le()
  this.numStrings = numStringsExpr

  ##[
  @see <a href="https://docs.microsoft.com/en-us/windows/win32/eventlog/event-categories">Source</a>
  ]##
  let eventCategoryExpr = this.io.readU2le()
  this.eventCategory = eventCategoryExpr
  let reservedExpr = this.io.readBytes(int(6))
  this.reserved = reservedExpr

  ##[
  Offset of strings present in the log
  ]##
  let ofsStringsExpr = this.io.readU4le()
  this.ofsStrings = ofsStringsExpr
  let lenUserSidExpr = this.io.readU4le()
  this.lenUserSid = lenUserSidExpr
  let ofsUserSidExpr = this.io.readU4le()
  this.ofsUserSid = ofsUserSidExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let ofsDataExpr = this.io.readU4le()
  this.ofsData = ofsDataExpr

proc userSid(this: WindowsEvtLog_RecordBody): seq[byte] = 
  if this.userSidInst.len != 0:
    return this.userSidInst
  let pos = this.io.pos()
  this.io.seek(int((this.ofsUserSid - 8)))
  let userSidInstExpr = this.io.readBytes(int(this.lenUserSid))
  this.userSidInst = userSidInstExpr
  this.io.seek(pos)
  if this.userSidInst.len != 0:
    return this.userSidInst

proc data(this: WindowsEvtLog_RecordBody): seq[byte] = 
  if this.dataInst.len != 0:
    return this.dataInst
  let pos = this.io.pos()
  this.io.seek(int((this.ofsData - 8)))
  let dataInstExpr = this.io.readBytes(int(this.lenData))
  this.dataInst = dataInstExpr
  this.io.seek(pos)
  if this.dataInst.len != 0:
    return this.dataInst

proc fromFile*(_: typedesc[WindowsEvtLog_RecordBody], filename: string): WindowsEvtLog_RecordBody =
  WindowsEvtLog_RecordBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record">Source</a>
]##
proc read*(_: typedesc[WindowsEvtLog_CursorRecordBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsEvtLog_Record): WindowsEvtLog_CursorRecordBody =
  template this: untyped = result
  this = new(WindowsEvtLog_CursorRecordBody)
  let root = if root == nil: cast[WindowsEvtLog](this) else: cast[WindowsEvtLog](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(12))
  this.magic = magicExpr
  let ofsFirstRecordExpr = this.io.readU4le()
  this.ofsFirstRecord = ofsFirstRecordExpr
  let ofsNextRecordExpr = this.io.readU4le()
  this.ofsNextRecord = ofsNextRecordExpr
  let idxNextRecordExpr = this.io.readU4le()
  this.idxNextRecord = idxNextRecordExpr
  let idxFirstRecordExpr = this.io.readU4le()
  this.idxFirstRecord = idxFirstRecordExpr

proc fromFile*(_: typedesc[WindowsEvtLog_CursorRecordBody], filename: string): WindowsEvtLog_CursorRecordBody =
  WindowsEvtLog_CursorRecordBody.read(newKaitaiFileStream(filename), nil, nil)

