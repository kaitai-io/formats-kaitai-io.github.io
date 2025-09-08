-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("vlq_base128_be")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- Standard MIDI file, typically known just as "MID", is a standard way
-- to serialize series of MIDI events, which is a protocol used in many
-- music synthesizers to transfer music data: notes being played,
-- effects being applied, etc.
-- 
-- Internally, file consists of a header and series of tracks, every
-- track listing MIDI events with certain header designating time these
-- events are happening.
-- 
-- NOTE: Rarely, MIDI files employ certain stateful compression scheme
-- to avoid storing certain elements of further elements, instead
-- reusing them from events which happened earlier in the
-- stream. Kaitai Struct (as of v0.9) is currently unable to parse
-- these, but files employing this mechanism are relatively rare.
StandardMidiFile = class.class(KaitaiStruct)

function StandardMidiFile:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function StandardMidiFile:_read()
  self.hdr = StandardMidiFile.Header(self._io, self, self._root)
  self.tracks = {}
  for i = 0, self.hdr.num_tracks - 1 do
    self.tracks[i + 1] = StandardMidiFile.Track(self._io, self, self._root)
  end
end


StandardMidiFile.ChannelPressureEvent = class.class(KaitaiStruct)

function StandardMidiFile.ChannelPressureEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.ChannelPressureEvent:_read()
  self.pressure = self._io:read_u1()
end


StandardMidiFile.ControllerEvent = class.class(KaitaiStruct)

function StandardMidiFile.ControllerEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.ControllerEvent:_read()
  self.controller = self._io:read_u1()
  self.value = self._io:read_u1()
end


StandardMidiFile.Header = class.class(KaitaiStruct)

function StandardMidiFile.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.Header:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\077\084\104\100") then
    error("not equal, expected " .. "\077\084\104\100" .. ", but got " .. self.magic)
  end
  self.len_header = self._io:read_u4be()
  self.format = self._io:read_u2be()
  self.num_tracks = self._io:read_u2be()
  self.division = self._io:read_s2be()
end


StandardMidiFile.MetaEventBody = class.class(KaitaiStruct)

StandardMidiFile.MetaEventBody.MetaTypeEnum = enum.Enum {
  sequence_number = 0,
  text_event = 1,
  copyright = 2,
  sequence_track_name = 3,
  instrument_name = 4,
  lyric_text = 5,
  marker_text = 6,
  cue_point = 7,
  midi_channel_prefix_assignment = 32,
  end_of_track = 47,
  tempo = 81,
  smpte_offset = 84,
  time_signature = 88,
  key_signature = 89,
  sequencer_specific_event = 127,
}

function StandardMidiFile.MetaEventBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.MetaEventBody:_read()
  self.meta_type = StandardMidiFile.MetaEventBody.MetaTypeEnum(self._io:read_u1())
  self.len = VlqBase128Be(self._io)
  self.body = self._io:read_bytes(self.len.value)
end


StandardMidiFile.NoteOffEvent = class.class(KaitaiStruct)

function StandardMidiFile.NoteOffEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.NoteOffEvent:_read()
  self.note = self._io:read_u1()
  self.velocity = self._io:read_u1()
end


StandardMidiFile.NoteOnEvent = class.class(KaitaiStruct)

function StandardMidiFile.NoteOnEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.NoteOnEvent:_read()
  self.note = self._io:read_u1()
  self.velocity = self._io:read_u1()
end


StandardMidiFile.PitchBendEvent = class.class(KaitaiStruct)

function StandardMidiFile.PitchBendEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.PitchBendEvent:_read()
  self.b1 = self._io:read_u1()
  self.b2 = self._io:read_u1()
end

StandardMidiFile.PitchBendEvent.property.adj_bend_value = {}
function StandardMidiFile.PitchBendEvent.property.adj_bend_value:get()
  if self._m_adj_bend_value ~= nil then
    return self._m_adj_bend_value
  end

  self._m_adj_bend_value = self.bend_value - 16384
  return self._m_adj_bend_value
end

StandardMidiFile.PitchBendEvent.property.bend_value = {}
function StandardMidiFile.PitchBendEvent.property.bend_value:get()
  if self._m_bend_value ~= nil then
    return self._m_bend_value
  end

  self._m_bend_value = ((self.b2 << 7) + self.b1) - 16384
  return self._m_bend_value
end


StandardMidiFile.PolyphonicPressureEvent = class.class(KaitaiStruct)

function StandardMidiFile.PolyphonicPressureEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.PolyphonicPressureEvent:_read()
  self.note = self._io:read_u1()
  self.pressure = self._io:read_u1()
end


StandardMidiFile.ProgramChangeEvent = class.class(KaitaiStruct)

function StandardMidiFile.ProgramChangeEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.ProgramChangeEvent:_read()
  self.program = self._io:read_u1()
end


StandardMidiFile.SysexEventBody = class.class(KaitaiStruct)

function StandardMidiFile.SysexEventBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.SysexEventBody:_read()
  self.len = VlqBase128Be(self._io)
  self.data = self._io:read_bytes(self.len.value)
end


StandardMidiFile.Track = class.class(KaitaiStruct)

function StandardMidiFile.Track:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.Track:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\077\084\114\107") then
    error("not equal, expected " .. "\077\084\114\107" .. ", but got " .. self.magic)
  end
  self.len_events = self._io:read_u4be()
  self._raw_events = self._io:read_bytes(self.len_events)
  local _io = KaitaiStream(stringstream(self._raw_events))
  self.events = StandardMidiFile.TrackEvents(_io, self, self._root)
end


StandardMidiFile.TrackEvent = class.class(KaitaiStruct)

function StandardMidiFile.TrackEvent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.TrackEvent:_read()
  self.v_time = VlqBase128Be(self._io)
  self.event_header = self._io:read_u1()
  if self.event_header == 255 then
    self.meta_event_body = StandardMidiFile.MetaEventBody(self._io, self, self._root)
  end
  if self.event_header == 240 then
    self.sysex_body = StandardMidiFile.SysexEventBody(self._io, self, self._root)
  end
  local _on = self.event_type
  if _on == 128 then
    self.event_body = StandardMidiFile.NoteOffEvent(self._io, self, self._root)
  elseif _on == 144 then
    self.event_body = StandardMidiFile.NoteOnEvent(self._io, self, self._root)
  elseif _on == 160 then
    self.event_body = StandardMidiFile.PolyphonicPressureEvent(self._io, self, self._root)
  elseif _on == 176 then
    self.event_body = StandardMidiFile.ControllerEvent(self._io, self, self._root)
  elseif _on == 192 then
    self.event_body = StandardMidiFile.ProgramChangeEvent(self._io, self, self._root)
  elseif _on == 208 then
    self.event_body = StandardMidiFile.ChannelPressureEvent(self._io, self, self._root)
  elseif _on == 224 then
    self.event_body = StandardMidiFile.PitchBendEvent(self._io, self, self._root)
  end
end

StandardMidiFile.TrackEvent.property.channel = {}
function StandardMidiFile.TrackEvent.property.channel:get()
  if self._m_channel ~= nil then
    return self._m_channel
  end

  if self.event_type ~= 240 then
    self._m_channel = self.event_header & 15
  end
  return self._m_channel
end

StandardMidiFile.TrackEvent.property.event_type = {}
function StandardMidiFile.TrackEvent.property.event_type:get()
  if self._m_event_type ~= nil then
    return self._m_event_type
  end

  self._m_event_type = self.event_header & 240
  return self._m_event_type
end


StandardMidiFile.TrackEvents = class.class(KaitaiStruct)

function StandardMidiFile.TrackEvents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function StandardMidiFile.TrackEvents:_read()
  self.event = {}
  local i = 0
  while not self._io:is_eof() do
    self.event[i + 1] = StandardMidiFile.TrackEvent(self._io, self, self._root)
    i = i + 1
  end
end


