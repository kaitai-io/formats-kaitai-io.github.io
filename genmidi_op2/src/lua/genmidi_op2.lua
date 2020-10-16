-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- GENMIDI.OP2 is a sound bank file used by players based on DMX sound
-- library to play MIDI files with General MIDI instruments using OPL2
-- sound chip (which was commonly installed on popular AdLib and Sound
-- Blaster sound cards).
-- 
-- Major users of DMX sound library include:
-- 
-- * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
-- * Raptor: Call of the Shadows 
-- See also: http://doom.wikia.com/wiki/GENMIDI (http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip)
GenmidiOp2 = class.class(KaitaiStruct)

function GenmidiOp2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GenmidiOp2:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\035\079\080\076\095\073\073\035") then
    error("not equal, expected " ..  "\035\079\080\076\095\073\073\035" .. ", but got " .. self.magic)
  end
  self.instruments = {}
  for i = 0, 175 - 1 do
    self.instruments[i + 1] = GenmidiOp2.InstrumentEntry(self._io, self, self._root)
  end
  self.instrument_names = {}
  for i = 0, 175 - 1 do
    self.instrument_names[i + 1] = str_decode.decode(KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io:read_bytes(32), 0), 0, false), "ASCII")
  end
end


GenmidiOp2.InstrumentEntry = class.class(KaitaiStruct)

function GenmidiOp2.InstrumentEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GenmidiOp2.InstrumentEntry:_read()
  self.flags = self._io:read_u2le()
  self.finetune = self._io:read_u1()
  self.note = self._io:read_u1()
  self.instruments = {}
  for i = 0, 2 - 1 do
    self.instruments[i + 1] = GenmidiOp2.Instrument(self._io, self, self._root)
  end
end

-- 
-- MIDI note for fixed instruments, 0 otherwise.

GenmidiOp2.Instrument = class.class(KaitaiStruct)

function GenmidiOp2.Instrument:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GenmidiOp2.Instrument:_read()
  self.op1 = GenmidiOp2.OpSettings(self._io, self, self._root)
  self.feedback = self._io:read_u1()
  self.op2 = GenmidiOp2.OpSettings(self._io, self, self._root)
  self.unused = self._io:read_u1()
  self.base_note = self._io:read_s2le()
end

-- 
-- Feedback/AM-FM (both operators).
-- 
-- Base note offset.

-- 
-- OPL2 settings for one operator (carrier or modulator)
GenmidiOp2.OpSettings = class.class(KaitaiStruct)

function GenmidiOp2.OpSettings:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GenmidiOp2.OpSettings:_read()
  self.trem_vibr = self._io:read_u1()
  self.att_dec = self._io:read_u1()
  self.sust_rel = self._io:read_u1()
  self.wave = self._io:read_u1()
  self.scale = self._io:read_u1()
  self.level = self._io:read_u1()
end

-- 
-- Tremolo/vibrato/sustain/KSR/multi.
-- 
-- Attack rate/decay rate.
-- 
-- Sustain level/release rate.
-- 
-- Waveform select.
-- 
-- Key scale level.
-- 
-- Output level.

