-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
-- solution in free/open source software world to do i18n/l10n of
-- software, by providing translated strings that will substitute
-- strings in original language (typically, English).
-- 
-- gettext .mo is a binary database format which stores these string
-- translation pairs in an efficient binary format, ready to be used by
-- gettext-enabled software. .mo format is a result of compilation of
-- text-based .po files using
-- [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
-- utility. The reverse conversion (.mo -> .po) is also possible using
-- [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
-- decompiler utility.
-- See also: Source (https://gitlab.com/worr/libintl)
GettextMo = class.class(KaitaiStruct)

function GettextMo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GettextMo:_read()
  self.signature = self._io:read_bytes(4)
  self.mo = GettextMo.Mo(self._io, self, self._root)
end


GettextMo.HashLookupIteration = class.class(KaitaiStruct)

function GettextMo.HashLookupIteration:_init(idx, collision_step, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self.collision_step = collision_step
  self:_read()
end

function GettextMo.HashLookupIteration:_read()
end

GettextMo.HashLookupIteration.property.original = {}
function GettextMo.HashLookupIteration.property.original:get()
  if self._m_original ~= nil then
    return self._m_original
  end

  self._m_original = self._root.mo.originals[self.idx + 1].str
  return self._m_original
end

GettextMo.HashLookupIteration.property.translation = {}
function GettextMo.HashLookupIteration.property.translation:get()
  if self._m_translation ~= nil then
    return self._m_translation
  end

  self._m_translation = self._root.mo.translations[self.idx + 1].str
  return self._m_translation
end

GettextMo.HashLookupIteration.property.next_idx = {}
function GettextMo.HashLookupIteration.property.next_idx:get()
  if self._m_next_idx ~= nil then
    return self._m_next_idx
  end

  self._m_next_idx = ((self.idx + self.collision_step) - utils.box_unwrap((self.idx >= (self._root.mo.num_hashtable_items - self.collision_step)) and utils.box_wrap(self._root.mo.num_hashtable_items) or (0)))
  return self._m_next_idx
end

GettextMo.HashLookupIteration.property.next = {}
function GettextMo.HashLookupIteration.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_next = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.next_idx + 1].val, self.collision_step, self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_next
end


GettextMo.LookupIteration = class.class(KaitaiStruct)

function GettextMo.LookupIteration:_init(current, query, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.current = current
  self.query = query
  self:_read()
end

function GettextMo.LookupIteration:_read()
end

GettextMo.LookupIteration.property.found = {}
function GettextMo.LookupIteration.property.found:get()
  if self._m_found ~= nil then
    return self._m_found
  end

  self._m_found = self.query == self.current.original
  return self._m_found
end

GettextMo.LookupIteration.property.next = {}
function GettextMo.LookupIteration.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  if not(self.found) then
    local _pos = self._io:pos()
    self._io:seek(0)
    self._m_next = GettextMo.LookupIteration(self.current.next, self.query, self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_next
end


-- 
-- def lookup(s:str, t:gettext_mo.GettextMo):
--   try:
--     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
--     e=l.entry
--     while(not e.found):
--       e=e.next
--     return e.current
--   except:
--     raise Exception("Not found "+s+" in the hashtable!")
-- 
-- lookup(t.mo.originals[145].str, t)
-- See also: Source (https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c)
GettextMo.HashtableLookup = class.class(KaitaiStruct)

function GettextMo.HashtableLookup:_init(query, hash, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.query = query
  self.hash = hash
  self:_read()
end

function GettextMo.HashtableLookup:_read()
end

GettextMo.HashtableLookup.property.collision_step = {}
function GettextMo.HashtableLookup.property.collision_step:get()
  if self._m_collision_step ~= nil then
    return self._m_collision_step
  end

  self._m_collision_step = ((self.hash % (self._root.mo.num_hashtable_items - 2)) + 1)
  return self._m_collision_step
end

GettextMo.HashtableLookup.property.idx = {}
function GettextMo.HashtableLookup.property.idx:get()
  if self._m_idx ~= nil then
    return self._m_idx
  end

  self._m_idx = (self.hash % self._root.mo.num_hashtable_items)
  return self._m_idx
end

GettextMo.HashtableLookup.property.hash_lookup_iteration = {}
function GettextMo.HashtableLookup.property.hash_lookup_iteration:get()
  if self._m_hash_lookup_iteration ~= nil then
    return self._m_hash_lookup_iteration
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_hash_lookup_iteration = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.idx + 1].val, self.collision_step, self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_hash_lookup_iteration
end

GettextMo.HashtableLookup.property.entry = {}
function GettextMo.HashtableLookup.property.entry:get()
  if self._m_entry ~= nil then
    return self._m_entry
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_entry = GettextMo.LookupIteration(self.hash_lookup_iteration, self.query, self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_entry
end

-- 
-- def string_hash(s):
--   s=s.encode("utf-8")
--   h = 0
--   for i in range(len(s)):
--     h = h << 4
--     h += s[i]
--     tmp = h & 0xF0000000
--     if tmp != 0:
--       h ^= tmp
--       h ^= tmp >> 24
--   return h
-- See also: Source (https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c)

GettextMo.Mo = class.class(KaitaiStruct)

function GettextMo.Mo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GettextMo.Mo:_read()
  local _on = self._root.signature
  if _on == "\222\018\004\149" then
    self._is_le = true
  elseif _on == "\149\004\018\222" then
    self._is_le = false
  end

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function GettextMo.Mo:_read_le()
  self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
  self.num_translations = self._io:read_u4le()
  self.ofs_originals = self._io:read_u4le()
  self.ofs_translations = self._io:read_u4le()
  self.num_hashtable_items = self._io:read_u4le()
  self.ofs_hashtable_items = self._io:read_u4le()
end

function GettextMo.Mo:_read_be()
  self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
  self.num_translations = self._io:read_u4be()
  self.ofs_originals = self._io:read_u4be()
  self.ofs_translations = self._io:read_u4be()
  self.num_hashtable_items = self._io:read_u4be()
  self.ofs_hashtable_items = self._io:read_u4be()
end

GettextMo.Mo.property.originals = {}
function GettextMo.Mo.property.originals:get()
  if self._m_originals ~= nil then
    return self._m_originals
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_originals)
  if self._is_le then
    self._m_originals = {}
    for i = 0, self.num_translations - 1 do
      self._m_originals[i + 1] = GettextMo.Mo.Descriptor(_io, self, self._root, self._is_le)
    end
  else
    self._m_originals = {}
    for i = 0, self.num_translations - 1 do
      self._m_originals[i + 1] = GettextMo.Mo.Descriptor(_io, self, self._root, self._is_le)
    end
  end
  _io:seek(_pos)
  return self._m_originals
end

GettextMo.Mo.property.translations = {}
function GettextMo.Mo.property.translations:get()
  if self._m_translations ~= nil then
    return self._m_translations
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_translations)
  if self._is_le then
    self._m_translations = {}
    for i = 0, self.num_translations - 1 do
      self._m_translations[i + 1] = GettextMo.Mo.Descriptor(_io, self, self._root, self._is_le)
    end
  else
    self._m_translations = {}
    for i = 0, self.num_translations - 1 do
      self._m_translations[i + 1] = GettextMo.Mo.Descriptor(_io, self, self._root, self._is_le)
    end
  end
  _io:seek(_pos)
  return self._m_translations
end

GettextMo.Mo.property.hashtable_items = {}
function GettextMo.Mo.property.hashtable_items:get()
  if self._m_hashtable_items ~= nil then
    return self._m_hashtable_items
  end

  if self.ofs_hashtable_items ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_hashtable_items)
    if self._is_le then
      self._m_hashtable_items = {}
      for i = 0, self.num_hashtable_items - 1 do
        self._m_hashtable_items[i + 1] = GettextMo.Mo.HashtableItem(_io, self, self._root, self._is_le)
      end
    else
      self._m_hashtable_items = {}
      for i = 0, self.num_hashtable_items - 1 do
        self._m_hashtable_items[i + 1] = GettextMo.Mo.HashtableItem(_io, self, self._root, self._is_le)
      end
    end
    _io:seek(_pos)
  end
  return self._m_hashtable_items
end


GettextMo.Mo.Version = class.class(KaitaiStruct)

function GettextMo.Mo.Version:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function GettextMo.Mo.Version:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function GettextMo.Mo.Version:_read_le()
  self.version_raw = self._io:read_u4le()
end

function GettextMo.Mo.Version:_read_be()
  self.version_raw = self._io:read_u4be()
end

GettextMo.Mo.Version.property.major = {}
function GettextMo.Mo.Version.property.major:get()
  if self._m_major ~= nil then
    return self._m_major
  end

  self._m_major = (self.version_raw >> 16)
  return self._m_major
end

GettextMo.Mo.Version.property.minor = {}
function GettextMo.Mo.Version.property.minor:get()
  if self._m_minor ~= nil then
    return self._m_minor
  end

  self._m_minor = (self.version_raw & 65535)
  return self._m_minor
end


GettextMo.Mo.HashtableItem = class.class(KaitaiStruct)

function GettextMo.Mo.HashtableItem:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function GettextMo.Mo.HashtableItem:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function GettextMo.Mo.HashtableItem:_read_le()
  self.raw_val = self._io:read_u4le()
end

function GettextMo.Mo.HashtableItem:_read_be()
  self.raw_val = self._io:read_u4be()
end

GettextMo.Mo.HashtableItem.property.mask = {}
function GettextMo.Mo.HashtableItem.property.mask:get()
  if self._m_mask ~= nil then
    return self._m_mask
  end

  self._m_mask = 2147483648
  return self._m_mask
end

GettextMo.Mo.HashtableItem.property.val_1 = {}
function GettextMo.Mo.HashtableItem.property.val_1:get()
  if self._m_val_1 ~= nil then
    return self._m_val_1
  end

  if self.raw_val ~= 0 then
    self._m_val_1 = (self.raw_val - 1)
  end
  return self._m_val_1
end

GettextMo.Mo.HashtableItem.property.is_system_dependent = {}
function GettextMo.Mo.HashtableItem.property.is_system_dependent:get()
  if self._m_is_system_dependent ~= nil then
    return self._m_is_system_dependent
  end

  if self.raw_val ~= 0 then
    self._m_is_system_dependent = (self.val_1 & self.mask) == 1
  end
  return self._m_is_system_dependent
end

GettextMo.Mo.HashtableItem.property.val = {}
function GettextMo.Mo.HashtableItem.property.val:get()
  if self._m_val ~= nil then
    return self._m_val
  end

  if self.raw_val ~= 0 then
    self._m_val = (self.val_1 & ~(self.mask))
  end
  return self._m_val
end


GettextMo.Mo.Descriptor = class.class(KaitaiStruct)

function GettextMo.Mo.Descriptor:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function GettextMo.Mo.Descriptor:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function GettextMo.Mo.Descriptor:_read_le()
  self.len_str = self._io:read_u4le()
  self.ofs_str = self._io:read_u4le()
end

function GettextMo.Mo.Descriptor:_read_be()
  self.len_str = self._io:read_u4be()
  self.ofs_str = self._io:read_u4be()
end

GettextMo.Mo.Descriptor.property.str = {}
function GettextMo.Mo.Descriptor.property.str:get()
  if self._m_str ~= nil then
    return self._m_str
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_str)
  if self._is_le then
    self._m_str = str_decode.decode(KaitaiStream.bytes_terminate(_io:read_bytes(self.len_str), 0, false), "UTF-8")
  else
    self._m_str = str_decode.decode(KaitaiStream.bytes_terminate(_io:read_bytes(self.len_str), 0, false), "UTF-8")
  end
  _io:seek(_pos)
  return self._m_str
end


