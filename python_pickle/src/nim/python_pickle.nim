import kaitai_struct_nim_runtime
import options

type
  PythonPickle* = ref object of KaitaiStruct
    `ops`*: seq[PythonPickle_Op]
    `parent`*: KaitaiStruct
  PythonPickle_Opcode* = enum
    mark = 40
    empty_tuple = 41
    stop = 46
    pop = 48
    pop_mark = 49
    dup = 50
    binbytes = 66
    short_binbytes = 67
    float = 70
    binfloat = 71
    int = 73
    binint = 74
    binint1 = 75
    long = 76
    binint2 = 77
    none = 78
    persid = 80
    binpersid = 81
    reduce = 82
    string = 83
    binstring = 84
    short_binstring = 85
    unicode = 86
    binunicode = 88
    empty_list = 93
    append = 97
    build = 98
    global_opcode = 99
    dict = 100
    appends = 101
    get = 103
    binget = 104
    inst = 105
    long_binget = 106
    list = 108
    obj = 111
    put = 112
    binput = 113
    long_binput = 114
    setitem = 115
    tuple = 116
    setitems = 117
    empty_dict = 125
    proto = 128
    newobj = 129
    ext1 = 130
    ext2 = 131
    ext4 = 132
    tuple1 = 133
    tuple2 = 134
    tuple3 = 135
    newtrue = 136
    newfalse = 137
    long1 = 138
    long4 = 139
    short_binunicode = 140
    binunicode8 = 141
    binbytes8 = 142
    empty_set = 143
    additems = 144
    frozenset = 145
    newobj_ex = 146
    stack_global = 147
    memoize = 148
    frame = 149
    bytearray8 = 150
    next_buffer = 151
    readonly_buffer = 152
  PythonPickle_Bytearray8* = ref object of KaitaiStruct
    `len`*: uint64
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_Bytes1* = ref object of KaitaiStruct
    `len`*: uint8
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_Bytes4* = ref object of KaitaiStruct
    `len`*: uint32
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_Bytes8* = ref object of KaitaiStruct
    `len`*: uint64
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_DecimalnlLong* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_DecimalnlShort* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_Floatnl* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_Long1* = ref object of KaitaiStruct
    `len`*: uint8
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_Long4* = ref object of KaitaiStruct
    `len`*: uint32
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_NoArg* = ref object of KaitaiStruct
    `parent`*: PythonPickle_Op
  PythonPickle_Op* = ref object of KaitaiStruct
    `code`*: PythonPickle_Opcode
    `arg`*: KaitaiStruct
    `parent`*: PythonPickle
  PythonPickle_String1* = ref object of KaitaiStruct
    `len`*: uint8
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_String4* = ref object of KaitaiStruct
    `len`*: int32
    `val`*: seq[byte]
    `parent`*: PythonPickle_Op
  PythonPickle_Stringnl* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_StringnlNoescape* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: KaitaiStruct
  PythonPickle_StringnlNoescapePair* = ref object of KaitaiStruct
    `val1`*: PythonPickle_StringnlNoescape
    `val2`*: PythonPickle_StringnlNoescape
    `parent`*: PythonPickle_Op
  PythonPickle_Unicodestring1* = ref object of KaitaiStruct
    `len`*: uint8
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_Unicodestring4* = ref object of KaitaiStruct
    `len`*: uint32
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_Unicodestring8* = ref object of KaitaiStruct
    `len`*: uint64
    `val`*: string
    `parent`*: PythonPickle_Op
  PythonPickle_Unicodestringnl* = ref object of KaitaiStruct
    `val`*: string
    `parent`*: PythonPickle_Op

proc read*(_: typedesc[PythonPickle], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPickle
proc read*(_: typedesc[PythonPickle_Bytearray8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytearray8
proc read*(_: typedesc[PythonPickle_Bytes1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes1
proc read*(_: typedesc[PythonPickle_Bytes4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes4
proc read*(_: typedesc[PythonPickle_Bytes8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes8
proc read*(_: typedesc[PythonPickle_DecimalnlLong], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_DecimalnlLong
proc read*(_: typedesc[PythonPickle_DecimalnlShort], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_DecimalnlShort
proc read*(_: typedesc[PythonPickle_Floatnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Floatnl
proc read*(_: typedesc[PythonPickle_Long1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Long1
proc read*(_: typedesc[PythonPickle_Long4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Long4
proc read*(_: typedesc[PythonPickle_NoArg], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_NoArg
proc read*(_: typedesc[PythonPickle_Op], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle): PythonPickle_Op
proc read*(_: typedesc[PythonPickle_String1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_String1
proc read*(_: typedesc[PythonPickle_String4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_String4
proc read*(_: typedesc[PythonPickle_Stringnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Stringnl
proc read*(_: typedesc[PythonPickle_StringnlNoescape], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPickle_StringnlNoescape
proc read*(_: typedesc[PythonPickle_StringnlNoescapePair], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_StringnlNoescapePair
proc read*(_: typedesc[PythonPickle_Unicodestring1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring1
proc read*(_: typedesc[PythonPickle_Unicodestring4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring4
proc read*(_: typedesc[PythonPickle_Unicodestring8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring8
proc read*(_: typedesc[PythonPickle_Unicodestringnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestringnl



##[
Python Pickle format serializes Python objects to a byte stream, as a sequence
of operations to run on the Pickle Virtual Machine.

The format is mostly implementation defined, there is no formal specification.
Pickle data types are closely coupled to the Python object model.
Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
are serialised using dedicated Pickle opcodes.
Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
serialised by encoding the name of a constructor callable.
They are deserialised by importing that constructor, and calling it.
So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
can cause arbitrary code execution.

Pickle format has evolved with Python, later protocols add opcodes & types.
Later Python releases can pickle to or unpickle from any earlier protocol.

* Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
* Protocol 1: Binary, no explicit version, first length prefixed types.
* Protocol 2 ([PEP 307](https://peps.python.org/pep-0307/)): Python 2.3+.
  Explicit versioning, more length prefixed types.
* Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
* Protocol 4 ([PEP 3154](https://peps.python.org/pep-3154/)): Python 3.4+.
  Opcodes for 64 bit strings, framing, `set`.
* Protocol 5 ([PEP 574](https://peps.python.org/pep-0574/)): Python 3.8+:
Opcodes for `bytearray` and out of band data

@see <a href="https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py">Source</a>
]##
proc read*(_: typedesc[PythonPickle], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPickle =
  template this: untyped = result
  this = new(PythonPickle)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = PythonPickle_Op.read(this.io, this.root, this)
      this.ops.add(it)
      if it.code == python_pickle.stop:
        break
      inc i

proc fromFile*(_: typedesc[PythonPickle], filename: string): PythonPickle =
  PythonPickle.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**64-1 bytes long.

The contents are deserilised into a `bytearray` object.

]##
proc read*(_: typedesc[PythonPickle_Bytearray8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytearray8 =
  template this: untyped = result
  this = new(PythonPickle_Bytearray8)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU8le()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Bytearray8], filename: string): PythonPickle_Bytearray8 =
  PythonPickle_Bytearray8.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed byte string, between 0 and 255 bytes long.
]##
proc read*(_: typedesc[PythonPickle_Bytes1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes1 =
  template this: untyped = result
  this = new(PythonPickle_Bytes1)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Bytes1], filename: string): PythonPickle_Bytes1 =
  PythonPickle_Bytes1.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**32-1 bytes long
]##
proc read*(_: typedesc[PythonPickle_Bytes4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes4 =
  template this: untyped = result
  this = new(PythonPickle_Bytes4)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4le()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Bytes4], filename: string): PythonPickle_Bytes4 =
  PythonPickle_Bytes4.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**64-1 bytes long.

Only a 64-bit build of Python would produce a pickle containing strings
large enough to need this type. Such a pickle could not be unpickled on
a 32-bit build of Python, because the string would be larger than
`sys.maxsize`.

]##
proc read*(_: typedesc[PythonPickle_Bytes8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Bytes8 =
  template this: untyped = result
  this = new(PythonPickle_Bytes8)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU8le()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Bytes8], filename: string): PythonPickle_Bytes8 =
  PythonPickle_Bytes8.read(newKaitaiFileStream(filename), nil, nil)


##[
Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
]##
proc read*(_: typedesc[PythonPickle_DecimalnlLong], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_DecimalnlLong =
  template this: untyped = result
  this = new(PythonPickle_DecimalnlLong)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_DecimalnlLong], filename: string): PythonPickle_DecimalnlLong =
  PythonPickle_DecimalnlLong.read(newKaitaiFileStream(filename), nil, nil)


##[
Integer or boolean, encoded with the ASCII characters [0-9-].

The values '00' and '01' encode the Python values `False` and `True`.
Normally a value would not contain leading '0' characters.

]##
proc read*(_: typedesc[PythonPickle_DecimalnlShort], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_DecimalnlShort =
  template this: untyped = result
  this = new(PythonPickle_DecimalnlShort)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_DecimalnlShort], filename: string): PythonPickle_DecimalnlShort =
  PythonPickle_DecimalnlShort.read(newKaitaiFileStream(filename), nil, nil)


##[
Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
or 'nan'.

]##
proc read*(_: typedesc[PythonPickle_Floatnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Floatnl =
  template this: untyped = result
  this = new(PythonPickle_Floatnl)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Floatnl], filename: string): PythonPickle_Floatnl =
  PythonPickle_Floatnl.read(newKaitaiFileStream(filename), nil, nil)


##[
Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
encoded as two's complement.

]##
proc read*(_: typedesc[PythonPickle_Long1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Long1 =
  template this: untyped = result
  this = new(PythonPickle_Long1)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Long1], filename: string): PythonPickle_Long1 =
  PythonPickle_Long1.read(newKaitaiFileStream(filename), nil, nil)


##[
Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
encoded as two's complement.

]##
proc read*(_: typedesc[PythonPickle_Long4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Long4 =
  template this: untyped = result
  this = new(PythonPickle_Long4)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4le()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Long4], filename: string): PythonPickle_Long4 =
  PythonPickle_Long4.read(newKaitaiFileStream(filename), nil, nil)


##[
Some opcodes take no argument, this empty type is used for them.
]##
proc read*(_: typedesc[PythonPickle_NoArg], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_NoArg =
  template this: untyped = result
  this = new(PythonPickle_NoArg)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[PythonPickle_NoArg], filename: string): PythonPickle_NoArg =
  PythonPickle_NoArg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPickle_Op], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle): PythonPickle_Op =
  template this: untyped = result
  this = new(PythonPickle_Op)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Operation code that determines which action should be
performed next by the Pickle Virtual Machine. Some opcodes
are only available in later versions of the Pickle protocol.

  ]##
  let codeExpr = PythonPickle_Opcode(this.io.readU1())
  this.code = codeExpr

  ##[
  Optional argument for the operation. Data type and length
are determined by the value of the opcode.

  ]##
  block:
    let on = this.code
    if on == python_pickle.additems:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.append:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.appends:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binbytes:
      let argExpr = PythonPickle_Bytes4.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binbytes8:
      let argExpr = PythonPickle_Bytes8.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binfloat:
      let argExpr = KaitaiStruct(this.io.readF8be())
      this.arg = argExpr
    elif on == python_pickle.binget:
      let argExpr = KaitaiStruct(this.io.readU1())
      this.arg = argExpr
    elif on == python_pickle.binint:
      let argExpr = KaitaiStruct(this.io.readS4le())
      this.arg = argExpr
    elif on == python_pickle.binint1:
      let argExpr = KaitaiStruct(this.io.readU1())
      this.arg = argExpr
    elif on == python_pickle.binint2:
      let argExpr = KaitaiStruct(this.io.readU2le())
      this.arg = argExpr
    elif on == python_pickle.binpersid:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binput:
      let argExpr = KaitaiStruct(this.io.readU1())
      this.arg = argExpr
    elif on == python_pickle.binstring:
      let argExpr = PythonPickle_String4.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binunicode:
      let argExpr = PythonPickle_Unicodestring4.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.binunicode8:
      let argExpr = PythonPickle_Unicodestring8.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.build:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.bytearray8:
      let argExpr = PythonPickle_Bytearray8.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.dict:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.dup:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.empty_dict:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.empty_list:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.empty_set:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.empty_tuple:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.ext1:
      let argExpr = KaitaiStruct(this.io.readU1())
      this.arg = argExpr
    elif on == python_pickle.ext2:
      let argExpr = KaitaiStruct(this.io.readU2le())
      this.arg = argExpr
    elif on == python_pickle.ext4:
      let argExpr = KaitaiStruct(this.io.readU4le())
      this.arg = argExpr
    elif on == python_pickle.float:
      let argExpr = PythonPickle_Floatnl.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.frame:
      let argExpr = KaitaiStruct(this.io.readU8le())
      this.arg = argExpr
    elif on == python_pickle.frozenset:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.get:
      let argExpr = PythonPickle_DecimalnlShort.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.global_opcode:
      let argExpr = PythonPickle_StringnlNoescapePair.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.inst:
      let argExpr = PythonPickle_StringnlNoescapePair.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.int:
      let argExpr = PythonPickle_DecimalnlShort.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.list:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.long:
      let argExpr = PythonPickle_DecimalnlLong.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.long1:
      let argExpr = PythonPickle_Long1.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.long4:
      let argExpr = PythonPickle_Long4.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.long_binget:
      let argExpr = KaitaiStruct(this.io.readU4le())
      this.arg = argExpr
    elif on == python_pickle.long_binput:
      let argExpr = KaitaiStruct(this.io.readU4le())
      this.arg = argExpr
    elif on == python_pickle.mark:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.memoize:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.newfalse:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.newobj:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.newobj_ex:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.newtrue:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.next_buffer:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.none:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.obj:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.persid:
      let argExpr = PythonPickle_StringnlNoescape.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.pop:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.pop_mark:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.proto:
      let argExpr = KaitaiStruct(this.io.readU1())
      this.arg = argExpr
    elif on == python_pickle.put:
      let argExpr = PythonPickle_DecimalnlShort.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.readonly_buffer:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.reduce:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.setitem:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.setitems:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.short_binbytes:
      let argExpr = PythonPickle_Bytes1.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.short_binstring:
      let argExpr = PythonPickle_String1.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.short_binunicode:
      let argExpr = PythonPickle_Unicodestring1.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.stack_global:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.stop:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.string:
      let argExpr = PythonPickle_Stringnl.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.tuple:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.tuple1:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.tuple2:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.tuple3:
      let argExpr = PythonPickle_NoArg.read(this.io, this.root, this)
      this.arg = argExpr
    elif on == python_pickle.unicode:
      let argExpr = PythonPickle_Unicodestringnl.read(this.io, this.root, this)
      this.arg = argExpr

proc fromFile*(_: typedesc[PythonPickle_Op], filename: string): PythonPickle_Op =
  PythonPickle_Op.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 255 bytes long. Encoding is
unspecified.

The default Python 2.x string type (`str`) is a sequence of bytes.
These are pickled as `string1` or `string4`, when protocol == 2.
The bytes are written directly, no explicit encoding is performed.

Python 3.x will not pickle an object as `string1` or `string4`.
Instead, opcodes and types with a known encoding are used.
When unpickling

- `pickle.Unpickler` objects default to ASCII, which can be overriden
- `pickletools.dis` uses latin1, and cannot be overriden

@see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
]##
proc read*(_: typedesc[PythonPickle_String1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_String1 =
  template this: untyped = result
  this = new(PythonPickle_String1)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_String1], filename: string): PythonPickle_String1 =
  PythonPickle_String1.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
unspecified.

Although the len field is signed, any length < 0 will raise an exception
during unpickling.

See the documentation for `string1` for further detail about encodings.

@see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
]##
proc read*(_: typedesc[PythonPickle_String4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_String4 =
  template this: untyped = result
  this = new(PythonPickle_String4)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readS4le()
  this.len = lenExpr
  let valExpr = this.io.readBytes(int(this.len))
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_String4], filename: string): PythonPickle_String4 =
  PythonPickle_String4.read(newKaitaiFileStream(filename), nil, nil)


##[
Quoted string, possibly containing Python string escapes.
]##
proc read*(_: typedesc[PythonPickle_Stringnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Stringnl =
  template this: untyped = result
  this = new(PythonPickle_Stringnl)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Stringnl], filename: string): PythonPickle_Stringnl =
  PythonPickle_Stringnl.read(newKaitaiFileStream(filename), nil, nil)


##[
Unquoted string, does not contain string escapes.
]##
proc read*(_: typedesc[PythonPickle_StringnlNoescape], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPickle_StringnlNoescape =
  template this: untyped = result
  this = new(PythonPickle_StringnlNoescape)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_StringnlNoescape], filename: string): PythonPickle_StringnlNoescape =
  PythonPickle_StringnlNoescape.read(newKaitaiFileStream(filename), nil, nil)


##[
Pair of unquoted, unescaped strings.
]##
proc read*(_: typedesc[PythonPickle_StringnlNoescapePair], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_StringnlNoescapePair =
  template this: untyped = result
  this = new(PythonPickle_StringnlNoescapePair)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let val1Expr = PythonPickle_StringnlNoescape.read(this.io, this.root, this)
  this.val1 = val1Expr
  let val2Expr = PythonPickle_StringnlNoescape.read(this.io, this.root, this)
  this.val2 = val2Expr

proc fromFile*(_: typedesc[PythonPickle_StringnlNoescapePair], filename: string): PythonPickle_StringnlNoescapePair =
  PythonPickle_StringnlNoescapePair.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 255 bytes long
]##
proc read*(_: typedesc[PythonPickle_Unicodestring1], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring1 =
  template this: untyped = result
  this = new(PythonPickle_Unicodestring1)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let valExpr = encode(this.io.readBytes(int(this.len)), "UTF-8")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Unicodestring1], filename: string): PythonPickle_Unicodestring1 =
  PythonPickle_Unicodestring1.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**32-1 bytes long
]##
proc read*(_: typedesc[PythonPickle_Unicodestring4], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring4 =
  template this: untyped = result
  this = new(PythonPickle_Unicodestring4)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4le()
  this.len = lenExpr
  let valExpr = encode(this.io.readBytes(int(this.len)), "UTF-8")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Unicodestring4], filename: string): PythonPickle_Unicodestring4 =
  PythonPickle_Unicodestring4.read(newKaitaiFileStream(filename), nil, nil)


##[
Length prefixed string, between 0 and 2**64-1 bytes long.

Only a 64-bit build of Python would produce a pickle containing strings
large enough to need this type. Such a pickle could not be unpickled on
a 32-bit build of Python, because the string would be larger than
`sys.maxsize`.

]##
proc read*(_: typedesc[PythonPickle_Unicodestring8], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestring8 =
  template this: untyped = result
  this = new(PythonPickle_Unicodestring8)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU8le()
  this.len = lenExpr
  let valExpr = encode(this.io.readBytes(int(this.len)), "UTF-8")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Unicodestring8], filename: string): PythonPickle_Unicodestring8 =
  PythonPickle_Unicodestring8.read(newKaitaiFileStream(filename), nil, nil)


##[
Unquoted string, containing Python Unicode escapes.
]##
proc read*(_: typedesc[PythonPickle_Unicodestringnl], io: KaitaiStream, root: KaitaiStruct, parent: PythonPickle_Op): PythonPickle_Unicodestringnl =
  template this: untyped = result
  this = new(PythonPickle_Unicodestringnl)
  let root = if root == nil: cast[PythonPickle](this) else: cast[PythonPickle](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.val = valExpr

proc fromFile*(_: typedesc[PythonPickle_Unicodestringnl], filename: string): PythonPickle_Unicodestringnl =
  PythonPickle_Unicodestringnl.read(newKaitaiFileStream(filename), nil, nil)

