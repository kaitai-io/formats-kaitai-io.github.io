-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Direct Internet Message Encapsulation (DIME)
-- is an old Microsoft specification for sending and receiving
-- SOAP messages along with additional attachments,
-- like binary files, XML fragments, and even other
-- SOAP messages, using standard transport protocols like HTTP.
-- 
-- Sample file: `curl -LO
-- https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
-- && gunzip scanner_withoptions.dump.gz`
-- See also: Source (https://tools.ietf.org/html/draft-nielsen-dime-02)
-- See also: Source (https://docs.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime)
-- See also: Source (http://imrannazar.com/Parsing-the-DIME-Message-Format)
DimeMessage = class.class(KaitaiStruct)

DimeMessage.TypeFormats = enum.Enum {
  unchanged = 0,
  media_type = 1,
  absolute_uri = 2,
  unknown = 3,
  none = 4,
}

function DimeMessage:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DimeMessage:_read()
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = DimeMessage.Record(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- padding to the next 4-byte boundary.
DimeMessage.Padding = class.class(KaitaiStruct)

function DimeMessage.Padding:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DimeMessage.Padding:_read()
  self.boundary_padding = self._io:read_bytes((-(self._io:pos()) % 4))
end


-- 
-- the option field of the record.
DimeMessage.OptionField = class.class(KaitaiStruct)

function DimeMessage.OptionField:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DimeMessage.OptionField:_read()
  self.option_elements = {}
  local i = 0
  while not self._io:is_eof() do
    self.option_elements[i + 1] = DimeMessage.OptionElement(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- one element of the option field.
DimeMessage.OptionElement = class.class(KaitaiStruct)

function DimeMessage.OptionElement:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DimeMessage.OptionElement:_read()
  self.element_format = self._io:read_u2be()
  self.len_element = self._io:read_u2be()
  self.element_data = self._io:read_bytes(self.len_element)
end


-- 
-- each individual fragment of the message.
DimeMessage.Record = class.class(KaitaiStruct)

function DimeMessage.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DimeMessage.Record:_read()
  self.version = self._io:read_bits_int_be(5)
  self.is_first_record = self._io:read_bits_int_be(1) ~= 0
  self.is_last_record = self._io:read_bits_int_be(1) ~= 0
  self.is_chunk_record = self._io:read_bits_int_be(1) ~= 0
  self.type_format = DimeMessage.TypeFormats(self._io:read_bits_int_be(4))
  self.reserved = self._io:read_bits_int_be(4)
  self._io:align_to_byte()
  self.len_options = self._io:read_u2be()
  self.len_id = self._io:read_u2be()
  self.len_type = self._io:read_u2be()
  self.len_data = self._io:read_u4be()
  self._raw_options = self._io:read_bytes(self.len_options)
  local _io = KaitaiStream(stringstream(self._raw_options))
  self.options = DimeMessage.OptionField(_io, self, self._root)
  self.options_padding = DimeMessage.Padding(self._io, self, self._root)
  self.id = str_decode.decode(self._io:read_bytes(self.len_id), "ASCII")
  self.id_padding = DimeMessage.Padding(self._io, self, self._root)
  self.type = str_decode.decode(self._io:read_bytes(self.len_type), "ASCII")
  self.type_padding = DimeMessage.Padding(self._io, self, self._root)
  self.data = self._io:read_bytes(self.len_data)
  self.data_padding = DimeMessage.Padding(self._io, self, self._root)
end

-- 
-- DIME format version (always 1).
-- 
-- Set if this is the first record in the message.
-- 
-- Set if this is the last record in the message.
-- 
-- Set if the file contained in this record is chunked into multiple records.
-- 
-- Indicates the structure and format of the value of the TYPE field.
-- 
-- Reserved for future use.
-- 
-- Length of the Options field.
-- 
-- Length of the ID field.
-- 
-- Length of the Type field.
-- 
-- Length of the Data field.
-- 
-- Unique identifier of the file (set in the first record of file).
-- 
-- Specified type in the format set with type_format.
-- 
-- The file data.

