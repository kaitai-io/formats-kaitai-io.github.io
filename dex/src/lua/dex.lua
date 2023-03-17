-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

require("vlq_base128_le")
-- 
-- Android OS applications executables are typically stored in its own
-- format, optimized for more efficient execution in Dalvik virtual
-- machine.
-- 
-- This format is loosely similar to Java .class file format and
-- generally holds the similar set of data: i.e. classes, methods,
-- fields, annotations, etc.
-- See also: Source (https://source.android.com/docs/core/runtime/dex-format)
Dex = class.class(KaitaiStruct)

Dex.ClassAccessFlags = enum.Enum {
  public = 1,
  private = 2,
  protected = 4,
  static = 8,
  final = 16,
  interface = 512,
  abstract = 1024,
  synthetic = 4096,
  annotation = 8192,
  enum = 16384,
}

function Dex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex:_read()
  self.header = Dex.HeaderItem(self._io, self, self._root)
end

-- 
-- string identifiers list.
-- 
-- These are identifiers for all the strings used by this file, either for
-- internal naming (e.g., type descriptors) or as constant objects referred to by code.
-- 
-- This list must be sorted by string contents, using UTF-16 code point values
-- (not in a locale-sensitive manner), and it must not contain any duplicate entries.
Dex.property.string_ids = {}
function Dex.property.string_ids:get()
  if self._m_string_ids ~= nil then
    return self._m_string_ids
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.string_ids_off)
  self._m_string_ids = {}
  for i = 0, self.header.string_ids_size - 1 do
    self._m_string_ids[i + 1] = Dex.StringIdItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_string_ids
end

-- 
-- method identifiers list.
-- 
-- These are identifiers for all methods referred to by this file,
-- whether defined in the file or not.
-- 
-- This list must be sorted, where the defining type (by type_id index
-- is the major order, method name (by string_id index) is the intermediate
-- order, and method prototype (by proto_id index) is the minor order.
-- 
-- The list must not contain any duplicate entries.
Dex.property.method_ids = {}
function Dex.property.method_ids:get()
  if self._m_method_ids ~= nil then
    return self._m_method_ids
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.method_ids_off)
  self._m_method_ids = {}
  for i = 0, self.header.method_ids_size - 1 do
    self._m_method_ids[i + 1] = Dex.MethodIdItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_method_ids
end

-- 
-- data used in statically linked files.
-- 
-- The format of the data in this section is left unspecified by this document.
-- 
-- This section is empty in unlinked files, and runtime implementations may
-- use it as they see fit.
Dex.property.link_data = {}
function Dex.property.link_data:get()
  if self._m_link_data ~= nil then
    return self._m_link_data
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.link_off)
  self._m_link_data = self._io:read_bytes(self.header.link_size)
  self._io:seek(_pos)
  return self._m_link_data
end

Dex.property.map = {}
function Dex.property.map:get()
  if self._m_map ~= nil then
    return self._m_map
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.map_off)
  self._m_map = Dex.MapList(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_map
end

-- 
-- class definitions list.
-- 
-- The classes must be ordered such that a given class's superclass and
-- implemented interfaces appear in the list earlier than the referring class.
-- 
-- Furthermore, it is invalid for a definition for the same-named class to
-- appear more than once in the list.
Dex.property.class_defs = {}
function Dex.property.class_defs:get()
  if self._m_class_defs ~= nil then
    return self._m_class_defs
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.class_defs_off)
  self._m_class_defs = {}
  for i = 0, self.header.class_defs_size - 1 do
    self._m_class_defs[i + 1] = Dex.ClassDefItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_class_defs
end

-- 
-- data area, containing all the support data for the tables listed above.
-- 
-- Different items have different alignment requirements, and padding bytes
-- are inserted before each item if necessary to achieve proper alignment.
Dex.property.data = {}
function Dex.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.data_off)
  self._m_data = self._io:read_bytes(self.header.data_size)
  self._io:seek(_pos)
  return self._m_data
end

-- 
-- type identifiers list.
-- 
-- These are identifiers for all types (classes, arrays, or primitive types)
-- referred to by this file, whether defined in the file or not.
-- 
-- This list must be sorted by string_id index, and it must not contain any duplicate entries.
Dex.property.type_ids = {}
function Dex.property.type_ids:get()
  if self._m_type_ids ~= nil then
    return self._m_type_ids
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.type_ids_off)
  self._m_type_ids = {}
  for i = 0, self.header.type_ids_size - 1 do
    self._m_type_ids[i + 1] = Dex.TypeIdItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_type_ids
end

-- 
-- method prototype identifiers list.
-- 
-- These are identifiers for all prototypes referred to by this file.
-- 
-- This list must be sorted in return-type (by type_id index) major order,
-- and then by argument list (lexicographic ordering, individual arguments
-- ordered by type_id index). The list must not contain any duplicate entries.
Dex.property.proto_ids = {}
function Dex.property.proto_ids:get()
  if self._m_proto_ids ~= nil then
    return self._m_proto_ids
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.proto_ids_off)
  self._m_proto_ids = {}
  for i = 0, self.header.proto_ids_size - 1 do
    self._m_proto_ids[i + 1] = Dex.ProtoIdItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_proto_ids
end

-- 
-- field identifiers list.
-- 
-- These are identifiers for all fields referred to by this file, whether defined in the file or not.
-- 
-- This list must be sorted, where the defining type (by type_id index)
-- is the major order, field name (by string_id index) is the intermediate
-- order, and type (by type_id index) is the minor order.
-- 
-- The list must not contain any duplicate entries.
Dex.property.field_ids = {}
function Dex.property.field_ids:get()
  if self._m_field_ids ~= nil then
    return self._m_field_ids
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.field_ids_off)
  self._m_field_ids = {}
  for i = 0, self.header.field_ids_size - 1 do
    self._m_field_ids[i + 1] = Dex.FieldIdItem(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_field_ids
end


Dex.HeaderItem = class.class(KaitaiStruct)

Dex.HeaderItem.EndianConstant = enum.Enum {
  endian_constant = 305419896,
  reverse_endian_constant = 2018915346,
}

function Dex.HeaderItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.HeaderItem:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\100\101\120\010") then
    error("not equal, expected " ..  "\100\101\120\010" .. ", but got " .. self.magic)
  end
  self.version_str = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(4), 0, false), "ascii")
  self.checksum = self._io:read_u4le()
  self.signature = self._io:read_bytes(20)
  self.file_size = self._io:read_u4le()
  self.header_size = self._io:read_u4le()
  self.endian_tag = Dex.HeaderItem.EndianConstant(self._io:read_u4le())
  self.link_size = self._io:read_u4le()
  self.link_off = self._io:read_u4le()
  self.map_off = self._io:read_u4le()
  self.string_ids_size = self._io:read_u4le()
  self.string_ids_off = self._io:read_u4le()
  self.type_ids_size = self._io:read_u4le()
  self.type_ids_off = self._io:read_u4le()
  self.proto_ids_size = self._io:read_u4le()
  self.proto_ids_off = self._io:read_u4le()
  self.field_ids_size = self._io:read_u4le()
  self.field_ids_off = self._io:read_u4le()
  self.method_ids_size = self._io:read_u4le()
  self.method_ids_off = self._io:read_u4le()
  self.class_defs_size = self._io:read_u4le()
  self.class_defs_off = self._io:read_u4le()
  self.data_size = self._io:read_u4le()
  self.data_off = self._io:read_u4le()
end

-- 
-- adler32 checksum of the rest of the file (everything but magic and this field);
-- used to detect file corruption
-- 
-- SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
-- and this field); used to uniquely identify files
-- 
-- size of the entire file (including the header), in bytes
-- 
-- size of the header (this entire section), in bytes. This allows for at
-- least a limited amount of backwards/forwards compatibility without
-- invalidating the format.
-- 
-- size of the link section, or 0 if this file isn't statically linked
-- 
-- offset from the start of the file to the link section, or 0 if link_size == 0.
-- The offset, if non-zero, should be to an offset into the link_data section.
-- The format of the data pointed at is left unspecified by this document;
-- this header field (and the previous) are left as hooks for use by runtime implementations.
-- 
-- offset from the start of the file to the map item.
-- The offset, which must be non-zero, should be to an offset into the data
-- section, and the data should be in the format specified by "map_list" below.
-- 
-- count of strings in the string identifiers list
-- 
-- offset from the start of the file to the string identifiers list,
-- or 0 if string_ids_size == 0 (admittedly a strange edge case).
-- The offset, if non-zero, should be to the start of the string_ids section.
-- 
-- count of elements in the type identifiers list, at most 65535
-- 
-- offset from the start of the file to the type identifiers list,
-- or 0 if type_ids_size == 0 (admittedly a strange edge case).
-- The offset, if non-zero, should be to the start of the type_ids section.
-- 
-- count of elements in the prototype identifiers list, at most 65535
-- 
-- offset from the start of the file to the prototype identifiers list,
-- or 0 if proto_ids_size == 0 (admittedly a strange edge case).
-- The offset, if non-zero, should be to the start of the proto_ids section.
-- 
-- count of elements in the field identifiers list
-- 
-- offset from the start of the file to the field identifiers list,
-- or 0 if field_ids_size == 0.
-- The offset, if non-zero, should be to the start of the field_ids section.
-- 
-- count of elements in the method identifiers list
-- 
-- offset from the start of the file to the method identifiers list,
-- or 0 if method_ids_size == 0.
-- The offset, if non-zero, should be to the start of the method_ids section.
-- 
-- count of elements in the class definitions list
-- 
-- offset from the start of the file to the class definitions list,
-- or 0 if class_defs_size == 0 (admittedly a strange edge case).
-- The offset, if non-zero, should be to the start of the class_defs section.
-- 
-- Size of data section in bytes. Must be an even multiple of sizeof(uint).
-- 
-- offset from the start of the file to the start of the data section.

Dex.MapList = class.class(KaitaiStruct)

function Dex.MapList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.MapList:_read()
  self.size = self._io:read_u4le()
  self.list = {}
  for i = 0, self.size - 1 do
    self.list[i + 1] = Dex.MapItem(self._io, self, self._root)
  end
end


Dex.EncodedValue = class.class(KaitaiStruct)

Dex.EncodedValue.ValueTypeEnum = enum.Enum {
  byte = 0,
  short = 2,
  char = 3,
  int = 4,
  long = 6,
  float = 16,
  double = 17,
  method_type = 21,
  method_handle = 22,
  string = 23,
  type = 24,
  field = 25,
  method = 26,
  enum = 27,
  array = 28,
  annotation = 29,
  null = 30,
  boolean = 31,
}

function Dex.EncodedValue:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedValue:_read()
  self.value_arg = self._io:read_bits_int_be(3)
  self.value_type = Dex.EncodedValue.ValueTypeEnum(self._io:read_bits_int_be(5))
  self._io:align_to_byte()
  local _on = self.value_type
  if _on == Dex.EncodedValue.ValueTypeEnum.int then
    self.value = self._io:read_s4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.annotation then
    self.value = Dex.EncodedAnnotation(self._io, self, self._root)
  elseif _on == Dex.EncodedValue.ValueTypeEnum.long then
    self.value = self._io:read_s8le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.method_handle then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.byte then
    self.value = self._io:read_s1()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.array then
    self.value = Dex.EncodedArray(self._io, self, self._root)
  elseif _on == Dex.EncodedValue.ValueTypeEnum.method_type then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.short then
    self.value = self._io:read_s2le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.method then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.double then
    self.value = self._io:read_f8le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.float then
    self.value = self._io:read_f4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.type then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.enum then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.field then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.string then
    self.value = self._io:read_u4le()
  elseif _on == Dex.EncodedValue.ValueTypeEnum.char then
    self.value = self._io:read_u2le()
  end
end


Dex.CallSiteIdItem = class.class(KaitaiStruct)

function Dex.CallSiteIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.CallSiteIdItem:_read()
  self.call_site_off = self._io:read_u4le()
end

-- 
-- offset from the start of the file to call site definition.
-- 
-- The offset should be in the data section, and the data there should
-- be in the format specified by "call_site_item" below.

Dex.MethodIdItem = class.class(KaitaiStruct)

function Dex.MethodIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.MethodIdItem:_read()
  self.class_idx = self._io:read_u2le()
  self.proto_idx = self._io:read_u2le()
  self.name_idx = self._io:read_u4le()
end

-- 
-- the definer of this method.
Dex.MethodIdItem.property.class_name = {}
function Dex.MethodIdItem.property.class_name:get()
  if self._m_class_name ~= nil then
    return self._m_class_name
  end

  self._m_class_name = self._root.type_ids[self.class_idx + 1].type_name
  return self._m_class_name
end

-- 
-- the short-form descriptor of the prototype of this method.
Dex.MethodIdItem.property.proto_desc = {}
function Dex.MethodIdItem.property.proto_desc:get()
  if self._m_proto_desc ~= nil then
    return self._m_proto_desc
  end

  self._m_proto_desc = self._root.proto_ids[self.proto_idx + 1].shorty_desc
  return self._m_proto_desc
end

-- 
-- the name of this method.
Dex.MethodIdItem.property.method_name = {}
function Dex.MethodIdItem.property.method_name:get()
  if self._m_method_name ~= nil then
    return self._m_method_name
  end

  self._m_method_name = self._root.string_ids[self.name_idx + 1].value.data
  return self._m_method_name
end

-- 
-- index into the type_ids list for the definer of this method.
-- This must be a class or array type, and not a primitive type.
-- 
-- index into the proto_ids list for the prototype of this method
-- 
-- index into the string_ids list for the name of this method.
-- The string must conform to the syntax for MemberName, defined above.

Dex.TypeItem = class.class(KaitaiStruct)

function Dex.TypeItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.TypeItem:_read()
  self.type_idx = self._io:read_u2le()
end

Dex.TypeItem.property.value = {}
function Dex.TypeItem.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self._root.type_ids[self.type_idx + 1].type_name
  return self._m_value
end


Dex.TypeIdItem = class.class(KaitaiStruct)

function Dex.TypeIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.TypeIdItem:_read()
  self.descriptor_idx = self._io:read_u4le()
end

Dex.TypeIdItem.property.type_name = {}
function Dex.TypeIdItem.property.type_name:get()
  if self._m_type_name ~= nil then
    return self._m_type_name
  end

  self._m_type_name = self._root.string_ids[self.descriptor_idx + 1].value.data
  return self._m_type_name
end

-- 
-- index into the string_ids list for the descriptor string of this type.
-- The string must conform to the syntax for TypeDescriptor, defined above.

Dex.AnnotationElement = class.class(KaitaiStruct)

function Dex.AnnotationElement:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.AnnotationElement:_read()
  self.name_idx = VlqBase128Le(self._io)
  self.value = Dex.EncodedValue(self._io, self, self._root)
end

-- 
-- element name, represented as an index into the string_ids section.
-- 
-- The string must conform to the syntax for MemberName, defined above.
-- 
-- element value

Dex.EncodedField = class.class(KaitaiStruct)

function Dex.EncodedField:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedField:_read()
  self.field_idx_diff = VlqBase128Le(self._io)
  self.access_flags = VlqBase128Le(self._io)
end

-- 
-- index into the field_ids list for the identity of this field
-- (includes the name and descriptor), represented as a difference
-- from the index of previous element in the list.
-- 
-- The index of the first element in a list is represented directly.
-- 
-- access flags for the field (public, final, etc.).
-- 
-- See "access_flags Definitions" for details.

Dex.EncodedArrayItem = class.class(KaitaiStruct)

function Dex.EncodedArrayItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedArrayItem:_read()
  self.value = Dex.EncodedArray(self._io, self, self._root)
end


Dex.ClassDataItem = class.class(KaitaiStruct)

function Dex.ClassDataItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.ClassDataItem:_read()
  self.static_fields_size = VlqBase128Le(self._io)
  self.instance_fields_size = VlqBase128Le(self._io)
  self.direct_methods_size = VlqBase128Le(self._io)
  self.virtual_methods_size = VlqBase128Le(self._io)
  self.static_fields = {}
  for i = 0, self.static_fields_size.value - 1 do
    self.static_fields[i + 1] = Dex.EncodedField(self._io, self, self._root)
  end
  self.instance_fields = {}
  for i = 0, self.instance_fields_size.value - 1 do
    self.instance_fields[i + 1] = Dex.EncodedField(self._io, self, self._root)
  end
  self.direct_methods = {}
  for i = 0, self.direct_methods_size.value - 1 do
    self.direct_methods[i + 1] = Dex.EncodedMethod(self._io, self, self._root)
  end
  self.virtual_methods = {}
  for i = 0, self.virtual_methods_size.value - 1 do
    self.virtual_methods[i + 1] = Dex.EncodedMethod(self._io, self, self._root)
  end
end

-- 
-- the number of static fields defined in this item
-- 
-- the number of instance fields defined in this item
-- 
-- the number of direct methods defined in this item
-- 
-- the number of virtual methods defined in this item
-- 
-- the defined static fields, represented as a sequence of encoded elements.
-- 
-- The fields must be sorted by field_idx in increasing order.
-- 
-- the defined instance fields, represented as a sequence of encoded elements.
-- 
-- The fields must be sorted by field_idx in increasing order.
-- 
-- the defined direct (any of static, private, or constructor) methods,
-- represented as a sequence of encoded elements.
-- 
-- The methods must be sorted by method_idx in increasing order.
-- 
-- the defined virtual (none of static, private, or constructor) methods,
-- represented as a sequence of encoded elements.
-- 
-- This list should not include inherited methods unless overridden by
-- the class that this item represents.
-- 
-- The methods must be sorted by method_idx in increasing order.
-- 
-- The method_idx of a virtual method must not be the same as any direct method.

Dex.FieldIdItem = class.class(KaitaiStruct)

function Dex.FieldIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.FieldIdItem:_read()
  self.class_idx = self._io:read_u2le()
  self.type_idx = self._io:read_u2le()
  self.name_idx = self._io:read_u4le()
end

-- 
-- the definer of this field.
Dex.FieldIdItem.property.class_name = {}
function Dex.FieldIdItem.property.class_name:get()
  if self._m_class_name ~= nil then
    return self._m_class_name
  end

  self._m_class_name = self._root.type_ids[self.class_idx + 1].type_name
  return self._m_class_name
end

-- 
-- the type of this field.
Dex.FieldIdItem.property.type_name = {}
function Dex.FieldIdItem.property.type_name:get()
  if self._m_type_name ~= nil then
    return self._m_type_name
  end

  self._m_type_name = self._root.type_ids[self.type_idx + 1].type_name
  return self._m_type_name
end

-- 
-- the name of this field.
Dex.FieldIdItem.property.field_name = {}
function Dex.FieldIdItem.property.field_name:get()
  if self._m_field_name ~= nil then
    return self._m_field_name
  end

  self._m_field_name = self._root.string_ids[self.name_idx + 1].value.data
  return self._m_field_name
end

-- 
-- index into the type_ids list for the definer of this field.
-- This must be a class type, and not an array or primitive type.
-- 
-- index into the type_ids list for the type of this field
-- 
-- index into the string_ids list for the name of this field.
-- The string must conform to the syntax for MemberName, defined above.

Dex.EncodedAnnotation = class.class(KaitaiStruct)

function Dex.EncodedAnnotation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedAnnotation:_read()
  self.type_idx = VlqBase128Le(self._io)
  self.size = VlqBase128Le(self._io)
  self.elements = {}
  for i = 0, self.size.value - 1 do
    self.elements[i + 1] = Dex.AnnotationElement(self._io, self, self._root)
  end
end

-- 
-- type of the annotation.
-- 
-- This must be a class (not array or primitive) type.
-- 
-- number of name-value mappings in this annotation
-- 
-- elements of the annotation, represented directly in-line (not as offsets).
-- 
-- Elements must be sorted in increasing order by string_id index.

Dex.ClassDefItem = class.class(KaitaiStruct)

function Dex.ClassDefItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.ClassDefItem:_read()
  self.class_idx = self._io:read_u4le()
  self.access_flags = Dex.ClassAccessFlags(self._io:read_u4le())
  self.superclass_idx = self._io:read_u4le()
  self.interfaces_off = self._io:read_u4le()
  self.source_file_idx = self._io:read_u4le()
  self.annotations_off = self._io:read_u4le()
  self.class_data_off = self._io:read_u4le()
  self.static_values_off = self._io:read_u4le()
end

Dex.ClassDefItem.property.type_name = {}
function Dex.ClassDefItem.property.type_name:get()
  if self._m_type_name ~= nil then
    return self._m_type_name
  end

  self._m_type_name = self._root.type_ids[self.class_idx + 1].type_name
  return self._m_type_name
end

Dex.ClassDefItem.property.class_data = {}
function Dex.ClassDefItem.property.class_data:get()
  if self._m_class_data ~= nil then
    return self._m_class_data
  end

  if self.class_data_off ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.class_data_off)
    self._m_class_data = Dex.ClassDataItem(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_class_data
end

Dex.ClassDefItem.property.static_values = {}
function Dex.ClassDefItem.property.static_values:get()
  if self._m_static_values ~= nil then
    return self._m_static_values
  end

  if self.static_values_off ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.static_values_off)
    self._m_static_values = Dex.EncodedArrayItem(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_static_values
end

-- 
-- index into the type_ids list for this class.
-- 
-- This must be a class type, and not an array or primitive type.
-- 
-- access flags for the class (public, final, etc.).
-- 
-- See "access_flags Definitions" for details.
-- 
-- index into the type_ids list for the superclass,
-- or the constant value NO_INDEX if this class has no superclass
-- (i.e., it is a root class such as Object).
-- 
-- If present, this must be a class type, and not an array or primitive type.
-- 
-- offset from the start of the file to the list of interfaces, or 0 if there are none.
-- 
-- This offset should be in the data section, and the data there should
-- be in the format specified by "type_list" below. Each of the elements
-- of the list must be a class type (not an array or primitive type),
-- and there must not be any duplicates.
-- 
-- index into the string_ids list for the name of the file containing
-- the original source for (at least most of) this class, or the
-- special value NO_INDEX to represent a lack of this information.
-- 
-- The debug_info_item of any given method may override this source file,
-- but the expectation is that most classes will only come from one source file.
-- 
-- offset from the start of the file to the annotations structure for
-- this class, or 0 if there are no annotations on this class.
-- 
-- This offset, if non-zero, should be in the data section, and the data
-- there should be in the format specified by "annotations_directory_item"
-- below,with all items referring to this class as the definer.
-- 
-- offset from the start of the file to the associated class data for this
-- item, or 0 if there is no class data for this class.
-- 
-- (This may be the case, for example, if this class is a marker interface.)
-- 
-- The offset, if non-zero, should be in the data section, and the data
-- there should be in the format specified by "class_data_item" below,
-- with all items referring to this class as the definer.
-- 
-- offset from the start of the file to the list of initial values for
-- static fields, or 0 if there are none (and all static fields are to be
-- initialized with 0 or null).
-- 
-- This offset should be in the data section, and the data there should
-- be in the format specified by "encoded_array_item" below.
-- 
-- The size of the array must be no larger than the number of static fields
-- declared by this class, and the elements correspond to the static fields
-- in the same order as declared in the corresponding field_list.
-- 
-- The type of each array element must match the declared type of its
-- corresponding field.
-- 
-- If there are fewer elements in the array than there are static fields,
-- then the leftover fields are initialized with a type-appropriate 0 or null.

Dex.TypeList = class.class(KaitaiStruct)

function Dex.TypeList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.TypeList:_read()
  self.size = self._io:read_u4le()
  self.list = {}
  for i = 0, self.size - 1 do
    self.list[i + 1] = Dex.TypeItem(self._io, self, self._root)
  end
end


Dex.StringIdItem = class.class(KaitaiStruct)

function Dex.StringIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.StringIdItem:_read()
  self.string_data_off = self._io:read_u4le()
end

Dex.StringIdItem.property.value = {}
function Dex.StringIdItem.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _pos = self._io:pos()
  self._io:seek(self.string_data_off)
  self._m_value = Dex.StringIdItem.StringDataItem(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_value
end

-- 
-- offset from the start of the file to the string data for this item.
-- The offset should be to a location in the data section, and the data
-- should be in the format specified by "string_data_item" below.
-- There is no alignment requirement for the offset.

Dex.StringIdItem.StringDataItem = class.class(KaitaiStruct)

function Dex.StringIdItem.StringDataItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.StringIdItem.StringDataItem:_read()
  self.utf16_size = VlqBase128Le(self._io)
  self.data = str_decode.decode(self._io:read_bytes(self.utf16_size.value), "ascii")
end


Dex.ProtoIdItem = class.class(KaitaiStruct)

function Dex.ProtoIdItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.ProtoIdItem:_read()
  self.shorty_idx = self._io:read_u4le()
  self.return_type_idx = self._io:read_u4le()
  self.parameters_off = self._io:read_u4le()
end

-- 
-- short-form descriptor string of this prototype, as pointed to by shorty_idx.
Dex.ProtoIdItem.property.shorty_desc = {}
function Dex.ProtoIdItem.property.shorty_desc:get()
  if self._m_shorty_desc ~= nil then
    return self._m_shorty_desc
  end

  self._m_shorty_desc = self._root.string_ids[self.shorty_idx + 1].value.data
  return self._m_shorty_desc
end

-- 
-- list of parameter types for this prototype.
Dex.ProtoIdItem.property.params_types = {}
function Dex.ProtoIdItem.property.params_types:get()
  if self._m_params_types ~= nil then
    return self._m_params_types
  end

  if self.parameters_off ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.parameters_off)
    self._m_params_types = Dex.TypeList(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_params_types
end

-- 
-- return type of this prototype.
Dex.ProtoIdItem.property.return_type = {}
function Dex.ProtoIdItem.property.return_type:get()
  if self._m_return_type ~= nil then
    return self._m_return_type
  end

  self._m_return_type = self._root.type_ids[self.return_type_idx + 1].type_name
  return self._m_return_type
end

-- 
-- index into the string_ids list for the short-form descriptor string of this prototype.
-- The string must conform to the syntax for ShortyDescriptor, defined above,
-- and must correspond to the return type and parameters of this item.
-- 
-- index into the type_ids list for the return type of this prototype
-- 
-- offset from the start of the file to the list of parameter types for this prototype,
-- or 0 if this prototype has no parameters.
-- This offset, if non-zero, should be in the data section, and the data
-- there should be in the format specified by "type_list" below.
-- Additionally, there should be no reference to the type void in the list.

Dex.EncodedMethod = class.class(KaitaiStruct)

function Dex.EncodedMethod:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedMethod:_read()
  self.method_idx_diff = VlqBase128Le(self._io)
  self.access_flags = VlqBase128Le(self._io)
  self.code_off = VlqBase128Le(self._io)
end

-- 
-- index into the method_ids list for the identity of this method
-- (includes the name and descriptor), represented as a difference
-- from the index of previous element in the list.
-- 
-- The index of the first element in a list is represented directly.
-- 
-- access flags for the field (public, final, etc.).
-- 
-- See "access_flags Definitions" for details.
-- 
-- offset from the start of the file to the code structure for this method,
-- or 0 if this method is either abstract or native.
-- 
-- The offset should be to a location in the data section.
-- 
-- The format of the data is specified by "code_item" below.

Dex.MapItem = class.class(KaitaiStruct)

Dex.MapItem.MapItemType = enum.Enum {
  header_item = 0,
  string_id_item = 1,
  type_id_item = 2,
  proto_id_item = 3,
  field_id_item = 4,
  method_id_item = 5,
  class_def_item = 6,
  call_site_id_item = 7,
  method_handle_item = 8,
  map_list = 4096,
  type_list = 4097,
  annotation_set_ref_list = 4098,
  annotation_set_item = 4099,
  class_data_item = 8192,
  code_item = 8193,
  string_data_item = 8194,
  debug_info_item = 8195,
  annotation_item = 8196,
  encoded_array_item = 8197,
  annotations_directory_item = 8198,
}

function Dex.MapItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.MapItem:_read()
  self.type = Dex.MapItem.MapItemType(self._io:read_u2le())
  self.unused = self._io:read_u2le()
  self.size = self._io:read_u4le()
  self.offset = self._io:read_u4le()
end

-- 
-- type of the items; see table below
-- 
-- (unused)
-- 
-- count of the number of items to be found at the indicated offset
-- 
-- offset from the start of the file to the items in question

Dex.EncodedArray = class.class(KaitaiStruct)

function Dex.EncodedArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dex.EncodedArray:_read()
  self.size = VlqBase128Le(self._io)
  self.values = {}
  for i = 0, self.size.value - 1 do
    self.values[i + 1] = Dex.EncodedValue(self._io, self, self._root)
  end
end


