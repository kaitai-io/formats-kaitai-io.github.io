import kaitai_struct_nim_runtime
import options

type
  NtMdt* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `size`*: uint32
    `reserved0`*: seq[byte]
    `lastFrame`*: uint16
    `reserved1`*: seq[byte]
    `wrondDoc`*: seq[byte]
    `frames`*: NtMdt_Framez
    `parent`*: KaitaiStruct
    `rawFrames`*: seq[byte]
  NtMdt_AdcMode* = enum
    height = 0
    dfl = 1
    lateral_f = 2
    bias_v = 3
    current = 4
    fb_out = 5
    mag = 6
    mag_sin = 7
    mag_cos = 8
    rms = 9
    calc_mag = 10
    phase1 = 11
    phase2 = 12
    calc_phase = 13
    ex1 = 14
    ex2 = 15
    hv_x = 16
    hv_y = 17
    snap_back = 18
    false = 255
  NtMdt_XmlScanLocation* = enum
    hlt = 0
    hlb = 1
    hrt = 2
    hrb = 3
    vlt = 4
    vlb = 5
    vrt = 6
    vrb = 7
  NtMdt_DataType* = enum
    floatfix = -65544
    float80 = -16138
    float64 = -13320
    float48 = -9990
    float32 = -5892
    int64 = -8
    int32 = -4
    int16 = -2
    int8 = -1
    unknown0 = 0
    uint8 = 1
    uint16 = 2
    uint32 = 4
    uint64 = 8
  NtMdt_XmlParamType* = enum
    none = 0
    laser_wavelength = 1
    units = 2
    data_array = 255
  NtMdt_SpmMode* = enum
    constant_force = 0
    contact_constant_height = 1
    contact_error = 2
    lateral_force = 3
    force_modulation = 4
    spreading_resistance_imaging = 5
    semicontact_topography = 6
    semicontact_error = 7
    phase_contrast = 8
    ac_magnetic_force = 9
    dc_magnetic_force = 10
    electrostatic_force = 11
    capacitance_contrast = 12
    kelvin_probe = 13
    constant_current = 14
    barrier_height = 15
    constant_height = 16
    afam = 17
    contact_efm = 18
    shear_force_topography = 19
    sfom = 20
    contact_capacitance = 21
    snom_transmission = 22
    snom_reflection = 23
    snom_all = 24
    snom = 25
  NtMdt_Unit* = enum
    raman_shift = -10
    reserved0 = -9
    reserved1 = -8
    reserved2 = -7
    reserved3 = -6
    meter = -5
    centi_meter = -4
    milli_meter = -3
    micro_meter = -2
    nano_meter = -1
    angstrom = 0
    nano_ampere = 1
    volt = 2
    none = 3
    kilo_hertz = 4
    degrees = 5
    percent = 6
    celsius_degree = 7
    volt_high = 8
    second = 9
    milli_second = 10
    micro_second = 11
    nano_second = 12
    counts = 13
    pixels = 14
    reserved_sfom0 = 15
    reserved_sfom1 = 16
    reserved_sfom2 = 17
    reserved_sfom3 = 18
    reserved_sfom4 = 19
    ampere2 = 20
    milli_ampere = 21
    micro_ampere = 22
    nano_ampere2 = 23
    pico_ampere = 24
    volt2 = 25
    milli_volt = 26
    micro_volt = 27
    nano_volt = 28
    pico_volt = 29
    newton = 30
    milli_newton = 31
    micro_newton = 32
    nano_newton = 33
    pico_newton = 34
    reserved_dos0 = 35
    reserved_dos1 = 36
    reserved_dos2 = 37
    reserved_dos3 = 38
    reserved_dos4 = 39
  NtMdt_SpmTechnique* = enum
    contact_mode = 0
    semicontact_mode = 1
    tunnel_current = 2
    snom = 3
  NtMdt_Consts* = enum
    frame_mode_size = 8
    frame_header_size = 22
    axis_scales_size = 30
    file_header_size = 32
    spectro_vars_min_size = 38
    scan_vars_min_size = 77
  NtMdt_Uuid* = ref object of KaitaiStruct
    `data`*: seq[uint8]
    `parent`*: NtMdt_Frame_FdMetaData
  NtMdt_Framez* = ref object of KaitaiStruct
    `frames`*: seq[NtMdt_Frame]
    `parent`*: NtMdt
  NtMdt_Frame* = ref object of KaitaiStruct
    `size`*: uint32
    `main`*: NtMdt_Frame_FrameMain
    `parent`*: NtMdt_Framez
    `rawMain`*: seq[byte]
  NtMdt_Frame_FrameType* = enum
    scanned = 0
    spectroscopy = 1
    text = 3
    old_mda = 105
    mda = 106
    palette = 107
    curves_new = 190
    curves = 201
  NtMdt_Frame_Dots* = ref object of KaitaiStruct
    `fmNdots`*: uint16
    `coordHeader`*: NtMdt_Frame_Dots_DotsHeader
    `coordinates`*: seq[NtMdt_Frame_Dots_DotsData]
    `data`*: seq[NtMdt_Frame_Dots_DataLinez]
    `parent`*: KaitaiStruct
  NtMdt_Frame_Dots_DotsHeader* = ref object of KaitaiStruct
    `headerSize`*: int32
    `header`*: NtMdt_Frame_Dots_DotsHeader_Header
    `parent`*: NtMdt_Frame_Dots
    `rawHeader`*: seq[byte]
  NtMdt_Frame_Dots_DotsHeader_Header* = ref object of KaitaiStruct
    `coordSize`*: int32
    `version`*: int32
    `xyunits`*: NtMdt_Unit
    `parent`*: NtMdt_Frame_Dots_DotsHeader
  NtMdt_Frame_Dots_DotsData* = ref object of KaitaiStruct
    `coordX`*: float32
    `coordY`*: float32
    `forwardSize`*: int32
    `backwardSize`*: int32
    `parent`*: NtMdt_Frame_Dots
  NtMdt_Frame_Dots_DataLinez* = ref object of KaitaiStruct
    `forward`*: seq[int16]
    `backward`*: seq[int16]
    `index`*: uint16
    `parent`*: NtMdt_Frame_Dots
  NtMdt_Frame_FrameMain* = ref object of KaitaiStruct
    `type`*: NtMdt_Frame_FrameType
    `version`*: NtMdt_Version
    `dateTime`*: NtMdt_Frame_DateTime
    `varSize`*: uint16
    `frameData`*: KaitaiStruct
    `parent`*: NtMdt_Frame
    `rawFrameData`*: seq[byte]
  NtMdt_Frame_FdCurvesNew* = ref object of KaitaiStruct
    `blockCount`*: uint32
    `blocksHeaders`*: seq[NtMdt_Frame_FdCurvesNew_BlockDescr]
    `blocksNames`*: seq[string]
    `blocksData`*: seq[seq[byte]]
    `parent`*: NtMdt_Frame_FrameMain
  NtMdt_Frame_FdCurvesNew_BlockDescr* = ref object of KaitaiStruct
    `nameLen`*: uint32
    `len`*: uint32
    `parent`*: NtMdt_Frame_FdCurvesNew
  NtMdt_Frame_FdMetaData* = ref object of KaitaiStruct
    `headSize`*: uint32
    `totLen`*: uint32
    `guids`*: seq[NtMdt_Uuid]
    `frameStatus`*: seq[byte]
    `nameSize`*: uint32
    `commSize`*: uint32
    `viewInfoSize`*: uint32
    `specSize`*: uint32
    `sourceInfoSize`*: uint32
    `varSize`*: uint32
    `dataOffset`*: uint32
    `dataSize`*: uint32
    `title`*: string
    `xml`*: string
    `structLen`*: uint32
    `arraySize`*: uint64
    `cellSize`*: uint32
    `nDimensions`*: uint32
    `nMesurands`*: uint32
    `dimensions`*: seq[NtMdt_Frame_FdMetaData_Calibration]
    `mesurands`*: seq[NtMdt_Frame_FdMetaData_Calibration]
    `parent`*: NtMdt_Frame_FrameMain
    `rawImageInst`*: seq[byte]
    `imageInst`*: NtMdt_Frame_FdMetaData_Image
  NtMdt_Frame_FdMetaData_Image* = ref object of KaitaiStruct
    `image`*: seq[NtMdt_Frame_FdMetaData_Image_Vec]
    `parent`*: NtMdt_Frame_FdMetaData
  NtMdt_Frame_FdMetaData_Image_Vec* = ref object of KaitaiStruct
    `items`*: seq[float64]
    `parent`*: NtMdt_Frame_FdMetaData_Image
  NtMdt_Frame_FdMetaData_Calibration* = ref object of KaitaiStruct
    `lenTot`*: uint32
    `lenStruct`*: uint32
    `lenName`*: uint32
    `lenComment`*: uint32
    `lenUnit`*: uint32
    `siUnit`*: uint64
    `accuracy`*: float64
    `functionIdAndDimensions`*: uint64
    `bias`*: float64
    `scale`*: float64
    `minIndex`*: uint64
    `maxIndex`*: uint64
    `dataType`*: NtMdt_DataType
    `lenAuthor`*: uint32
    `name`*: string
    `comment`*: string
    `unit`*: string
    `author`*: string
    `parent`*: NtMdt_Frame_FdMetaData
    `countInst`*: int
  NtMdt_Frame_FdSpectroscopy* = ref object of KaitaiStruct
    `vars`*: NtMdt_Frame_FdSpectroscopy_Vars
    `fmMode`*: uint16
    `fmXres`*: uint16
    `fmYres`*: uint16
    `dots`*: NtMdt_Frame_Dots
    `data`*: seq[int16]
    `title`*: NtMdt_Title
    `xml`*: NtMdt_Xml
    `parent`*: NtMdt_Frame_FrameMain
    `rawVars`*: seq[byte]
  NtMdt_Frame_FdSpectroscopy_Vars* = ref object of KaitaiStruct
    `xScale`*: NtMdt_Frame_AxisScale
    `yScale`*: NtMdt_Frame_AxisScale
    `zScale`*: NtMdt_Frame_AxisScale
    `spMode`*: uint16
    `spFilter`*: uint16
    `uBegin`*: float32
    `uEnd`*: float32
    `zUp`*: int16
    `zDown`*: int16
    `spAveraging`*: uint16
    `spRepeat`*: uint8
    `spBack`*: uint8
    `sp4nx`*: int16
    `spOsc`*: uint8
    `spN4`*: uint8
    `sp4x0`*: float32
    `sp4xr`*: float32
    `sp4u`*: int16
    `sp4i`*: int16
    `spNx`*: int16
    `parent`*: NtMdt_Frame_FdSpectroscopy
  NtMdt_Frame_DateTime* = ref object of KaitaiStruct
    `date`*: NtMdt_Frame_DateTime_Date
    `time`*: NtMdt_Frame_DateTime_Time
    `parent`*: NtMdt_Frame_FrameMain
  NtMdt_Frame_DateTime_Date* = ref object of KaitaiStruct
    `year`*: uint16
    `month`*: uint16
    `day`*: uint16
    `parent`*: NtMdt_Frame_DateTime
  NtMdt_Frame_DateTime_Time* = ref object of KaitaiStruct
    `hour`*: uint16
    `min`*: uint16
    `sec`*: uint16
    `parent`*: NtMdt_Frame_DateTime
  NtMdt_Frame_AxisScale* = ref object of KaitaiStruct
    `offset`*: float32
    `step`*: float32
    `unit`*: NtMdt_Unit
    `parent`*: KaitaiStruct
  NtMdt_Frame_FdScanned* = ref object of KaitaiStruct
    `vars`*: NtMdt_Frame_FdScanned_Vars
    `origFormat`*: uint32
    `tune`*: NtMdt_Frame_FdScanned_LiftMode
    `feedbackGain`*: float64
    `dacScale`*: int32
    `overscan`*: int32
    `fmMode`*: uint16
    `fmXres`*: uint16
    `fmYres`*: uint16
    `dots`*: NtMdt_Frame_Dots
    `image`*: seq[int16]
    `title`*: NtMdt_Title
    `xml`*: NtMdt_Xml
    `parent`*: NtMdt_Frame_FrameMain
    `rawVars`*: seq[byte]
  NtMdt_Frame_FdScanned_Mode* = enum
    stm = 0
    afm = 1
    unknown2 = 2
    unknown3 = 3
    unknown4 = 4
  NtMdt_Frame_FdScanned_InputSignal* = enum
    extension_slot = 0
    bias_v = 1
    ground = 2
  NtMdt_Frame_FdScanned_LiftMode* = enum
    step = 0
    fine = 1
    slope = 2
  NtMdt_Frame_FdScanned_Vars* = ref object of KaitaiStruct
    `xScale`*: NtMdt_Frame_AxisScale
    `yScale`*: NtMdt_Frame_AxisScale
    `zScale`*: NtMdt_Frame_AxisScale
    `channelIndex`*: NtMdt_AdcMode
    `mode`*: NtMdt_Frame_FdScanned_Mode
    `xres`*: uint16
    `yres`*: uint16
    `ndacq`*: uint16
    `stepLength`*: float32
    `adt`*: uint16
    `adcGainAmpLog10`*: uint8
    `adcIndex`*: uint8
    `inputSignalOrVersion`*: uint8
    `substrPlaneOrderOrPassNum`*: uint8
    `scanDir`*: NtMdt_Frame_FdScanned_ScanDir
    `powerOf2`*: uint8
    `velocity`*: float32
    `setpoint`*: float32
    `biasVoltage`*: float32
    `draw`*: uint8
    `reserved`*: uint8
    `xoff`*: int32
    `yoff`*: int32
    `nlCorr`*: uint8
    `parent`*: NtMdt_Frame_FdScanned
  NtMdt_Frame_FdScanned_Dot* = ref object of KaitaiStruct
    `x`*: int16
    `y`*: int16
    `parent`*: KaitaiStruct
  NtMdt_Frame_FdScanned_ScanDir* = ref object of KaitaiStruct
    `unkn`*: uint64
    `doublePass`*: bool
    `bottom`*: bool
    `left`*: bool
    `horizontal`*: bool
    `parent`*: NtMdt_Frame_FdScanned_Vars
  NtMdt_Version* = ref object of KaitaiStruct
    `minor`*: uint8
    `major`*: uint8
    `parent`*: NtMdt_Frame_FrameMain
  NtMdt_Xml* = ref object of KaitaiStruct
    `xmlLen`*: uint32
    `xml`*: string
    `parent`*: KaitaiStruct
  NtMdt_Title* = ref object of KaitaiStruct
    `titleLen`*: uint32
    `title`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[NtMdt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt
proc read*(_: typedesc[NtMdt_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Uuid
proc read*(_: typedesc[NtMdt_Framez], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt): NtMdt_Framez
proc read*(_: typedesc[NtMdt_Frame], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Framez): NtMdt_Frame
proc read*(_: typedesc[NtMdt_Frame_Dots], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_Dots
proc read*(_: typedesc[NtMdt_Frame_Dots_DotsHeader], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots): NtMdt_Frame_Dots_DotsHeader
proc read*(_: typedesc[NtMdt_Frame_Dots_DotsHeader_Header], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots_DotsHeader): NtMdt_Frame_Dots_DotsHeader_Header
proc read*(_: typedesc[NtMdt_Frame_Dots_DotsData], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots): NtMdt_Frame_Dots_DotsData
proc read*(_: typedesc[NtMdt_Frame_Dots_DataLinez], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots, index: any): NtMdt_Frame_Dots_DataLinez
proc read*(_: typedesc[NtMdt_Frame_FrameMain], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame): NtMdt_Frame_FrameMain
proc read*(_: typedesc[NtMdt_Frame_FdCurvesNew], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdCurvesNew
proc read*(_: typedesc[NtMdt_Frame_FdCurvesNew_BlockDescr], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdCurvesNew): NtMdt_Frame_FdCurvesNew_BlockDescr
proc read*(_: typedesc[NtMdt_Frame_FdMetaData], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdMetaData
proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Image], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Image
proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Image_Vec], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData_Image): NtMdt_Frame_FdMetaData_Image_Vec
proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Calibration], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Calibration
proc read*(_: typedesc[NtMdt_Frame_FdSpectroscopy], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdSpectroscopy
proc read*(_: typedesc[NtMdt_Frame_FdSpectroscopy_Vars], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdSpectroscopy): NtMdt_Frame_FdSpectroscopy_Vars
proc read*(_: typedesc[NtMdt_Frame_DateTime], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_DateTime
proc read*(_: typedesc[NtMdt_Frame_DateTime_Date], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_DateTime): NtMdt_Frame_DateTime_Date
proc read*(_: typedesc[NtMdt_Frame_DateTime_Time], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_DateTime): NtMdt_Frame_DateTime_Time
proc read*(_: typedesc[NtMdt_Frame_AxisScale], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_AxisScale
proc read*(_: typedesc[NtMdt_Frame_FdScanned], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdScanned
proc read*(_: typedesc[NtMdt_Frame_FdScanned_Vars], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdScanned): NtMdt_Frame_FdScanned_Vars
proc read*(_: typedesc[NtMdt_Frame_FdScanned_Dot], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_FdScanned_Dot
proc read*(_: typedesc[NtMdt_Frame_FdScanned_ScanDir], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdScanned_Vars): NtMdt_Frame_FdScanned_ScanDir
proc read*(_: typedesc[NtMdt_Version], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Version
proc read*(_: typedesc[NtMdt_Xml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Xml
proc read*(_: typedesc[NtMdt_Title], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Title

proc image*(this: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Image
proc count*(this: NtMdt_Frame_FdMetaData_Calibration): int


##[
A native file format of NT-MDT scientific software. Usually contains
any of:

* [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
* [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
* results of their analysis

Some examples of mdt files can be downloaded at:

* https://www.ntmdt-si.ru/resources/scan-gallery
* http://callistosoft.narod.ru/Resources/Mdt.zip

@see <a href="https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c">Source</a>
]##
proc read*(_: typedesc[NtMdt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt =
  template this: untyped = result
  this = new(NtMdt)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr

  ##[
  File size (w/o header)
  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let reserved0Expr = this.io.readBytes(int(4))
  this.reserved0 = reserved0Expr
  let lastFrameExpr = this.io.readU2le()
  this.lastFrame = lastFrameExpr
  let reserved1Expr = this.io.readBytes(int(18))
  this.reserved1 = reserved1Expr

  ##[
  documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
  ]##
  let wrondDocExpr = this.io.readBytes(int(1))
  this.wrondDoc = wrondDocExpr
  let rawFramesExpr = this.io.readBytes(int(this.size))
  this.rawFrames = rawFramesExpr
  let rawFramesIo = newKaitaiStream(rawFramesExpr)
  let framesExpr = NtMdt_Framez.read(rawFramesIo, this.root, this)
  this.frames = framesExpr

proc fromFile*(_: typedesc[NtMdt], filename: string): NtMdt =
  NtMdt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Uuid =
  template this: untyped = result
  this = new(NtMdt_Uuid)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(16):
    let it = this.io.readU1()
    this.data.add(it)

proc fromFile*(_: typedesc[NtMdt_Uuid], filename: string): NtMdt_Uuid =
  NtMdt_Uuid.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Framez], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt): NtMdt_Framez =
  template this: untyped = result
  this = new(NtMdt_Framez)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int((NtMdt(this.root).lastFrame + 1)):
    let it = NtMdt_Frame.read(this.io, this.root, this)
    this.frames.add(it)

proc fromFile*(_: typedesc[NtMdt_Framez], filename: string): NtMdt_Framez =
  NtMdt_Framez.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Framez): NtMdt_Frame =
  template this: untyped = result
  this = new(NtMdt_Frame)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  h_sz
  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let rawMainExpr = this.io.readBytes(int((this.size - 4)))
  this.rawMain = rawMainExpr
  let rawMainIo = newKaitaiStream(rawMainExpr)
  let mainExpr = NtMdt_Frame_FrameMain.read(rawMainIo, this.root, this)
  this.main = mainExpr

proc fromFile*(_: typedesc[NtMdt_Frame], filename: string): NtMdt_Frame =
  NtMdt_Frame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_Dots], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_Dots =
  template this: untyped = result
  this = new(NtMdt_Frame_Dots)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fmNdotsExpr = this.io.readU2le()
  this.fmNdots = fmNdotsExpr
  if this.fmNdots > 0:
    let coordHeaderExpr = NtMdt_Frame_Dots_DotsHeader.read(this.io, this.root, this)
    this.coordHeader = coordHeaderExpr
  for i in 0 ..< int(this.fmNdots):
    let it = NtMdt_Frame_Dots_DotsData.read(this.io, this.root, this)
    this.coordinates.add(it)
  for i in 0 ..< int(this.fmNdots):
    let it = NtMdt_Frame_Dots_DataLinez.read(this.io, this.root, this, i)
    this.data.add(it)

proc fromFile*(_: typedesc[NtMdt_Frame_Dots], filename: string): NtMdt_Frame_Dots =
  NtMdt_Frame_Dots.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_Dots_DotsHeader], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots): NtMdt_Frame_Dots_DotsHeader =
  template this: untyped = result
  this = new(NtMdt_Frame_Dots_DotsHeader)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerSizeExpr = this.io.readS4le()
  this.headerSize = headerSizeExpr
  let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = NtMdt_Frame_Dots_DotsHeader_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

proc fromFile*(_: typedesc[NtMdt_Frame_Dots_DotsHeader], filename: string): NtMdt_Frame_Dots_DotsHeader =
  NtMdt_Frame_Dots_DotsHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_Dots_DotsHeader_Header], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots_DotsHeader): NtMdt_Frame_Dots_DotsHeader_Header =
  template this: untyped = result
  this = new(NtMdt_Frame_Dots_DotsHeader_Header)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let coordSizeExpr = this.io.readS4le()
  this.coordSize = coordSizeExpr
  let versionExpr = this.io.readS4le()
  this.version = versionExpr
  let xyunitsExpr = NtMdt_Unit(this.io.readS2le())
  this.xyunits = xyunitsExpr

proc fromFile*(_: typedesc[NtMdt_Frame_Dots_DotsHeader_Header], filename: string): NtMdt_Frame_Dots_DotsHeader_Header =
  NtMdt_Frame_Dots_DotsHeader_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_Dots_DotsData], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots): NtMdt_Frame_Dots_DotsData =
  template this: untyped = result
  this = new(NtMdt_Frame_Dots_DotsData)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let coordXExpr = this.io.readF4le()
  this.coordX = coordXExpr
  let coordYExpr = this.io.readF4le()
  this.coordY = coordYExpr
  let forwardSizeExpr = this.io.readS4le()
  this.forwardSize = forwardSizeExpr
  let backwardSizeExpr = this.io.readS4le()
  this.backwardSize = backwardSizeExpr

proc fromFile*(_: typedesc[NtMdt_Frame_Dots_DotsData], filename: string): NtMdt_Frame_Dots_DotsData =
  NtMdt_Frame_Dots_DotsData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_Dots_DataLinez], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_Dots, index: any): NtMdt_Frame_Dots_DataLinez =
  template this: untyped = result
  this = new(NtMdt_Frame_Dots_DataLinez)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent
  let indexExpr = uint16(index)
  this.index = indexExpr

  for i in 0 ..< int(this.parent.coordinates[this.index].forwardSize):
    let it = this.io.readS2le()
    this.forward.add(it)
  for i in 0 ..< int(this.parent.coordinates[this.index].backwardSize):
    let it = this.io.readS2le()
    this.backward.add(it)

proc fromFile*(_: typedesc[NtMdt_Frame_Dots_DataLinez], filename: string): NtMdt_Frame_Dots_DataLinez =
  NtMdt_Frame_Dots_DataLinez.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FrameMain], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame): NtMdt_Frame_FrameMain =
  template this: untyped = result
  this = new(NtMdt_Frame_FrameMain)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  h_what
  ]##
  let typeExpr = NtMdt_Frame_FrameType(this.io.readU2le())
  this.type = typeExpr
  let versionExpr = NtMdt_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let dateTimeExpr = NtMdt_Frame_DateTime.read(this.io, this.root, this)
  this.dateTime = dateTimeExpr

  ##[
  h_am, v6 and older only
  ]##
  let varSizeExpr = this.io.readU2le()
  this.varSize = varSizeExpr

  ##[
  
  ]##
  block:
    let on = this.type
    if on == nt_mdt.mda:
      let rawFrameDataExpr = this.io.readBytesFull()
      this.rawFrameData = rawFrameDataExpr
      let rawFrameDataIo = newKaitaiStream(rawFrameDataExpr)
      let frameDataExpr = NtMdt_Frame_FdMetaData.read(rawFrameDataIo, this.root, this)
      this.frameData = frameDataExpr
    elif on == nt_mdt.curves_new:
      let rawFrameDataExpr = this.io.readBytesFull()
      this.rawFrameData = rawFrameDataExpr
      let rawFrameDataIo = newKaitaiStream(rawFrameDataExpr)
      let frameDataExpr = NtMdt_Frame_FdCurvesNew.read(rawFrameDataIo, this.root, this)
      this.frameData = frameDataExpr
    elif on == nt_mdt.curves:
      let rawFrameDataExpr = this.io.readBytesFull()
      this.rawFrameData = rawFrameDataExpr
      let rawFrameDataIo = newKaitaiStream(rawFrameDataExpr)
      let frameDataExpr = NtMdt_Frame_FdSpectroscopy.read(rawFrameDataIo, this.root, this)
      this.frameData = frameDataExpr
    elif on == nt_mdt.spectroscopy:
      let rawFrameDataExpr = this.io.readBytesFull()
      this.rawFrameData = rawFrameDataExpr
      let rawFrameDataIo = newKaitaiStream(rawFrameDataExpr)
      let frameDataExpr = NtMdt_Frame_FdSpectroscopy.read(rawFrameDataIo, this.root, this)
      this.frameData = frameDataExpr
    elif on == nt_mdt.scanned:
      let rawFrameDataExpr = this.io.readBytesFull()
      this.rawFrameData = rawFrameDataExpr
      let rawFrameDataIo = newKaitaiStream(rawFrameDataExpr)
      let frameDataExpr = NtMdt_Frame_FdScanned.read(rawFrameDataIo, this.root, this)
      this.frameData = frameDataExpr
    else:
      let frameDataExpr = this.io.readBytesFull()
      this.frameData = frameDataExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FrameMain], filename: string): NtMdt_Frame_FrameMain =
  NtMdt_Frame_FrameMain.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdCurvesNew], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdCurvesNew =
  template this: untyped = result
  this = new(NtMdt_Frame_FdCurvesNew)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blockCountExpr = this.io.readU4le()
  this.blockCount = blockCountExpr
  for i in 0 ..< int(this.blockCount):
    let it = NtMdt_Frame_FdCurvesNew_BlockDescr.read(this.io, this.root, this)
    this.blocksHeaders.add(it)
  for i in 0 ..< int(this.blockCount):
    let it = encode(this.io.readBytes(int(this.blocksHeaders[i].nameLen)), "UTF-8")
    this.blocksNames.add(it)
  for i in 0 ..< int(this.blockCount):
    let it = this.io.readBytes(int(this.blocksHeaders[i].len))
    this.blocksData.add(it)

proc fromFile*(_: typedesc[NtMdt_Frame_FdCurvesNew], filename: string): NtMdt_Frame_FdCurvesNew =
  NtMdt_Frame_FdCurvesNew.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdCurvesNew_BlockDescr], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdCurvesNew): NtMdt_Frame_FdCurvesNew_BlockDescr =
  template this: untyped = result
  this = new(NtMdt_Frame_FdCurvesNew_BlockDescr)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameLenExpr = this.io.readU4le()
  this.nameLen = nameLenExpr
  let lenExpr = this.io.readU4le()
  this.len = lenExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdCurvesNew_BlockDescr], filename: string): NtMdt_Frame_FdCurvesNew_BlockDescr =
  NtMdt_Frame_FdCurvesNew_BlockDescr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdMetaData], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdMetaData =
  template this: untyped = result
  this = new(NtMdt_Frame_FdMetaData)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headSizeExpr = this.io.readU4le()
  this.headSize = headSizeExpr
  let totLenExpr = this.io.readU4le()
  this.totLen = totLenExpr
  for i in 0 ..< int(2):
    let it = NtMdt_Uuid.read(this.io, this.root, this)
    this.guids.add(it)
  let frameStatusExpr = this.io.readBytes(int(4))
  this.frameStatus = frameStatusExpr
  let nameSizeExpr = this.io.readU4le()
  this.nameSize = nameSizeExpr
  let commSizeExpr = this.io.readU4le()
  this.commSize = commSizeExpr
  let viewInfoSizeExpr = this.io.readU4le()
  this.viewInfoSize = viewInfoSizeExpr
  let specSizeExpr = this.io.readU4le()
  this.specSize = specSizeExpr
  let sourceInfoSizeExpr = this.io.readU4le()
  this.sourceInfoSize = sourceInfoSizeExpr
  let varSizeExpr = this.io.readU4le()
  this.varSize = varSizeExpr
  let dataOffsetExpr = this.io.readU4le()
  this.dataOffset = dataOffsetExpr
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr
  let titleExpr = encode(this.io.readBytes(int(this.nameSize)), "UTF-8")
  this.title = titleExpr
  let xmlExpr = encode(this.io.readBytes(int(this.commSize)), "UTF-8")
  this.xml = xmlExpr
  let structLenExpr = this.io.readU4le()
  this.structLen = structLenExpr
  let arraySizeExpr = this.io.readU8le()
  this.arraySize = arraySizeExpr
  let cellSizeExpr = this.io.readU4le()
  this.cellSize = cellSizeExpr
  let nDimensionsExpr = this.io.readU4le()
  this.nDimensions = nDimensionsExpr
  let nMesurandsExpr = this.io.readU4le()
  this.nMesurands = nMesurandsExpr
  for i in 0 ..< int(this.nDimensions):
    let it = NtMdt_Frame_FdMetaData_Calibration.read(this.io, this.root, this)
    this.dimensions.add(it)
  for i in 0 ..< int(this.nMesurands):
    let it = NtMdt_Frame_FdMetaData_Calibration.read(this.io, this.root, this)
    this.mesurands.add(it)

proc image(this: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Image = 
  if this.imageInst != nil:
    return this.imageInst
  let pos = this.io.pos()
  this.io.seek(int(this.dataOffset))
  let rawImageInstExpr = this.io.readBytes(int(this.dataSize))
  this.rawImageInst = rawImageInstExpr
  let rawImageInstIo = newKaitaiStream(rawImageInstExpr)
  let imageInstExpr = NtMdt_Frame_FdMetaData_Image.read(rawImageInstIo, this.root, this)
  this.imageInst = imageInstExpr
  this.io.seek(pos)
  if this.imageInst != nil:
    return this.imageInst

proc fromFile*(_: typedesc[NtMdt_Frame_FdMetaData], filename: string): NtMdt_Frame_FdMetaData =
  NtMdt_Frame_FdMetaData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Image], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Image =
  template this: untyped = result
  this = new(NtMdt_Frame_FdMetaData_Image)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = NtMdt_Frame_FdMetaData_Image_Vec.read(this.io, this.root, this)
      this.image.add(it)
      inc i

proc fromFile*(_: typedesc[NtMdt_Frame_FdMetaData_Image], filename: string): NtMdt_Frame_FdMetaData_Image =
  NtMdt_Frame_FdMetaData_Image.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Image_Vec], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData_Image): NtMdt_Frame_FdMetaData_Image_Vec =
  template this: untyped = result
  this = new(NtMdt_Frame_FdMetaData_Image_Vec)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(this.parent.parent.nMesurands):
    block:
      let on = this.parent.parent.mesurands[i].dataType
      if on == nt_mdt.uint64:
        let it = float64(this.io.readU8le())
        this.items.add(it)
      elif on == nt_mdt.uint8:
        let it = float64(this.io.readU1())
        this.items.add(it)
      elif on == nt_mdt.float32:
        let it = float64(this.io.readF4le())
        this.items.add(it)
      elif on == nt_mdt.int8:
        let it = float64(this.io.readS1())
        this.items.add(it)
      elif on == nt_mdt.uint16:
        let it = float64(this.io.readU2le())
        this.items.add(it)
      elif on == nt_mdt.int64:
        let it = float64(this.io.readS8le())
        this.items.add(it)
      elif on == nt_mdt.uint32:
        let it = float64(this.io.readU4le())
        this.items.add(it)
      elif on == nt_mdt.float64:
        let it = float64(this.io.readF8le())
        this.items.add(it)
      elif on == nt_mdt.int16:
        let it = float64(this.io.readS2le())
        this.items.add(it)
      elif on == nt_mdt.int32:
        let it = float64(this.io.readS4le())
        this.items.add(it)

proc fromFile*(_: typedesc[NtMdt_Frame_FdMetaData_Image_Vec], filename: string): NtMdt_Frame_FdMetaData_Image_Vec =
  NtMdt_Frame_FdMetaData_Image_Vec.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdMetaData_Calibration], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdMetaData): NtMdt_Frame_FdMetaData_Calibration =
  template this: untyped = result
  this = new(NtMdt_Frame_FdMetaData_Calibration)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenTotExpr = this.io.readU4le()
  this.lenTot = lenTotExpr
  let lenStructExpr = this.io.readU4le()
  this.lenStruct = lenStructExpr
  let lenNameExpr = this.io.readU4le()
  this.lenName = lenNameExpr
  let lenCommentExpr = this.io.readU4le()
  this.lenComment = lenCommentExpr
  let lenUnitExpr = this.io.readU4le()
  this.lenUnit = lenUnitExpr
  let siUnitExpr = this.io.readU8le()
  this.siUnit = siUnitExpr
  let accuracyExpr = this.io.readF8le()
  this.accuracy = accuracyExpr
  let functionIdAndDimensionsExpr = this.io.readU8le()
  this.functionIdAndDimensions = functionIdAndDimensionsExpr
  let biasExpr = this.io.readF8le()
  this.bias = biasExpr
  let scaleExpr = this.io.readF8le()
  this.scale = scaleExpr
  let minIndexExpr = this.io.readU8le()
  this.minIndex = minIndexExpr
  let maxIndexExpr = this.io.readU8le()
  this.maxIndex = maxIndexExpr
  let dataTypeExpr = NtMdt_DataType(this.io.readS4le())
  this.dataType = dataTypeExpr
  let lenAuthorExpr = this.io.readU4le()
  this.lenAuthor = lenAuthorExpr
  let nameExpr = encode(this.io.readBytes(int(this.lenName)), "utf-8")
  this.name = nameExpr
  let commentExpr = encode(this.io.readBytes(int(this.lenComment)), "utf-8")
  this.comment = commentExpr
  let unitExpr = encode(this.io.readBytes(int(this.lenUnit)), "utf-8")
  this.unit = unitExpr
  let authorExpr = encode(this.io.readBytes(int(this.lenAuthor)), "utf-8")
  this.author = authorExpr

proc count(this: NtMdt_Frame_FdMetaData_Calibration): int = 
  if this.countInst != nil:
    return this.countInst
  let countInstExpr = int(((this.maxIndex - this.minIndex) + 1))
  this.countInst = countInstExpr
  if this.countInst != nil:
    return this.countInst

proc fromFile*(_: typedesc[NtMdt_Frame_FdMetaData_Calibration], filename: string): NtMdt_Frame_FdMetaData_Calibration =
  NtMdt_Frame_FdMetaData_Calibration.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdSpectroscopy], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdSpectroscopy =
  template this: untyped = result
  this = new(NtMdt_Frame_FdSpectroscopy)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawVarsExpr = this.io.readBytes(int(this.parent.varSize))
  this.rawVars = rawVarsExpr
  let rawVarsIo = newKaitaiStream(rawVarsExpr)
  let varsExpr = NtMdt_Frame_FdSpectroscopy_Vars.read(rawVarsIo, this.root, this)
  this.vars = varsExpr
  let fmModeExpr = this.io.readU2le()
  this.fmMode = fmModeExpr
  let fmXresExpr = this.io.readU2le()
  this.fmXres = fmXresExpr
  let fmYresExpr = this.io.readU2le()
  this.fmYres = fmYresExpr
  let dotsExpr = NtMdt_Frame_Dots.read(this.io, this.root, this)
  this.dots = dotsExpr
  for i in 0 ..< int((this.fmXres * this.fmYres)):
    let it = this.io.readS2le()
    this.data.add(it)
  let titleExpr = NtMdt_Title.read(this.io, this.root, this)
  this.title = titleExpr
  let xmlExpr = NtMdt_Xml.read(this.io, this.root, this)
  this.xml = xmlExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdSpectroscopy], filename: string): NtMdt_Frame_FdSpectroscopy =
  NtMdt_Frame_FdSpectroscopy.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdSpectroscopy_Vars], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdSpectroscopy): NtMdt_Frame_FdSpectroscopy_Vars =
  template this: untyped = result
  this = new(NtMdt_Frame_FdSpectroscopy_Vars)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.xScale = xScaleExpr
  let yScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.yScale = yScaleExpr
  let zScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.zScale = zScaleExpr
  let spModeExpr = this.io.readU2le()
  this.spMode = spModeExpr
  let spFilterExpr = this.io.readU2le()
  this.spFilter = spFilterExpr
  let uBeginExpr = this.io.readF4le()
  this.uBegin = uBeginExpr
  let uEndExpr = this.io.readF4le()
  this.uEnd = uEndExpr
  let zUpExpr = this.io.readS2le()
  this.zUp = zUpExpr
  let zDownExpr = this.io.readS2le()
  this.zDown = zDownExpr
  let spAveragingExpr = this.io.readU2le()
  this.spAveraging = spAveragingExpr
  let spRepeatExpr = this.io.readU1()
  this.spRepeat = spRepeatExpr
  let spBackExpr = this.io.readU1()
  this.spBack = spBackExpr
  let sp4nxExpr = this.io.readS2le()
  this.sp4nx = sp4nxExpr
  let spOscExpr = this.io.readU1()
  this.spOsc = spOscExpr
  let spN4Expr = this.io.readU1()
  this.spN4 = spN4Expr
  let sp4x0Expr = this.io.readF4le()
  this.sp4x0 = sp4x0Expr
  let sp4xrExpr = this.io.readF4le()
  this.sp4xr = sp4xrExpr
  let sp4uExpr = this.io.readS2le()
  this.sp4u = sp4uExpr
  let sp4iExpr = this.io.readS2le()
  this.sp4i = sp4iExpr
  let spNxExpr = this.io.readS2le()
  this.spNx = spNxExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdSpectroscopy_Vars], filename: string): NtMdt_Frame_FdSpectroscopy_Vars =
  NtMdt_Frame_FdSpectroscopy_Vars.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_DateTime], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_DateTime =
  template this: untyped = result
  this = new(NtMdt_Frame_DateTime)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dateExpr = NtMdt_Frame_DateTime_Date.read(this.io, this.root, this)
  this.date = dateExpr
  let timeExpr = NtMdt_Frame_DateTime_Time.read(this.io, this.root, this)
  this.time = timeExpr

proc fromFile*(_: typedesc[NtMdt_Frame_DateTime], filename: string): NtMdt_Frame_DateTime =
  NtMdt_Frame_DateTime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_DateTime_Date], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_DateTime): NtMdt_Frame_DateTime_Date =
  template this: untyped = result
  this = new(NtMdt_Frame_DateTime_Date)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  h_yea
  ]##
  let yearExpr = this.io.readU2le()
  this.year = yearExpr

  ##[
  h_mon
  ]##
  let monthExpr = this.io.readU2le()
  this.month = monthExpr

  ##[
  h_day
  ]##
  let dayExpr = this.io.readU2le()
  this.day = dayExpr

proc fromFile*(_: typedesc[NtMdt_Frame_DateTime_Date], filename: string): NtMdt_Frame_DateTime_Date =
  NtMdt_Frame_DateTime_Date.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_DateTime_Time], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_DateTime): NtMdt_Frame_DateTime_Time =
  template this: untyped = result
  this = new(NtMdt_Frame_DateTime_Time)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  h_h
  ]##
  let hourExpr = this.io.readU2le()
  this.hour = hourExpr

  ##[
  h_m
  ]##
  let minExpr = this.io.readU2le()
  this.min = minExpr

  ##[
  h_s
  ]##
  let secExpr = this.io.readU2le()
  this.sec = secExpr

proc fromFile*(_: typedesc[NtMdt_Frame_DateTime_Time], filename: string): NtMdt_Frame_DateTime_Time =
  NtMdt_Frame_DateTime_Time.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_AxisScale], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_AxisScale =
  template this: untyped = result
  this = new(NtMdt_Frame_AxisScale)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
  ]##
  let offsetExpr = this.io.readF4le()
  this.offset = offsetExpr

  ##[
  x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
  g_warning("x_scale.step == 0, changing to 1");
  x_scale->step = 1.0;
}

  ]##
  let stepExpr = this.io.readF4le()
  this.step = stepExpr

  ##[
  U
  ]##
  let unitExpr = NtMdt_Unit(this.io.readS2le())
  this.unit = unitExpr

proc fromFile*(_: typedesc[NtMdt_Frame_AxisScale], filename: string): NtMdt_Frame_AxisScale =
  NtMdt_Frame_AxisScale.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdScanned], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Frame_FdScanned =
  template this: untyped = result
  this = new(NtMdt_Frame_FdScanned)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawVarsExpr = this.io.readBytes(int(this.parent.varSize))
  this.rawVars = rawVarsExpr
  let rawVarsIo = newKaitaiStream(rawVarsExpr)
  let varsExpr = NtMdt_Frame_FdScanned_Vars.read(rawVarsIo, this.root, this)
  this.vars = varsExpr

  ##[
  s_oem
  ]##
  if false:
    let origFormatExpr = this.io.readU4le()
    this.origFormat = origFormatExpr

  ##[
  z_tune
  ]##
  if false:
    let tuneExpr = NtMdt_Frame_FdScanned_LiftMode(this.io.readU4le())
    this.tune = tuneExpr

  ##[
  s_fbg
  ]##
  if false:
    let feedbackGainExpr = this.io.readF8le()
    this.feedbackGain = feedbackGainExpr

  ##[
  s_s
  ]##
  if false:
    let dacScaleExpr = this.io.readS4le()
    this.dacScale = dacScaleExpr

  ##[
  s_xov (in %)
  ]##
  if false:
    let overscanExpr = this.io.readS4le()
    this.overscan = overscanExpr

  ##[
  m_mode
  ]##
  let fmModeExpr = this.io.readU2le()
  this.fmMode = fmModeExpr

  ##[
  m_nx
  ]##
  let fmXresExpr = this.io.readU2le()
  this.fmXres = fmXresExpr

  ##[
  m_ny
  ]##
  let fmYresExpr = this.io.readU2le()
  this.fmYres = fmYresExpr
  let dotsExpr = NtMdt_Frame_Dots.read(this.io, this.root, this)
  this.dots = dotsExpr
  for i in 0 ..< int((this.fmXres * this.fmYres)):
    let it = this.io.readS2le()
    this.image.add(it)
  let titleExpr = NtMdt_Title.read(this.io, this.root, this)
  this.title = titleExpr
  let xmlExpr = NtMdt_Xml.read(this.io, this.root, this)
  this.xml = xmlExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdScanned], filename: string): NtMdt_Frame_FdScanned =
  NtMdt_Frame_FdScanned.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdScanned_Vars], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdScanned): NtMdt_Frame_FdScanned_Vars =
  template this: untyped = result
  this = new(NtMdt_Frame_FdScanned_Vars)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.xScale = xScaleExpr
  let yScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.yScale = yScaleExpr
  let zScaleExpr = NtMdt_Frame_AxisScale.read(this.io, this.root, this)
  this.zScale = zScaleExpr

  ##[
  s_mode
  ]##
  let channelIndexExpr = NtMdt_AdcMode(this.io.readU1())
  this.channelIndex = channelIndexExpr

  ##[
  s_dev
  ]##
  let modeExpr = NtMdt_Frame_FdScanned_Mode(this.io.readU1())
  this.mode = modeExpr

  ##[
  s_nx
  ]##
  let xresExpr = this.io.readU2le()
  this.xres = xresExpr

  ##[
  s_ny
  ]##
  let yresExpr = this.io.readU2le()
  this.yres = yresExpr

  ##[
  Step (DAC)
  ]##
  let ndacqExpr = this.io.readU2le()
  this.ndacq = ndacqExpr

  ##[
  s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
  ]##
  let stepLengthExpr = this.io.readF4le()
  this.stepLength = stepLengthExpr

  ##[
  s_adt
  ]##
  let adtExpr = this.io.readU2le()
  this.adt = adtExpr

  ##[
  s_adc_a
  ]##
  let adcGainAmpLog10Expr = this.io.readU1()
  this.adcGainAmpLog10 = adcGainAmpLog10Expr

  ##[
  ADC index
  ]##
  let adcIndexExpr = this.io.readU1()
  this.adcIndex = adcIndexExpr

  ##[
  MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
  ]##
  let inputSignalOrVersionExpr = this.io.readU1()
  this.inputSignalOrVersion = inputSignalOrVersionExpr

  ##[
  s_spl or z_03
  ]##
  let substrPlaneOrderOrPassNumExpr = this.io.readU1()
  this.substrPlaneOrderOrPassNum = substrPlaneOrderOrPassNumExpr

  ##[
  s_xy TODO: interpretation
  ]##
  let scanDirExpr = NtMdt_Frame_FdScanned_ScanDir.read(this.io, this.root, this)
  this.scanDir = scanDirExpr

  ##[
  s_2n (bool)
  ]##
  let powerOf2Expr = this.io.readU1()
  this.powerOf2 = powerOf2Expr

  ##[
  s_vel (Angstrom/second)
  ]##
  let velocityExpr = this.io.readF4le()
  this.velocity = velocityExpr

  ##[
  s_i0
  ]##
  let setpointExpr = this.io.readF4le()
  this.setpoint = setpointExpr

  ##[
  s_ut
  ]##
  let biasVoltageExpr = this.io.readF4le()
  this.biasVoltage = biasVoltageExpr

  ##[
  s_draw (bool)
  ]##
  let drawExpr = this.io.readU1()
  this.draw = drawExpr
  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr

  ##[
  s_x00 (in DAC quants)
  ]##
  let xoffExpr = this.io.readS4le()
  this.xoff = xoffExpr

  ##[
  s_y00 (in DAC quants)
  ]##
  let yoffExpr = this.io.readS4le()
  this.yoff = yoffExpr

  ##[
  s_cor (bool)
  ]##
  let nlCorrExpr = this.io.readU1()
  this.nlCorr = nlCorrExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdScanned_Vars], filename: string): NtMdt_Frame_FdScanned_Vars =
  NtMdt_Frame_FdScanned_Vars.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdScanned_Dot], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Frame_FdScanned_Dot =
  template this: untyped = result
  this = new(NtMdt_Frame_FdScanned_Dot)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readS2le()
  this.x = xExpr
  let yExpr = this.io.readS2le()
  this.y = yExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdScanned_Dot], filename: string): NtMdt_Frame_FdScanned_Dot =
  NtMdt_Frame_FdScanned_Dot.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Frame_FdScanned_ScanDir], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FdScanned_Vars): NtMdt_Frame_FdScanned_ScanDir =
  template this: untyped = result
  this = new(NtMdt_Frame_FdScanned_ScanDir)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unknExpr = this.io.readBitsIntBe(4)
  this.unkn = unknExpr
  let doublePassExpr = this.io.readBitsIntBe(1) != 0
  this.doublePass = doublePassExpr

  ##[
  Bottom - 1 Top - 0
  ]##
  let bottomExpr = this.io.readBitsIntBe(1) != 0
  this.bottom = bottomExpr

  ##[
  Left - 1 Right - 0
  ]##
  let leftExpr = this.io.readBitsIntBe(1) != 0
  this.left = leftExpr

  ##[
  Horizontal - 1 Vertical - 0
  ]##
  let horizontalExpr = this.io.readBitsIntBe(1) != 0
  this.horizontal = horizontalExpr

proc fromFile*(_: typedesc[NtMdt_Frame_FdScanned_ScanDir], filename: string): NtMdt_Frame_FdScanned_ScanDir =
  NtMdt_Frame_FdScanned_ScanDir.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Version], io: KaitaiStream, root: KaitaiStruct, parent: NtMdt_Frame_FrameMain): NtMdt_Version =
  template this: untyped = result
  this = new(NtMdt_Version)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minorExpr = this.io.readU1()
  this.minor = minorExpr
  let majorExpr = this.io.readU1()
  this.major = majorExpr

proc fromFile*(_: typedesc[NtMdt_Version], filename: string): NtMdt_Version =
  NtMdt_Version.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Xml], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Xml =
  template this: untyped = result
  this = new(NtMdt_Xml)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xmlLenExpr = this.io.readU4le()
  this.xmlLen = xmlLenExpr
  let xmlExpr = encode(this.io.readBytes(int(this.xmlLen)), "UTF-16LE")
  this.xml = xmlExpr

proc fromFile*(_: typedesc[NtMdt_Xml], filename: string): NtMdt_Xml =
  NtMdt_Xml.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdt_Title], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdt_Title =
  template this: untyped = result
  this = new(NtMdt_Title)
  let root = if root == nil: cast[NtMdt](this) else: cast[NtMdt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let titleLenExpr = this.io.readU4le()
  this.titleLen = titleLenExpr
  let titleExpr = encode(this.io.readBytes(int(this.titleLen)), "cp1251")
  this.title = titleExpr

proc fromFile*(_: typedesc[NtMdt_Title], filename: string): NtMdt_Title =
  NtMdt_Title.read(newKaitaiFileStream(filename), nil, nil)

