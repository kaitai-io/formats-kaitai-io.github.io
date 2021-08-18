-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
-- of data (primarily devicetree data, although other data is possible as well).
-- The data is internally stored as a tree of named nodes and properties. Nodes
-- contain properties and child nodes, while properties are name–value pairs.
-- 
-- The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
-- files (`.dts`) through the Devicetree compiler (DTC).
-- 
-- On Linux systems that support this, the blobs can be accessed in
-- `/sys/firmware/fdt`:
-- 
-- * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
-- 
-- The encoding of strings used in the `strings_block` and `structure_block` is
-- actually a subset of ASCII:
-- 
-- <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
-- 
-- Example files:
-- 
-- * <https://github.com/qemu/qemu/tree/master/pc-bios>
-- See also: Source (https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html)
-- See also: Source (https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf)
Dtb = class.class(KaitaiStruct)

Dtb.Fdt = enum.Enum {
  begin_node = 1,
  end_node = 2,
  prop = 3,
  nop = 4,
  end = 9,
}

function Dtb:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dtb:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\208\013\254\237") then
    error("not equal, expected " ..  "\208\013\254\237" .. ", but got " .. self.magic)
  end
  self.total_size = self._io:read_u4be()
  self.ofs_structure_block = self._io:read_u4be()
  self.ofs_strings_block = self._io:read_u4be()
  self.ofs_memory_reservation_block = self._io:read_u4be()
  self.version = self._io:read_u4be()
  self.min_compatible_version = self._io:read_u4be()
  if not(self.min_compatible_version <= self.version) then
    error("ValidationGreaterThanError")
  end
  self.boot_cpuid_phys = self._io:read_u4be()
  self.len_strings_block = self._io:read_u4be()
  self.len_structure_block = self._io:read_u4be()
end

Dtb.property.memory_reservation_block = {}
function Dtb.property.memory_reservation_block:get()
  if self._m_memory_reservation_block ~= nil then
    return self._m_memory_reservation_block
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_memory_reservation_block)
  self._raw__m_memory_reservation_block = self._io:read_bytes((self.ofs_structure_block - self.ofs_memory_reservation_block))
  local _io = KaitaiStream(stringstream(self._raw__m_memory_reservation_block))
  self._m_memory_reservation_block = Dtb.MemoryBlock(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_memory_reservation_block
end

Dtb.property.structure_block = {}
function Dtb.property.structure_block:get()
  if self._m_structure_block ~= nil then
    return self._m_structure_block
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_structure_block)
  self._raw__m_structure_block = self._io:read_bytes(self.len_structure_block)
  local _io = KaitaiStream(stringstream(self._raw__m_structure_block))
  self._m_structure_block = Dtb.FdtBlock(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_structure_block
end

Dtb.property.strings_block = {}
function Dtb.property.strings_block:get()
  if self._m_strings_block ~= nil then
    return self._m_strings_block
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_strings_block)
  self._raw__m_strings_block = self._io:read_bytes(self.len_strings_block)
  local _io = KaitaiStream(stringstream(self._raw__m_strings_block))
  self._m_strings_block = Dtb.Strings(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_strings_block
end


Dtb.MemoryBlock = class.class(KaitaiStruct)

function Dtb.MemoryBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dtb.MemoryBlock:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Dtb.MemoryBlockEntry(self._io, self, self._root)
    i = i + 1
  end
end


Dtb.FdtBlock = class.class(KaitaiStruct)

function Dtb.FdtBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dtb.FdtBlock:_read()
  self.nodes = {}
  local i = 0
  while true do
    _ = Dtb.FdtNode(self._io, self, self._root)
    self.nodes[i + 1] = _
    if _.type == Dtb.Fdt.end then
      break
    end
    i = i + 1
  end
end


Dtb.MemoryBlockEntry = class.class(KaitaiStruct)

function Dtb.MemoryBlockEntry:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dtb.MemoryBlockEntry:_read()
self.address = self._io:read_u8be()
self.size = self._io:read_u8be()
end

-- 
-- physical address of a reserved memory region.
-- 
-- size of a reserved memory region.

Dtb.Strings = class.class(KaitaiStruct)

function Dtb.Strings:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dtb.Strings:_read()
self.strings = {}
local i = 0
while not self._io:is_eof() do
  self.strings[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
  i = i + 1
end
end


Dtb.FdtProp = class.class(KaitaiStruct)

function Dtb.FdtProp:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dtb.FdtProp:_read()
self.len_property = self._io:read_u4be()
self.ofs_name = self._io:read_u4be()
self.property = self._io:read_bytes(self.len_property)
self.padding = self._io:read_bytes((-(self._io:pos()) % 4))
end

Dtb.FdtProp.property.name = {}
function Dtb.FdtProp.property.name:get()
if self._m_name ~= nil then
  return self._m_name
end

local _io = self._root.strings_block._io
local _pos = _io:pos()
_io:seek(self.ofs_name)
self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
_io:seek(_pos)
return self._m_name
end


Dtb.FdtNode = class.class(KaitaiStruct)

function Dtb.FdtNode:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dtb.FdtNode:_read()
self.type = Dtb.Fdt(self._io:read_u4be())
local _on = self.type
if _on == Dtb.Fdt.begin_node then
  self.body = Dtb.FdtBeginNode(self._io, self, self._root)
elseif _on == Dtb.Fdt.prop then
  self.body = Dtb.FdtProp(self._io, self, self._root)
end
end


Dtb.FdtBeginNode = class.class(KaitaiStruct)

function Dtb.FdtBeginNode:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dtb.FdtBeginNode:_read()
self.name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
self.padding = self._io:read_bytes((-(self._io:pos()) % 4))
end


