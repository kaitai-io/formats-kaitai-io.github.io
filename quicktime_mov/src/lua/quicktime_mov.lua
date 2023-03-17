-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- See also: Source (https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF)
QuicktimeMov = class.class(KaitaiStruct)

QuicktimeMov.AtomType = enum.Enum {
  xtra = 1484026465,
  dinf = 1684631142,
  dref = 1685218662,
  edts = 1701082227,
  elst = 1701606260,
  free = 1718773093,
  ftyp = 1718909296,
  hdlr = 1751411826,
  iods = 1768907891,
  mdat = 1835295092,
  mdhd = 1835296868,
  mdia = 1835297121,
  meta = 1835365473,
  minf = 1835626086,
  moof = 1836019558,
  moov = 1836019574,
  mvhd = 1836476516,
  smhd = 1936549988,
  stbl = 1937007212,
  stco = 1937007471,
  stsc = 1937011555,
  stsd = 1937011556,
  stsz = 1937011578,
  stts = 1937011827,
  tkhd = 1953196132,
  traf = 1953653094,
  trak = 1953653099,
  tref = 1953654118,
  udta = 1969517665,
  vmhd = 1986881636,
}

QuicktimeMov.Brand = enum.Enum {
  x_3g2a = 862401121,
  x_3ge6 = 862414134,
  x_3ge7 = 862414135,
  x_3ge9 = 862414137,
  x_3gf9 = 862414393,
  x_3gg6 = 862414646,
  x_3gg9 = 862414649,
  x_3gh9 = 862414905,
  x_3gm9 = 862416185,
  x_3gma = 862416193,
  x_3gp4 = 862416948,
  x_3gp5 = 862416949,
  x_3gp6 = 862416950,
  x_3gp7 = 862416951,
  x_3gp8 = 862416952,
  x_3gp9 = 862416953,
  x_3gr6 = 862417462,
  x_3gr9 = 862417465,
  x_3gs6 = 862417718,
  x_3gs9 = 862417721,
  x_3gt8 = 862417976,
  x_3gt9 = 862417977,
  x_3gtv = 862418038,
  x_3gvr = 862418546,
  x_3vra = 863400545,
  x_3vrb = 863400546,
  x_3vrm = 863400557,
  arri = 1095914057,
  caep = 1128351056,
  cdes = 1128555891,
  j2p0 = 1244811312,
  j2p1 = 1244811313,
  lcag = 1279476039,
  m4a = 1295270176,
  m4b = 1295270432,
  m4p = 1295274016,
  m4v = 1295275552,
  ma1a = 1296118081,
  ma1b = 1296118082,
  mfsm = 1296454477,
  mgsv = 1296520022,
  mppi = 1297109065,
  msnv = 1297305174,
  miab = 1298743618,
  miac = 1298743619,
  mian = 1298743662,
  mibu = 1298743925,
  micm = 1298744173,
  miha = 1298745409,
  mihb = 1298745410,
  mihe = 1298745413,
  mipr = 1298747506,
  ross = 1380930387,
  seau = 1397047637,
  sebk = 1397047883,
  xavc = 1480676931,
  adti = 1633973353,
  aid3 = 1634296883,
  av01 = 1635135537,
  avc1 = 1635148593,
  avci = 1635148649,
  avcs = 1635148659,
  avde = 1635148901,
  avif = 1635150182,
  avio = 1635150191,
  avis = 1635150195,
  bbxm = 1650620525,
  ca4m = 1667314797,
  ca4s = 1667314803,
  caaa = 1667326305,
  caac = 1667326307,
  cabl = 1667326572,
  cama = 1667329377,
  camc = 1667329379,
  caqv = 1667330422,
  casu = 1667330933,
  ccea = 1667458401,
  ccff = 1667458662,
  cdm1 = 1667525937,
  cdm4 = 1667525940,
  ceac = 1667588451,
  cfhd = 1667655780,
  cfsd = 1667658596,
  chd1 = 1667785777,
  chd2 = 1667785778,
  chdf = 1667785830,
  chev = 1667786102,
  chh1 = 1667786801,
  chhd = 1667786852,
  cint = 1667853940,
  clg1 = 1668048689,
  clg2 = 1668048690,
  cmf2 = 1668113970,
  cmfc = 1668114019,
  cmff = 1668114022,
  cmfl = 1668114028,
  cmfs = 1668114035,
  cmhm = 1668114541,
  cmhs = 1668114547,
  comp = 1668246896,
  csh1 = 1668507697,
  cud1 = 1668637745,
  cud2 = 1668637746,
  cud8 = 1668637752,
  cud9 = 1668637753,
  cuvd = 1668642404,
  cvid = 1668704612,
  cwvt = 1668773492,
  da0a = 1684090977,
  da0b = 1684090978,
  da1a = 1684091233,
  da1b = 1684091234,
  da2a = 1684091489,
  da2b = 1684091490,
  da3a = 1684091745,
  da3b = 1684091746,
  dash = 1684108136,
  dby1 = 1684175153,
  dmb1 = 1684890161,
  dsms = 1685286259,
  dts1 = 1685353265,
  dts2 = 1685353266,
  dts3 = 1685353267,
  dv1a = 1685467489,
  dv1b = 1685467490,
  dv2a = 1685467745,
  dv2b = 1685467746,
  dv3a = 1685468001,
  dv3b = 1685468002,
  dvr1 = 1685484081,
  dvt1 = 1685484593,
  dxo = 1685614368,
  emsg = 1701671783,
  heic = 1751476579,
  heim = 1751476589,
  heis = 1751476595,
  heix = 1751476600,
  heoi = 1751478121,
  hevc = 1751479907,
  hevd = 1751479908,
  hevi = 1751479913,
  hevm = 1751479917,
  hevs = 1751479923,
  hevx = 1751479928,
  hvce = 1752589157,
  hvci = 1752589161,
  hvcx = 1752589176,
  hvti = 1752593513,
  ifaa = 1768317281,
  ifhd = 1768319076,
  ifhh = 1768319080,
  ifhr = 1768319090,
  ifhs = 1768319091,
  ifhu = 1768319093,
  ifhx = 1768319096,
  ifrm = 1768321645,
  ifsd = 1768321892,
  im1i = 1768763753,
  im1t = 1768763764,
  im2i = 1768764009,
  im2t = 1768764020,
  isc2 = 1769169714,
  iso2 = 1769172786,
  iso3 = 1769172787,
  iso4 = 1769172788,
  iso5 = 1769172789,
  iso6 = 1769172790,
  iso7 = 1769172791,
  iso8 = 1769172792,
  iso9 = 1769172793,
  isoa = 1769172833,
  isob = 1769172834,
  isoc = 1769172835,
  isom = 1769172845,
  j2is = 1781688691,
  j2ki = 1781689193,
  j2ks = 1781689203,
  jp2 = 1785737760,
  jpeg = 1785750887,
  jpgs = 1785751411,
  jpm = 1785752864,
  jpoi = 1785753449,
  jpsi = 1785754473,
  jpx = 1785755680,
  jpxb = 1785755746,
  jxl = 1786276896,
  jxs = 1786278688,
  jxsc = 1786278755,
  jxsi = 1786278761,
  jxss = 1786278771,
  lhte = 1818784869,
  lhti = 1818784873,
  lmsg = 1819112295,
  miaf = 1835622758,
  mif1 = 1835623985,
  mif2 = 1835623986,
  mj2s = 1835676275,
  mjp2 = 1835692082,
  mp21 = 1836069425,
  mp41 = 1836069937,
  mp42 = 1836069938,
  mp71 = 1836070705,
  mpuf = 1836086630,
  msdh = 1836278888,
  msf1 = 1836279345,
  msix = 1836280184,
  niko = 1852402543,
  nlsl = 1852601196,
  nras = 1852989811,
  oa2d = 1868640868,
  oabl = 1868653164,
  odcf = 1868850022,
  ompp = 1869443184,
  opf2 = 1869637170,
  opx2 = 1869641778,
  ovdp = 1870029936,
  ovly = 1870031993,
  paff = 1885431398,
  pana = 1885433441,
  piff = 1885955686,
  pmff = 1886217830,
  pnvi = 1886287465,
  pred = 1886545252,
  qt = 1903435808,
  relo = 1919249519,
  risx = 1919513464,
  sdv = 1935963680,
  senv = 1936027254,
  sims = 1936289139,
  sisx = 1936290680,
  siti = 1936290921,
  slh1 = 1936484401,
  slh2 = 1936484402,
  slh3 = 1936484403,
  ssss = 1936946035,
  ttml = 1953787244,
  ttwv = 1953789814,
  uhvi = 1969780329,
  unif = 1970170214,
  uvvu = 1970697845,
  vwpt = 1987539060,
  yt4 = 2037658656,
}

function QuicktimeMov:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov:_read()
  self.atoms = QuicktimeMov.AtomList(self._io, self, self._root)
end


-- 
-- See also: Source (https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG)
QuicktimeMov.MvhdBody = class.class(KaitaiStruct)

function QuicktimeMov.MvhdBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.MvhdBody:_read()
  self.version = self._io:read_u1()
  self.flags = self._io:read_bytes(3)
  self.creation_time = self._io:read_u4be()
  self.modification_time = self._io:read_u4be()
  self.time_scale = self._io:read_u4be()
  self.duration = self._io:read_u4be()
  self.preferred_rate = QuicktimeMov.Fixed32(self._io, self, self._root)
  self.preferred_volume = QuicktimeMov.Fixed16(self._io, self, self._root)
  self.reserved1 = self._io:read_bytes(10)
  self.matrix = self._io:read_bytes(36)
  self.preview_time = self._io:read_u4be()
  self.preview_duration = self._io:read_u4be()
  self.poster_time = self._io:read_u4be()
  self.selection_time = self._io:read_u4be()
  self.selection_duration = self._io:read_u4be()
  self.current_time = self._io:read_u4be()
  self.next_track_id = self._io:read_u4be()
end

-- 
-- Version of this movie header atom.
-- 
-- A time value that indicates the time scale for this
-- movie - the number of time units that pass per second
-- in its time coordinate system. A time coordinate system that
-- measures time in sixtieths of a second, for example, has a
-- time scale of 60.
-- 
-- A time value that indicates the duration of the movie in
-- time scale units. Note that this property is derived from
-- the movie's tracks. The value of this field corresponds to
-- the duration of the longest track in the movie.
-- 
-- The rate at which to play this movie. A value of 1.0 indicates normal rate.
-- 
-- How loud to play this movie's sound. A value of 1.0 indicates full volume.
-- 
-- A matrix shows how to map points from one coordinate space into another.
-- 
-- The time value in the movie at which the preview begins.
-- 
-- The duration of the movie preview in movie time scale units.
-- 
-- The time value of the time of the movie poster.
-- 
-- The time value for the start time of the current selection.
-- 
-- The duration of the current selection in movie time scale units.
-- 
-- The time value for current time position within the movie.
-- 
-- Indicates a value to use for the track ID number of the next
-- track added to this movie. Note that 0 is not a valid track
-- ID value.

-- 
-- See also: Source (https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF)
QuicktimeMov.FtypBody = class.class(KaitaiStruct)

function QuicktimeMov.FtypBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.FtypBody:_read()
  self.major_brand = QuicktimeMov.Brand(self._io:read_u4be())
  self.minor_version = self._io:read_bytes(4)
  self.compatible_brands = {}
  local i = 0
  while not self._io:is_eof() do
    self.compatible_brands[i + 1] = QuicktimeMov.Brand(self._io:read_u4be())
    i = i + 1
  end
end


-- 
-- Fixed-point 32-bit number.
QuicktimeMov.Fixed32 = class.class(KaitaiStruct)

function QuicktimeMov.Fixed32:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.Fixed32:_read()
  self.int_part = self._io:read_s2be()
  self.frac_part = self._io:read_u2be()
end


-- 
-- Fixed-point 16-bit number.
QuicktimeMov.Fixed16 = class.class(KaitaiStruct)

function QuicktimeMov.Fixed16:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.Fixed16:_read()
  self.int_part = self._io:read_s1()
  self.frac_part = self._io:read_u1()
end


QuicktimeMov.Atom = class.class(KaitaiStruct)

function QuicktimeMov.Atom:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.Atom:_read()
  self.len32 = self._io:read_u4be()
  self.atom_type = QuicktimeMov.AtomType(self._io:read_u4be())
  if self.len32 == 1 then
    self.len64 = self._io:read_u8be()
  end
  local _on = self.atom_type
  if _on == QuicktimeMov.AtomType.moof then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.tkhd then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.TkhdBody(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.stbl then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.traf then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.minf then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.trak then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.moov then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.mdia then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.dinf then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.AtomList(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.mvhd then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.MvhdBody(_io, self, self._root)
  elseif _on == QuicktimeMov.AtomType.ftyp then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = QuicktimeMov.FtypBody(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len)
  end
end

QuicktimeMov.Atom.property.len = {}
function QuicktimeMov.Atom.property.len:get()
  if self._m_len ~= nil then
    return self._m_len
  end

  self._m_len = utils.box_unwrap((self.len32 == 0) and utils.box_wrap((self._io:size() - 8)) or (utils.box_unwrap((self.len32 == 1) and utils.box_wrap((self.len64 - 16)) or ((self.len32 - 8)))))
  return self._m_len
end


-- 
-- See also: Source (https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550)
QuicktimeMov.TkhdBody = class.class(KaitaiStruct)

function QuicktimeMov.TkhdBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.TkhdBody:_read()
  self.version = self._io:read_u1()
  self.flags = self._io:read_bytes(3)
  self.creation_time = self._io:read_u4be()
  self.modification_time = self._io:read_u4be()
  self.track_id = self._io:read_u4be()
  self.reserved1 = self._io:read_bytes(4)
  self.duration = self._io:read_u4be()
  self.reserved2 = self._io:read_bytes(8)
  self.layer = self._io:read_u2be()
  self.alternative_group = self._io:read_u2be()
  self.volume = self._io:read_u2be()
  self.reserved3 = self._io:read_u2be()
  self.matrix = self._io:read_bytes(36)
  self.width = QuicktimeMov.Fixed32(self._io, self, self._root)
  self.height = QuicktimeMov.Fixed32(self._io, self, self._root)
end

-- 
-- Integer that uniquely identifies the track. The value 0 cannot be used.

QuicktimeMov.AtomList = class.class(KaitaiStruct)

function QuicktimeMov.AtomList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuicktimeMov.AtomList:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = QuicktimeMov.Atom(self._io, self, self._root)
    i = i + 1
  end
end


