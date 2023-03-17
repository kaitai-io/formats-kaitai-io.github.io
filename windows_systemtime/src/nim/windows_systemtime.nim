import kaitai_struct_nim_runtime
import options

type
  WindowsSystemtime* = ref object of KaitaiStruct
    `year`*: uint16
    `month`*: uint16
    `dow`*: uint16
    `day`*: uint16
    `hour`*: uint16
    `min`*: uint16
    `sec`*: uint16
    `msec`*: uint16
    `parent`*: KaitaiStruct

proc read*(_: typedesc[WindowsSystemtime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsSystemtime



##[
Microsoft Windows SYSTEMTIME structure, stores individual components
of date and time as individual fields, up to millisecond precision.

@see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime">Source</a>
]##
proc read*(_: typedesc[WindowsSystemtime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsSystemtime =
  template this: untyped = result
  this = new(WindowsSystemtime)
  let root = if root == nil: cast[WindowsSystemtime](this) else: cast[WindowsSystemtime](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Year
  ]##
  let yearExpr = this.io.readU2le()
  this.year = yearExpr

  ##[
  Month (January = 1)
  ]##
  let monthExpr = this.io.readU2le()
  this.month = monthExpr

  ##[
  Day of week (Sun = 0)
  ]##
  let dowExpr = this.io.readU2le()
  this.dow = dowExpr

  ##[
  Day of month
  ]##
  let dayExpr = this.io.readU2le()
  this.day = dayExpr

  ##[
  Hours
  ]##
  let hourExpr = this.io.readU2le()
  this.hour = hourExpr

  ##[
  Minutes
  ]##
  let minExpr = this.io.readU2le()
  this.min = minExpr

  ##[
  Seconds
  ]##
  let secExpr = this.io.readU2le()
  this.sec = secExpr

  ##[
  Milliseconds
  ]##
  let msecExpr = this.io.readU2le()
  this.msec = msecExpr

proc fromFile*(_: typedesc[WindowsSystemtime], filename: string): WindowsSystemtime =
  WindowsSystemtime.read(newKaitaiFileStream(filename), nil, nil)

