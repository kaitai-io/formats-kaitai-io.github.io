import kaitai_struct_nim_runtime
import options
import strutils

type
  DosDatetime* = ref object of KaitaiStruct
    `time`*: DosDatetime_Time
    `date`*: DosDatetime_Date
    `parent`*: KaitaiStruct
  DosDatetime_Time* = ref object of KaitaiStruct
    `secondDiv2`*: uint64
    `minute`*: uint64
    `hour`*: uint64
    `parent`*: DosDatetime
    `secondInst`: int
    `secondInstFlag`: bool
    `paddedSecondInst`: string
    `paddedSecondInstFlag`: bool
    `paddedMinuteInst`: string
    `paddedMinuteInstFlag`: bool
    `paddedHourInst`: string
    `paddedHourInstFlag`: bool
  DosDatetime_Date* = ref object of KaitaiStruct
    `day`*: uint64
    `month`*: uint64
    `yearMinus1980`*: uint64
    `parent`*: DosDatetime
    `yearInst`: int
    `yearInstFlag`: bool
    `paddedDayInst`: string
    `paddedDayInstFlag`: bool
    `paddedMonthInst`: string
    `paddedMonthInstFlag`: bool
    `paddedYearInst`: string
    `paddedYearInstFlag`: bool

proc read*(_: typedesc[DosDatetime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosDatetime
proc read*(_: typedesc[DosDatetime_Time], io: KaitaiStream, root: KaitaiStruct, parent: DosDatetime): DosDatetime_Time
proc read*(_: typedesc[DosDatetime_Date], io: KaitaiStream, root: KaitaiStruct, parent: DosDatetime): DosDatetime_Date

proc second*(this: DosDatetime_Time): int
proc paddedSecond*(this: DosDatetime_Time): string
proc paddedMinute*(this: DosDatetime_Time): string
proc paddedHour*(this: DosDatetime_Time): string
proc year*(this: DosDatetime_Date): int
proc paddedDay*(this: DosDatetime_Date): string
proc paddedMonth*(this: DosDatetime_Date): string
proc paddedYear*(this: DosDatetime_Date): string


##[
MS-DOS date and time are packed 16-bit values that specify local date/time.
The time is always stored in the current UTC time offset set on the computer
which created the file. Note that the daylight saving time (DST) shifts
also change the UTC time offset.

For example, if you pack two files A and B into a ZIP archive, file A last modified
at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
the file modification times saved in MS-DOS format in the ZIP file will vary depending
on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.

  - If set to GMT:
      - file A: 2020-03-29 00:59 (UTC+00:00)
      - file B: 2020-03-29 01:00 (UTC+00:00)
  - If set to BST:
      - file A: 2020-03-29 01:59 (UTC+01:00)
      - file B: 2020-03-29 02:00 (UTC+01:00)

It follows that you are unable to determine the actual last modified time
of any file stored in the ZIP archive, if you don't know the locale time
setting of the computer at the time it created the ZIP.

This format is used in some data formats from the MS-DOS era, for example:

  - [zip](/zip/)
  - [rar](/rar/)
  - [vfat](/vfat/) (FAT12)
  - [lzh](/lzh/)
  - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)

@see <a href="https://docs.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time">Source</a>
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime">Source</a>
@see <a href="https://github.com/reactos/reactos/blob/c6b6444/dll/win32/kernel32/client/time.c#L82-L87">DosDateTimeToFileTime</a>
@see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">page 25/34</a>
]##
proc read*(_: typedesc[DosDatetime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosDatetime =
  template this: untyped = result
  this = new(DosDatetime)
  let root = if root == nil: cast[DosDatetime](this) else: cast[DosDatetime](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timeExpr = DosDatetime_Time.read(this.io, this.root, this)
  this.time = timeExpr
  let dateExpr = DosDatetime_Date.read(this.io, this.root, this)
  this.date = dateExpr

proc fromFile*(_: typedesc[DosDatetime], filename: string): DosDatetime =
  DosDatetime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosDatetime_Time], io: KaitaiStream, root: KaitaiStruct, parent: DosDatetime): DosDatetime_Time =
  template this: untyped = result
  this = new(DosDatetime_Time)
  let root = if root == nil: cast[DosDatetime](this) else: cast[DosDatetime](root)
  this.io = io
  this.root = root
  this.parent = parent

  let secondDiv2Expr = this.io.readBitsIntLe(5)
  this.secondDiv2 = secondDiv2Expr
  let minuteExpr = this.io.readBitsIntLe(6)
  this.minute = minuteExpr
  let hourExpr = this.io.readBitsIntLe(5)
  this.hour = hourExpr

proc second(this: DosDatetime_Time): int = 
  if this.secondInstFlag:
    return this.secondInst
  let secondInstExpr = int((2 * this.secondDiv2))
  this.secondInst = secondInstExpr
  this.secondInstFlag = true
  return this.secondInst

proc paddedSecond(this: DosDatetime_Time): string = 
  if this.paddedSecondInstFlag:
    return this.paddedSecondInst
  let paddedSecondInstExpr = string(($(if this.second <= 9: "0" else: "") & $intToStr(int(this.second))))
  this.paddedSecondInst = paddedSecondInstExpr
  this.paddedSecondInstFlag = true
  return this.paddedSecondInst

proc paddedMinute(this: DosDatetime_Time): string = 
  if this.paddedMinuteInstFlag:
    return this.paddedMinuteInst
  let paddedMinuteInstExpr = string(($(if this.minute <= 9: "0" else: "") & $intToStr(int(this.minute))))
  this.paddedMinuteInst = paddedMinuteInstExpr
  this.paddedMinuteInstFlag = true
  return this.paddedMinuteInst

proc paddedHour(this: DosDatetime_Time): string = 
  if this.paddedHourInstFlag:
    return this.paddedHourInst
  let paddedHourInstExpr = string(($(if this.hour <= 9: "0" else: "") & $intToStr(int(this.hour))))
  this.paddedHourInst = paddedHourInstExpr
  this.paddedHourInstFlag = true
  return this.paddedHourInst

proc fromFile*(_: typedesc[DosDatetime_Time], filename: string): DosDatetime_Time =
  DosDatetime_Time.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosDatetime_Date], io: KaitaiStream, root: KaitaiStruct, parent: DosDatetime): DosDatetime_Date =
  template this: untyped = result
  this = new(DosDatetime_Date)
  let root = if root == nil: cast[DosDatetime](this) else: cast[DosDatetime](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dayExpr = this.io.readBitsIntLe(5)
  this.day = dayExpr
  let monthExpr = this.io.readBitsIntLe(4)
  this.month = monthExpr
  let yearMinus1980Expr = this.io.readBitsIntLe(7)
  this.yearMinus1980 = yearMinus1980Expr

proc year(this: DosDatetime_Date): int = 

  ##[
  only years from 1980 to 2107 (1980 + 127) can be represented
  ]##
  if this.yearInstFlag:
    return this.yearInst
  let yearInstExpr = int((1980 + this.yearMinus1980))
  this.yearInst = yearInstExpr
  this.yearInstFlag = true
  return this.yearInst

proc paddedDay(this: DosDatetime_Date): string = 
  if this.paddedDayInstFlag:
    return this.paddedDayInst
  let paddedDayInstExpr = string(($(if this.day <= 9: "0" else: "") & $intToStr(int(this.day))))
  this.paddedDayInst = paddedDayInstExpr
  this.paddedDayInstFlag = true
  return this.paddedDayInst

proc paddedMonth(this: DosDatetime_Date): string = 
  if this.paddedMonthInstFlag:
    return this.paddedMonthInst
  let paddedMonthInstExpr = string(($(if this.month <= 9: "0" else: "") & $intToStr(int(this.month))))
  this.paddedMonthInst = paddedMonthInstExpr
  this.paddedMonthInstFlag = true
  return this.paddedMonthInst

proc paddedYear(this: DosDatetime_Date): string = 
  if this.paddedYearInstFlag:
    return this.paddedYearInst
  let paddedYearInstExpr = string(($(if this.year <= 999: ($"0" & $(if this.year <= 99: ($"0" & $(if this.year <= 9: "0" else: "")) else: "")) else: "") & $intToStr(int(this.year))))
  this.paddedYearInst = paddedYearInstExpr
  this.paddedYearInstFlag = true
  return this.paddedYearInst

proc fromFile*(_: typedesc[DosDatetime_Date], filename: string): DosDatetime_Date =
  DosDatetime_Date.read(newKaitaiFileStream(filename), nil, nil)

