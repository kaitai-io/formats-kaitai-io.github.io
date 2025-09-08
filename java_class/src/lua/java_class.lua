-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local stringstream = require("string_stream")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html)
-- See also: Source (https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf)
-- See also: Source (https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/jdk.hotspot.agent/share/classes/sun/jvm/hotspot/runtime/ClassConstants.java)
-- See also: Source (https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/java.base/share/native/include/classfile_constants.h.template)
-- See also: Source (https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/hotspot/share/classfile/classFileParser.cpp)
JavaClass = class.class(KaitaiStruct)

function JavaClass:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function JavaClass:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\202\254\186\190") then
    error("not equal, expected " .. "\202\254\186\190" .. ", but got " .. self.magic)
  end
  self.version_minor = self._io:read_u2be()
  self.version_major = self._io:read_u2be()
  if not(self.version_major >= 43) then
    error("ValidationLessThanError")
  end
  self.constant_pool_count = self._io:read_u2be()
  self.constant_pool = {}
  for i = 0, self.constant_pool_count - 1 - 1 do
    self.constant_pool[i + 1] = JavaClass.ConstantPoolEntry(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.constant_pool[(i - 1) + 1].is_two_entries) or (false)), self._io, self, self._root)
  end
  self.access_flags = self._io:read_u2be()
  self.this_class = self._io:read_u2be()
  self.super_class = self._io:read_u2be()
  self.interfaces_count = self._io:read_u2be()
  self.interfaces = {}
  for i = 0, self.interfaces_count - 1 do
    self.interfaces[i + 1] = self._io:read_u2be()
  end
  self.fields_count = self._io:read_u2be()
  self.fields = {}
  for i = 0, self.fields_count - 1 do
    self.fields[i + 1] = JavaClass.FieldInfo(self._io, self, self._root)
  end
  self.methods_count = self._io:read_u2be()
  self.methods = {}
  for i = 0, self.methods_count - 1 do
    self.methods[i + 1] = JavaClass.MethodInfo(self._io, self, self._root)
  end
  self.attributes_count = self._io:read_u2be()
  self.attributes = {}
  for i = 0, self.attributes_count - 1 do
    self.attributes[i + 1] = JavaClass.AttributeInfo(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7)
JavaClass.AttributeInfo = class.class(KaitaiStruct)

function JavaClass.AttributeInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo:_read()
  self.name_index = self._io:read_u2be()
  self.attribute_length = self._io:read_u4be()
  local _on = self.name_as_str
  if _on == "Code" then
    self._raw_info = self._io:read_bytes(self.attribute_length)
    local _io = KaitaiStream(stringstream(self._raw_info))
    self.info = JavaClass.AttributeInfo.AttrBodyCode(_io, self, self._root)
  elseif _on == "Exceptions" then
    self._raw_info = self._io:read_bytes(self.attribute_length)
    local _io = KaitaiStream(stringstream(self._raw_info))
    self.info = JavaClass.AttributeInfo.AttrBodyExceptions(_io, self, self._root)
  elseif _on == "LineNumberTable" then
    self._raw_info = self._io:read_bytes(self.attribute_length)
    local _io = KaitaiStream(stringstream(self._raw_info))
    self.info = JavaClass.AttributeInfo.AttrBodyLineNumberTable(_io, self, self._root)
  elseif _on == "SourceFile" then
    self._raw_info = self._io:read_bytes(self.attribute_length)
    local _io = KaitaiStream(stringstream(self._raw_info))
    self.info = JavaClass.AttributeInfo.AttrBodySourceFile(_io, self, self._root)
  else
    self.info = self._io:read_bytes(self.attribute_length)
  end
end

JavaClass.AttributeInfo.property.name_as_str = {}
function JavaClass.AttributeInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self._root.constant_pool[(self.name_index - 1) + 1].cp_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3)
JavaClass.AttributeInfo.AttrBodyCode = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyCode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyCode:_read()
  self.max_stack = self._io:read_u2be()
  self.max_locals = self._io:read_u2be()
  self.code_length = self._io:read_u4be()
  self.code = self._io:read_bytes(self.code_length)
  self.exception_table_length = self._io:read_u2be()
  self.exception_table = {}
  for i = 0, self.exception_table_length - 1 do
    self.exception_table[i + 1] = JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry(self._io, self, self._root)
  end
  self.attributes_count = self._io:read_u2be()
  self.attributes = {}
  for i = 0, self.attributes_count - 1 do
    self.attributes[i + 1] = JavaClass.AttributeInfo(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3)
JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry:_read()
  self.start_pc = self._io:read_u2be()
  self.end_pc = self._io:read_u2be()
  self.handler_pc = self._io:read_u2be()
  self.catch_type = self._io:read_u2be()
end

JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry.property.catch_exception = {}
function JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry.property.catch_exception:get()
  if self._m_catch_exception ~= nil then
    return self._m_catch_exception
  end

  if self.catch_type ~= 0 then
    self._m_catch_exception = self._root.constant_pool[(self.catch_type - 1) + 1]
  end
  return self._m_catch_exception
end

-- 
-- Start of a code region where exception handler is being
-- active, index in code array (inclusive)
-- 
-- End of a code region where exception handler is being
-- active, index in code array (exclusive)
-- 
-- Start of exception handler code, index in code array.
-- 
-- Exception class that this handler catches, index in constant
-- pool, or 0 (catch all exceptions handler, used to implement
-- `finally`).

-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5)
JavaClass.AttributeInfo.AttrBodyExceptions = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyExceptions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyExceptions:_read()
  self.number_of_exceptions = self._io:read_u2be()
  self.exceptions = {}
  for i = 0, self.number_of_exceptions - 1 do
    self.exceptions[i + 1] = JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry(self._io, self, self._root)
  end
end


JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry:_read()
  self.index = self._io:read_u2be()
end

JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry.property.as_info = {}
function JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry.property.as_info:get()
  if self._m_as_info ~= nil then
    return self._m_as_info
  end

  self._m_as_info = self._root.constant_pool[(self.index - 1) + 1].cp_info
  return self._m_as_info
end

JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry.property.name_as_str = {}
function JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self.as_info.name_as_str
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12)
JavaClass.AttributeInfo.AttrBodyLineNumberTable = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyLineNumberTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyLineNumberTable:_read()
  self.line_number_table_length = self._io:read_u2be()
  self.line_number_table = {}
  for i = 0, self.line_number_table_length - 1 do
    self.line_number_table[i + 1] = JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry(self._io, self, self._root)
  end
end


JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry:_read()
  self.start_pc = self._io:read_u2be()
  self.line_number = self._io:read_u2be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10)
JavaClass.AttributeInfo.AttrBodySourceFile = class.class(KaitaiStruct)

function JavaClass.AttributeInfo.AttrBodySourceFile:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.AttributeInfo.AttrBodySourceFile:_read()
  self.sourcefile_index = self._io:read_u2be()
end

JavaClass.AttributeInfo.AttrBodySourceFile.property.sourcefile_as_str = {}
function JavaClass.AttributeInfo.AttrBodySourceFile.property.sourcefile_as_str:get()
  if self._m_sourcefile_as_str ~= nil then
    return self._m_sourcefile_as_str
  end

  self._m_sourcefile_as_str = self._root.constant_pool[(self.sourcefile_index - 1) + 1].cp_info.value
  return self._m_sourcefile_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1)
JavaClass.ClassCpInfo = class.class(KaitaiStruct)

function JavaClass.ClassCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.ClassCpInfo:_read()
  self.name_index = self._io:read_u2be()
end

JavaClass.ClassCpInfo.property.name_as_info = {}
function JavaClass.ClassCpInfo.property.name_as_info:get()
  if self._m_name_as_info ~= nil then
    return self._m_name_as_info
  end

  self._m_name_as_info = self._root.constant_pool[(self.name_index - 1) + 1].cp_info
  return self._m_name_as_info
end

JavaClass.ClassCpInfo.property.name_as_str = {}
function JavaClass.ClassCpInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self.name_as_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4)
JavaClass.ConstantPoolEntry = class.class(KaitaiStruct)

JavaClass.ConstantPoolEntry.TagEnum = enum.Enum {
  utf8 = 1,
  integer = 3,
  float = 4,
  long = 5,
  double = 6,
  class_type = 7,
  string = 8,
  field_ref = 9,
  method_ref = 10,
  interface_method_ref = 11,
  name_and_type = 12,
  method_handle = 15,
  method_type = 16,
  dynamic = 17,
  invoke_dynamic = 18,
  module = 19,
  package = 20,
}

function JavaClass.ConstantPoolEntry:_init(is_prev_two_entries, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.is_prev_two_entries = is_prev_two_entries
  self:_read()
end

function JavaClass.ConstantPoolEntry:_read()
  if not(self.is_prev_two_entries) then
    self.tag = JavaClass.ConstantPoolEntry.TagEnum(self._io:read_u1())
  end
  if not(self.is_prev_two_entries) then
    local _on = self.tag
    if _on == JavaClass.ConstantPoolEntry.TagEnum.class_type then
      self.cp_info = JavaClass.ClassCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.double then
      self.cp_info = JavaClass.DoubleCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic then
      self.cp_info = JavaClass.DynamicCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref then
      self.cp_info = JavaClass.FieldRefCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.float then
      self.cp_info = JavaClass.FloatCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.integer then
      self.cp_info = JavaClass.IntegerCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref then
      self.cp_info = JavaClass.InterfaceMethodRefCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic then
      self.cp_info = JavaClass.InvokeDynamicCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.long then
      self.cp_info = JavaClass.LongCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle then
      self.cp_info = JavaClass.MethodHandleCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref then
      self.cp_info = JavaClass.MethodRefCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type then
      self.cp_info = JavaClass.MethodTypeCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.module then
      self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type then
      self.cp_info = JavaClass.NameAndTypeCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.package then
      self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.string then
      self.cp_info = JavaClass.StringCpInfo(self._io, self, self._root)
    elseif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8 then
      self.cp_info = JavaClass.Utf8CpInfo(self._io, self, self._root)
    end
  end
end

JavaClass.ConstantPoolEntry.property.is_two_entries = {}
function JavaClass.ConstantPoolEntry.property.is_two_entries:get()
  if self._m_is_two_entries ~= nil then
    return self._m_is_two_entries
  end

  self._m_is_two_entries = utils.box_unwrap((self.is_prev_two_entries) and utils.box_wrap(false) or ( ((self.tag == JavaClass.ConstantPoolEntry.TagEnum.long) or (self.tag == JavaClass.ConstantPoolEntry.TagEnum.double)) ))
  return self._m_is_two_entries
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6)
JavaClass.DoubleCpInfo = class.class(KaitaiStruct)

function JavaClass.DoubleCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.DoubleCpInfo:_read()
  self.value = self._io:read_f8be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10)
JavaClass.DynamicCpInfo = class.class(KaitaiStruct)

function JavaClass.DynamicCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.DynamicCpInfo:_read()
  self._unnamed0 = JavaClass.VersionGuard(55, self._io, self, self._root)
  self.bootstrap_method_attr_index = self._io:read_u2be()
  self.name_and_type_index = self._io:read_u2be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5)
JavaClass.FieldInfo = class.class(KaitaiStruct)

function JavaClass.FieldInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.FieldInfo:_read()
  self.access_flags = self._io:read_u2be()
  self.name_index = self._io:read_u2be()
  self.descriptor_index = self._io:read_u2be()
  self.attributes_count = self._io:read_u2be()
  self.attributes = {}
  for i = 0, self.attributes_count - 1 do
    self.attributes[i + 1] = JavaClass.AttributeInfo(self._io, self, self._root)
  end
end

JavaClass.FieldInfo.property.name_as_str = {}
function JavaClass.FieldInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self._root.constant_pool[(self.name_index - 1) + 1].cp_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2)
JavaClass.FieldRefCpInfo = class.class(KaitaiStruct)

function JavaClass.FieldRefCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.FieldRefCpInfo:_read()
  self.class_index = self._io:read_u2be()
  self.name_and_type_index = self._io:read_u2be()
end

JavaClass.FieldRefCpInfo.property.class_as_info = {}
function JavaClass.FieldRefCpInfo.property.class_as_info:get()
  if self._m_class_as_info ~= nil then
    return self._m_class_as_info
  end

  self._m_class_as_info = self._root.constant_pool[(self.class_index - 1) + 1].cp_info
  return self._m_class_as_info
end

JavaClass.FieldRefCpInfo.property.name_and_type_as_info = {}
function JavaClass.FieldRefCpInfo.property.name_and_type_as_info:get()
  if self._m_name_and_type_as_info ~= nil then
    return self._m_name_and_type_as_info
  end

  self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1) + 1].cp_info
  return self._m_name_and_type_as_info
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5)
JavaClass.FloatCpInfo = class.class(KaitaiStruct)

function JavaClass.FloatCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.FloatCpInfo:_read()
  self.value = self._io:read_f4be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4)
JavaClass.IntegerCpInfo = class.class(KaitaiStruct)

function JavaClass.IntegerCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.IntegerCpInfo:_read()
  self.value = self._io:read_u4be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2)
JavaClass.InterfaceMethodRefCpInfo = class.class(KaitaiStruct)

function JavaClass.InterfaceMethodRefCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.InterfaceMethodRefCpInfo:_read()
  self.class_index = self._io:read_u2be()
  self.name_and_type_index = self._io:read_u2be()
end

JavaClass.InterfaceMethodRefCpInfo.property.class_as_info = {}
function JavaClass.InterfaceMethodRefCpInfo.property.class_as_info:get()
  if self._m_class_as_info ~= nil then
    return self._m_class_as_info
  end

  self._m_class_as_info = self._root.constant_pool[(self.class_index - 1) + 1].cp_info
  return self._m_class_as_info
end

JavaClass.InterfaceMethodRefCpInfo.property.name_and_type_as_info = {}
function JavaClass.InterfaceMethodRefCpInfo.property.name_and_type_as_info:get()
  if self._m_name_and_type_as_info ~= nil then
    return self._m_name_and_type_as_info
  end

  self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1) + 1].cp_info
  return self._m_name_and_type_as_info
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10)
JavaClass.InvokeDynamicCpInfo = class.class(KaitaiStruct)

function JavaClass.InvokeDynamicCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.InvokeDynamicCpInfo:_read()
  self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
  self.bootstrap_method_attr_index = self._io:read_u2be()
  self.name_and_type_index = self._io:read_u2be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5)
JavaClass.LongCpInfo = class.class(KaitaiStruct)

function JavaClass.LongCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.LongCpInfo:_read()
  self.value = self._io:read_u8be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8)
JavaClass.MethodHandleCpInfo = class.class(KaitaiStruct)

JavaClass.MethodHandleCpInfo.ReferenceKindEnum = enum.Enum {
  get_field = 1,
  get_static = 2,
  put_field = 3,
  put_static = 4,
  invoke_virtual = 5,
  invoke_static = 6,
  invoke_special = 7,
  new_invoke_special = 8,
  invoke_interface = 9,
}

function JavaClass.MethodHandleCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.MethodHandleCpInfo:_read()
  self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
  self.reference_kind = JavaClass.MethodHandleCpInfo.ReferenceKindEnum(self._io:read_u1())
  self.reference_index = self._io:read_u2be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6)
JavaClass.MethodInfo = class.class(KaitaiStruct)

function JavaClass.MethodInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.MethodInfo:_read()
  self.access_flags = self._io:read_u2be()
  self.name_index = self._io:read_u2be()
  self.descriptor_index = self._io:read_u2be()
  self.attributes_count = self._io:read_u2be()
  self.attributes = {}
  for i = 0, self.attributes_count - 1 do
    self.attributes[i + 1] = JavaClass.AttributeInfo(self._io, self, self._root)
  end
end

JavaClass.MethodInfo.property.name_as_str = {}
function JavaClass.MethodInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self._root.constant_pool[(self.name_index - 1) + 1].cp_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2)
JavaClass.MethodRefCpInfo = class.class(KaitaiStruct)

function JavaClass.MethodRefCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.MethodRefCpInfo:_read()
  self.class_index = self._io:read_u2be()
  self.name_and_type_index = self._io:read_u2be()
end

JavaClass.MethodRefCpInfo.property.class_as_info = {}
function JavaClass.MethodRefCpInfo.property.class_as_info:get()
  if self._m_class_as_info ~= nil then
    return self._m_class_as_info
  end

  self._m_class_as_info = self._root.constant_pool[(self.class_index - 1) + 1].cp_info
  return self._m_class_as_info
end

JavaClass.MethodRefCpInfo.property.name_and_type_as_info = {}
function JavaClass.MethodRefCpInfo.property.name_and_type_as_info:get()
  if self._m_name_and_type_as_info ~= nil then
    return self._m_name_and_type_as_info
  end

  self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1) + 1].cp_info
  return self._m_name_and_type_as_info
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9)
JavaClass.MethodTypeCpInfo = class.class(KaitaiStruct)

function JavaClass.MethodTypeCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.MethodTypeCpInfo:_read()
  self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
  self.descriptor_index = self._io:read_u2be()
end


-- 
-- Project Jigsaw modules introduced in Java 9
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16)
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11)
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12)
JavaClass.ModulePackageCpInfo = class.class(KaitaiStruct)

function JavaClass.ModulePackageCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.ModulePackageCpInfo:_read()
  self._unnamed0 = JavaClass.VersionGuard(53, self._io, self, self._root)
  self.name_index = self._io:read_u2be()
end

JavaClass.ModulePackageCpInfo.property.name_as_info = {}
function JavaClass.ModulePackageCpInfo.property.name_as_info:get()
  if self._m_name_as_info ~= nil then
    return self._m_name_as_info
  end

  self._m_name_as_info = self._root.constant_pool[(self.name_index - 1) + 1].cp_info
  return self._m_name_as_info
end

JavaClass.ModulePackageCpInfo.property.name_as_str = {}
function JavaClass.ModulePackageCpInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self.name_as_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6)
JavaClass.NameAndTypeCpInfo = class.class(KaitaiStruct)

function JavaClass.NameAndTypeCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.NameAndTypeCpInfo:_read()
  self.name_index = self._io:read_u2be()
  self.descriptor_index = self._io:read_u2be()
end

JavaClass.NameAndTypeCpInfo.property.descriptor_as_info = {}
function JavaClass.NameAndTypeCpInfo.property.descriptor_as_info:get()
  if self._m_descriptor_as_info ~= nil then
    return self._m_descriptor_as_info
  end

  self._m_descriptor_as_info = self._root.constant_pool[(self.descriptor_index - 1) + 1].cp_info
  return self._m_descriptor_as_info
end

JavaClass.NameAndTypeCpInfo.property.descriptor_as_str = {}
function JavaClass.NameAndTypeCpInfo.property.descriptor_as_str:get()
  if self._m_descriptor_as_str ~= nil then
    return self._m_descriptor_as_str
  end

  self._m_descriptor_as_str = self.descriptor_as_info.value
  return self._m_descriptor_as_str
end

JavaClass.NameAndTypeCpInfo.property.name_as_info = {}
function JavaClass.NameAndTypeCpInfo.property.name_as_info:get()
  if self._m_name_as_info ~= nil then
    return self._m_name_as_info
  end

  self._m_name_as_info = self._root.constant_pool[(self.name_index - 1) + 1].cp_info
  return self._m_name_as_info
end

JavaClass.NameAndTypeCpInfo.property.name_as_str = {}
function JavaClass.NameAndTypeCpInfo.property.name_as_str:get()
  if self._m_name_as_str ~= nil then
    return self._m_name_as_str
  end

  self._m_name_as_str = self.name_as_info.value
  return self._m_name_as_str
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3)
JavaClass.StringCpInfo = class.class(KaitaiStruct)

function JavaClass.StringCpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.StringCpInfo:_read()
  self.string_index = self._io:read_u2be()
end


-- 
-- See also: Source (https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7)
JavaClass.Utf8CpInfo = class.class(KaitaiStruct)

function JavaClass.Utf8CpInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function JavaClass.Utf8CpInfo:_read()
  self.str_len = self._io:read_u2be()
  self.value = str_decode.decode(self._io:read_bytes(self.str_len), "UTF-8")
end


-- 
-- `class` file format version 45.3 (appeared in the very first publicly
-- known release of Java SE AND JDK 1.0.2, released 23th January 1996) is so
-- ancient that it's taken for granted. Earlier formats seem to be
-- undocumented. Changes of `version_minor` don't change `class` format.
-- Earlier `version_major`s likely belong to Oak programming language, the
-- proprietary predecessor of Java.
-- See also: James Gosling, Bill Joy and Guy Steele. The Java Language Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Aug. 1996, p. 825. ISBN: 0-201-63451-1.
-- See also: Frank Yellin and Tim Lindholm. The Java Virtual Machine Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Sept. 1996, p. 475. ISBN: 0-201-63452-X.
JavaClass.VersionGuard = class.class(KaitaiStruct)

function JavaClass.VersionGuard:_init(major, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.major = major
  self:_read()
end

function JavaClass.VersionGuard:_read()
  self._unnamed0 = self._io:read_bytes(0)
  local _ = self._unnamed0
  if not(self._root.version_major >= self.major) then
    error("ValidationExprError")
  end
end


