-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
-- Flash) to encode rich interactive multimedia content and are,
-- essentially, a container for special bytecode instructions to play
-- back that content. In early 2000s, it was dominant rich multimedia
-- web format (.swf files were integrated into web pages and played
-- back with a browser plugin), but its usage largely declined in
-- 2010s, as HTML5 and performant browser-native solutions
-- (i.e. JavaScript engines and graphical approaches, such as WebGL)
-- emerged.
-- 
-- There are a lot of versions of SWF (~36), format is somewhat
-- documented by Adobe.
-- See also: Source (https://open-flash.github.io/mirrors/swf-spec-19.pdf)
Swf = class.class(KaitaiStruct)

Swf.Compressions = enum.Enum {
  zlib = 67,
  none = 70,
  lzma = 90,
}

Swf.TagType = enum.Enum {
  end_of_file = 0,
  place_object = 4,
  remove_object = 5,
  set_background_color = 9,
  define_sound = 14,
  place_object2 = 26,
  remove_object2 = 28,
  frame_label = 43,
  export_assets = 56,
  script_limits = 65,
  file_attributes = 69,
  place_object3 = 70,
  symbol_class = 76,
  metadata = 77,
  define_scaling_grid = 78,
  do_abc = 82,
  define_scene_and_frame_label_data = 86,
}

function Swf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf:_read()
  self.compression = Swf.Compressions(self._io:read_u1())
  self.signature = self._io:read_bytes(2)
  if not(self.signature == "\087\083") then
    error("not equal, expected " ..  "\087\083" .. ", but got " .. self.signature)
  end
  self.version = self._io:read_u1()
  self.len_file = self._io:read_u4le()
  if self.compression == Swf.Compressions.none then
    self._raw_plain_body = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_plain_body))
    self.plain_body = Swf.SwfBody(_io, self, self._root)
  end
  if self.compression == Swf.Compressions.zlib then
    self._raw__raw_zlib_body = self._io:read_bytes_full()
    self._raw_zlib_body = KaitaiStream.process_zlib(self._raw__raw_zlib_body)
    local _io = KaitaiStream(stringstream(self._raw_zlib_body))
    self.zlib_body = Swf.SwfBody(_io, self, self._root)
  end
end


Swf.Rgb = class.class(KaitaiStruct)

function Swf.Rgb:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.Rgb:_read()
  self.r = self._io:read_u1()
  self.g = self._io:read_u1()
  self.b = self._io:read_u1()
end


Swf.DoAbcBody = class.class(KaitaiStruct)

function Swf.DoAbcBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.DoAbcBody:_read()
  self.flags = self._io:read_u4le()
  self.name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
  self.abcdata = self._io:read_bytes_full()
end


Swf.SwfBody = class.class(KaitaiStruct)

function Swf.SwfBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.SwfBody:_read()
  self.rect = Swf.Rect(self._io, self, self._root)
  self.frame_rate = self._io:read_u2le()
  self.frame_count = self._io:read_u2le()
  if self._root.version >= 8 then
    self.file_attributes_tag = Swf.Tag(self._io, self, self._root)
  end
  self.tags = {}
  local i = 0
  while not self._io:is_eof() do
    self.tags[i + 1] = Swf.Tag(self._io, self, self._root)
    i = i + 1
  end
end


Swf.Rect = class.class(KaitaiStruct)

function Swf.Rect:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.Rect:_read()
  self.b1 = self._io:read_u1()
  self.skip = self._io:read_bytes(self.num_bytes)
end

Swf.Rect.property.num_bits = {}
function Swf.Rect.property.num_bits:get()
  if self._m_num_bits ~= nil then
    return self._m_num_bits
  end

  self._m_num_bits = (self.b1 >> 3)
  return self._m_num_bits
end

Swf.Rect.property.num_bytes = {}
function Swf.Rect.property.num_bytes:get()
  if self._m_num_bytes ~= nil then
    return self._m_num_bytes
  end

  self._m_num_bytes = math.floor((((self.num_bits * 4) - 3) + 7) / 8)
  return self._m_num_bytes
end


Swf.Tag = class.class(KaitaiStruct)

function Swf.Tag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.Tag:_read()
  self.record_header = Swf.RecordHeader(self._io, self, self._root)
  local _on = self.record_header.tag_type
  if _on == Swf.TagType.define_sound then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.DefineSoundBody(_io, self, self._root)
  elseif _on == Swf.TagType.set_background_color then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.Rgb(_io, self, self._root)
  elseif _on == Swf.TagType.script_limits then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.ScriptLimitsBody(_io, self, self._root)
  elseif _on == Swf.TagType.do_abc then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.DoAbcBody(_io, self, self._root)
  elseif _on == Swf.TagType.export_assets then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.SymbolClassBody(_io, self, self._root)
  elseif _on == Swf.TagType.symbol_class then
    self._raw_tag_body = self._io:read_bytes(self.record_header.len)
    local _io = KaitaiStream(stringstream(self._raw_tag_body))
    self.tag_body = Swf.SymbolClassBody(_io, self, self._root)
  else
    self.tag_body = self._io:read_bytes(self.record_header.len)
  end
end


Swf.SymbolClassBody = class.class(KaitaiStruct)

function Swf.SymbolClassBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.SymbolClassBody:_read()
  self.num_symbols = self._io:read_u2le()
  self.symbols = {}
  for i = 0, self.num_symbols - 1 do
    self.symbols[i + 1] = Swf.SymbolClassBody.Symbol(self._io, self, self._root)
  end
end


Swf.SymbolClassBody.Symbol = class.class(KaitaiStruct)

function Swf.SymbolClassBody.Symbol:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.SymbolClassBody.Symbol:_read()
  self.tag = self._io:read_u2le()
  self.name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


Swf.DefineSoundBody = class.class(KaitaiStruct)

Swf.DefineSoundBody.SamplingRates = enum.Enum {
  rate_5_5_khz = 0,
  rate_11_khz = 1,
  rate_22_khz = 2,
  rate_44_khz = 3,
}

Swf.DefineSoundBody.Bps = enum.Enum {
  sound_8_bit = 0,
  sound_16_bit = 1,
}

Swf.DefineSoundBody.Channels = enum.Enum {
  mono = 0,
  stereo = 1,
}

function Swf.DefineSoundBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.DefineSoundBody:_read()
  self.id = self._io:read_u2le()
  self.format = self._io:read_bits_int_be(4)
  self.sampling_rate = Swf.DefineSoundBody.SamplingRates(self._io:read_bits_int_be(2))
  self.bits_per_sample = Swf.DefineSoundBody.Bps(self._io:read_bits_int_be(1))
  self.num_channels = Swf.DefineSoundBody.Channels(self._io:read_bits_int_be(1))
  self._io:align_to_byte()
  self.num_samples = self._io:read_u4le()
end

-- 
-- Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.

Swf.RecordHeader = class.class(KaitaiStruct)

function Swf.RecordHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.RecordHeader:_read()
  self.tag_code_and_length = self._io:read_u2le()
  if self.small_len == 63 then
    self.big_len = self._io:read_s4le()
  end
end

Swf.RecordHeader.property.tag_type = {}
function Swf.RecordHeader.property.tag_type:get()
  if self._m_tag_type ~= nil then
    return self._m_tag_type
  end

  self._m_tag_type = Swf.TagType((self.tag_code_and_length >> 6))
  return self._m_tag_type
end

Swf.RecordHeader.property.small_len = {}
function Swf.RecordHeader.property.small_len:get()
  if self._m_small_len ~= nil then
    return self._m_small_len
  end

  self._m_small_len = (self.tag_code_and_length & 63)
  return self._m_small_len
end

Swf.RecordHeader.property.len = {}
function Swf.RecordHeader.property.len:get()
  if self._m_len ~= nil then
    return self._m_len
  end

  self._m_len = utils.box_unwrap((self.small_len == 63) and utils.box_wrap(self.big_len) or (self.small_len))
  return self._m_len
end


Swf.ScriptLimitsBody = class.class(KaitaiStruct)

function Swf.ScriptLimitsBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Swf.ScriptLimitsBody:_read()
  self.max_recursion_depth = self._io:read_u2le()
  self.script_timeout_seconds = self._io:read_u2le()
end


