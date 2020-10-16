import kaitai_struct_nim_runtime
import options

type
  SudoersTs* = ref object of KaitaiStruct
    `records`*: seq[SudoersTs_Record]
    `parent`*: KaitaiStruct
  SudoersTs_TsType* = enum
    global = 1
    tty = 2
    ppid = 3
    lockexcl = 4
  SudoersTs_RecordV2* = ref object of KaitaiStruct
    `type`*: SudoersTs_TsType
    `flags`*: SudoersTs_TsFlag
    `authUid`*: uint32
    `sid`*: uint32
    `startTime`*: SudoersTs_Timespec
    `ts`*: SudoersTs_Timespec
    `ttydev`*: uint32
    `ppid`*: uint32
    `parent`*: SudoersTs_Record
  SudoersTs_TsFlag* = ref object of KaitaiStruct
    `reserved0`*: uint64
    `anyuid`*: bool
    `disabled`*: bool
    `reserved1`*: uint64
    `parent`*: KaitaiStruct
  SudoersTs_RecordV1* = ref object of KaitaiStruct
    `type`*: SudoersTs_TsType
    `flags`*: SudoersTs_TsFlag
    `authUid`*: uint32
    `sid`*: uint32
    `ts`*: SudoersTs_Timespec
    `ttydev`*: uint32
    `ppid`*: uint32
    `parent`*: SudoersTs_Record
  SudoersTs_Timespec* = ref object of KaitaiStruct
    `sec`*: int64
    `nsec`*: int64
    `parent`*: KaitaiStruct
  SudoersTs_Record* = ref object of KaitaiStruct
    `version`*: uint16
    `lenRecord`*: uint16
    `payload`*: KaitaiStruct
    `parent`*: SudoersTs
    `rawPayload`*: seq[byte]

proc read*(_: typedesc[SudoersTs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs
proc read*(_: typedesc[SudoersTs_RecordV2], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs_Record): SudoersTs_RecordV2
proc read*(_: typedesc[SudoersTs_TsFlag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs_TsFlag
proc read*(_: typedesc[SudoersTs_RecordV1], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs_Record): SudoersTs_RecordV1
proc read*(_: typedesc[SudoersTs_Timespec], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs_Timespec
proc read*(_: typedesc[SudoersTs_Record], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs): SudoersTs_Record



##[
This spec can be used to parse sudo time stamp files located in directories
such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.

@see <a href="https://www.sudo.ws/man/1.8.27/sudoers_timestamp.man.html">Source</a>
]##
proc read*(_: typedesc[SudoersTs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs =
  template this: untyped = result
  this = new(SudoersTs)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SudoersTs_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[SudoersTs], filename: string): SudoersTs =
  SudoersTs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SudoersTs_RecordV2], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs_Record): SudoersTs_RecordV2 =
  template this: untyped = result
  this = new(SudoersTs_RecordV2)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  record type
  ]##
  let typeExpr = SudoersTs_TsType(this.io.readU2le())
  this.type = typeExpr

  ##[
  record flags
  ]##
  let flagsExpr = SudoersTs_TsFlag.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  user ID that was used for authentication
  ]##
  let authUidExpr = this.io.readU4le()
  this.authUid = authUidExpr

  ##[
  ID of the user's terminal session, if present (when type is TS_TTY)
  ]##
  let sidExpr = this.io.readU4le()
  this.sid = sidExpr

  ##[
  start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
  ]##
  let startTimeExpr = SudoersTs_Timespec.read(this.io, this.root, this)
  this.startTime = startTimeExpr

  ##[
  actual time stamp, from a monotonic time source
  ]##
  let tsExpr = SudoersTs_Timespec.read(this.io, this.root, this)
  this.ts = tsExpr

  ##[
  device number of the terminal associated with the session
  ]##
  if this.type == sudoers_ts.tty:
    let ttydevExpr = this.io.readU4le()
    this.ttydev = ttydevExpr

  ##[
  ID of the parent process
  ]##
  if this.type == sudoers_ts.ppid:
    let ppidExpr = this.io.readU4le()
    this.ppid = ppidExpr

proc fromFile*(_: typedesc[SudoersTs_RecordV2], filename: string): SudoersTs_RecordV2 =
  SudoersTs_RecordV2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SudoersTs_TsFlag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs_TsFlag =
  template this: untyped = result
  this = new(SudoersTs_TsFlag)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Reserved (unused) bits
  ]##
  let reserved0Expr = this.io.readBitsIntBe(6)
  this.reserved0 = reserved0Expr

  ##[
  ignore uid
  ]##
  let anyuidExpr = this.io.readBitsIntBe(1) != 0
  this.anyuid = anyuidExpr

  ##[
  entry disabled
  ]##
  let disabledExpr = this.io.readBitsIntBe(1) != 0
  this.disabled = disabledExpr

  ##[
  Reserved (unused) bits
  ]##
  let reserved1Expr = this.io.readBitsIntBe(8)
  this.reserved1 = reserved1Expr

proc fromFile*(_: typedesc[SudoersTs_TsFlag], filename: string): SudoersTs_TsFlag =
  SudoersTs_TsFlag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SudoersTs_RecordV1], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs_Record): SudoersTs_RecordV1 =
  template this: untyped = result
  this = new(SudoersTs_RecordV1)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  record type
  ]##
  let typeExpr = SudoersTs_TsType(this.io.readU2le())
  this.type = typeExpr

  ##[
  record flags
  ]##
  let flagsExpr = SudoersTs_TsFlag.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  user ID that was used for authentication
  ]##
  let authUidExpr = this.io.readU4le()
  this.authUid = authUidExpr

  ##[
  session ID associated with tty/ppid
  ]##
  let sidExpr = this.io.readU4le()
  this.sid = sidExpr

  ##[
  time stamp, from a monotonic time source
  ]##
  let tsExpr = SudoersTs_Timespec.read(this.io, this.root, this)
  this.ts = tsExpr

  ##[
  device number of the terminal associated with the session
  ]##
  if this.type == sudoers_ts.tty:
    let ttydevExpr = this.io.readU4le()
    this.ttydev = ttydevExpr

  ##[
  ID of the parent process
  ]##
  if this.type == sudoers_ts.ppid:
    let ppidExpr = this.io.readU4le()
    this.ppid = ppidExpr

proc fromFile*(_: typedesc[SudoersTs_RecordV1], filename: string): SudoersTs_RecordV1 =
  SudoersTs_RecordV1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SudoersTs_Timespec], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SudoersTs_Timespec =
  template this: untyped = result
  this = new(SudoersTs_Timespec)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  seconds
  ]##
  let secExpr = this.io.readS8le()
  this.sec = secExpr

  ##[
  nanoseconds
  ]##
  let nsecExpr = this.io.readS8le()
  this.nsec = nsecExpr

proc fromFile*(_: typedesc[SudoersTs_Timespec], filename: string): SudoersTs_Timespec =
  SudoersTs_Timespec.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SudoersTs_Record], io: KaitaiStream, root: KaitaiStruct, parent: SudoersTs): SudoersTs_Record =
  template this: untyped = result
  this = new(SudoersTs_Record)
  let root = if root == nil: cast[SudoersTs](this) else: cast[SudoersTs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  version number of the timestamp_entry struct
  ]##
  let versionExpr = this.io.readU2le()
  this.version = versionExpr

  ##[
  size of the record in bytes
  ]##
  let lenRecordExpr = this.io.readU2le()
  this.lenRecord = lenRecordExpr
  block:
    let on = this.version
    if on == 1:
      let rawPayloadExpr = this.io.readBytes(int((this.lenRecord - 4)))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = SudoersTs_RecordV1.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == 2:
      let rawPayloadExpr = this.io.readBytes(int((this.lenRecord - 4)))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = SudoersTs_RecordV2.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    else:
      let payloadExpr = this.io.readBytes(int((this.lenRecord - 4)))
      this.payload = payloadExpr

proc fromFile*(_: typedesc[SudoersTs_Record], filename: string): SudoersTs_Record =
  SudoersTs_Record.read(newKaitaiFileStream(filename), nil, nil)

