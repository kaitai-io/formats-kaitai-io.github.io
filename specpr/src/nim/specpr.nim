import kaitai_struct_nim_runtime
import options

type
  Specpr* = ref object of KaitaiStruct
    `records`*: seq[Specpr_Record]
    `parent`*: KaitaiStruct
  Specpr_RecordType* = enum
    data_initial = 0
    text_initial = 1
    data_continuation = 2
    text_continuation = 3
  Specpr_DataInitial* = ref object of KaitaiStruct
    `ids`*: Specpr_Identifiers
    `iscta`*: Specpr_CoarseTimestamp
    `isctb`*: Specpr_CoarseTimestamp
    `jdatea`*: int32
    `jdateb`*: int32
    `istb`*: Specpr_CoarseTimestamp
    `isra`*: int32
    `isdec`*: int32
    `itchan`*: int32
    `irmas`*: int32
    `revs`*: int32
    `iband`*: seq[int32]
    `irwav`*: int32
    `irespt`*: int32
    `irecno`*: int32
    `itpntr`*: int32
    `ihist`*: string
    `mhist`*: seq[string]
    `nruns`*: int32
    `siangl`*: Specpr_IllumAngle
    `seangl`*: Specpr_IllumAngle
    `sphase`*: int32
    `iwtrns`*: int32
    `itimch`*: int32
    `xnrm`*: float32
    `scatim`*: float32
    `timint`*: float32
    `tempd`*: float32
    `data`*: seq[float32]
    `parent`*: Specpr_Record
    `phaseAngleArcsecInst`*: float64
  Specpr_CoarseTimestamp* = ref object of KaitaiStruct
    `scaledSeconds`*: int32
    `parent`*: Specpr_DataInitial
    `secondsInst`*: float64
  Specpr_Icflag* = ref object of KaitaiStruct
    `reserved`*: uint64
    `isctbType`*: bool
    `isctaType`*: bool
    `coordinateMode`*: bool
    `errors`*: bool
    `text`*: bool
    `continuation`*: bool
    `parent`*: Specpr_Record
    `typeInst`*: Specpr_RecordType
  Specpr_DataContinuation* = ref object of KaitaiStruct
    `cdata`*: seq[float32]
    `parent`*: Specpr_Record
  Specpr_Identifiers* = ref object of KaitaiStruct
    `ititle`*: string
    `usernm`*: string
    `parent`*: KaitaiStruct
  Specpr_IllumAngle* = ref object of KaitaiStruct
    `angl`*: int32
    `parent`*: Specpr_DataInitial
    `secondsTotalInst`*: int
    `minutesTotalInst`*: int
    `degreesTotalInst`*: int
  Specpr_TextInitial* = ref object of KaitaiStruct
    `ids`*: Specpr_Identifiers
    `itxtpt`*: uint32
    `itxtch`*: int32
    `itext`*: string
    `parent`*: Specpr_Record
  Specpr_Record* = ref object of KaitaiStruct
    `icflag`*: Specpr_Icflag
    `content`*: KaitaiStruct
    `parent`*: Specpr
    `rawContent`*: seq[byte]
  Specpr_TextContinuation* = ref object of KaitaiStruct
    `tdata`*: string
    `parent`*: Specpr_Record

proc read*(_: typedesc[Specpr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Specpr
proc read*(_: typedesc[Specpr_DataInitial], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_DataInitial
proc read*(_: typedesc[Specpr_CoarseTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_DataInitial): Specpr_CoarseTimestamp
proc read*(_: typedesc[Specpr_Icflag], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_Icflag
proc read*(_: typedesc[Specpr_DataContinuation], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_DataContinuation
proc read*(_: typedesc[Specpr_Identifiers], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Specpr_Identifiers
proc read*(_: typedesc[Specpr_IllumAngle], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_DataInitial): Specpr_IllumAngle
proc read*(_: typedesc[Specpr_TextInitial], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_TextInitial
proc read*(_: typedesc[Specpr_Record], io: KaitaiStream, root: KaitaiStruct, parent: Specpr): Specpr_Record
proc read*(_: typedesc[Specpr_TextContinuation], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_TextContinuation

proc phaseAngleArcsec*(this: Specpr_DataInitial): float64
proc seconds*(this: Specpr_CoarseTimestamp): float64
proc type*(this: Specpr_Icflag): Specpr_RecordType
proc secondsTotal*(this: Specpr_IllumAngle): int
proc minutesTotal*(this: Specpr_IllumAngle): int
proc degreesTotal*(this: Specpr_IllumAngle): int


##[
Specpr records are fixed format, 1536 bytes/record. Record number
counting starts at 0. Binary data are in IEEE format real numbers
and non-byte swapped integers (compatiible with all Sun
Microsystems, and Hewlett Packard workstations (Intel and some DEC
machines are byte swapped relative to Suns and HPs). Each record may
contain different information according to the following scheme.

You can get some library of spectra from
ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/

]##
proc read*(_: typedesc[Specpr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Specpr =
  template this: untyped = result
  this = new(Specpr)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Specpr_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[Specpr], filename: string): Specpr =
  Specpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_DataInitial], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_DataInitial =
  template this: untyped = result
  this = new(Specpr_DataInitial)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idsExpr = Specpr_Identifiers.read(this.io, this.root, this)
  this.ids = idsExpr

  ##[
  Civil or Universal time when data was last processed
  ]##
  let isctaExpr = Specpr_CoarseTimestamp.read(this.io, this.root, this)
  this.iscta = isctaExpr

  ##[
  Civil or Universal time at the start of the spectral run
  ]##
  let isctbExpr = Specpr_CoarseTimestamp.read(this.io, this.root, this)
  this.isctb = isctbExpr

  ##[
  Date when data was last processed. Stored as integer*4 Julian Day number *10
  ]##
  let jdateaExpr = this.io.readS4be()
  this.jdatea = jdateaExpr

  ##[
  Date when the spectral run began. Stored as integer*4 Julian Day number *10
  ]##
  let jdatebExpr = this.io.readS4be()
  this.jdateb = jdatebExpr

  ##[
  Siderial time when the spectral run started. See flag #05.
  ]##
  let istbExpr = Specpr_CoarseTimestamp.read(this.io, this.root, this)
  this.istb = istbExpr

  ##[
  Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
  ]##
  let israExpr = this.io.readS4be()
  this.isra = israExpr

  ##[
  Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
  ]##
  let isdecExpr = this.io.readS4be()
  this.isdec = isdecExpr

  ##[
  Total number of channels in the spectrum (integer*4 value from 1 to 4852)
  ]##
  let itchanExpr = this.io.readS4be()
  this.itchan = itchanExpr

  ##[
  The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
  ]##
  let irmasExpr = this.io.readS4be()
  this.irmas = irmasExpr

  ##[
  The number of independent spectral scans which were added to make the spectrum (integer*4 number).
  ]##
  let revsExpr = this.io.readS4be()
  this.revs = revsExpr

  ##[
  The channel numbers which define the band normalization (scaling to unity). (integers*4).
  ]##
  for i in 0 ..< int(2):
    let it = this.io.readS4be()
    this.iband.add(it)

  ##[
  The record number within the file where the wavelengths are found (integer*4).
  ]##
  let irwavExpr = this.io.readS4be()
  this.irwav = irwavExpr

  ##[
  The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
  ]##
  let iresptExpr = this.io.readS4be()
  this.irespt = iresptExpr

  ##[
  The record number within the file where the data is located (integer*4 number).
  ]##
  let irecnoExpr = this.io.readS4be()
  this.irecno = irecnoExpr

  ##[
  Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
  ]##
  let itpntrExpr = this.io.readS4be()
  this.itpntr = itpntrExpr

  ##[
  The program automatic 60 character history.
  ]##
  let ihistExpr = encode(this.io.readBytes(int(60)).bytesStripRight(32), "ascii")
  this.ihist = ihistExpr

  ##[
  Manual history. Program automatic for large history requirements.
  ]##
  for i in 0 ..< int(4):
    let it = encode(this.io.readBytes(int(74)), "ascii")
    this.mhist.add(it)

  ##[
  The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
  ]##
  let nrunsExpr = this.io.readS4be()
  this.nruns = nrunsExpr

  ##[
  The angle of incidence of illuminating radiation
      integrating sphere = 2000000000
      Geometric albedo   = 2000000001

  ]##
  let sianglExpr = Specpr_IllumAngle.read(this.io, this.root, this)
  this.siangl = sianglExpr

  ##[
  The angle of emission of illuminating radiation
      integrating sphere = 2000000000
      Geometric albedo   = 2000000001

  ]##
  let seanglExpr = Specpr_IllumAngle.read(this.io, this.root, this)
  this.seangl = seanglExpr

  ##[
  The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
      integrating sphere = 2000000000

  ]##
  let sphaseExpr = this.io.readS4be()
  this.sphase = sphaseExpr

  ##[
  Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
  ]##
  let iwtrnsExpr = this.io.readS4be()
  this.iwtrns = iwtrnsExpr

  ##[
  The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
  ]##
  let itimchExpr = this.io.readS4be()
  this.itimch = itimchExpr

  ##[
  The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
  ]##
  let xnrmExpr = this.io.readF4be()
  this.xnrm = xnrmExpr

  ##[
  The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
  ]##
  let scatimExpr = this.io.readF4be()
  this.scatim = scatimExpr

  ##[
  Total integration time (usually=scatime * nruns) (32 bit real number).
  ]##
  let timintExpr = this.io.readF4be()
  this.timint = timintExpr

  ##[
  Temperature in degrees Kelvin (32 bit real number).
  ]##
  let tempdExpr = this.io.readF4be()
  this.tempd = tempdExpr

  ##[
  The spectral data (256 channels of 32 bit real data numbers).
  ]##
  for i in 0 ..< int(256):
    let it = this.io.readF4be()
    this.data.add(it)

proc phaseAngleArcsec(this: Specpr_DataInitial): float64 = 

  ##[
  The phase angle between iangl and eangl in seconds
  ]##
  if this.phaseAngleArcsecInst != nil:
    return this.phaseAngleArcsecInst
  let phaseAngleArcsecInstExpr = float64((this.sphase div 1500))
  this.phaseAngleArcsecInst = phaseAngleArcsecInstExpr
  if this.phaseAngleArcsecInst != nil:
    return this.phaseAngleArcsecInst

proc fromFile*(_: typedesc[Specpr_DataInitial], filename: string): Specpr_DataInitial =
  Specpr_DataInitial.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_CoarseTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_DataInitial): Specpr_CoarseTimestamp =
  template this: untyped = result
  this = new(Specpr_CoarseTimestamp)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let scaledSecondsExpr = this.io.readS4be()
  this.scaledSeconds = scaledSecondsExpr

proc seconds(this: Specpr_CoarseTimestamp): float64 = 
  if this.secondsInst != nil:
    return this.secondsInst
  let secondsInstExpr = float64((this.scaledSeconds * 24000))
  this.secondsInst = secondsInstExpr
  if this.secondsInst != nil:
    return this.secondsInst

proc fromFile*(_: typedesc[Specpr_CoarseTimestamp], filename: string): Specpr_CoarseTimestamp =
  Specpr_CoarseTimestamp.read(newKaitaiFileStream(filename), nil, nil)


##[
it is big endian
]##
proc read*(_: typedesc[Specpr_Icflag], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_Icflag =
  template this: untyped = result
  this = new(Specpr_Icflag)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(26)
  this.reserved = reservedExpr

  ##[
  =0 ctb is civil time
=1 ctb is universal time

  ]##
  let isctbTypeExpr = this.io.readBitsIntBe(1) != 0
  this.isctbType = isctbTypeExpr

  ##[
  =0 cta is civil time
=1 cta is universal time

  ]##
  let isctaTypeExpr = this.io.readBitsIntBe(1) != 0
  this.isctaType = isctaTypeExpr

  ##[
  RA, Dec / Long., Lat flag
=0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
=1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.

  ]##
  let coordinateModeExpr = this.io.readBitsIntBe(1) != 0
  this.coordinateMode = coordinateModeExpr

  ##[
  flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.

  ]##
  let errorsExpr = this.io.readBitsIntBe(1) != 0
  this.errors = errorsExpr

  ##[
  =0 the data in the array "data" is data
=1 the data in the array "data" is ascii text as is most of the header info.

  ]##
  let textExpr = this.io.readBitsIntBe(1) != 0
  this.text = textExpr

  ##[
  =0 first record of a spectrum consists of: header then 256 data channels
=1 continuation data record consisting of:
  # bit flags followed by 1532 bytes of
  # real data (bit 1=0) (383 channels)
  # or 1532 bytes of text (bit 1=1).
  # A maximum of 12 continuation records
  # are allowed for a total of 4852
  # channels (limited by arrays of 4864)
  # or 19860 characters of text (bit 1=1).

  ]##
  let continuationExpr = this.io.readBitsIntBe(1) != 0
  this.continuation = continuationExpr

proc type(this: Specpr_Icflag): Specpr_RecordType = 
  if this.typeInst != nil:
    return this.typeInst
  let typeInstExpr = Specpr_RecordType(Specpr_RecordType((((if this.text: 1 else: 0) * 1) + ((if this.continuation: 1 else: 0) * 2))))
  this.typeInst = typeInstExpr
  if this.typeInst != nil:
    return this.typeInst

proc fromFile*(_: typedesc[Specpr_Icflag], filename: string): Specpr_Icflag =
  Specpr_Icflag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_DataContinuation], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_DataContinuation =
  template this: untyped = result
  this = new(Specpr_DataContinuation)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The continuation of the data values (383 channels of 32 bit real numbers).
  ]##
  for i in 0 ..< int(383):
    let it = this.io.readF4be()
    this.cdata.add(it)

proc fromFile*(_: typedesc[Specpr_DataContinuation], filename: string): Specpr_DataContinuation =
  Specpr_DataContinuation.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_Identifiers], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Specpr_Identifiers =
  template this: untyped = result
  this = new(Specpr_Identifiers)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Title which describes the data
  ]##
  let ititleExpr = encode(this.io.readBytes(int(40)).bytesStripRight(32), "ascii")
  this.ititle = ititleExpr

  ##[
  The name of the user who created the data record
  ]##
  let usernmExpr = encode(this.io.readBytes(int(8)), "ascii")
  this.usernm = usernmExpr

proc fromFile*(_: typedesc[Specpr_Identifiers], filename: string): Specpr_Identifiers =
  Specpr_Identifiers.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_IllumAngle], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_DataInitial): Specpr_IllumAngle =
  template this: untyped = result
  this = new(Specpr_IllumAngle)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)

  ]##
  let anglExpr = this.io.readS4be()
  this.angl = anglExpr

proc secondsTotal(this: Specpr_IllumAngle): int = 
  if this.secondsTotalInst != nil:
    return this.secondsTotalInst
  let secondsTotalInstExpr = int((this.angl div 6000))
  this.secondsTotalInst = secondsTotalInstExpr
  if this.secondsTotalInst != nil:
    return this.secondsTotalInst

proc minutesTotal(this: Specpr_IllumAngle): int = 
  if this.minutesTotalInst != nil:
    return this.minutesTotalInst
  let minutesTotalInstExpr = int((this.secondsTotal div 60))
  this.minutesTotalInst = minutesTotalInstExpr
  if this.minutesTotalInst != nil:
    return this.minutesTotalInst

proc degreesTotal(this: Specpr_IllumAngle): int = 
  if this.degreesTotalInst != nil:
    return this.degreesTotalInst
  let degreesTotalInstExpr = int((this.minutesTotal div 60))
  this.degreesTotalInst = degreesTotalInstExpr
  if this.degreesTotalInst != nil:
    return this.degreesTotalInst

proc fromFile*(_: typedesc[Specpr_IllumAngle], filename: string): Specpr_IllumAngle =
  Specpr_IllumAngle.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_TextInitial], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_TextInitial =
  template this: untyped = result
  this = new(Specpr_TextInitial)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idsExpr = Specpr_Identifiers.read(this.io, this.root, this)
  this.ids = idsExpr

  ##[
  Text data record pointer. This pointer points  to a data record where additional text may be may be found.
  ]##
  let itxtptExpr = this.io.readU4be()
  this.itxtpt = itxtptExpr

  ##[
  The number of text characters (maximum= 19860).
  ]##
  let itxtchExpr = this.io.readS4be()
  this.itxtch = itxtchExpr

  ##[
  1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
  ]##
  let itextExpr = encode(this.io.readBytes(int(1476)), "ascii")
  this.itext = itextExpr

proc fromFile*(_: typedesc[Specpr_TextInitial], filename: string): Specpr_TextInitial =
  Specpr_TextInitial.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_Record], io: KaitaiStream, root: KaitaiStruct, parent: Specpr): Specpr_Record =
  template this: untyped = result
  this = new(Specpr_Record)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Total number of bytes comprising the document.
  ]##
  let icflagExpr = Specpr_Icflag.read(this.io, this.root, this)
  this.icflag = icflagExpr
  block:
    let on = this.icflag.type
    if on == specpr.data_initial:
      let rawContentExpr = this.io.readBytes(int((1536 - 4)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = Specpr_DataInitial.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == specpr.data_continuation:
      let rawContentExpr = this.io.readBytes(int((1536 - 4)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = Specpr_DataContinuation.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == specpr.text_continuation:
      let rawContentExpr = this.io.readBytes(int((1536 - 4)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = Specpr_TextContinuation.read(rawContentIo, this.root, this)
      this.content = contentExpr
    elif on == specpr.text_initial:
      let rawContentExpr = this.io.readBytes(int((1536 - 4)))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = Specpr_TextInitial.read(rawContentIo, this.root, this)
      this.content = contentExpr
    else:
      let contentExpr = this.io.readBytes(int((1536 - 4)))
      this.content = contentExpr

proc fromFile*(_: typedesc[Specpr_Record], filename: string): Specpr_Record =
  Specpr_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Specpr_TextContinuation], io: KaitaiStream, root: KaitaiStruct, parent: Specpr_Record): Specpr_TextContinuation =
  template this: untyped = result
  this = new(Specpr_TextContinuation)
  let root = if root == nil: cast[Specpr](this) else: cast[Specpr](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  1532 characters of text.
  ]##
  let tdataExpr = encode(this.io.readBytes(int(1532)), "ascii")
  this.tdata = tdataExpr

proc fromFile*(_: typedesc[Specpr_TextContinuation], filename: string): Specpr_TextContinuation =
  Specpr_TextContinuation.read(newKaitaiFileStream(filename), nil, nil)

