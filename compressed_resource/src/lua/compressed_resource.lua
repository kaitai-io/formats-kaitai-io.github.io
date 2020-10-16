-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

require("bytes_with_io")
-- 
-- Compressed Macintosh resource data,
-- as stored in resources with the "compressed" attribute.
-- 
-- Resource decompression is not documented by Apple.
-- It is mostly used internally in System 7,
-- some of Apple's own applications (such as ResEdit),
-- and also by some third-party applications.
-- Later versions of Classic Mac OS make less use of resource compression,
-- but still support it fully for backwards compatibility.
-- Carbon in Mac OS X no longer supports resource compression in any way.
-- 
-- The data of all compressed resources starts with a common header,
-- followed by the compressed data.
-- The data is decompressed using code in a `'dcmp'` resource.
-- Some decompressors used by Apple are included in the System file,
-- but applications can also include custom decompressors.
-- The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
-- along with some parameters for the decompressor.
-- See also: Source (http://www.alysis.us/arctechnology.htm)
-- See also: Source (http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html)
-- See also: Source (https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress)
CompressedResource = class.class(KaitaiStruct)

function CompressedResource:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CompressedResource:_read()
  self.header = CompressedResource.Header(self._io, self, self._root)
  self.compressed_data = self._io:read_bytes_full()
end

-- 
-- The header of the compressed data.
-- 
-- The compressed resource data.
-- 
-- The format of this data is completely dependent on the decompressor and its parameters,
-- as specified in the header.
-- For details about the compressed data formats implemented by Apple's decompressors,
-- see the specs in the resource_compression subdirectory.

-- 
-- Compressed resource data header,
-- as stored at the start of all compressed resources.
CompressedResource.Header = class.class(KaitaiStruct)

function CompressedResource.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CompressedResource.Header:_read()
  self.common_part = CompressedResource.Header.CommonPart(self._io, self, self._root)
  self._raw_type_specific_part_raw_with_io = self._io:read_bytes((self.common_part.len_header - 12))
  local _io = KaitaiStream(stringstream(self._raw_type_specific_part_raw_with_io))
  self.type_specific_part_raw_with_io = BytesWithIo(_io)
end

-- 
-- The type-specific part of the header,
-- as a raw byte array.
CompressedResource.Header.property.type_specific_part_raw = {}
function CompressedResource.Header.property.type_specific_part_raw:get()
  if self._m_type_specific_part_raw ~= nil then
    return self._m_type_specific_part_raw
  end

  self._m_type_specific_part_raw = self.type_specific_part_raw_with_io.data
  return self._m_type_specific_part_raw
end

-- 
-- The type-specific part of the header,
-- parsed according to the type from the common part.
CompressedResource.Header.property.type_specific_part = {}
function CompressedResource.Header.property.type_specific_part:get()
  if self._m_type_specific_part ~= nil then
    return self._m_type_specific_part
  end

  local _io = self.type_specific_part_raw_with_io._io
  local _pos = _io:pos()
  _io:seek(0)
  local _on = self.common_part.header_type
  if _on == 8 then
    self._m_type_specific_part = CompressedResource.Header.TypeSpecificPartType8(_io, self, self._root)
  elseif _on == 9 then
    self._m_type_specific_part = CompressedResource.Header.TypeSpecificPartType9(_io, self, self._root)
  end
  _io:seek(_pos)
  return self._m_type_specific_part
end

-- 
-- The common part of the header.
-- Among other things,
-- this part contains the header type,
-- which determines the format of the data in the type-specific part of the header.
-- 
-- Use `type_specific_part_raw` instead,
-- unless you need access to this field's `_io`.

-- 
-- The common part of a compressed resource data header.
-- The format of this part is the same for all compressed resources.
CompressedResource.Header.CommonPart = class.class(KaitaiStruct)

function CompressedResource.Header.CommonPart:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CompressedResource.Header.CommonPart:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\168\159\101\114") then
    error("not equal, expected " ..  "\168\159\101\114" .. ", but got " .. self.magic)
  end
  self.len_header = self._io:read_u2be()
  if not(self.len_header == 18) then
    error("not equal, expected " ..  18 .. ", but got " .. self.len_header)
  end
  self.header_type = self._io:read_u1()
  self.unknown = self._io:read_u1()
  if not(self.unknown == 1) then
    error("not equal, expected " ..  1 .. ", but got " .. self.unknown)
  end
  self.len_decompressed = self._io:read_u4be()
end

-- 
-- The signature of all compressed resource data.
-- 
-- When interpreted as MacRoman, this byte sequence decodes to `®üer`.
-- 
-- The byte length of the entire header (common and type-specific parts).
-- 
-- The meaning of this field is mostly a guess,
-- as all known header types result in a total length of `0x12`.
-- 
-- Type of the header.
-- This determines the format of the data in the type-specific part of the header.
-- 
-- The only known header type values are `8` and `9`.
-- 
-- Every known decompressor is only compatible with one of the header types
-- (but every header type is used by more than one decompressor).
-- Apple's decompressors with IDs 0 and 1 use header type 8,
-- and those with IDs 2 and 3 use header type 9.
-- 
-- The meaning of this field is not known.
-- It has the value `0x01` in all known compressed resources.
-- 
-- The byte length of the data after decompression.

-- 
-- The type-specific part of a compressed resource header with header type `8`.
CompressedResource.Header.TypeSpecificPartType8 = class.class(KaitaiStruct)

function CompressedResource.Header.TypeSpecificPartType8:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CompressedResource.Header.TypeSpecificPartType8:_read()
  self.working_buffer_fractional_size = self._io:read_u1()
  self.expansion_buffer_size = self._io:read_u1()
  self.decompressor_id = self._io:read_s2be()
  self.reserved = self._io:read_u2be()
  if not(self.reserved == 0) then
    error("not equal, expected " ..  0 .. ", but got " .. self.reserved)
  end
end

-- 
-- The ratio of the compressed data size to the uncompressed data size,
-- times 256.
-- 
-- This parameter affects the amount of memory allocated by the Resource Manager during decompression,
-- but does not have a direct effect on the decompressor
-- (except that it will misbehave if insufficient memory is provided).
-- Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
-- 
-- The maximum number of bytes that the compressed data might "grow" during decompression.
-- 
-- This parameter affects the amount of memory allocated by the Resource Manager during decompression,
-- but does not have a direct effect on the decompressor
-- (except that it will misbehave if insufficient memory is provided).
-- Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
-- 
-- The ID of the `'dcmp'` resource that should be used to decompress this resource.
-- 
-- The meaning of this field is not known.
-- It has the value `0` in all known compressed resources,
-- so it is most likely reserved.

-- 
-- The type-specific part of a compressed resource header with header type `9`.
CompressedResource.Header.TypeSpecificPartType9 = class.class(KaitaiStruct)

function CompressedResource.Header.TypeSpecificPartType9:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CompressedResource.Header.TypeSpecificPartType9:_read()
  self.decompressor_id = self._io:read_s2be()
  self._raw_decompressor_specific_parameters_with_io = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_decompressor_specific_parameters_with_io))
  self.decompressor_specific_parameters_with_io = BytesWithIo(_io)
end

-- 
-- Decompressor-specific parameters.
-- The exact structure and meaning of this field is different for each decompressor.
-- 
-- This field always has the same length,
-- but decompressors don't always use the entirety of the field,
-- so depending on the decompressor some parts of this field may be meaningless.
CompressedResource.Header.TypeSpecificPartType9.property.decompressor_specific_parameters = {}
function CompressedResource.Header.TypeSpecificPartType9.property.decompressor_specific_parameters:get()
  if self._m_decompressor_specific_parameters ~= nil then
    return self._m_decompressor_specific_parameters
  end

  self._m_decompressor_specific_parameters = self.decompressor_specific_parameters_with_io.data
  return self._m_decompressor_specific_parameters
end

-- 
-- The ID of the `'dcmp'` resource that should be used to decompress this resource.
-- 
-- Use `decompressor_specific_parameters` instead,
-- unless you need access to this field's `_io`.

