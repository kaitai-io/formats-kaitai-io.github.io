-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local stringstream = require("string_stream")

-- 
-- You can get a dump for testing from this link:
-- <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
-- See also: Source (https://github.com/nfc-tools/libnfc
-- https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
-- )
MifareClassic = class.class(KaitaiStruct)

function MifareClassic:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic:_read()
  self._raw_sectors = {}
  self.sectors = {}
  local i = 0
  while not self._io:is_eof() do
    self._raw_sectors[i + 1] = self._io:read_bytes(((utils.box_unwrap((i >= 32) and utils.box_wrap(4) or (1)) * 4) * 16))
    local _io = KaitaiStream(stringstream(self._raw_sectors[#self._raw_sectors]))
    self.sectors[i + 1] = MifareClassic.Sector(i == 0, _io, self, self._root)
    i = i + 1
  end
end


MifareClassic.Key = class.class(KaitaiStruct)

function MifareClassic.Key:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Key:_read()
  self.key = self._io:read_bytes(6)
end


MifareClassic.Sector = class.class(KaitaiStruct)

function MifareClassic.Sector:_init(has_manufacturer, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.has_manufacturer = has_manufacturer
  self:_read()
end

function MifareClassic.Sector:_read()
  if self.has_manufacturer then
    self.manufacturer = MifareClassic.Manufacturer(self._io, self, self._root)
  end
  self._raw_data_filler = self._io:read_bytes(((self._io:size() - self._io:pos()) - 16))
  local _io = KaitaiStream(stringstream(self._raw_data_filler))
  self.data_filler = MifareClassic.Sector.Filler(_io, self, self._root)
  self.trailer = MifareClassic.Trailer(self._io, self, self._root)
end

MifareClassic.Sector.property.block_size = {}
function MifareClassic.Sector.property.block_size:get()
  if self._m_block_size ~= nil then
    return self._m_block_size
  end

  self._m_block_size = 16
  return self._m_block_size
end

MifareClassic.Sector.property.data = {}
function MifareClassic.Sector.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  self._m_data = self.data_filler.data
  return self._m_data
end

MifareClassic.Sector.property.blocks = {}
function MifareClassic.Sector.property.blocks:get()
  if self._m_blocks ~= nil then
    return self._m_blocks
  end

  local _io = self.data_filler._io
  local _pos = _io:pos()
  _io:seek(0)
  self._m_blocks = {}
  local i = 0
  while not _io:is_eof() do
    self._m_blocks[i + 1] = _io:read_bytes(self.block_size)
    i = i + 1
  end
  _io:seek(_pos)
  return self._m_blocks
end

MifareClassic.Sector.property.values = {}
function MifareClassic.Sector.property.values:get()
  if self._m_values ~= nil then
    return self._m_values
  end

  local _io = self.data_filler._io
  local _pos = _io:pos()
  _io:seek(0)
  self._m_values = MifareClassic.Sector.Values(_io, self, self._root)
  _io:seek(_pos)
  return self._m_values
end


MifareClassic.Sector.Values = class.class(KaitaiStruct)

function MifareClassic.Sector.Values:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Sector.Values:_read()
  self.values = {}
  local i = 0
  while not self._io:is_eof() do
    self.values[i + 1] = MifareClassic.Sector.Values.ValueBlock(self._io, self, self._root)
    i = i + 1
  end
end


MifareClassic.Sector.Values.ValueBlock = class.class(KaitaiStruct)

function MifareClassic.Sector.Values.ValueBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Sector.Values.ValueBlock:_read()
  self.valuez = {}
  for i = 0, 3 - 1 do
    self.valuez[i + 1] = self._io:read_u4le()
  end
  self.addrz = {}
  for i = 0, 4 - 1 do
    self.addrz[i + 1] = self._io:read_u1()
  end
end

MifareClassic.Sector.Values.ValueBlock.property.addr = {}
function MifareClassic.Sector.Values.ValueBlock.property.addr:get()
  if self._m_addr ~= nil then
    return self._m_addr
  end

  if self.valid then
    self._m_addr = self.addrz[0 + 1]
  end
  return self._m_addr
end

MifareClassic.Sector.Values.ValueBlock.property.addr_valid = {}
function MifareClassic.Sector.Values.ValueBlock.property.addr_valid:get()
  if self._m_addr_valid ~= nil then
    return self._m_addr_valid
  end

  self._m_addr_valid =  ((self.addrz[0 + 1] == ~(self.addrz[1 + 1])) and (self.addrz[0 + 1] == self.addrz[2 + 1]) and (self.addrz[1 + 1] == self.addrz[3 + 1])) 
  return self._m_addr_valid
end

MifareClassic.Sector.Values.ValueBlock.property.valid = {}
function MifareClassic.Sector.Values.ValueBlock.property.valid:get()
  if self._m_valid ~= nil then
    return self._m_valid
  end

  self._m_valid =  ((self.value_valid) and (self.addr_valid)) 
  return self._m_valid
end

MifareClassic.Sector.Values.ValueBlock.property.value_valid = {}
function MifareClassic.Sector.Values.ValueBlock.property.value_valid:get()
  if self._m_value_valid ~= nil then
    return self._m_value_valid
  end

  self._m_value_valid =  ((self.valuez[0 + 1] == ~(self.valuez[1 + 1])) and (self.valuez[0 + 1] == self.valuez[2 + 1])) 
  return self._m_value_valid
end

MifareClassic.Sector.Values.ValueBlock.property.value = {}
function MifareClassic.Sector.Values.ValueBlock.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  if self.valid then
    self._m_value = self.valuez[0 + 1]
  end
  return self._m_value
end


-- 
-- only to create _io.
MifareClassic.Sector.Filler = class.class(KaitaiStruct)

function MifareClassic.Sector.Filler:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Sector.Filler:_read()
  self.data = self._io:read_bytes(self._io:size())
end


MifareClassic.Manufacturer = class.class(KaitaiStruct)

function MifareClassic.Manufacturer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Manufacturer:_read()
  self.nuid = self._io:read_u4le()
  self.bcc = self._io:read_u1()
  self.sak = self._io:read_u1()
  self.atqa = self._io:read_u2le()
  self.manufacturer = self._io:read_bytes(8)
end

-- 
-- beware for 7bytes UID it goes over next fields.
-- 
-- may contain manufacture date as BCD.

MifareClassic.Trailer = class.class(KaitaiStruct)

function MifareClassic.Trailer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Trailer:_read()
  self.key_a = MifareClassic.Key(self._io, self, self._root)
  self._raw_access_bits = self._io:read_bytes(3)
  local _io = KaitaiStream(stringstream(self._raw_access_bits))
  self.access_bits = MifareClassic.Trailer.AccessConditions(_io, self, self._root)
  self.user_byte = self._io:read_u1()
  self.key_b = MifareClassic.Key(self._io, self, self._root)
end

MifareClassic.Trailer.property.ac_bits = {}
function MifareClassic.Trailer.property.ac_bits:get()
  if self._m_ac_bits ~= nil then
    return self._m_ac_bits
  end

  self._m_ac_bits = 3
  return self._m_ac_bits
end

MifareClassic.Trailer.property.acs_in_sector = {}
function MifareClassic.Trailer.property.acs_in_sector:get()
  if self._m_acs_in_sector ~= nil then
    return self._m_acs_in_sector
  end

  self._m_acs_in_sector = 4
  return self._m_acs_in_sector
end

MifareClassic.Trailer.property.ac_count_of_chunks = {}
function MifareClassic.Trailer.property.ac_count_of_chunks:get()
  if self._m_ac_count_of_chunks ~= nil then
    return self._m_ac_count_of_chunks
  end

  self._m_ac_count_of_chunks = (self.ac_bits * 2)
  return self._m_ac_count_of_chunks
end


MifareClassic.Trailer.AccessConditions = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MifareClassic.Trailer.AccessConditions:_read()
  self.raw_chunks = {}
  for i = 0, self._parent.ac_count_of_chunks - 1 do
    self.raw_chunks[i + 1] = self._io:read_bits_int_be(4)
  end
end

MifareClassic.Trailer.AccessConditions.property.data_acs = {}
function MifareClassic.Trailer.AccessConditions.property.data_acs:get()
  if self._m_data_acs ~= nil then
    return self._m_data_acs
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_data_acs = {}
  for i = 0, (self._parent.acs_in_sector - 1) - 1 do
    self._m_data_acs[i + 1] = MifareClassic.Trailer.AccessConditions.DataAc(self.acs_raw[i + 1], self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_data_acs
end

MifareClassic.Trailer.AccessConditions.property.remaps = {}
function MifareClassic.Trailer.AccessConditions.property.remaps:get()
  if self._m_remaps ~= nil then
    return self._m_remaps
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_remaps = {}
  for i = 0, self._parent.ac_bits - 1 do
    self._m_remaps[i + 1] = MifareClassic.Trailer.AccessConditions.ChunkBitRemap(i, self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_remaps
end

MifareClassic.Trailer.AccessConditions.property.acs_raw = {}
function MifareClassic.Trailer.AccessConditions.property.acs_raw:get()
  if self._m_acs_raw ~= nil then
    return self._m_acs_raw
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_acs_raw = {}
  for i = 0, self._parent.acs_in_sector - 1 do
    self._m_acs_raw[i + 1] = MifareClassic.Trailer.AccessConditions.Ac(i, self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_acs_raw
end

MifareClassic.Trailer.AccessConditions.property.trailer_ac = {}
function MifareClassic.Trailer.AccessConditions.property.trailer_ac:get()
  if self._m_trailer_ac ~= nil then
    return self._m_trailer_ac
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_trailer_ac = MifareClassic.Trailer.AccessConditions.TrailerAc(self.acs_raw[(self._parent.acs_in_sector - 1) + 1], self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_trailer_ac
end

MifareClassic.Trailer.AccessConditions.property.chunks = {}
function MifareClassic.Trailer.AccessConditions.property.chunks:get()
  if self._m_chunks ~= nil then
    return self._m_chunks
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_chunks = {}
  for i = 0, self._parent.ac_bits - 1 do
    self._m_chunks[i + 1] = MifareClassic.Trailer.AccessConditions.ValidChunk(self.raw_chunks[self.remaps[i + 1].inv_chunk_no + 1], self.raw_chunks[self.remaps[i + 1].chunk_no + 1], self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_chunks
end


MifareClassic.Trailer.AccessConditions.TrailerAc = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.TrailerAc:_init(ac, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.ac = ac
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.TrailerAc:_read()
end

-- 
-- key A is required.
MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_read_key_b = {}
function MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_read_key_b:get()
  if self._m_can_read_key_b ~= nil then
    return self._m_can_read_key_b
  end

  self._m_can_read_key_b = self.ac.inv_shift_val <= 2
  return self._m_can_read_key_b
end

MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_write_keys = {}
function MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_write_keys:get()
  if self._m_can_write_keys ~= nil then
    return self._m_can_write_keys
  end

  self._m_can_write_keys =  ((((self.ac.inv_shift_val + 1) % 3) ~= 0) and (self.ac.inv_shift_val < 6)) 
  return self._m_can_write_keys
end

MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_write_access_bits = {}
function MifareClassic.Trailer.AccessConditions.TrailerAc.property.can_write_access_bits:get()
  if self._m_can_write_access_bits ~= nil then
    return self._m_can_write_access_bits
  end

  self._m_can_write_access_bits = self.ac.bits[2 + 1].b
  return self._m_can_write_access_bits
end

MifareClassic.Trailer.AccessConditions.TrailerAc.property.key_b_controls_write = {}
function MifareClassic.Trailer.AccessConditions.TrailerAc.property.key_b_controls_write:get()
  if self._m_key_b_controls_write ~= nil then
    return self._m_key_b_controls_write
  end

  self._m_key_b_controls_write = not(self.can_read_key_b)
  return self._m_key_b_controls_write
end


MifareClassic.Trailer.AccessConditions.ChunkBitRemap = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.ChunkBitRemap:_init(bit_no, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.bit_no = bit_no
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.ChunkBitRemap:_read()
end

MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.shift_value = {}
function MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.shift_value:get()
  if self._m_shift_value ~= nil then
    return self._m_shift_value
  end

  self._m_shift_value = utils.box_unwrap((self.bit_no == 1) and utils.box_wrap(-1) or (1))
  return self._m_shift_value
end

MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.chunk_no = {}
function MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.chunk_no:get()
  if self._m_chunk_no ~= nil then
    return self._m_chunk_no
  end

  self._m_chunk_no = (((self.inv_chunk_no + self.shift_value) + self._parent._parent.ac_count_of_chunks) % self._parent._parent.ac_count_of_chunks)
  return self._m_chunk_no
end

MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.inv_chunk_no = {}
function MifareClassic.Trailer.AccessConditions.ChunkBitRemap.property.inv_chunk_no:get()
  if self._m_inv_chunk_no ~= nil then
    return self._m_inv_chunk_no
  end

  self._m_inv_chunk_no = (self.bit_no + self.shift_value)
  return self._m_inv_chunk_no
end


MifareClassic.Trailer.AccessConditions.DataAc = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.DataAc:_init(ac, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.ac = ac
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.DataAc:_read()
end

MifareClassic.Trailer.AccessConditions.DataAc.property.read_key_a_required = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.read_key_a_required:get()
  if self._m_read_key_a_required ~= nil then
    return self._m_read_key_a_required
  end

  self._m_read_key_a_required = self.ac.val <= 4
  return self._m_read_key_a_required
end

MifareClassic.Trailer.AccessConditions.DataAc.property.write_key_b_required = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.write_key_b_required:get()
  if self._m_write_key_b_required ~= nil then
    return self._m_write_key_b_required
  end

  self._m_write_key_b_required =  (( ((not(self.read_key_a_required)) or (self.read_key_b_required)) ) and (not(self.ac.bits[0 + 1].b))) 
  return self._m_write_key_b_required
end

MifareClassic.Trailer.AccessConditions.DataAc.property.write_key_a_required = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.write_key_a_required:get()
  if self._m_write_key_a_required ~= nil then
    return self._m_write_key_a_required
  end

  self._m_write_key_a_required = self.ac.val == 0
  return self._m_write_key_a_required
end

MifareClassic.Trailer.AccessConditions.DataAc.property.read_key_b_required = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.read_key_b_required:get()
  if self._m_read_key_b_required ~= nil then
    return self._m_read_key_b_required
  end

  self._m_read_key_b_required = self.ac.val <= 6
  return self._m_read_key_b_required
end

MifareClassic.Trailer.AccessConditions.DataAc.property.decrement_available = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.decrement_available:get()
  if self._m_decrement_available ~= nil then
    return self._m_decrement_available
  end

  self._m_decrement_available =  (( ((self.ac.bits[1 + 1].b) or (not(self.ac.bits[0 + 1].b))) ) and (not(self.ac.bits[2 + 1].b))) 
  return self._m_decrement_available
end

MifareClassic.Trailer.AccessConditions.DataAc.property.increment_available = {}
function MifareClassic.Trailer.AccessConditions.DataAc.property.increment_available:get()
  if self._m_increment_available ~= nil then
    return self._m_increment_available
  end

  self._m_increment_available =  (( ((not(self.ac.bits[0 + 1].b)) and (not(self.read_key_a_required)) and (not(self.read_key_b_required))) ) or ( ((not(self.ac.bits[0 + 1].b)) and (self.read_key_a_required) and (self.read_key_b_required)) )) 
  return self._m_increment_available
end


MifareClassic.Trailer.AccessConditions.Ac = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.Ac:_init(index, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.index = index
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.Ac:_read()
end

MifareClassic.Trailer.AccessConditions.Ac.property.bits = {}
function MifareClassic.Trailer.AccessConditions.Ac.property.bits:get()
  if self._m_bits ~= nil then
    return self._m_bits
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_bits = {}
  for i = 0, self._parent._parent.ac_bits - 1 do
    self._m_bits[i + 1] = MifareClassic.Trailer.AccessConditions.Ac.AcBit(self.index, self._parent.chunks[i + 1].chunk, self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_bits
end

-- 
-- c3 c2 c1.
MifareClassic.Trailer.AccessConditions.Ac.property.val = {}
function MifareClassic.Trailer.AccessConditions.Ac.property.val:get()
  if self._m_val ~= nil then
    return self._m_val
  end

  self._m_val = (((self.bits[2 + 1].n << 2) | (self.bits[1 + 1].n << 1)) | self.bits[0 + 1].n)
  return self._m_val
end

MifareClassic.Trailer.AccessConditions.Ac.property.inv_shift_val = {}
function MifareClassic.Trailer.AccessConditions.Ac.property.inv_shift_val:get()
  if self._m_inv_shift_val ~= nil then
    return self._m_inv_shift_val
  end

  self._m_inv_shift_val = (((self.bits[0 + 1].n << 2) | (self.bits[1 + 1].n << 1)) | self.bits[2 + 1].n)
  return self._m_inv_shift_val
end


MifareClassic.Trailer.AccessConditions.Ac.AcBit = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.Ac.AcBit:_init(i, chunk, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.i = i
  self.chunk = chunk
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.Ac.AcBit:_read()
end

MifareClassic.Trailer.AccessConditions.Ac.AcBit.property.n = {}
function MifareClassic.Trailer.AccessConditions.Ac.AcBit.property.n:get()
  if self._m_n ~= nil then
    return self._m_n
  end

  self._m_n = ((self.chunk >> self.i) & 1)
  return self._m_n
end

MifareClassic.Trailer.AccessConditions.Ac.AcBit.property.b = {}
function MifareClassic.Trailer.AccessConditions.Ac.AcBit.property.b:get()
  if self._m_b ~= nil then
    return self._m_b
  end

  self._m_b = self.n == 1
  return self._m_b
end


MifareClassic.Trailer.AccessConditions.ValidChunk = class.class(KaitaiStruct)

function MifareClassic.Trailer.AccessConditions.ValidChunk:_init(inv_chunk, chunk, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.inv_chunk = inv_chunk
  self.chunk = chunk
  self:_read()
end

function MifareClassic.Trailer.AccessConditions.ValidChunk:_read()
end

MifareClassic.Trailer.AccessConditions.ValidChunk.property.valid = {}
function MifareClassic.Trailer.AccessConditions.ValidChunk.property.valid:get()
  if self._m_valid ~= nil then
    return self._m_valid
  end

  self._m_valid = (self.inv_chunk ~ self.chunk) == 15
  return self._m_valid
end

-- 
-- c3 c2 c1 c0.

