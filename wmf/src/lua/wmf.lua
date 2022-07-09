-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- WMF (Windows Metafile) is a relatively early vector image format
-- introduced for Microsoft Windows in 1990.
-- 
-- Inside, it provides a serialized list of Windows GDI (Graphics
-- Device Interface) function calls, which, if played back, result in
-- an image being drawn on a given surface (display, off-screen buffer,
-- printer, etc).
-- See also: Source (http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf)
Wmf = class.class(KaitaiStruct)

Wmf.Func = enum.Enum {
  eof = 0,
  savedc = 30,
  realizepalette = 53,
  setpalentries = 55,
  createpalette = 247,
  setbkmode = 258,
  setmapmode = 259,
  setrop2 = 260,
  setrelabs = 261,
  setpolyfillmode = 262,
  setstretchbltmode = 263,
  settextcharextra = 264,
  restoredc = 295,
  invertregion = 298,
  paintregion = 299,
  selectclipregion = 300,
  selectobject = 301,
  settextalign = 302,
  resizepalette = 313,
  dibcreatepatternbrush = 322,
  setlayout = 329,
  deleteobject = 496,
  createpatternbrush = 505,
  setbkcolor = 513,
  settextcolor = 521,
  settextjustification = 522,
  setwindoworg = 523,
  setwindowext = 524,
  setviewportorg = 525,
  setviewportext = 526,
  offsetwindoworg = 527,
  offsetviewportorg = 529,
  lineto = 531,
  moveto = 532,
  offsetcliprgn = 544,
  fillregion = 552,
  setmapperflags = 561,
  selectpalette = 564,
  createpenindirect = 762,
  createfontindirect = 763,
  createbrushindirect = 764,
  polygon = 804,
  polyline = 805,
  scalewindowext = 1040,
  scaleviewportext = 1042,
  excludecliprect = 1045,
  intersectcliprect = 1046,
  ellipse = 1048,
  floodfill = 1049,
  rectangle = 1051,
  setpixel = 1055,
  frameregion = 1065,
  animatepalette = 1078,
  textout = 1313,
  polypolygon = 1336,
  extfloodfill = 1352,
  roundrect = 1564,
  patblt = 1565,
  escape = 1574,
  createregion = 1791,
  arc = 2071,
  pie = 2074,
  chord = 2096,
  bitblt = 2338,
  dibbitblt = 2368,
  exttextout = 2610,
  stretchblt = 2851,
  dibstretchblt = 2881,
  setdibtodev = 3379,
  stretchdib = 3907,
}

Wmf.BinRasterOp = enum.Enum {
  black = 1,
  notmergepen = 2,
  masknotpen = 3,
  notcopypen = 4,
  maskpennot = 5,
  not = 6,
  xorpen = 7,
  notmaskpen = 8,
  maskpen = 9,
  notxorpen = 10,
  nop = 11,
  mergenotpen = 12,
  copypen = 13,
  mergepennot = 14,
  mergepen = 15,
  white = 16,
}

Wmf.MixMode = enum.Enum {
  transparent = 1,
  opaque = 2,
}

Wmf.PolyFillMode = enum.Enum {
  alternate = 1,
  winding = 2,
}

function Wmf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf:_read()
  self.special_header = Wmf.SpecialHeader(self._io, self, self._root)
  self.header = Wmf.Header(self._io, self, self._root)
  self.records = {}
  local i = 0
  while true do
    local _ = Wmf.Record(self._io, self, self._root)
    self.records[i + 1] = _
    if _.function == Wmf.Func.eof then
      break
    end
    i = i + 1
  end
end


-- 
-- See also: section 2.3.5.31
Wmf.ParamsSetwindoworg = class.class(KaitaiStruct)

function Wmf.ParamsSetwindoworg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsSetwindoworg:_read()
  self.y = self._io:read_s2le()
  self.x = self._io:read_s2le()
end

-- 
-- Y coordinate of the window origin, in logical units.
-- 
-- X coordinate of the window origin, in logical units.

-- 
-- See also: section 2.3.5.15
Wmf.ParamsSetbkmode = class.class(KaitaiStruct)

function Wmf.ParamsSetbkmode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsSetbkmode:_read()
  self.bk_mode = Wmf.MixMode(self._io:read_u2le())
end

-- 
-- Defines current graphic context background mix mode.

-- 
-- See also: section 2.2.1.12
Wmf.PointS = class.class(KaitaiStruct)

function Wmf.PointS:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.PointS:_read()
  self.x = self._io:read_s2le()
  self.y = self._io:read_s2le()
end

-- 
-- X coordinate of the point, in logical units.
-- 
-- Y coordinate of the point, in logical units.

-- 
-- See also: section 2.3.5.30
Wmf.ParamsSetwindowext = class.class(KaitaiStruct)

function Wmf.ParamsSetwindowext:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsSetwindowext:_read()
  self.y = self._io:read_s2le()
  self.x = self._io:read_s2le()
end

-- 
-- Vertical extent of the window in logical units.
-- 
-- Horizontal extent of the window in logical units.

-- 
-- See also: section 2.3.3.15 = params_polyline
Wmf.ParamsPolygon = class.class(KaitaiStruct)

function Wmf.ParamsPolygon:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsPolygon:_read()
  self.num_points = self._io:read_s2le()
  self.points = {}
  for i = 0, self.num_points - 1 do
    self.points[i + 1] = Wmf.PointS(self._io, self, self._root)
  end
end


Wmf.Header = class.class(KaitaiStruct)

Wmf.Header.MetafileType = enum.Enum {
  memory_metafile = 1,
  disk_metafile = 2,
}

function Wmf.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.Header:_read()
  self.metafile_type = Wmf.Header.MetafileType(self._io:read_u2le())
  self.header_size = self._io:read_u2le()
  self.version = self._io:read_u2le()
  self.size = self._io:read_u4le()
  self.number_of_objects = self._io:read_u2le()
  self.max_record = self._io:read_u4le()
  self.number_of_members = self._io:read_u2le()
end


-- 
-- See also: section 2.2.1.7
Wmf.ColorRef = class.class(KaitaiStruct)

function Wmf.ColorRef:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ColorRef:_read()
  self.red = self._io:read_u1()
  self.green = self._io:read_u1()
  self.blue = self._io:read_u1()
  self.reserved = self._io:read_u1()
end


-- 
-- See also: section 2.3.5.22
Wmf.ParamsSetrop2 = class.class(KaitaiStruct)

function Wmf.ParamsSetrop2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsSetrop2:_read()
  self.draw_mode = Wmf.BinRasterOp(self._io:read_u2le())
end

-- 
-- Defines current foreground binary raster operation mixing mode.

-- 
-- See also: section 2.3.5.20
Wmf.ParamsSetpolyfillmode = class.class(KaitaiStruct)

function Wmf.ParamsSetpolyfillmode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsSetpolyfillmode:_read()
  self.poly_fill_mode = Wmf.PolyFillMode(self._io:read_u2le())
end

-- 
-- Defines current polygon fill mode.

-- 
-- See also: section 2.3.3.14
Wmf.ParamsPolyline = class.class(KaitaiStruct)

function Wmf.ParamsPolyline:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.ParamsPolyline:_read()
  self.num_points = self._io:read_s2le()
  self.points = {}
  for i = 0, self.num_points - 1 do
    self.points[i + 1] = Wmf.PointS(self._io, self, self._root)
  end
end


Wmf.SpecialHeader = class.class(KaitaiStruct)

function Wmf.SpecialHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.SpecialHeader:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\215\205\198\154") then
    error("not equal, expected " ..  "\215\205\198\154" .. ", but got " .. self.magic)
  end
  self.handle = self._io:read_bytes(2)
  if not(self.handle == "\000\000") then
    error("not equal, expected " ..  "\000\000" .. ", but got " .. self.handle)
  end
  self.left = self._io:read_s2le()
  self.top = self._io:read_s2le()
  self.right = self._io:read_s2le()
  self.bottom = self._io:read_s2le()
  self.inch = self._io:read_u2le()
  self.reserved = self._io:read_bytes(4)
  if not(self.reserved == "\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000" .. ", but got " .. self.reserved)
  end
  self.checksum = self._io:read_u2le()
end


Wmf.Record = class.class(KaitaiStruct)

function Wmf.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Wmf.Record:_read()
  self.size = self._io:read_u4le()
  self.function = Wmf.Func(self._io:read_u2le())
  local _on = self.function
  if _on == Wmf.Func.setbkmode then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsSetbkmode(_io, self, self._root)
  elseif _on == Wmf.Func.polygon then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsPolygon(_io, self, self._root)
  elseif _on == Wmf.Func.setbkcolor then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ColorRef(_io, self, self._root)
  elseif _on == Wmf.Func.setpolyfillmode then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsSetpolyfillmode(_io, self, self._root)
  elseif _on == Wmf.Func.setwindoworg then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsSetwindoworg(_io, self, self._root)
  elseif _on == Wmf.Func.setrop2 then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsSetrop2(_io, self, self._root)
  elseif _on == Wmf.Func.setwindowext then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsSetwindowext(_io, self, self._root)
  elseif _on == Wmf.Func.polyline then
    self._raw_params = self._io:read_bytes(((self.size - 3) * 2))
    local _io = KaitaiStream(stringstream(self._raw_params))
    self.params = Wmf.ParamsPolyline(_io, self, self._root)
  else
    self.params = self._io:read_bytes(((self.size - 3) * 2))
  end
end


