import kaitai_struct_nim_runtime
import options

type
  AixUtmp* = ref object of KaitaiStruct
    `records`*: seq[AixUtmp_Record]
    `parent`*: KaitaiStruct
  AixUtmp_EntryType* = enum
    empty = 0
    run_lvl = 1
    boot_time = 2
    old_time = 3
    new_time = 4
    init_process = 5
    login_process = 6
    user_process = 7
    dead_process = 8
    accounting = 9
  AixUtmp_ExitStatus* = ref object of KaitaiStruct
    `terminationCode`*: int16
    `exitCode`*: int16
    `parent`*: AixUtmp_Record
  AixUtmp_Record* = ref object of KaitaiStruct
    `user`*: string
    `inittabId`*: string
    `device`*: string
    `pid`*: uint64
    `type`*: AixUtmp_EntryType
    `timestamp`*: int64
    `exitStatus`*: AixUtmp_ExitStatus
    `hostname`*: string
    `dblWordPad`*: int32
    `reservedA`*: seq[byte]
    `reservedV`*: seq[byte]
    `parent`*: AixUtmp

proc read*(_: typedesc[AixUtmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AixUtmp
proc read*(_: typedesc[AixUtmp_ExitStatus], io: KaitaiStream, root: KaitaiStruct, parent: AixUtmp_Record): AixUtmp_ExitStatus
proc read*(_: typedesc[AixUtmp_Record], io: KaitaiStream, root: KaitaiStruct, parent: AixUtmp): AixUtmp_Record



##[
This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
@see <a href="https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file">Source</a>
]##
proc read*(_: typedesc[AixUtmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AixUtmp =
  template this: untyped = result
  this = new(AixUtmp)
  let root = if root == nil: cast[AixUtmp](this) else: cast[AixUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = AixUtmp_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[AixUtmp], filename: string): AixUtmp =
  AixUtmp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AixUtmp_ExitStatus], io: KaitaiStream, root: KaitaiStruct, parent: AixUtmp_Record): AixUtmp_ExitStatus =
  template this: untyped = result
  this = new(AixUtmp_ExitStatus)
  let root = if root == nil: cast[AixUtmp](this) else: cast[AixUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  process termination status
  ]##
  let terminationCodeExpr = this.io.readS2be()
  this.terminationCode = terminationCodeExpr

  ##[
  process exit status
  ]##
  let exitCodeExpr = this.io.readS2be()
  this.exitCode = exitCodeExpr

proc fromFile*(_: typedesc[AixUtmp_ExitStatus], filename: string): AixUtmp_ExitStatus =
  AixUtmp_ExitStatus.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AixUtmp_Record], io: KaitaiStream, root: KaitaiStruct, parent: AixUtmp): AixUtmp_Record =
  template this: untyped = result
  this = new(AixUtmp_Record)
  let root = if root == nil: cast[AixUtmp](this) else: cast[AixUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  User login name
  ]##
  let userExpr = encode(this.io.readBytes(int(256)), "ASCII")
  this.user = userExpr

  ##[
  /etc/inittab id
  ]##
  let inittabIdExpr = encode(this.io.readBytes(int(14)), "ASCII")
  this.inittabId = inittabIdExpr

  ##[
  device name (console, lnxx)
  ]##
  let deviceExpr = encode(this.io.readBytes(int(64)), "ASCII")
  this.device = deviceExpr

  ##[
  process id
  ]##
  let pidExpr = this.io.readU8be()
  this.pid = pidExpr

  ##[
  Type of login
  ]##
  let typeExpr = AixUtmp_EntryType(this.io.readS2be())
  this.type = typeExpr

  ##[
  time entry was made
  ]##
  let timestampExpr = this.io.readS8be()
  this.timestamp = timestampExpr

  ##[
  the exit status of a process marked as DEAD PROCESS
  ]##
  let exitStatusExpr = AixUtmp_ExitStatus.read(this.io, this.root, this)
  this.exitStatus = exitStatusExpr

  ##[
  host name
  ]##
  let hostnameExpr = encode(this.io.readBytes(int(256)), "ASCII")
  this.hostname = hostnameExpr
  let dblWordPadExpr = this.io.readS4be()
  this.dblWordPad = dblWordPadExpr
  let reservedAExpr = this.io.readBytes(int(8))
  this.reservedA = reservedAExpr
  let reservedVExpr = this.io.readBytes(int(24))
  this.reservedV = reservedVExpr

proc fromFile*(_: typedesc[AixUtmp_Record], filename: string): AixUtmp_Record =
  AixUtmp_Record.read(newKaitaiFileStream(filename), nil, nil)

