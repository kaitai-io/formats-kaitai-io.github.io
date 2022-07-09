-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- The WebSocket protocol establishes a two-way communication channel via TCP.
-- Messages are made up of one or more dataframes, and are delineated by
-- frames with the `fin` bit set.
Websocket = class.class(KaitaiStruct)

Websocket.Opcode = enum.Enum {
  continuation = 0,
  text = 1,
  binary = 2,
  reserved_3 = 3,
  reserved_4 = 4,
  reserved_5 = 5,
  reserved_6 = 6,
  reserved_7 = 7,
  close = 8,
  ping = 9,
  pong = 10,
  reserved_control_b = 11,
  reserved_control_c = 12,
  reserved_control_d = 13,
  reserved_control_e = 14,
  reserved_control_f = 15,
}

function Websocket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Websocket:_read()
  self.initial_frame = Websocket.InitialFrame(self._io, self, self._root)
  if self.initial_frame.header.finished ~= true then
    self.trailing_frames = {}
    local i = 0
    while true do
      local _ = Websocket.Dataframe(self._io, self, self._root)
      self.trailing_frames[i + 1] = _
      if _.header.finished then
        break
      end
      i = i + 1
    end
  end
end


Websocket.FrameHeader = class.class(KaitaiStruct)

function Websocket.FrameHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Websocket.FrameHeader:_read()
  self.finished = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(3)
  self.opcode = Websocket.Opcode(self._io:read_bits_int_be(4))
  self.is_masked = self._io:read_bits_int_be(1) ~= 0
  self.len_payload_primary = self._io:read_bits_int_be(7)
  self._io:align_to_byte()
  if self.len_payload_primary == 126 then
    self.len_payload_extended_1 = self._io:read_u2be()
  end
  if self.len_payload_primary == 127 then
    self.len_payload_extended_2 = self._io:read_u4be()
  end
  if self.is_masked then
    self.mask_key = self._io:read_u4be()
  end
end

Websocket.FrameHeader.property.len_payload = {}
function Websocket.FrameHeader.property.len_payload:get()
  if self._m_len_payload ~= nil then
    return self._m_len_payload
  end

  self._m_len_payload = utils.box_unwrap((self.len_payload_primary <= 125) and utils.box_wrap(self.len_payload_primary) or (utils.box_unwrap((self.len_payload_primary == 126) and utils.box_wrap(self.len_payload_extended_1) or (self.len_payload_extended_2))))
  return self._m_len_payload
end


Websocket.InitialFrame = class.class(KaitaiStruct)

function Websocket.InitialFrame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Websocket.InitialFrame:_read()
  self.header = Websocket.FrameHeader(self._io, self, self._root)
  if self.header.opcode ~= Websocket.Opcode.text then
    self.payload_bytes = self._io:read_bytes(self.header.len_payload)
  end
  if self.header.opcode == Websocket.Opcode.text then
    self.payload_text = str_decode.decode(self._io:read_bytes(self.header.len_payload), "UTF-8")
  end
end


Websocket.Dataframe = class.class(KaitaiStruct)

function Websocket.Dataframe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Websocket.Dataframe:_read()
  self.header = Websocket.FrameHeader(self._io, self, self._root)
  if self._root.initial_frame.header.opcode ~= Websocket.Opcode.text then
    self.payload_bytes = self._io:read_bytes(self.header.len_payload)
  end
  if self._root.initial_frame.header.opcode == Websocket.Opcode.text then
    self.payload_text = str_decode.decode(self._io:read_bytes(self.header.len_payload), "UTF-8")
  end
end


