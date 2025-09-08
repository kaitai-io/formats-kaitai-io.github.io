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
-- ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
-- Rules) is a standard-backed serialization scheme used in many
-- different use-cases. Particularly popular usage scenarios are X.509
-- certificates and some telecommunication / networking protocols.
-- 
-- DER is self-describing encoding scheme which allows representation
-- of simple, atomic data elements, such as strings and numbers, and
-- complex objects, such as sequences of other elements.
-- 
-- DER is a subset of BER (Basic Encoding Rules), with an emphasis on
-- being non-ambiguous: there's always exactly one canonical way to
-- encode a data structure defined in terms of ASN.1 using DER.
-- 
-- This spec allows full parsing of format syntax, but to understand
-- the semantics, one would typically require a dictionary of Object
-- Identifiers (OIDs), to match OID bodies against some human-readable
-- list of constants. OIDs are covered by many different standards,
-- so typically it's simpler to use a pre-compiled list of them, such
-- as:
-- 
-- * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
-- * <http://oid-info.com/>
-- * <https://www.alvestrand.no/objectid/top.html>
-- See also: Source (https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&lang=en)
Asn1Der = class.class(KaitaiStruct)

Asn1Der.TypeTag = enum.Enum {
  end_of_content = 0,
  boolean = 1,
  integer = 2,
  bit_string = 3,
  octet_string = 4,
  null_value = 5,
  object_id = 6,
  object_descriptor = 7,
  external = 8,
  real = 9,
  enumerated = 10,
  embedded_pdv = 11,
  utf8string = 12,
  relative_oid = 13,
  sequence_10 = 16,
  printable_string = 19,
  ia5string = 22,
  sequence_30 = 48,
  set = 49,
}

function Asn1Der:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Asn1Der:_read()
  self.type_tag = Asn1Der.TypeTag(self._io:read_u1())
  self.len = Asn1Der.LenEncoded(self._io, self, self._root)
  local _on = self.type_tag
  if _on == Asn1Der.TypeTag.object_id then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodyObjectId(_io, self, self._root)
  elseif _on == Asn1Der.TypeTag.printable_string then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodyPrintableString(_io, self, self._root)
  elseif _on == Asn1Der.TypeTag.sequence_10 then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodySequence(_io, self, self._root)
  elseif _on == Asn1Der.TypeTag.sequence_30 then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodySequence(_io, self, self._root)
  elseif _on == Asn1Der.TypeTag.set then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodySequence(_io, self, self._root)
  elseif _on == Asn1Der.TypeTag.utf8string then
    self._raw_body = self._io:read_bytes(self.len.result)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der.BodyUtf8string(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len.result)
  end
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier)
Asn1Der.BodyObjectId = class.class(KaitaiStruct)

function Asn1Der.BodyObjectId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Asn1Der.BodyObjectId:_read()
  self.first_and_second = self._io:read_u1()
  self.rest = self._io:read_bytes_full()
end

Asn1Der.BodyObjectId.property.first = {}
function Asn1Der.BodyObjectId.property.first:get()
  if self._m_first ~= nil then
    return self._m_first
  end

  self._m_first = math.floor(self.first_and_second / 40)
  return self._m_first
end

Asn1Der.BodyObjectId.property.second = {}
function Asn1Der.BodyObjectId.property.second:get()
  if self._m_second ~= nil then
    return self._m_second
  end

  self._m_second = self.first_and_second % 40
  return self._m_second
end


Asn1Der.BodyPrintableString = class.class(KaitaiStruct)

function Asn1Der.BodyPrintableString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Asn1Der.BodyPrintableString:_read()
  self.str = str_decode.decode(self._io:read_bytes_full(), "ASCII")
end


Asn1Der.BodySequence = class.class(KaitaiStruct)

function Asn1Der.BodySequence:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Asn1Der.BodySequence:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Asn1Der(self._io, self, self._root)
    i = i + 1
  end
end


Asn1Der.BodyUtf8string = class.class(KaitaiStruct)

function Asn1Der.BodyUtf8string:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Asn1Der.BodyUtf8string:_read()
  self.str = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


Asn1Der.LenEncoded = class.class(KaitaiStruct)

function Asn1Der.LenEncoded:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Asn1Der.LenEncoded:_read()
  self.b1 = self._io:read_u1()
  if self.b1 == 130 then
    self.int2 = self._io:read_u2be()
  end
  if self.b1 == 129 then
    self.int1 = self._io:read_u1()
  end
end

Asn1Der.LenEncoded.property.result = {}
function Asn1Der.LenEncoded.property.result:get()
  if self._m_result ~= nil then
    return self._m_result
  end

  self._m_result = utils.box_unwrap((self.b1 == 129) and utils.box_wrap(self.int1) or (utils.box_unwrap((self.b1 == 130) and utils.box_wrap(self.int2) or (self.b1))))
  return self._m_result
end


