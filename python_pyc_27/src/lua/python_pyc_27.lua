-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Python interpreter runs .py files in 2 step process: first, it
-- produces bytecode, which it then executes. Translation of .py source
-- into bytecode is time-consuming, so Python dumps compiled bytecode
-- into .pyc files, to be reused from cache at later time if possible.
-- 
-- .pyc file is essentially a raw dump of `py_object` (see `body`) with
-- a simple header prepended.
PythonPyc27 = class.class(KaitaiStruct)

PythonPyc27.Version = enum.Enum {
  v15 = 20121,
  v16 = 50428,
  v20 = 50823,
  v21 = 60202,
  v22 = 60717,
  v23_a0 = 62011,
  v23_a0b = 62021,
  v24_a0 = 62041,
  v24_a3 = 62051,
  v24_b1 = 62061,
  v25_a0 = 62071,
  v25_a0b = 62081,
  v25_a0c = 62091,
  v25_a0d = 62092,
  v25_b3 = 62101,
  v25_b3b = 62111,
  v25_c1 = 62121,
  v25_c2 = 62131,
  v26_a0 = 62151,
  v26_a1 = 62161,
  v27_a0 = 62171,
  v27_a0b = 62181,
  v27_a0c = 62191,
  v27_a0d = 62201,
  v27_a0e = 62211,
}

function PythonPyc27:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27:_read()
  self.version_magic = PythonPyc27.Version(self._io:read_u2le())
  self.crlf = self._io:read_u2le()
  self.modification_timestamp = self._io:read_u4le()
  self.body = PythonPyc27.PyObject(self._io, self, self._root)
end


PythonPyc27.CodeObject = class.class(KaitaiStruct)

PythonPyc27.CodeObject.FlagsEnum = enum.Enum {
  has_args = 4,
  has_kwargs = 8,
  generator = 32,
}

function PythonPyc27.CodeObject:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.CodeObject:_read()
  self.arg_count = self._io:read_u4le()
  self.local_count = self._io:read_u4le()
  self.stack_size = self._io:read_u4le()
  self.flags = PythonPyc27.CodeObject.FlagsEnum(self._io:read_u4le())
  self.code = PythonPyc27.Assembly(self._io, self, self._root)
  self.consts = PythonPyc27.PyObject(self._io, self, self._root)
  self.names = PythonPyc27.PyObject(self._io, self, self._root)
  self.var_names = PythonPyc27.PyObject(self._io, self, self._root)
  self.free_vars = PythonPyc27.PyObject(self._io, self, self._root)
  self.cell_vars = PythonPyc27.PyObject(self._io, self, self._root)
  self.filename = PythonPyc27.PyObject(self._io, self, self._root)
  self.name = PythonPyc27.PyObject(self._io, self, self._root)
  self.first_line_no = self._io:read_u4le()
  self.lnotab = PythonPyc27.PyObject(self._io, self, self._root)
end


PythonPyc27.Assembly = class.class(KaitaiStruct)

function PythonPyc27.Assembly:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.Assembly:_read()
  self.string_magic = self._io:read_bytes(1)
  if not(self.string_magic == "\115") then
    error("not equal, expected " ..  "\115" .. ", but got " .. self.string_magic)
  end
  self.length = self._io:read_u4le()
  self._raw_items = self._io:read_bytes(self.length)
  local _io = KaitaiStream(stringstream(self._raw_items))
  self.items = PythonPyc27.OpArgs(_io, self, self._root)
end


PythonPyc27.OpArg = class.class(KaitaiStruct)

PythonPyc27.OpArg.OpCodeEnum = enum.Enum {
  stop_code = 0,
  pop_top = 1,
  rot_two = 2,
  rot_three = 3,
  dup_top = 4,
  rot_four = 5,
  nop = 9,
  unary_positive = 10,
  unary_negative = 11,
  unary_not = 12,
  unary_convert = 13,
  unary_invert = 15,
  binary_power = 19,
  binary_multiply = 20,
  binary_divide = 21,
  binary_modulo = 22,
  binary_add = 23,
  binary_subtract = 24,
  binary_subscr = 25,
  binary_floor_divide = 26,
  binary_true_divide = 27,
  inplace_floor_divide = 28,
  inplace_true_divide = 29,
  slice_0 = 30,
  slice_1 = 31,
  slice_2 = 32,
  slice_3 = 33,
  store_slice_0 = 40,
  store_slice_1 = 41,
  store_slice_2 = 42,
  store_slice_3 = 43,
  delete_slice_0 = 50,
  delete_slice_1 = 51,
  delete_slice_2 = 52,
  delete_slice_3 = 53,
  store_map = 54,
  inplace_add = 55,
  inplace_subtract = 56,
  inplace_multiply = 57,
  inplace_divide = 58,
  inplace_modulo = 59,
  store_subscr = 60,
  delete_subscr = 61,
  binary_lshift = 62,
  binary_rshift = 63,
  binary_and = 64,
  binary_xor = 65,
  binary_or = 66,
  inplace_power = 67,
  get_iter = 68,
  print_expr = 70,
  print_item = 71,
  print_newline = 72,
  print_item_to = 73,
  print_newline_to = 74,
  inplace_lshift = 75,
  inplace_rshift = 76,
  inplace_and = 77,
  inplace_xor = 78,
  inplace_or = 79,
  break_loop = 80,
  with_cleanup = 81,
  load_locals = 82,
  return_value = 83,
  import_star = 84,
  exec_stmt = 85,
  yield_value = 86,
  pop_block = 87,
  end_finally = 88,
  build_class = 89,
  store_name = 90,
  delete_name = 91,
  unpack_sequence = 92,
  for_iter = 93,
  list_append = 94,
  store_attr = 95,
  delete_attr = 96,
  store_global = 97,
  delete_global = 98,
  dup_topx = 99,
  load_const = 100,
  load_name = 101,
  build_tuple = 102,
  build_list = 103,
  build_set = 104,
  build_map = 105,
  load_attr = 106,
  compare_op = 107,
  import_name = 108,
  import_from = 109,
  jump_forward = 110,
  jump_if_false_or_pop = 111,
  jump_if_true_or_pop = 112,
  jump_absolute = 113,
  pop_jump_if_false = 114,
  pop_jump_if_true = 115,
  load_global = 116,
  continue_loop = 119,
  setup_loop = 120,
  setup_except = 121,
  setup_finally = 122,
  load_fast = 124,
  store_fast = 125,
  delete_fast = 126,
  raise_varargs = 130,
  call_function = 131,
  make_function = 132,
  build_slice = 133,
  make_closure = 134,
  load_closure = 135,
  load_deref = 136,
  store_deref = 137,
  call_function_var = 140,
  call_function_kw = 141,
  call_function_var_kw = 142,
  setup_with = 143,
  extended_arg = 145,
  set_add = 146,
  map_add = 147,
}

function PythonPyc27.OpArg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.OpArg:_read()
  self.op_code = PythonPyc27.OpArg.OpCodeEnum(self._io:read_u1())
  if self.op_code.value >= PythonPyc27.OpArg.OpCodeEnum.store_name.value then
    self.arg = self._io:read_u2le()
  end
end


PythonPyc27.PyObject = class.class(KaitaiStruct)

PythonPyc27.PyObject.ObjectType = enum.Enum {
  tuple = 40,
  py_false = 70,
  none = 78,
  string_ref = 82,
  py_true = 84,
  code_object = 99,
  int = 105,
  string = 115,
  interned = 116,
  unicode_string = 117,
}

function PythonPyc27.PyObject:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject:_read()
  self.type = PythonPyc27.PyObject.ObjectType(self._io:read_u1())
  local _on = self.type
  if _on == PythonPyc27.PyObject.ObjectType.string then
    self.value = PythonPyc27.PyObject.PyString(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.tuple then
    self.value = PythonPyc27.PyObject.Tuple(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.int then
    self.value = self._io:read_u4le()
  elseif _on == PythonPyc27.PyObject.ObjectType.py_true then
    self.value = PythonPyc27.PyObject.PyTrue(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.py_false then
    self.value = PythonPyc27.PyObject.PyFalse(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.none then
    self.value = PythonPyc27.PyObject.PyNone(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.string_ref then
    self.value = PythonPyc27.PyObject.StringRef(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.code_object then
    self.value = PythonPyc27.CodeObject(self._io, self, self._root)
  elseif _on == PythonPyc27.PyObject.ObjectType.interned then
    self.value = PythonPyc27.PyObject.InternedString(self._io, self, self._root)
  end
end


PythonPyc27.PyObject.PyNone = class.class(KaitaiStruct)

function PythonPyc27.PyObject.PyNone:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.PyNone:_read()
end


PythonPyc27.PyObject.PyFalse = class.class(KaitaiStruct)

function PythonPyc27.PyObject.PyFalse:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.PyFalse:_read()
end


PythonPyc27.PyObject.StringRef = class.class(KaitaiStruct)

function PythonPyc27.PyObject.StringRef:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.StringRef:_read()
  self.interned_list_index = self._io:read_u4le()
end


PythonPyc27.PyObject.PyTrue = class.class(KaitaiStruct)

function PythonPyc27.PyObject.PyTrue:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.PyTrue:_read()
end


PythonPyc27.PyObject.Tuple = class.class(KaitaiStruct)

function PythonPyc27.PyObject.Tuple:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.Tuple:_read()
  self.count = self._io:read_u4le()
  self.items = {}
  for i = 0, self.count - 1 do
    self.items[i + 1] = PythonPyc27.PyObject(self._io, self, self._root)
  end
end


PythonPyc27.PyObject.UnicodeString = class.class(KaitaiStruct)

function PythonPyc27.PyObject.UnicodeString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.UnicodeString:_read()
  self.length = self._io:read_u4le()
  self.data = str_decode.decode(self._io:read_bytes(self.length), "utf-8")
end


PythonPyc27.PyObject.InternedString = class.class(KaitaiStruct)

function PythonPyc27.PyObject.InternedString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.InternedString:_read()
  self.length = self._io:read_u4le()
  self.data = str_decode.decode(self._io:read_bytes(self.length), "utf-8")
end


PythonPyc27.PyObject.PyString = class.class(KaitaiStruct)

function PythonPyc27.PyObject.PyString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.PyObject.PyString:_read()
  self.length = self._io:read_u4le()
  self.data = self._io:read_bytes(self.length)
end


PythonPyc27.OpArgs = class.class(KaitaiStruct)

function PythonPyc27.OpArgs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPyc27.OpArgs:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = PythonPyc27.OpArg(self._io, self, self._root)
    i = i + 1
  end
end


