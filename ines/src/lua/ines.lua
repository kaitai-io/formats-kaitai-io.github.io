-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local enum = require("enum")

-- 
-- See also: Source (https://www.nesdev.org/wiki/INES)
Ines = class.class(KaitaiStruct)

function Ines:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines:_read()
  self._raw_header = self._io:read_bytes(16)
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = Ines.Header(_io, self, self._root)
  if self.header.f6.trainer then
    self.trainer = self._io:read_bytes(512)
  end
  self.prg_rom = self._io:read_bytes((self.header.len_prg_rom * 16384))
  self.chr_rom = self._io:read_bytes((self.header.len_chr_rom * 8192))
  if self.header.f7.playchoice10 then
    self.playchoice10 = Ines.Playchoice10(self._io, self, self._root)
  end
  if not(self._io:is_eof()) then
    self.title = str_decode.decode(self._io:read_bytes_full(), "ASCII")
  end
end


Ines.Header = class.class(KaitaiStruct)

function Ines.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Header:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\078\069\083\026") then
    error("not equal, expected " ..  "\078\069\083\026" .. ", but got " .. self.magic)
  end
  self.len_prg_rom = self._io:read_u1()
  self.len_chr_rom = self._io:read_u1()
  self._raw_f6 = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_f6))
  self.f6 = Ines.Header.F6(_io, self, self._root)
  self._raw_f7 = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_f7))
  self.f7 = Ines.Header.F7(_io, self, self._root)
  self.len_prg_ram = self._io:read_u1()
  self._raw_f9 = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_f9))
  self.f9 = Ines.Header.F9(_io, self, self._root)
  self._raw_f10 = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_f10))
  self.f10 = Ines.Header.F10(_io, self, self._root)
  self.reserved = self._io:read_bytes(5)
  if not(self.reserved == "\000\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000\000" .. ", but got " .. self.reserved)
  end
end

-- 
-- See also: Source (https://www.nesdev.org/wiki/Mapper)
Ines.Header.property.mapper = {}
function Ines.Header.property.mapper:get()
  if self._m_mapper ~= nil then
    return self._m_mapper
  end

  self._m_mapper = (self.f6.lower_mapper | (self.f7.upper_mapper << 4))
  return self._m_mapper
end

-- 
-- Size of PRG ROM in 16 KB units.
-- 
-- Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM).
-- 
-- Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com).
-- 
-- this one is unofficial.

-- 
-- See also: Source (https://www.nesdev.org/wiki/INES#Flags_6)
Ines.Header.F6 = class.class(KaitaiStruct)

Ines.Header.F6.Mirroring = enum.Enum {
  horizontal = 0,
  vertical = 1,
}

function Ines.Header.F6:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Header.F6:_read()
  self.lower_mapper = self._io:read_bits_int_be(4)
  self.four_screen = self._io:read_bits_int_be(1) ~= 0
  self.trainer = self._io:read_bits_int_be(1) ~= 0
  self.has_battery_ram = self._io:read_bits_int_be(1) ~= 0
  self.mirroring = Ines.Header.F6.Mirroring(self._io:read_bits_int_be(1))
end

-- 
-- Lower nibble of mapper number.
-- 
-- Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM.
-- 
-- 512-byte trainer at $7000-$71FF (stored before PRG data).
-- 
-- If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory.
-- 
-- if 0, horizontal arrangement. if 1, vertical arrangement.

-- 
-- See also: Source (https://www.nesdev.org/wiki/INES#Flags_7)
Ines.Header.F7 = class.class(KaitaiStruct)

function Ines.Header.F7:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Header.F7:_read()
  self.upper_mapper = self._io:read_bits_int_be(4)
  self.format = self._io:read_bits_int_be(2)
  self.playchoice10 = self._io:read_bits_int_be(1) ~= 0
  self.vs_unisystem = self._io:read_bits_int_be(1) ~= 0
end

-- 
-- Upper nibble of mapper number.
-- 
-- If equal to 2, flags 8-15 are in NES 2.0 format.
-- 
-- Determines if it made for a Nintendo PlayChoice-10 or not.
-- 
-- Determines if it is made for a Nintendo VS Unisystem or not.

-- 
-- See also: Source (https://www.nesdev.org/wiki/INES#Flags_9)
Ines.Header.F9 = class.class(KaitaiStruct)

Ines.Header.F9.TvSystem = enum.Enum {
  ntsc = 0,
  pal = 1,
}

function Ines.Header.F9:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Header.F9:_read()
  self.reserved = self._io:read_bits_int_be(7)
  self.tv_system = Ines.Header.F9.TvSystem(self._io:read_bits_int_be(1))
end

-- 
-- if 0, NTSC. If 1, PAL.

-- 
-- See also: Source (https://www.nesdev.org/wiki/INES#Flags_10)
Ines.Header.F10 = class.class(KaitaiStruct)

Ines.Header.F10.TvSystem = enum.Enum {
  ntsc = 0,
  dual1 = 1,
  pal = 2,
  dual2 = 3,
}

function Ines.Header.F10:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Header.F10:_read()
  self.reserved1 = self._io:read_bits_int_be(2)
  self.bus_conflict = self._io:read_bits_int_be(1) ~= 0
  self.prg_ram = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(2)
  self.tv_system = Ines.Header.F10.TvSystem(self._io:read_bits_int_be(2))
end

-- 
-- If 0, no bus conflicts. If 1, bus conflicts.
-- 
-- If 0, PRG ram is present. If 1, not present.
-- 
-- if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.

-- 
-- See also: Source (https://www.nesdev.org/wiki/PC10_ROM-Images)
Ines.Playchoice10 = class.class(KaitaiStruct)

function Ines.Playchoice10:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Playchoice10:_read()
  self.inst_rom = self._io:read_bytes(8192)
  self.prom = Ines.Playchoice10.Prom(self._io, self, self._root)
end


Ines.Playchoice10.Prom = class.class(KaitaiStruct)

function Ines.Playchoice10.Prom:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ines.Playchoice10.Prom:_read()
  self.data = self._io:read_bytes(16)
  self.counter_out = self._io:read_bytes(16)
end


