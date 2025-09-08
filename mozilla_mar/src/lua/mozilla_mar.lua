-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
-- Test files can be found on Mozilla's FTP site, for example:
-- 
-- <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
-- See also: Source (https://wiki.mozilla.org/Software_Update:MAR)
MozillaMar = class.class(KaitaiStruct)

MozillaMar.BlockIdentifiers = enum.Enum {
  product_information = 1,
}

MozillaMar.SignatureAlgorithms = enum.Enum {
  rsa_pkcs1_sha1 = 1,
  rsa_pkcs1_sha384 = 2,
}

function MozillaMar:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MozillaMar:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\077\065\082\049") then
    error("not equal, expected " .. "\077\065\082\049" .. ", but got " .. self.magic)
  end
  self.ofs_index = self._io:read_u4be()
  self.file_size = self._io:read_u8be()
  self.len_signatures = self._io:read_u4be()
  self.signatures = {}
  for i = 0, self.len_signatures - 1 do
    self.signatures[i + 1] = MozillaMar.Signature(self._io, self, self._root)
  end
  self.len_additional_sections = self._io:read_u4be()
  self.additional_sections = {}
  for i = 0, self.len_additional_sections - 1 do
    self.additional_sections[i + 1] = MozillaMar.AdditionalSection(self._io, self, self._root)
  end
end

MozillaMar.property.index = {}
function MozillaMar.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_index)
  self._m_index = MozillaMar.MarIndex(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_index
end


MozillaMar.AdditionalSection = class.class(KaitaiStruct)

function MozillaMar.AdditionalSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.AdditionalSection:_read()
  self.len_block = self._io:read_u4be()
  self.block_identifier = MozillaMar.BlockIdentifiers(self._io:read_u4be())
  local _on = self.block_identifier
  if _on == MozillaMar.BlockIdentifiers.product_information then
    self._raw_bytes = self._io:read_bytes((self.len_block - 4) - 4)
    local _io = KaitaiStream(stringstream(self._raw_bytes))
    self.bytes = MozillaMar.ProductInformationBlock(_io, self, self._root)
  else
    self.bytes = self._io:read_bytes((self.len_block - 4) - 4)
  end
end


MozillaMar.IndexEntries = class.class(KaitaiStruct)

function MozillaMar.IndexEntries:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.IndexEntries:_read()
  self.index_entry = {}
  local i = 0
  while not self._io:is_eof() do
    self.index_entry[i + 1] = MozillaMar.IndexEntry(self._io, self, self._root)
    i = i + 1
  end
end


MozillaMar.IndexEntry = class.class(KaitaiStruct)

function MozillaMar.IndexEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.IndexEntry:_read()
  self.ofs_content = self._io:read_u4be()
  self.len_content = self._io:read_u4be()
  self.flags = self._io:read_u4be()
  self.file_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
end

MozillaMar.IndexEntry.property.body = {}
function MozillaMar.IndexEntry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_content)
  self._m_body = _io:read_bytes(self.len_content)
  _io:seek(_pos)
  return self._m_body
end

-- 
-- File permission bits (in standard unix-style format).

MozillaMar.MarIndex = class.class(KaitaiStruct)

function MozillaMar.MarIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.MarIndex:_read()
  self.len_index = self._io:read_u4be()
  self._raw_index_entries = self._io:read_bytes(self.len_index)
  local _io = KaitaiStream(stringstream(self._raw_index_entries))
  self.index_entries = MozillaMar.IndexEntries(_io, self, self._root)
end


MozillaMar.ProductInformationBlock = class.class(KaitaiStruct)

function MozillaMar.ProductInformationBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.ProductInformationBlock:_read()
  self.mar_channel_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(64), 0, false), "UTF-8")
  self.product_version = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(32), 0, false), "UTF-8")
end


MozillaMar.Signature = class.class(KaitaiStruct)

function MozillaMar.Signature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MozillaMar.Signature:_read()
  self.algorithm = MozillaMar.SignatureAlgorithms(self._io:read_u4be())
  self.len_signature = self._io:read_u4be()
  self.signature = self._io:read_bytes(self.len_signature)
end


