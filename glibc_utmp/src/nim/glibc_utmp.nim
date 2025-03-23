import kaitai_struct_nim_runtime
import options

type
  GlibcUtmp* = ref object of KaitaiStruct
    `records`*: seq[GlibcUtmp_Record]
    `parent`*: KaitaiStruct
    `rawRecords`*: seq[seq[byte]]
  GlibcUtmp_EntryType* = enum
    empty = 0
    run_lvl = 1
    boot_time = 2
    new_time = 3
    old_time = 4
    init_process = 5
    login_process = 6
    user_process = 7
    dead_process = 8
    accounting = 9
  GlibcUtmp_Record* = ref object of KaitaiStruct
    `utType`*: GlibcUtmp_EntryType
    `pid`*: uint32
    `line`*: string
    `id`*: string
    `user`*: string
    `host`*: string
    `exit`*: uint32
    `session`*: int32
    `tv`*: GlibcUtmp_Timeval
    `addrV6`*: seq[byte]
    `reserved`*: seq[byte]
    `parent`*: GlibcUtmp
  GlibcUtmp_Timeval* = ref object of KaitaiStruct
    `sec`*: uint32
    `usec`*: int32
    `parent`*: GlibcUtmp_Record

proc read*(_: typedesc[GlibcUtmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GlibcUtmp
proc read*(_: typedesc[GlibcUtmp_Record], io: KaitaiStream, root: KaitaiStruct, parent: GlibcUtmp): GlibcUtmp_Record
proc read*(_: typedesc[GlibcUtmp_Timeval], io: KaitaiStream, root: KaitaiStruct, parent: GlibcUtmp_Record): GlibcUtmp_Timeval


proc read*(_: typedesc[GlibcUtmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GlibcUtmp =
  template this: untyped = result
  this = new(GlibcUtmp)
  let root = if root == nil: cast[GlibcUtmp](this) else: cast[GlibcUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let buf = this.io.readBytes(int(384))
      this.rawRecords.add(buf)
      let rawRecordsIo = newKaitaiStream(buf)
      let it = GlibcUtmp_Record.read(rawRecordsIo, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[GlibcUtmp], filename: string): GlibcUtmp =
  GlibcUtmp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GlibcUtmp_Record], io: KaitaiStream, root: KaitaiStruct, parent: GlibcUtmp): GlibcUtmp_Record =
  template this: untyped = result
  this = new(GlibcUtmp_Record)
  let root = if root == nil: cast[GlibcUtmp](this) else: cast[GlibcUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Type of login
  ]##
  let utTypeExpr = GlibcUtmp_EntryType(this.io.readS4le())
  this.utType = utTypeExpr

  ##[
  Process ID of login process
  ]##
  let pidExpr = this.io.readU4le()
  this.pid = pidExpr

  ##[
  Devicename
  ]##
  let lineExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.line = lineExpr

  ##[
  Inittab ID
  ]##
  let idExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.id = idExpr

  ##[
  Username
  ]##
  let userExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.user = userExpr

  ##[
  Hostname for remote login
  ]##
  let hostExpr = encode(this.io.readBytes(int(256)), "UTF-8")
  this.host = hostExpr

  ##[
  Exit status of a process marked as DEAD_PROCESS
  ]##
  let exitExpr = this.io.readU4le()
  this.exit = exitExpr

  ##[
  Session ID, used for windowing
  ]##
  let sessionExpr = this.io.readS4le()
  this.session = sessionExpr

  ##[
  Time entry was made
  ]##
  let tvExpr = GlibcUtmp_Timeval.read(this.io, this.root, this)
  this.tv = tvExpr

  ##[
  Internet address of remote host
  ]##
  let addrV6Expr = this.io.readBytes(int(16))
  this.addrV6 = addrV6Expr
  let reservedExpr = this.io.readBytes(int(20))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[GlibcUtmp_Record], filename: string): GlibcUtmp_Record =
  GlibcUtmp_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GlibcUtmp_Timeval], io: KaitaiStream, root: KaitaiStruct, parent: GlibcUtmp_Record): GlibcUtmp_Timeval =
  template this: untyped = result
  this = new(GlibcUtmp_Timeval)
  let root = if root == nil: cast[GlibcUtmp](this) else: cast[GlibcUtmp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Seconds
  ]##
  let secExpr = this.io.readU4le()
  this.sec = secExpr

  ##[
  Microseconds
  ]##
  let usecExpr = this.io.readS4le()
  this.usec = usecExpr

proc fromFile*(_: typedesc[GlibcUtmp_Timeval], filename: string): GlibcUtmp_Timeval =
  GlibcUtmp_Timeval.read(newKaitaiFileStream(filename), nil, nil)

