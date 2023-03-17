import kaitai_struct_nim_runtime
import options

type
  QuicktimeMov* = ref object of KaitaiStruct
    `atoms`*: QuicktimeMov_AtomList
    `parent`*: KaitaiStruct
  QuicktimeMov_AtomType* = enum
    xtra = 1484026465
    dinf = 1684631142
    dref = 1685218662
    edts = 1701082227
    elst = 1701606260
    free = 1718773093
    ftyp = 1718909296
    hdlr = 1751411826
    iods = 1768907891
    mdat = 1835295092
    mdhd = 1835296868
    mdia = 1835297121
    meta = 1835365473
    minf = 1835626086
    moof = 1836019558
    moov = 1836019574
    mvhd = 1836476516
    smhd = 1936549988
    stbl = 1937007212
    stco = 1937007471
    stsc = 1937011555
    stsd = 1937011556
    stsz = 1937011578
    stts = 1937011827
    tkhd = 1953196132
    traf = 1953653094
    trak = 1953653099
    tref = 1953654118
    udta = 1969517665
    vmhd = 1986881636
  QuicktimeMov_Brand* = enum
    x_3g2a = 862401121
    x_3ge6 = 862414134
    x_3ge7 = 862414135
    x_3ge9 = 862414137
    x_3gf9 = 862414393
    x_3gg6 = 862414646
    x_3gg9 = 862414649
    x_3gh9 = 862414905
    x_3gm9 = 862416185
    x_3gma = 862416193
    x_3gp4 = 862416948
    x_3gp5 = 862416949
    x_3gp6 = 862416950
    x_3gp7 = 862416951
    x_3gp8 = 862416952
    x_3gp9 = 862416953
    x_3gr6 = 862417462
    x_3gr9 = 862417465
    x_3gs6 = 862417718
    x_3gs9 = 862417721
    x_3gt8 = 862417976
    x_3gt9 = 862417977
    x_3gtv = 862418038
    x_3gvr = 862418546
    x_3vra = 863400545
    x_3vrb = 863400546
    x_3vrm = 863400557
    arri = 1095914057
    caep = 1128351056
    cdes = 1128555891
    j2p0 = 1244811312
    j2p1 = 1244811313
    lcag = 1279476039
    m4a = 1295270176
    m4b = 1295270432
    m4p = 1295274016
    m4v = 1295275552
    ma1a = 1296118081
    ma1b = 1296118082
    mfsm = 1296454477
    mgsv = 1296520022
    mppi = 1297109065
    msnv = 1297305174
    miab = 1298743618
    miac = 1298743619
    mian = 1298743662
    mibu = 1298743925
    micm = 1298744173
    miha = 1298745409
    mihb = 1298745410
    mihe = 1298745413
    mipr = 1298747506
    ross = 1380930387
    seau = 1397047637
    sebk = 1397047883
    xavc = 1480676931
    adti = 1633973353
    aid3 = 1634296883
    av01 = 1635135537
    avc1 = 1635148593
    avci = 1635148649
    avcs = 1635148659
    avde = 1635148901
    avif = 1635150182
    avio = 1635150191
    avis = 1635150195
    bbxm = 1650620525
    ca4m = 1667314797
    ca4s = 1667314803
    caaa = 1667326305
    caac = 1667326307
    cabl = 1667326572
    cama = 1667329377
    camc = 1667329379
    caqv = 1667330422
    casu = 1667330933
    ccea = 1667458401
    ccff = 1667458662
    cdm1 = 1667525937
    cdm4 = 1667525940
    ceac = 1667588451
    cfhd = 1667655780
    cfsd = 1667658596
    chd1 = 1667785777
    chd2 = 1667785778
    chdf = 1667785830
    chev = 1667786102
    chh1 = 1667786801
    chhd = 1667786852
    cint = 1667853940
    clg1 = 1668048689
    clg2 = 1668048690
    cmf2 = 1668113970
    cmfc = 1668114019
    cmff = 1668114022
    cmfl = 1668114028
    cmfs = 1668114035
    cmhm = 1668114541
    cmhs = 1668114547
    comp = 1668246896
    csh1 = 1668507697
    cud1 = 1668637745
    cud2 = 1668637746
    cud8 = 1668637752
    cud9 = 1668637753
    cuvd = 1668642404
    cvid = 1668704612
    cwvt = 1668773492
    da0a = 1684090977
    da0b = 1684090978
    da1a = 1684091233
    da1b = 1684091234
    da2a = 1684091489
    da2b = 1684091490
    da3a = 1684091745
    da3b = 1684091746
    dash = 1684108136
    dby1 = 1684175153
    dmb1 = 1684890161
    dsms = 1685286259
    dts1 = 1685353265
    dts2 = 1685353266
    dts3 = 1685353267
    dv1a = 1685467489
    dv1b = 1685467490
    dv2a = 1685467745
    dv2b = 1685467746
    dv3a = 1685468001
    dv3b = 1685468002
    dvr1 = 1685484081
    dvt1 = 1685484593
    dxo = 1685614368
    emsg = 1701671783
    heic = 1751476579
    heim = 1751476589
    heis = 1751476595
    heix = 1751476600
    heoi = 1751478121
    hevc = 1751479907
    hevd = 1751479908
    hevi = 1751479913
    hevm = 1751479917
    hevs = 1751479923
    hevx = 1751479928
    hvce = 1752589157
    hvci = 1752589161
    hvcx = 1752589176
    hvti = 1752593513
    ifaa = 1768317281
    ifhd = 1768319076
    ifhh = 1768319080
    ifhr = 1768319090
    ifhs = 1768319091
    ifhu = 1768319093
    ifhx = 1768319096
    ifrm = 1768321645
    ifsd = 1768321892
    im1i = 1768763753
    im1t = 1768763764
    im2i = 1768764009
    im2t = 1768764020
    isc2 = 1769169714
    iso2 = 1769172786
    iso3 = 1769172787
    iso4 = 1769172788
    iso5 = 1769172789
    iso6 = 1769172790
    iso7 = 1769172791
    iso8 = 1769172792
    iso9 = 1769172793
    isoa = 1769172833
    isob = 1769172834
    isoc = 1769172835
    isom = 1769172845
    j2is = 1781688691
    j2ki = 1781689193
    j2ks = 1781689203
    jp2 = 1785737760
    jpeg = 1785750887
    jpgs = 1785751411
    jpm = 1785752864
    jpoi = 1785753449
    jpsi = 1785754473
    jpx = 1785755680
    jpxb = 1785755746
    jxl = 1786276896
    jxs = 1786278688
    jxsc = 1786278755
    jxsi = 1786278761
    jxss = 1786278771
    lhte = 1818784869
    lhti = 1818784873
    lmsg = 1819112295
    miaf = 1835622758
    mif1 = 1835623985
    mif2 = 1835623986
    mj2s = 1835676275
    mjp2 = 1835692082
    mp21 = 1836069425
    mp41 = 1836069937
    mp42 = 1836069938
    mp71 = 1836070705
    mpuf = 1836086630
    msdh = 1836278888
    msf1 = 1836279345
    msix = 1836280184
    niko = 1852402543
    nlsl = 1852601196
    nras = 1852989811
    oa2d = 1868640868
    oabl = 1868653164
    odcf = 1868850022
    ompp = 1869443184
    opf2 = 1869637170
    opx2 = 1869641778
    ovdp = 1870029936
    ovly = 1870031993
    paff = 1885431398
    pana = 1885433441
    piff = 1885955686
    pmff = 1886217830
    pnvi = 1886287465
    pred = 1886545252
    qt = 1903435808
    relo = 1919249519
    risx = 1919513464
    sdv = 1935963680
    senv = 1936027254
    sims = 1936289139
    sisx = 1936290680
    siti = 1936290921
    slh1 = 1936484401
    slh2 = 1936484402
    slh3 = 1936484403
    ssss = 1936946035
    ttml = 1953787244
    ttwv = 1953789814
    uhvi = 1969780329
    unif = 1970170214
    uvvu = 1970697845
    vwpt = 1987539060
    yt4 = 2037658656
  QuicktimeMov_MvhdBody* = ref object of KaitaiStruct
    `version`*: uint8
    `flags`*: seq[byte]
    `creationTime`*: uint32
    `modificationTime`*: uint32
    `timeScale`*: uint32
    `duration`*: uint32
    `preferredRate`*: QuicktimeMov_Fixed32
    `preferredVolume`*: QuicktimeMov_Fixed16
    `reserved1`*: seq[byte]
    `matrix`*: seq[byte]
    `previewTime`*: uint32
    `previewDuration`*: uint32
    `posterTime`*: uint32
    `selectionTime`*: uint32
    `selectionDuration`*: uint32
    `currentTime`*: uint32
    `nextTrackId`*: uint32
    `parent`*: QuicktimeMov_Atom
  QuicktimeMov_FtypBody* = ref object of KaitaiStruct
    `majorBrand`*: QuicktimeMov_Brand
    `minorVersion`*: seq[byte]
    `compatibleBrands`*: seq[QuicktimeMov_Brand]
    `parent`*: QuicktimeMov_Atom
  QuicktimeMov_Fixed32* = ref object of KaitaiStruct
    `intPart`*: int16
    `fracPart`*: uint16
    `parent`*: KaitaiStruct
  QuicktimeMov_Fixed16* = ref object of KaitaiStruct
    `intPart`*: int8
    `fracPart`*: uint8
    `parent`*: QuicktimeMov_MvhdBody
  QuicktimeMov_Atom* = ref object of KaitaiStruct
    `len32`*: uint32
    `atomType`*: QuicktimeMov_AtomType
    `len64`*: uint64
    `body`*: KaitaiStruct
    `parent`*: QuicktimeMov_AtomList
    `rawBody`*: seq[byte]
    `lenInst`: int
    `lenInstFlag`: bool
  QuicktimeMov_TkhdBody* = ref object of KaitaiStruct
    `version`*: uint8
    `flags`*: seq[byte]
    `creationTime`*: uint32
    `modificationTime`*: uint32
    `trackId`*: uint32
    `reserved1`*: seq[byte]
    `duration`*: uint32
    `reserved2`*: seq[byte]
    `layer`*: uint16
    `alternativeGroup`*: uint16
    `volume`*: uint16
    `reserved3`*: uint16
    `matrix`*: seq[byte]
    `width`*: QuicktimeMov_Fixed32
    `height`*: QuicktimeMov_Fixed32
    `parent`*: QuicktimeMov_Atom
  QuicktimeMov_AtomList* = ref object of KaitaiStruct
    `items`*: seq[QuicktimeMov_Atom]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[QuicktimeMov], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov
proc read*(_: typedesc[QuicktimeMov_MvhdBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_MvhdBody
proc read*(_: typedesc[QuicktimeMov_FtypBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_FtypBody
proc read*(_: typedesc[QuicktimeMov_Fixed32], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov_Fixed32
proc read*(_: typedesc[QuicktimeMov_Fixed16], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_MvhdBody): QuicktimeMov_Fixed16
proc read*(_: typedesc[QuicktimeMov_Atom], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_AtomList): QuicktimeMov_Atom
proc read*(_: typedesc[QuicktimeMov_TkhdBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_TkhdBody
proc read*(_: typedesc[QuicktimeMov_AtomList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov_AtomList

proc len*(this: QuicktimeMov_Atom): int


##[
@see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF">Source</a>
]##
proc read*(_: typedesc[QuicktimeMov], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov =
  template this: untyped = result
  this = new(QuicktimeMov)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let atomsExpr = QuicktimeMov_AtomList.read(this.io, this.root, this)
  this.atoms = atomsExpr

proc fromFile*(_: typedesc[QuicktimeMov], filename: string): QuicktimeMov =
  QuicktimeMov.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG">Source</a>
]##
proc read*(_: typedesc[QuicktimeMov_MvhdBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_MvhdBody =
  template this: untyped = result
  this = new(QuicktimeMov_MvhdBody)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Version of this movie header atom
  ]##
  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let flagsExpr = this.io.readBytes(int(3))
  this.flags = flagsExpr
  let creationTimeExpr = this.io.readU4be()
  this.creationTime = creationTimeExpr
  let modificationTimeExpr = this.io.readU4be()
  this.modificationTime = modificationTimeExpr

  ##[
  A time value that indicates the time scale for this
movie - the number of time units that pass per second
in its time coordinate system. A time coordinate system that
measures time in sixtieths of a second, for example, has a
time scale of 60.

  ]##
  let timeScaleExpr = this.io.readU4be()
  this.timeScale = timeScaleExpr

  ##[
  A time value that indicates the duration of the movie in
time scale units. Note that this property is derived from
the movie's tracks. The value of this field corresponds to
the duration of the longest track in the movie.

  ]##
  let durationExpr = this.io.readU4be()
  this.duration = durationExpr

  ##[
  The rate at which to play this movie. A value of 1.0 indicates normal rate.
  ]##
  let preferredRateExpr = QuicktimeMov_Fixed32.read(this.io, this.root, this)
  this.preferredRate = preferredRateExpr

  ##[
  How loud to play this movie's sound. A value of 1.0 indicates full volume.
  ]##
  let preferredVolumeExpr = QuicktimeMov_Fixed16.read(this.io, this.root, this)
  this.preferredVolume = preferredVolumeExpr
  let reserved1Expr = this.io.readBytes(int(10))
  this.reserved1 = reserved1Expr

  ##[
  A matrix shows how to map points from one coordinate space into another.
  ]##
  let matrixExpr = this.io.readBytes(int(36))
  this.matrix = matrixExpr

  ##[
  The time value in the movie at which the preview begins.
  ]##
  let previewTimeExpr = this.io.readU4be()
  this.previewTime = previewTimeExpr

  ##[
  The duration of the movie preview in movie time scale units.
  ]##
  let previewDurationExpr = this.io.readU4be()
  this.previewDuration = previewDurationExpr

  ##[
  The time value of the time of the movie poster.
  ]##
  let posterTimeExpr = this.io.readU4be()
  this.posterTime = posterTimeExpr

  ##[
  The time value for the start time of the current selection.
  ]##
  let selectionTimeExpr = this.io.readU4be()
  this.selectionTime = selectionTimeExpr

  ##[
  The duration of the current selection in movie time scale units.
  ]##
  let selectionDurationExpr = this.io.readU4be()
  this.selectionDuration = selectionDurationExpr

  ##[
  The time value for current time position within the movie.
  ]##
  let currentTimeExpr = this.io.readU4be()
  this.currentTime = currentTimeExpr

  ##[
  Indicates a value to use for the track ID number of the next
track added to this movie. Note that 0 is not a valid track
ID value.

  ]##
  let nextTrackIdExpr = this.io.readU4be()
  this.nextTrackId = nextTrackIdExpr

proc fromFile*(_: typedesc[QuicktimeMov_MvhdBody], filename: string): QuicktimeMov_MvhdBody =
  QuicktimeMov_MvhdBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF">Source</a>
]##
proc read*(_: typedesc[QuicktimeMov_FtypBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_FtypBody =
  template this: untyped = result
  this = new(QuicktimeMov_FtypBody)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorBrandExpr = QuicktimeMov_Brand(this.io.readU4be())
  this.majorBrand = majorBrandExpr
  let minorVersionExpr = this.io.readBytes(int(4))
  this.minorVersion = minorVersionExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = QuicktimeMov_Brand(this.io.readU4be())
      this.compatibleBrands.add(it)
      inc i

proc fromFile*(_: typedesc[QuicktimeMov_FtypBody], filename: string): QuicktimeMov_FtypBody =
  QuicktimeMov_FtypBody.read(newKaitaiFileStream(filename), nil, nil)


##[
Fixed-point 32-bit number.
]##
proc read*(_: typedesc[QuicktimeMov_Fixed32], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov_Fixed32 =
  template this: untyped = result
  this = new(QuicktimeMov_Fixed32)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let intPartExpr = this.io.readS2be()
  this.intPart = intPartExpr
  let fracPartExpr = this.io.readU2be()
  this.fracPart = fracPartExpr

proc fromFile*(_: typedesc[QuicktimeMov_Fixed32], filename: string): QuicktimeMov_Fixed32 =
  QuicktimeMov_Fixed32.read(newKaitaiFileStream(filename), nil, nil)


##[
Fixed-point 16-bit number.
]##
proc read*(_: typedesc[QuicktimeMov_Fixed16], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_MvhdBody): QuicktimeMov_Fixed16 =
  template this: untyped = result
  this = new(QuicktimeMov_Fixed16)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let intPartExpr = this.io.readS1()
  this.intPart = intPartExpr
  let fracPartExpr = this.io.readU1()
  this.fracPart = fracPartExpr

proc fromFile*(_: typedesc[QuicktimeMov_Fixed16], filename: string): QuicktimeMov_Fixed16 =
  QuicktimeMov_Fixed16.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuicktimeMov_Atom], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_AtomList): QuicktimeMov_Atom =
  template this: untyped = result
  this = new(QuicktimeMov_Atom)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let len32Expr = this.io.readU4be()
  this.len32 = len32Expr
  let atomTypeExpr = QuicktimeMov_AtomType(this.io.readU4be())
  this.atomType = atomTypeExpr
  if this.len32 == 1:
    let len64Expr = this.io.readU8be()
    this.len64 = len64Expr
  block:
    let on = this.atomType
    if on == quicktime_mov.moof:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.tkhd:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_TkhdBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.stbl:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.traf:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.minf:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.trak:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.moov:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.mdia:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.dinf:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_AtomList.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.mvhd:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_MvhdBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == quicktime_mov.ftyp:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = QuicktimeMov_FtypBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.len))
      this.body = bodyExpr

proc len(this: QuicktimeMov_Atom): int = 
  if this.lenInstFlag:
    return this.lenInst
  let lenInstExpr = int((if this.len32 == 0: (this.io.size - 8) else: (if this.len32 == 1: (this.len64 - 16) else: (this.len32 - 8))))
  this.lenInst = lenInstExpr
  this.lenInstFlag = true
  return this.lenInst

proc fromFile*(_: typedesc[QuicktimeMov_Atom], filename: string): QuicktimeMov_Atom =
  QuicktimeMov_Atom.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550">Source</a>
]##
proc read*(_: typedesc[QuicktimeMov_TkhdBody], io: KaitaiStream, root: KaitaiStruct, parent: QuicktimeMov_Atom): QuicktimeMov_TkhdBody =
  template this: untyped = result
  this = new(QuicktimeMov_TkhdBody)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let flagsExpr = this.io.readBytes(int(3))
  this.flags = flagsExpr
  let creationTimeExpr = this.io.readU4be()
  this.creationTime = creationTimeExpr
  let modificationTimeExpr = this.io.readU4be()
  this.modificationTime = modificationTimeExpr

  ##[
  Integer that uniquely identifies the track. The value 0 cannot be used.
  ]##
  let trackIdExpr = this.io.readU4be()
  this.trackId = trackIdExpr
  let reserved1Expr = this.io.readBytes(int(4))
  this.reserved1 = reserved1Expr
  let durationExpr = this.io.readU4be()
  this.duration = durationExpr
  let reserved2Expr = this.io.readBytes(int(8))
  this.reserved2 = reserved2Expr
  let layerExpr = this.io.readU2be()
  this.layer = layerExpr
  let alternativeGroupExpr = this.io.readU2be()
  this.alternativeGroup = alternativeGroupExpr
  let volumeExpr = this.io.readU2be()
  this.volume = volumeExpr
  let reserved3Expr = this.io.readU2be()
  this.reserved3 = reserved3Expr
  let matrixExpr = this.io.readBytes(int(36))
  this.matrix = matrixExpr
  let widthExpr = QuicktimeMov_Fixed32.read(this.io, this.root, this)
  this.width = widthExpr
  let heightExpr = QuicktimeMov_Fixed32.read(this.io, this.root, this)
  this.height = heightExpr

proc fromFile*(_: typedesc[QuicktimeMov_TkhdBody], filename: string): QuicktimeMov_TkhdBody =
  QuicktimeMov_TkhdBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuicktimeMov_AtomList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuicktimeMov_AtomList =
  template this: untyped = result
  this = new(QuicktimeMov_AtomList)
  let root = if root == nil: cast[QuicktimeMov](this) else: cast[QuicktimeMov](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = QuicktimeMov_Atom.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[QuicktimeMov_AtomList], filename: string): QuicktimeMov_AtomList =
  QuicktimeMov_AtomList.read(newKaitaiFileStream(filename), nil, nil)

