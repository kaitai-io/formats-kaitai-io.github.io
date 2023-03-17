-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")

-- 
-- Format mostly used by Google Chrome and various Android apps to store
-- resources such as translated strings, help messages and images.
-- See also: Source (https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings)
-- See also: Source (https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py)
-- See also: Source (https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py)
ChromePak = class.class(KaitaiStruct)

ChromePak.Encodings = enum.Enum {
  binary = 0,
  utf8 = 1,
  utf16 = 2,
}

function ChromePak:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ChromePak:_read()
  self.version = self._io:read_u4le()
  if not( ((self.version == 4) or (self.version == 5)) ) then
    error("ValidationNotAnyOfError")
  end
  if self.version == 4 then
    self.num_resources_v4 = self._io:read_u4le()
  end
  self.encoding = ChromePak.Encodings(self._io:read_u1())
  if self.version == 5 then
    self.v5_part = ChromePak.HeaderV5Part(self._io, self, self._root)
  end
  self.resources = {}
  for i = 0, (self.num_resources + 1) - 1 do
    self.resources[i + 1] = ChromePak.Resource(i, i < self.num_resources, self._io, self, self._root)
  end
  self.aliases = {}
  for i = 0, self.num_aliases - 1 do
    self.aliases[i + 1] = ChromePak.Alias(self._io, self, self._root)
  end
end

ChromePak.property.num_resources = {}
function ChromePak.property.num_resources:get()
  if self._m_num_resources ~= nil then
    return self._m_num_resources
  end

  self._m_num_resources = utils.box_unwrap((self.version == 5) and utils.box_wrap(self.v5_part.num_resources) or (self.num_resources_v4))
  return self._m_num_resources
end

ChromePak.property.num_aliases = {}
function ChromePak.property.num_aliases:get()
  if self._m_num_aliases ~= nil then
    return self._m_num_aliases
  end

  self._m_num_aliases = utils.box_unwrap((self.version == 5) and utils.box_wrap(self.v5_part.num_aliases) or (0))
  return self._m_num_aliases
end

-- 
-- only versions 4 and 5 are supported.
-- 
-- Character encoding of all text resources in the PAK file. Note that
-- the file can **always** contain binary resources, this only applies to
-- those that are supposed to hold text.
-- 
-- In practice, this will probably always be `encodings::utf8` - I haven't
-- seen any organic file that would state otherwise. `UTF8` is also usually
-- hardcoded in Python scripts from the GRIT repository that generate .pak
-- files (for example
-- [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
-- 
-- The length is calculated by looking at the offset of
-- the next item, so an extra entry is stored with id 0
-- and offset pointing to the end of the resources.

ChromePak.HeaderV5Part = class.class(KaitaiStruct)

function ChromePak.HeaderV5Part:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ChromePak.HeaderV5Part:_read()
  self.encoding_padding = self._io:read_bytes(3)
  self.num_resources = self._io:read_u2le()
  self.num_aliases = self._io:read_u2le()
end


ChromePak.Resource = class.class(KaitaiStruct)

function ChromePak.Resource:_init(idx, has_body, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self.has_body = has_body
  self:_read()
end

function ChromePak.Resource:_read()
  self.id = self._io:read_u2le()
  self.ofs_body = self._io:read_u4le()
end

-- 
-- MUST NOT be accessed until the next `resource` is parsed.
ChromePak.Resource.property.len_body = {}
function ChromePak.Resource.property.len_body:get()
  if self._m_len_body ~= nil then
    return self._m_len_body
  end

  if self.has_body then
    self._m_len_body = (self._parent.resources[(self.idx + 1) + 1].ofs_body - self.ofs_body)
  end
  return self._m_len_body
end

-- 
-- MUST NOT be accessed until the next `resource` is parsed.
ChromePak.Resource.property.body = {}
function ChromePak.Resource.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  if self.has_body then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_body)
    self._m_body = self._io:read_bytes(self.len_body)
    self._io:seek(_pos)
  end
  return self._m_body
end


ChromePak.Alias = class.class(KaitaiStruct)

function ChromePak.Alias:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ChromePak.Alias:_read()
  self.id = self._io:read_u2le()
  self.resource_idx = self._io:read_u2le()
  if not(self.resource_idx <= (self._parent.num_resources - 1)) then
    error("ValidationGreaterThanError")
  end
end

ChromePak.Alias.property.resource = {}
function ChromePak.Alias.property.resource:get()
  if self._m_resource ~= nil then
    return self._m_resource
  end

  self._m_resource = self._parent.resources[self.resource_idx + 1]
  return self._m_resource
end


