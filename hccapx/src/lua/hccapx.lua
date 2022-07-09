-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Native format of Hashcat password "recovery" utility
-- See also: Source (https://hashcat.net/wiki/doku.php?id=hccapx)
Hccapx = class.class(KaitaiStruct)

function Hccapx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hccapx:_read()
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = Hccapx.HccapxRecord(self._io, self, self._root)
    i = i + 1
  end
end


Hccapx.HccapxRecord = class.class(KaitaiStruct)

function Hccapx.HccapxRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hccapx.HccapxRecord:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\072\067\080\088") then
    error("not equal, expected " ..  "\072\067\080\088" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
  self.ignore_replay_counter = self._io:read_bits_int_be(1) ~= 0
  self.message_pair = self._io:read_bits_int_be(7)
  self._io:align_to_byte()
  self.len_essid = self._io:read_u1()
  self.essid = self._io:read_bytes(self.len_essid)
  self.padding1 = self._io:read_bytes((32 - self.len_essid))
  self.keyver = self._io:read_u1()
  self.keymic = self._io:read_bytes(16)
  self.mac_ap = self._io:read_bytes(6)
  self.nonce_ap = self._io:read_bytes(32)
  self.mac_station = self._io:read_bytes(6)
  self.nonce_station = self._io:read_bytes(32)
  self.len_eapol = self._io:read_u2le()
  self.eapol = self._io:read_bytes(self.len_eapol)
  self.padding2 = self._io:read_bytes((256 - self.len_eapol))
end

-- 
-- The version number of the .hccapx file format.
-- 
-- Indicates if the message pair matching was done based on
-- replay counter or not.
-- 
-- Whenever it was set to 1 it means that the replay counter
-- was ignored (i.e. it was not considered at all by the
-- matching algorithm).
-- 
-- Hashcat currently does not perform any particular action
-- based on this bit, but nonetheless this information could be
-- crucial for some 3th party tools and for
-- analysis/statistics. There could be some opportunity to
-- implement some further logic based on this particular
-- information also within hashcat (in the future).
-- 
-- The message_pair value describes which messages of the 4-way
-- handshake were combined to form the .hccapx structure. It is
-- always a pair of 2 messages: 1 from the AP (access point)
-- and 1 from the STA (client).
-- 
-- Furthermore, the message_pair value also gives a hint from
-- which of the 2 messages the EAPOL origins. This is
-- interesting data, but not necessarily needed for hashcat to
-- be able to crack the hash.
-- 
-- On the other hand, it could be very important to know if
-- "only" message 1 and message 2 were captured or if for
-- instance message 3 and/or message 4 were captured too. If
-- message 3 and/or message 4 were captured it should be a hard
-- evidence that the connection was established and that the
-- password the client used was the correct one.
-- 
-- The flag used to distinguish WPA from WPA2 ciphers. Value of
-- 1 means WPA, other - WPA2.
-- 
-- The final hash value. MD5 for WPA and SHA-1 for WPA2
-- (truncated to 128 bit).
-- 
-- The BSSID (MAC address) of the access point.
-- 
-- Nonce (random salt) generated by the access point.
-- 
-- The MAC address of the client connecting to the access point.
-- 
-- Nonce (random salt) generated by the client connecting to the access point.
-- 
-- The length of the EAPOL data.

