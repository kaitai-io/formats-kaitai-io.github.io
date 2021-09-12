-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- Bitmap font format for the GRUB 2 bootloader.
-- See also: Source (https://grub.gibibit.com/New_font_format)
Grub2Font = class.class(KaitaiStruct)

function Grub2Font:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grub2Font:_read()
  self.magic = self._io:read_bytes(12)
  if not(self.magic == "\070\073\076\069\000\000\000\004\080\070\070\050") then
    error("not equal, expected " ..  "\070\073\076\069\000\000\000\004\080\070\070\050" .. ", but got " .. self.magic)
  end
  self.sections = {}
  local i = 0
  while true do
    _ = Grub2Font.Section(self._io, self, self._root)
    self.sections[i + 1] = _
    if _.section_type == "DATA" then
      break
    end
    i = i + 1
  end
end

-- 
-- The "DATA" section acts as a terminator. The documentation says:
-- "A marker that indicates the remainder of the file is data accessed
-- via the character index (CHIX) section. When reading this font file,
-- the rest of the file can be ignored when scanning the sections."

Grub2Font.PtszSection = class.class(KaitaiStruct)

function Grub2Font.PtszSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.PtszSection:_read()
self.font_point_size = self._io:read_u2be()
end


Grub2Font.FamiSection = class.class(KaitaiStruct)

function Grub2Font.FamiSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.FamiSection:_read()
self.font_family_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


Grub2Font.WeigSection = class.class(KaitaiStruct)

function Grub2Font.WeigSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.WeigSection:_read()
self.font_weight = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


Grub2Font.MaxwSection = class.class(KaitaiStruct)

function Grub2Font.MaxwSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.MaxwSection:_read()
self.maximum_character_width = self._io:read_u2be()
end


Grub2Font.DescSection = class.class(KaitaiStruct)

function Grub2Font.DescSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.DescSection:_read()
self.descent_in_pixels = self._io:read_u2be()
end


Grub2Font.Section = class.class(KaitaiStruct)

function Grub2Font.Section:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.Section:_read()
self.section_type = str_decode.decode(self._io:read_bytes(4), "ASCII")
self.len_body = self._io:read_u4be()
if self.section_type ~= "DATA" then
  local _on = self.section_type
  if _on == "MAXH" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.MaxhSection(_io, self, self._root)
  elseif _on == "FAMI" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.FamiSection(_io, self, self._root)
  elseif _on == "PTSZ" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.PtszSection(_io, self, self._root)
  elseif _on == "MAXW" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.MaxwSection(_io, self, self._root)
  elseif _on == "SLAN" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.SlanSection(_io, self, self._root)
  elseif _on == "WEIG" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.WeigSection(_io, self, self._root)
  elseif _on == "CHIX" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.ChixSection(_io, self, self._root)
  elseif _on == "DESC" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.DescSection(_io, self, self._root)
  elseif _on == "NAME" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.NameSection(_io, self, self._root)
  elseif _on == "ASCE" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Grub2Font.AsceSection(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len_body)
  end
end
end

-- 
-- Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`.

Grub2Font.AsceSection = class.class(KaitaiStruct)

function Grub2Font.AsceSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.AsceSection:_read()
self.ascent_in_pixels = self._io:read_u2be()
end


Grub2Font.ChixSection = class.class(KaitaiStruct)

function Grub2Font.ChixSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.ChixSection:_read()
self.characters = {}
local i = 0
while not self._io:is_eof() do
  self.characters[i + 1] = Grub2Font.ChixSection.Character(self._io, self, self._root)
  i = i + 1
end
end


Grub2Font.ChixSection.Character = class.class(KaitaiStruct)

function Grub2Font.ChixSection.Character:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.ChixSection.Character:_read()
self.code_point = self._io:read_u4be()
self.flags = self._io:read_u1()
self.ofs_definition = self._io:read_u4be()
end

Grub2Font.ChixSection.Character.property.definition = {}
function Grub2Font.ChixSection.Character.property.definition:get()
if self._m_definition ~= nil then
  return self._m_definition
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_definition)
self._m_definition = Grub2Font.ChixSection.CharacterDefinition(_io, self, self._root)
_io:seek(_pos)
return self._m_definition
end

-- 
-- Unicode code point.

Grub2Font.ChixSection.CharacterDefinition = class.class(KaitaiStruct)

function Grub2Font.ChixSection.CharacterDefinition:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.ChixSection.CharacterDefinition:_read()
self.width = self._io:read_u2be()
self.height = self._io:read_u2be()
self.x_offset = self._io:read_s2be()
self.y_offset = self._io:read_s2be()
self.device_width = self._io:read_s2be()
self.bitmap_data = self._io:read_bytes(math.floor(((self.width * self.height) + 7) / 8))
end

-- 
-- A two-dimensional bitmap, one bit per pixel. It is organized as
-- row-major, top-down, left-to-right. The most significant bit of
-- each byte corresponds to the leftmost or uppermost pixel from all
-- bits of the byte. If a bit is set (1, `true`), the pixel is set to
-- the font color, if a bit is clear (0, `false`), the pixel is
-- transparent.
-- 
-- Rows are **not** padded to byte boundaries (i.e., a
-- single byte may contain bits belonging to multiple rows). The last
-- byte of the bitmap _is_ padded with zero bits at all unused least
-- significant bit positions so that the bitmap ends on a byte
-- boundary.

Grub2Font.MaxhSection = class.class(KaitaiStruct)

function Grub2Font.MaxhSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.MaxhSection:_read()
self.maximum_character_height = self._io:read_u2be()
end


Grub2Font.NameSection = class.class(KaitaiStruct)

function Grub2Font.NameSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.NameSection:_read()
self.font_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


Grub2Font.SlanSection = class.class(KaitaiStruct)

function Grub2Font.SlanSection:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Grub2Font.SlanSection:_read()
self.font_slant = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


