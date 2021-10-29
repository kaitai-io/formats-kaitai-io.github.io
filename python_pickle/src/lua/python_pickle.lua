-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- Python Pickle format serializes Python objects to a byte stream, as a sequence
-- of operations to run on the Pickle Virtual Machine.
-- 
-- The format is mostly implementation defined, there is no formal specification.
-- Pickle data types are closely coupled to the Python object model.
-- Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
-- are serialised using dedicated Pickle opcodes.
-- Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
-- serialised by encoding the name of a constructor callable.
-- They are deserialised by importing that constructor, and calling it.
-- So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
-- can cause arbitrary code execution.
-- 
-- Pickle format has evolved with Python, later protocols add opcodes & types.
-- Later Python releases can pickle to or unpickle from any earlier protocol.
-- 
-- * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
-- * Protocol 1: Binary, no explicit version, first length prefixed types.
-- * Protocol 2: Python 2.3+. Explicit versioning, more length prefixed types.
--   https://www.python.org/dev/peps/pep-0307/
-- * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
-- * Protocol 4: Python 3.4+. Opcodes for 64 bit strings, framing, `set`.
--   https://www.python.org/dev/peps/pep-3154/
-- * Protocol 5: Python 3.8+: Opcodes for `bytearray` and out of band data
--   https://www.python.org/dev/peps/pep-0574/
-- See also: Source (https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py)
PythonPickle = class.class(KaitaiStruct)

PythonPickle.Opcode = enum.Enum {
  mark = 40,
  empty_tuple = 41,
  stop = 46,
  pop = 48,
  pop_mark = 49,
  dup = 50,
  binbytes = 66,
  short_binbytes = 67,
  float = 70,
  binfloat = 71,
  int = 73,
  binint = 74,
  binint1 = 75,
  long = 76,
  binint2 = 77,
  none = 78,
  persid = 80,
  binpersid = 81,
  reduce = 82,
  string = 83,
  binstring = 84,
  short_binstring = 85,
  unicode = 86,
  binunicode = 88,
  empty_list = 93,
  append = 97,
  build = 98,
  global_opcode = 99,
  dict = 100,
  appends = 101,
  get = 103,
  binget = 104,
  inst = 105,
  long_binget = 106,
  list = 108,
  obj = 111,
  put = 112,
  binput = 113,
  long_binput = 114,
  setitem = 115,
  tuple = 116,
  setitems = 117,
  empty_dict = 125,
  proto = 128,
  newobj = 129,
  ext1 = 130,
  ext2 = 131,
  ext4 = 132,
  tuple1 = 133,
  tuple2 = 134,
  tuple3 = 135,
  newtrue = 136,
  newfalse = 137,
  long1 = 138,
  long4 = 139,
  short_binunicode = 140,
  binunicode8 = 141,
  binbytes8 = 142,
  empty_set = 143,
  additems = 144,
  frozenset = 145,
  newobj_ex = 146,
  stack_global = 147,
  memoize = 148,
  frame = 149,
  bytearray8 = 150,
  next_buffer = 151,
  readonly_buffer = 152,
}

function PythonPickle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PythonPickle:_read()
  self.ops = {}
  local i = 0
  while true do
    _ = PythonPickle.Op(self._io, self, self._root)
    self.ops[i + 1] = _
    if _.code == PythonPickle.Opcode.stop then
      break
    end
    i = i + 1
  end
end


-- 
-- Length prefixed string, between 0 and 2**64-1 bytes long.
-- 
-- Only a 64-bit build of Python would produce a pickle containing strings
-- large enough to need this type. Such a pickle could not be unpickled on
-- a 32-bit build of Python, because the string would be larger than
-- `sys.maxsize`.
PythonPickle.Unicodestring8 = class.class(KaitaiStruct)

function PythonPickle.Unicodestring8:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Unicodestring8:_read()
self.len = self._io:read_u8le()
self.val = str_decode.decode(self._io:read_bytes(self.len), "utf8")
end


-- 
-- Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
-- encoded as two's complement.
PythonPickle.Long1 = class.class(KaitaiStruct)

function PythonPickle.Long1:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Long1:_read()
self.len = self._io:read_u1()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Length prefixed string, between 0 and 2**64-1 bytes long.
-- 
-- Only a 64-bit build of Python would produce a pickle containing strings
-- large enough to need this type. Such a pickle could not be unpickled on
-- a 32-bit build of Python, because the string would be larger than
-- `sys.maxsize`.
PythonPickle.Bytes8 = class.class(KaitaiStruct)

function PythonPickle.Bytes8:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Bytes8:_read()
self.len = self._io:read_u8le()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Length prefixed byte string, between 0 and 255 bytes long.
PythonPickle.Bytes1 = class.class(KaitaiStruct)

function PythonPickle.Bytes1:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Bytes1:_read()
self.len = self._io:read_u1()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Length prefixed string, between 0 and 2**32-1 bytes long.
PythonPickle.Bytes4 = class.class(KaitaiStruct)

function PythonPickle.Bytes4:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Bytes4:_read()
self.len = self._io:read_u4le()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Some opcodes take no argument, this empty type is used for them.
PythonPickle.NoArg = class.class(KaitaiStruct)

function PythonPickle.NoArg:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.NoArg:_read()
end


-- 
-- Unquoted string, does not contain string escapes.
PythonPickle.StringnlNoescape = class.class(KaitaiStruct)

function PythonPickle.StringnlNoescape:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.StringnlNoescape:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


-- 
-- Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
PythonPickle.DecimalnlLong = class.class(KaitaiStruct)

function PythonPickle.DecimalnlLong:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.DecimalnlLong:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


-- 
-- Length prefixed string, between 0 and 2**32-1 bytes long.
PythonPickle.Unicodestring4 = class.class(KaitaiStruct)

function PythonPickle.Unicodestring4:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Unicodestring4:_read()
self.len = self._io:read_u4le()
self.val = str_decode.decode(self._io:read_bytes(self.len), "utf8")
end


-- 
-- Unquoted string, containing Python Unicode escapes.
PythonPickle.Unicodestringnl = class.class(KaitaiStruct)

function PythonPickle.Unicodestringnl:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Unicodestringnl:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


-- 
-- Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
-- encoded as two's complement.
PythonPickle.Long4 = class.class(KaitaiStruct)

function PythonPickle.Long4:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Long4:_read()
self.len = self._io:read_u4le()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Length prefixed string, between 0 and 255 bytes long. Encoding is
-- unspecified.
-- 
-- The default Python 2.x string type (`str`) is a sequence of bytes.
-- These are pickled as `string1` or `string4`, when protocol == 2.
-- The bytes are written directly, no explicit encoding is performed.
-- 
-- Python 3.x will not pickle an object as `string1` or `string4`.
-- Instead, opcodes and types with a known encoding are used.
-- When unpickling
-- 
-- - `pickle.Unpickler` objects default to ASCII, which can be overriden
-- - `pickletools.dis` uses latin1, and cannot be overriden
-- See also: Source (https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495)
PythonPickle.String1 = class.class(KaitaiStruct)

function PythonPickle.String1:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.String1:_read()
self.len = self._io:read_u1()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Length prefixed string, between 0 and 2**64-1 bytes long.
-- 
-- The contents are deserilised into a `bytearray` object.
PythonPickle.Bytearray8 = class.class(KaitaiStruct)

function PythonPickle.Bytearray8:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Bytearray8:_read()
self.len = self._io:read_u8le()
self.val = self._io:read_bytes(self.len)
end


-- 
-- Integer or boolean, encoded with the ASCII characters [0-9-].
-- 
-- The values '00' and '01' encode the Python values `False` and `True`.
-- Normally a value would not contain leading '0' characters.
PythonPickle.DecimalnlShort = class.class(KaitaiStruct)

function PythonPickle.DecimalnlShort:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.DecimalnlShort:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


-- 
-- Length prefixed string, between 0 and 255 bytes long.
PythonPickle.Unicodestring1 = class.class(KaitaiStruct)

function PythonPickle.Unicodestring1:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Unicodestring1:_read()
self.len = self._io:read_u1()
self.val = str_decode.decode(self._io:read_bytes(self.len), "utf8")
end


-- 
-- Quoted string, possibly containing Python string escapes.
PythonPickle.Stringnl = class.class(KaitaiStruct)

function PythonPickle.Stringnl:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Stringnl:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


-- 
-- Pair of unquoted, unescaped strings.
PythonPickle.StringnlNoescapePair = class.class(KaitaiStruct)

function PythonPickle.StringnlNoescapePair:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.StringnlNoescapePair:_read()
self.val1 = PythonPickle.StringnlNoescape(self._io, self, self._root)
self.val2 = PythonPickle.StringnlNoescape(self._io, self, self._root)
end


-- 
-- Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
-- unspecified.
-- 
-- Although the len field is signed, any length < 0 will raise an exception
-- during unpickling.
-- 
-- See the documentation for `string1` for further detail about encodings.
-- See also: Source (https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495)
PythonPickle.String4 = class.class(KaitaiStruct)

function PythonPickle.String4:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.String4:_read()
self.len = self._io:read_s4le()
self.val = self._io:read_bytes(self.len)
end


PythonPickle.Op = class.class(KaitaiStruct)

function PythonPickle.Op:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Op:_read()
self.code = PythonPickle.Opcode(self._io:read_u1())
local _on = self.code
if _on == PythonPickle.Opcode.ext4 then
  self.arg = self._io:read_u4le()
elseif _on == PythonPickle.Opcode.tuple1 then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.setitem then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.readonly_buffer then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.stop then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.ext2 then
  self.arg = self._io:read_u2le()
elseif _on == PythonPickle.Opcode.empty_tuple then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.newtrue then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.long then
  self.arg = PythonPickle.DecimalnlLong(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.newobj then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.bytearray8 then
  self.arg = PythonPickle.Bytearray8(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.put then
  self.arg = PythonPickle.DecimalnlShort(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.stack_global then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.pop_mark then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.append then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.newfalse then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binpersid then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.build then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.empty_dict then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.tuple2 then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.long4 then
  self.arg = PythonPickle.Long4(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.next_buffer then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.appends then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binbytes then
  self.arg = PythonPickle.Bytes4(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.dup then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.list then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.proto then
  self.arg = self._io:read_u1()
elseif _on == PythonPickle.Opcode.pop then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.frame then
  self.arg = self._io:read_u8le()
elseif _on == PythonPickle.Opcode.string then
  self.arg = PythonPickle.Stringnl(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binunicode then
  self.arg = PythonPickle.Unicodestring4(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.float then
  self.arg = PythonPickle.Floatnl(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.reduce then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.global_opcode then
  self.arg = PythonPickle.StringnlNoescapePair(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binput then
  self.arg = self._io:read_u1()
elseif _on == PythonPickle.Opcode.memoize then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.persid then
  self.arg = PythonPickle.StringnlNoescape(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.ext1 then
  self.arg = self._io:read_u1()
elseif _on == PythonPickle.Opcode.none then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.short_binunicode then
  self.arg = PythonPickle.Unicodestring1(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.obj then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binfloat then
  self.arg = self._io:read_f8be()
elseif _on == PythonPickle.Opcode.newobj_ex then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.empty_list then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.tuple then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binunicode8 then
  self.arg = PythonPickle.Unicodestring8(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binget then
  self.arg = self._io:read_u1()
elseif _on == PythonPickle.Opcode.dict then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binstring then
  self.arg = PythonPickle.String4(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.setitems then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binint2 then
  self.arg = self._io:read_u2le()
elseif _on == PythonPickle.Opcode.binbytes8 then
  self.arg = PythonPickle.Bytes8(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binint1 then
  self.arg = self._io:read_u1()
elseif _on == PythonPickle.Opcode.inst then
  self.arg = PythonPickle.StringnlNoescapePair(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.long_binget then
  self.arg = self._io:read_u4le()
elseif _on == PythonPickle.Opcode.long_binput then
  self.arg = self._io:read_u4le()
elseif _on == PythonPickle.Opcode.int then
  self.arg = PythonPickle.DecimalnlShort(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.binint then
  self.arg = self._io:read_s4le()
elseif _on == PythonPickle.Opcode.unicode then
  self.arg = PythonPickle.Unicodestringnl(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.long1 then
  self.arg = PythonPickle.Long1(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.short_binstring then
  self.arg = PythonPickle.String1(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.mark then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.frozenset then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.tuple3 then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.additems then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.get then
  self.arg = PythonPickle.DecimalnlShort(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.empty_set then
  self.arg = PythonPickle.NoArg(self._io, self, self._root)
elseif _on == PythonPickle.Opcode.short_binbytes then
  self.arg = PythonPickle.Bytes1(self._io, self, self._root)
end
end

-- 
-- Operation code that determines which action should be
-- performed next by the Pickle Virtual Machine. Some opcodes
-- are only available in later versions of the Pickle protocol.
-- 
-- Optional argument for the operation. Data type and length
-- are determined by the value of the opcode.

-- 
-- Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
-- or 'nan'.
PythonPickle.Floatnl = class.class(KaitaiStruct)

function PythonPickle.Floatnl:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PythonPickle.Floatnl:_read()
self.val = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
end


