-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- A structured binary format native to Minecraft for saving game data and transferring
-- it over the network (in multiplayer), such as player data
-- ([`<player>.dat`](https://minecraft.gamepedia.com/Player.dat_format); contains
-- e.g. player's inventory and location), saved worlds
-- ([`level.dat`](
--   https://minecraft.gamepedia.com/Java_Edition_level_format#level.dat_format
-- ) and [Chunk format](https://minecraft.gamepedia.com/Chunk_format#NBT_structure)),
-- list of saved multiplayer servers
-- ([`servers.dat`](https://minecraft.gamepedia.com/Servers.dat_format)) and so on -
-- see <https://minecraft.gamepedia.com/NBT_format#Uses>.
-- 
-- The entire file should be _gzip_-compressed (in accordance with the original
-- specification [NBT.txt](
--   https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
-- ) by Notch), but can also be compressed with _zlib_ or uncompressed.
-- 
-- This spec can only handle uncompressed NBT data, so be sure to first detect
-- what type of data you are dealing with. You can use the Unix `file` command
-- to do this:
-- 
-- ```shell
-- file --brief --mime-type input-unknown.nbt
-- ```
-- 
-- If it says:
-- 
--   * `application/gzip`, you can decompress it by
--     * `gunzip -c input-gzip.nbt > output.nbt` or
--     * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
--       gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
--   * `application/zlib`, you can use
--     * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
--     * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
--       zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
--   * something else (especially `image/x-pcx` and `application/octet-stream`),
--     it is most likely already uncompressed.
-- 
-- The file `output.nbt` generated by one of the above commands can already be
-- processed with this Kaitai Struct specification.
-- 
-- This spec **only** implements the Java edition format. There is also
-- a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
-- which uses little-endian encoding and has a few other differences, but it isn't
-- as popular as the Java edition format.
-- 
-- **Implementation note:** strings in `TAG_String` are incorrectly decoded with
-- standard UTF-8, while they are encoded in [**Modified UTF-8**](
--   https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
-- ) (MUTF-8). That's because MUTF-8 is not supported natively by most target
-- languages, and thus one must use external libraries to achieve a fully-compliant
-- decoder. But decoding in standard UTF-8 is still better than nothing, and
-- it usually works fine.
-- 
-- All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
-- U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
-- (all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
-- A _MUTF-8_-encoded string containing these code points cannot be successfully
-- decoded as UTF-8. The behavior in this case depends on the target language -
-- usually an exception is thrown, or the bytes that are not valid UTF-8
-- are replaced or ignored.
-- 
-- **Sample files:**
-- 
--   * <https://wiki.vg/NBT#Download>
--   * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
--   * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
--   * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>
-- See also: Source (https://wiki.vg/NBT)
-- See also: Source (https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt)
-- See also: Source (https://minecraft.gamepedia.com/NBT_format)
MinecraftNbt = class.class(KaitaiStruct)

MinecraftNbt.Tag = enum.Enum {
  end = 0,
  byte = 1,
  short = 2,
  int = 3,
  long = 4,
  float = 5,
  double = 6,
  byte_array = 7,
  string = 8,
  list = 9,
  compound = 10,
  int_array = 11,
  long_array = 12,
}

function MinecraftNbt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt:_read()
  if  ((self.root_type == MinecraftNbt.Tag.end) and (false))  then
    self.root_check = self._io:read_bytes(0)
  end
  self.root = MinecraftNbt.NamedTag(self._io, self, self._root)
end

MinecraftNbt.property.root_type = {}
function MinecraftNbt.property.root_type:get()
  if self._m_root_type ~= nil then
    return self._m_root_type
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_root_type = MinecraftNbt.Tag(self._io:read_u1())
  self._io:seek(_pos)
  if not(self.root_type == MinecraftNbt.Tag.compound) then
    error("not equal, expected " ..  MinecraftNbt.Tag.compound .. ", but got " .. self.root_type)
  end
  return self._m_root_type
end


MinecraftNbt.TagLongArray = class.class(KaitaiStruct)

function MinecraftNbt.TagLongArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagLongArray:_read()
  self.num_tags = self._io:read_s4be()
  self.tags = {}
  for i = 0, self.num_tags - 1 do
    self.tags[i + 1] = self._io:read_s8be()
  end
end

MinecraftNbt.TagLongArray.property.tags_type = {}
function MinecraftNbt.TagLongArray.property.tags_type:get()
  if self._m_tags_type ~= nil then
    return self._m_tags_type
  end

  self._m_tags_type = MinecraftNbt.Tag.long
  return self._m_tags_type
end


MinecraftNbt.TagByteArray = class.class(KaitaiStruct)

function MinecraftNbt.TagByteArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagByteArray:_read()
  self.len_data = self._io:read_s4be()
  self.data = self._io:read_bytes(self.len_data)
end


MinecraftNbt.TagIntArray = class.class(KaitaiStruct)

function MinecraftNbt.TagIntArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagIntArray:_read()
  self.num_tags = self._io:read_s4be()
  self.tags = {}
  for i = 0, self.num_tags - 1 do
    self.tags[i + 1] = self._io:read_s4be()
  end
end

MinecraftNbt.TagIntArray.property.tags_type = {}
function MinecraftNbt.TagIntArray.property.tags_type:get()
  if self._m_tags_type ~= nil then
    return self._m_tags_type
  end

  self._m_tags_type = MinecraftNbt.Tag.int
  return self._m_tags_type
end


MinecraftNbt.TagList = class.class(KaitaiStruct)

function MinecraftNbt.TagList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagList:_read()
  self.tags_type = MinecraftNbt.Tag(self._io:read_u1())
  self.num_tags = self._io:read_s4be()
  self.tags = {}
  for i = 0, self.num_tags - 1 do
    local _on = self.tags_type
    if _on == MinecraftNbt.Tag.long_array then
      self.tags[i + 1] = MinecraftNbt.TagLongArray(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.compound then
      self.tags[i + 1] = MinecraftNbt.TagCompound(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.double then
      self.tags[i + 1] = self._io:read_f8be()
    elseif _on == MinecraftNbt.Tag.list then
      self.tags[i + 1] = MinecraftNbt.TagList(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.float then
      self.tags[i + 1] = self._io:read_f4be()
    elseif _on == MinecraftNbt.Tag.short then
      self.tags[i + 1] = self._io:read_s2be()
    elseif _on == MinecraftNbt.Tag.int then
      self.tags[i + 1] = self._io:read_s4be()
    elseif _on == MinecraftNbt.Tag.byte_array then
      self.tags[i + 1] = MinecraftNbt.TagByteArray(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.byte then
      self.tags[i + 1] = self._io:read_s1()
    elseif _on == MinecraftNbt.Tag.int_array then
      self.tags[i + 1] = MinecraftNbt.TagIntArray(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.string then
      self.tags[i + 1] = MinecraftNbt.TagString(self._io, self, self._root)
    elseif _on == MinecraftNbt.Tag.long then
      self.tags[i + 1] = self._io:read_s8be()
    end
  end
end


MinecraftNbt.TagString = class.class(KaitaiStruct)

function MinecraftNbt.TagString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagString:_read()
  self.len_data = self._io:read_u2be()
  self.data = str_decode.decode(self._io:read_bytes(self.len_data), "utf-8")
end

-- 
-- unsigned according to https://wiki.vg/NBT#Specification.

MinecraftNbt.TagCompound = class.class(KaitaiStruct)

function MinecraftNbt.TagCompound:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MinecraftNbt.TagCompound:_read()
  self.tags = {}
  local i = 0
  while true do
    _ = MinecraftNbt.NamedTag(self._io, self, self._root)
    self.tags[i + 1] = _
    if _.is_tag_end then
      break
    end
    i = i + 1
  end
end

MinecraftNbt.TagCompound.property.dump_num_tags = {}
function MinecraftNbt.TagCompound.property.dump_num_tags:get()
if self._m_dump_num_tags ~= nil then
  return self._m_dump_num_tags
end

self._m_dump_num_tags = (#self.tags - utils.box_unwrap(( ((#self.tags >= 1) and (self.tags[#self.tags].is_tag_end)) ) and utils.box_wrap(1) or (0)))
return self._m_dump_num_tags
end


MinecraftNbt.NamedTag = class.class(KaitaiStruct)

function MinecraftNbt.NamedTag:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function MinecraftNbt.NamedTag:_read()
self.type = MinecraftNbt.Tag(self._io:read_u1())
if not(self.is_tag_end) then
  self.name = MinecraftNbt.TagString(self._io, self, self._root)
end
if not(self.is_tag_end) then
  local _on = self.type
  if _on == MinecraftNbt.Tag.long_array then
    self.payload = MinecraftNbt.TagLongArray(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.compound then
    self.payload = MinecraftNbt.TagCompound(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.double then
    self.payload = self._io:read_f8be()
  elseif _on == MinecraftNbt.Tag.list then
    self.payload = MinecraftNbt.TagList(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.float then
    self.payload = self._io:read_f4be()
  elseif _on == MinecraftNbt.Tag.short then
    self.payload = self._io:read_s2be()
  elseif _on == MinecraftNbt.Tag.int then
    self.payload = self._io:read_s4be()
  elseif _on == MinecraftNbt.Tag.byte_array then
    self.payload = MinecraftNbt.TagByteArray(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.byte then
    self.payload = self._io:read_s1()
  elseif _on == MinecraftNbt.Tag.int_array then
    self.payload = MinecraftNbt.TagIntArray(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.string then
    self.payload = MinecraftNbt.TagString(self._io, self, self._root)
  elseif _on == MinecraftNbt.Tag.long then
    self.payload = self._io:read_s8be()
  end
end
end

MinecraftNbt.NamedTag.property.is_tag_end = {}
function MinecraftNbt.NamedTag.property.is_tag_end:get()
if self._m_is_tag_end ~= nil then
  return self._m_is_tag_end
end

self._m_is_tag_end = self.type == MinecraftNbt.Tag.end
return self._m_is_tag_end
end


