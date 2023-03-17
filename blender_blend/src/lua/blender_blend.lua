-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- Blender is an open source suite for 3D modelling, sculpting,
-- animation, compositing, rendering, preparation of assets for its own
-- game engine and exporting to others, etc. `.blend` is its own binary
-- format that saves whole state of suite: current scene, animations,
-- all software settings, extensions, etc.
-- 
-- Internally, .blend format is a hybrid semi-self-descriptive
-- format. On top level, it contains a simple header and a sequence of
-- file blocks, which more or less follow typical [TLV
-- pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
-- block would be a structure with code `DNA1`, which is a essentially
-- a machine-readable schema of all other structures used in this file.
BlenderBlend = class.class(KaitaiStruct)

BlenderBlend.PtrSize = enum.Enum {
  bits_64 = 45,
  bits_32 = 95,
}

BlenderBlend.Endian = enum.Enum {
  be = 86,
  le = 118,
}

function BlenderBlend:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend:_read()
  self.hdr = BlenderBlend.Header(self._io, self, self._root)
  self.blocks = {}
  local i = 0
  while not self._io:is_eof() do
    self.blocks[i + 1] = BlenderBlend.FileBlock(self._io, self, self._root)
    i = i + 1
  end
end

BlenderBlend.property.sdna_structs = {}
function BlenderBlend.property.sdna_structs:get()
  if self._m_sdna_structs ~= nil then
    return self._m_sdna_structs
  end

  self._m_sdna_structs = self.blocks[(#self.blocks - 2) + 1].body.structs
  return self._m_sdna_structs
end


-- 
-- DNA struct contains a `type` (type name), which is specified as
-- an index in types table, and sequence of fields.
BlenderBlend.DnaStruct = class.class(KaitaiStruct)

function BlenderBlend.DnaStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend.DnaStruct:_read()
  self.idx_type = self._io:read_u2le()
  self.num_fields = self._io:read_u2le()
  self.fields = {}
  for i = 0, self.num_fields - 1 do
    self.fields[i + 1] = BlenderBlend.DnaField(self._io, self, self._root)
  end
end

BlenderBlend.DnaStruct.property.type = {}
function BlenderBlend.DnaStruct.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = self._parent.types[self.idx_type + 1]
  return self._m_type
end


BlenderBlend.FileBlock = class.class(KaitaiStruct)

function BlenderBlend.FileBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend.FileBlock:_read()
  self.code = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.len_body = self._io:read_u4le()
  self.mem_addr = self._io:read_bytes(self._root.hdr.psize)
  self.sdna_index = self._io:read_u4le()
  self.count = self._io:read_u4le()
  local _on = self.code
  if _on == "DNA1" then
    self._raw_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = BlenderBlend.Dna1Body(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len_body)
  end
end

BlenderBlend.FileBlock.property.sdna_struct = {}
function BlenderBlend.FileBlock.property.sdna_struct:get()
  if self._m_sdna_struct ~= nil then
    return self._m_sdna_struct
  end

  if self.sdna_index ~= 0 then
    self._m_sdna_struct = self._root.sdna_structs[self.sdna_index + 1]
  end
  return self._m_sdna_struct
end

-- 
-- Identifier of the file block.
-- 
-- Total length of the data after the header of file block.
-- 
-- Memory address the structure was located when written to disk.
-- 
-- Index of the SDNA structure.
-- 
-- Number of structure located in this file-block.

-- 
-- DNA1, also known as "Structure DNA", is a special block in
-- .blend file, which contains machine-readable specifications of
-- all other structures used in this .blend file.
-- 
-- Effectively, this block contains:
-- 
-- * a sequence of "names" (strings which represent field names)
-- * a sequence of "types" (strings which represent type name)
-- * a sequence of "type lengths"
-- * a sequence of "structs" (which describe contents of every
--   structure, referring to types and names by index)
-- See also: Source (https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA)
BlenderBlend.Dna1Body = class.class(KaitaiStruct)

function BlenderBlend.Dna1Body:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend.Dna1Body:_read()
  self.id = self._io:read_bytes(4)
  if not(self.id == "\083\068\078\065") then
    error("not equal, expected " ..  "\083\068\078\065" .. ", but got " .. self.id)
  end
  self.name_magic = self._io:read_bytes(4)
  if not(self.name_magic == "\078\065\077\069") then
    error("not equal, expected " ..  "\078\065\077\069" .. ", but got " .. self.name_magic)
  end
  self.num_names = self._io:read_u4le()
  self.names = {}
  for i = 0, self.num_names - 1 do
    self.names[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  end
  self.padding_1 = self._io:read_bytes(((4 - self._io:pos()) % 4))
  self.type_magic = self._io:read_bytes(4)
  if not(self.type_magic == "\084\089\080\069") then
    error("not equal, expected " ..  "\084\089\080\069" .. ", but got " .. self.type_magic)
  end
  self.num_types = self._io:read_u4le()
  self.types = {}
  for i = 0, self.num_types - 1 do
    self.types[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  end
  self.padding_2 = self._io:read_bytes(((4 - self._io:pos()) % 4))
  self.tlen_magic = self._io:read_bytes(4)
  if not(self.tlen_magic == "\084\076\069\078") then
    error("not equal, expected " ..  "\084\076\069\078" .. ", but got " .. self.tlen_magic)
  end
  self.lengths = {}
  for i = 0, self.num_types - 1 do
    self.lengths[i + 1] = self._io:read_u2le()
  end
  self.padding_3 = self._io:read_bytes(((4 - self._io:pos()) % 4))
  self.strc_magic = self._io:read_bytes(4)
  if not(self.strc_magic == "\083\084\082\067") then
    error("not equal, expected " ..  "\083\084\082\067" .. ", but got " .. self.strc_magic)
  end
  self.num_structs = self._io:read_u4le()
  self.structs = {}
  for i = 0, self.num_structs - 1 do
    self.structs[i + 1] = BlenderBlend.DnaStruct(self._io, self, self._root)
  end
end


BlenderBlend.Header = class.class(KaitaiStruct)

function BlenderBlend.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend.Header:_read()
  self.magic = self._io:read_bytes(7)
  if not(self.magic == "\066\076\069\078\068\069\082") then
    error("not equal, expected " ..  "\066\076\069\078\068\069\082" .. ", but got " .. self.magic)
  end
  self.ptr_size_id = BlenderBlend.PtrSize(self._io:read_u1())
  self.endian = BlenderBlend.Endian(self._io:read_u1())
  self.version = str_decode.decode(self._io:read_bytes(3), "ASCII")
end

-- 
-- Number of bytes that a pointer occupies.
BlenderBlend.Header.property.psize = {}
function BlenderBlend.Header.property.psize:get()
  if self._m_psize ~= nil then
    return self._m_psize
  end

  self._m_psize = utils.box_unwrap((self.ptr_size_id == BlenderBlend.PtrSize.bits_64) and utils.box_wrap(8) or (4))
  return self._m_psize
end

-- 
-- Size of a pointer; all pointers in the file are stored in this format.
-- 
-- Type of byte ordering used.
-- 
-- Blender version used to save this file.

BlenderBlend.DnaField = class.class(KaitaiStruct)

function BlenderBlend.DnaField:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BlenderBlend.DnaField:_read()
  self.idx_type = self._io:read_u2le()
  self.idx_name = self._io:read_u2le()
end

BlenderBlend.DnaField.property.type = {}
function BlenderBlend.DnaField.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = self._parent._parent.types[self.idx_type + 1]
  return self._m_type
end

BlenderBlend.DnaField.property.name = {}
function BlenderBlend.DnaField.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  self._m_name = self._parent._parent.names[self.idx_name + 1]
  return self._m_name
end


