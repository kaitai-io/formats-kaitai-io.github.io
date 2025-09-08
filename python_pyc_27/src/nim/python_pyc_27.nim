import kaitai_struct_nim_runtime
import options

type
  PythonPyc27* = ref object of KaitaiStruct
    `versionMagic`*: PythonPyc27_Version
    `crlf`*: uint16
    `modificationTimestamp`*: uint32
    `body`*: PythonPyc27_PyObject
    `parent`*: KaitaiStruct
  PythonPyc27_Version* = enum
    v15 = 20121
    v16 = 50428
    v20 = 50823
    v21 = 60202
    v22 = 60717
    v23_a0 = 62011
    v23_a0b = 62021
    v24_a0 = 62041
    v24_a3 = 62051
    v24_b1 = 62061
    v25_a0 = 62071
    v25_a0b = 62081
    v25_a0c = 62091
    v25_a0d = 62092
    v25_b3 = 62101
    v25_b3b = 62111
    v25_c1 = 62121
    v25_c2 = 62131
    v26_a0 = 62151
    v26_a1 = 62161
    v27_a0 = 62171
    v27_a0b = 62181
    v27_a0c = 62191
    v27_a0d = 62201
    v27_a0e = 62211
  PythonPyc27_Assembly* = ref object of KaitaiStruct
    `stringMagic`*: seq[byte]
    `length`*: uint32
    `items`*: PythonPyc27_OpArgs
    `parent`*: PythonPyc27_CodeObject
    `rawItems`*: seq[byte]
  PythonPyc27_CodeObject* = ref object of KaitaiStruct
    `argCount`*: uint32
    `localCount`*: uint32
    `stackSize`*: uint32
    `flags`*: PythonPyc27_CodeObject_FlagsEnum
    `code`*: PythonPyc27_Assembly
    `consts`*: PythonPyc27_PyObject
    `names`*: PythonPyc27_PyObject
    `varNames`*: PythonPyc27_PyObject
    `freeVars`*: PythonPyc27_PyObject
    `cellVars`*: PythonPyc27_PyObject
    `filename`*: PythonPyc27_PyObject
    `name`*: PythonPyc27_PyObject
    `firstLineNo`*: uint32
    `lnotab`*: PythonPyc27_PyObject
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_CodeObject_FlagsEnum* = enum
    has_args = 4
    has_kwargs = 8
    generator = 32
  PythonPyc27_OpArg* = ref object of KaitaiStruct
    `opCode`*: PythonPyc27_OpArg_OpCodeEnum
    `arg`*: uint16
    `parent`*: PythonPyc27_OpArgs
  PythonPyc27_OpArg_OpCodeEnum* = enum
    stop_code = 0
    pop_top = 1
    rot_two = 2
    rot_three = 3
    dup_top = 4
    rot_four = 5
    nop = 9
    unary_positive = 10
    unary_negative = 11
    unary_not = 12
    unary_convert = 13
    unary_invert = 15
    binary_power = 19
    binary_multiply = 20
    binary_divide = 21
    binary_modulo = 22
    binary_add = 23
    binary_subtract = 24
    binary_subscr = 25
    binary_floor_divide = 26
    binary_true_divide = 27
    inplace_floor_divide = 28
    inplace_true_divide = 29
    slice_0 = 30
    slice_1 = 31
    slice_2 = 32
    slice_3 = 33
    store_slice_0 = 40
    store_slice_1 = 41
    store_slice_2 = 42
    store_slice_3 = 43
    delete_slice_0 = 50
    delete_slice_1 = 51
    delete_slice_2 = 52
    delete_slice_3 = 53
    store_map = 54
    inplace_add = 55
    inplace_subtract = 56
    inplace_multiply = 57
    inplace_divide = 58
    inplace_modulo = 59
    store_subscr = 60
    delete_subscr = 61
    binary_lshift = 62
    binary_rshift = 63
    binary_and = 64
    binary_xor = 65
    binary_or = 66
    inplace_power = 67
    get_iter = 68
    print_expr = 70
    print_item = 71
    print_newline = 72
    print_item_to = 73
    print_newline_to = 74
    inplace_lshift = 75
    inplace_rshift = 76
    inplace_and = 77
    inplace_xor = 78
    inplace_or = 79
    break_loop = 80
    with_cleanup = 81
    load_locals = 82
    return_value = 83
    import_star = 84
    exec_stmt = 85
    yield_value = 86
    pop_block = 87
    end_finally = 88
    build_class = 89
    store_name = 90
    delete_name = 91
    unpack_sequence = 92
    for_iter = 93
    list_append = 94
    store_attr = 95
    delete_attr = 96
    store_global = 97
    delete_global = 98
    dup_topx = 99
    load_const = 100
    load_name = 101
    build_tuple = 102
    build_list = 103
    build_set = 104
    build_map = 105
    load_attr = 106
    compare_op = 107
    import_name = 108
    import_from = 109
    jump_forward = 110
    jump_if_false_or_pop = 111
    jump_if_true_or_pop = 112
    jump_absolute = 113
    pop_jump_if_false = 114
    pop_jump_if_true = 115
    load_global = 116
    continue_loop = 119
    setup_loop = 120
    setup_except = 121
    setup_finally = 122
    load_fast = 124
    store_fast = 125
    delete_fast = 126
    raise_varargs = 130
    call_function = 131
    make_function = 132
    build_slice = 133
    make_closure = 134
    load_closure = 135
    load_deref = 136
    store_deref = 137
    call_function_var = 140
    call_function_kw = 141
    call_function_var_kw = 142
    setup_with = 143
    extended_arg = 145
    set_add = 146
    map_add = 147
  PythonPyc27_OpArgs* = ref object of KaitaiStruct
    `items`*: seq[PythonPyc27_OpArg]
    `parent`*: PythonPyc27_Assembly
  PythonPyc27_PyObject* = ref object of KaitaiStruct
    `type`*: PythonPyc27_PyObject_ObjectType
    `value`*: KaitaiStruct
    `parent`*: KaitaiStruct
  PythonPyc27_PyObject_ObjectType* = enum
    tuple = 40
    py_false = 70
    none = 78
    string_ref = 82
    py_true = 84
    code_object = 99
    int = 105
    string = 115
    interned = 116
    unicode_string = 117
  PythonPyc27_PyObject_InternedString* = ref object of KaitaiStruct
    `length`*: uint32
    `data`*: string
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_PyFalse* = ref object of KaitaiStruct
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_PyNone* = ref object of KaitaiStruct
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_PyString* = ref object of KaitaiStruct
    `length`*: uint32
    `data`*: seq[byte]
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_PyTrue* = ref object of KaitaiStruct
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_StringRef* = ref object of KaitaiStruct
    `internedListIndex`*: uint32
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_Tuple* = ref object of KaitaiStruct
    `count`*: uint32
    `items`*: seq[PythonPyc27_PyObject]
    `parent`*: PythonPyc27_PyObject
  PythonPyc27_PyObject_UnicodeString* = ref object of KaitaiStruct
    `length`*: uint32
    `data`*: string
    `parent`*: KaitaiStruct

proc read*(_: typedesc[PythonPyc27], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27
proc read*(_: typedesc[PythonPyc27_Assembly], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_CodeObject): PythonPyc27_Assembly
proc read*(_: typedesc[PythonPyc27_CodeObject], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_CodeObject
proc read*(_: typedesc[PythonPyc27_OpArg], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_OpArgs): PythonPyc27_OpArg
proc read*(_: typedesc[PythonPyc27_OpArgs], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_Assembly): PythonPyc27_OpArgs
proc read*(_: typedesc[PythonPyc27_PyObject], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27_PyObject
proc read*(_: typedesc[PythonPyc27_PyObject_InternedString], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_InternedString
proc read*(_: typedesc[PythonPyc27_PyObject_PyFalse], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyFalse
proc read*(_: typedesc[PythonPyc27_PyObject_PyNone], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyNone
proc read*(_: typedesc[PythonPyc27_PyObject_PyString], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyString
proc read*(_: typedesc[PythonPyc27_PyObject_PyTrue], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyTrue
proc read*(_: typedesc[PythonPyc27_PyObject_StringRef], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_StringRef
proc read*(_: typedesc[PythonPyc27_PyObject_Tuple], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_Tuple
proc read*(_: typedesc[PythonPyc27_PyObject_UnicodeString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27_PyObject_UnicodeString



##[
Python interpreter runs .py files in 2 step process: first, it
produces bytecode, which it then executes. Translation of .py source
into bytecode is time-consuming, so Python dumps compiled bytecode
into .pyc files, to be reused from cache at later time if possible.

.pyc file is essentially a raw dump of `py_object` (see `body`) with
a simple header prepended.

]##
proc read*(_: typedesc[PythonPyc27], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27 =
  template this: untyped = result
  this = new(PythonPyc27)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionMagicExpr = PythonPyc27_Version(this.io.readU2le())
  this.versionMagic = versionMagicExpr
  let crlfExpr = this.io.readU2le()
  this.crlf = crlfExpr
  let modificationTimestampExpr = this.io.readU4le()
  this.modificationTimestamp = modificationTimestampExpr
  let bodyExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.body = bodyExpr

proc fromFile*(_: typedesc[PythonPyc27], filename: string): PythonPyc27 =
  PythonPyc27.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_Assembly], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_CodeObject): PythonPyc27_Assembly =
  template this: untyped = result
  this = new(PythonPyc27_Assembly)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let stringMagicExpr = this.io.readBytes(int(1))
  this.stringMagic = stringMagicExpr
  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let rawItemsExpr = this.io.readBytes(int(this.length))
  this.rawItems = rawItemsExpr
  let rawItemsIo = newKaitaiStream(rawItemsExpr)
  let itemsExpr = PythonPyc27_OpArgs.read(rawItemsIo, this.root, this)
  this.items = itemsExpr

proc fromFile*(_: typedesc[PythonPyc27_Assembly], filename: string): PythonPyc27_Assembly =
  PythonPyc27_Assembly.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_CodeObject], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_CodeObject =
  template this: untyped = result
  this = new(PythonPyc27_CodeObject)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let argCountExpr = this.io.readU4le()
  this.argCount = argCountExpr
  let localCountExpr = this.io.readU4le()
  this.localCount = localCountExpr
  let stackSizeExpr = this.io.readU4le()
  this.stackSize = stackSizeExpr
  let flagsExpr = PythonPyc27_CodeObject_FlagsEnum(this.io.readU4le())
  this.flags = flagsExpr
  let codeExpr = PythonPyc27_Assembly.read(this.io, this.root, this)
  this.code = codeExpr
  let constsExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.consts = constsExpr
  let namesExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.names = namesExpr
  let varNamesExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.varNames = varNamesExpr
  let freeVarsExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.freeVars = freeVarsExpr
  let cellVarsExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.cellVars = cellVarsExpr
  let filenameExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.filename = filenameExpr
  let nameExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.name = nameExpr
  let firstLineNoExpr = this.io.readU4le()
  this.firstLineNo = firstLineNoExpr
  let lnotabExpr = PythonPyc27_PyObject.read(this.io, this.root, this)
  this.lnotab = lnotabExpr

proc fromFile*(_: typedesc[PythonPyc27_CodeObject], filename: string): PythonPyc27_CodeObject =
  PythonPyc27_CodeObject.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_OpArg], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_OpArgs): PythonPyc27_OpArg =
  template this: untyped = result
  this = new(PythonPyc27_OpArg)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let opCodeExpr = PythonPyc27_OpArg_OpCodeEnum(this.io.readU1())
  this.opCode = opCodeExpr
  if ord(this.opCode) >= ord(python_pyc_27.store_name):
    let argExpr = this.io.readU2le()
    this.arg = argExpr

proc fromFile*(_: typedesc[PythonPyc27_OpArg], filename: string): PythonPyc27_OpArg =
  PythonPyc27_OpArg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_OpArgs], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_Assembly): PythonPyc27_OpArgs =
  template this: untyped = result
  this = new(PythonPyc27_OpArgs)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = PythonPyc27_OpArg.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[PythonPyc27_OpArgs], filename: string): PythonPyc27_OpArgs =
  PythonPyc27_OpArgs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27_PyObject =
  template this: untyped = result
  this = new(PythonPyc27_PyObject)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = PythonPyc27_PyObject_ObjectType(this.io.readU1())
  this.type = typeExpr
  block:
    let on = this.type
    if on == python_pyc_27.code_object:
      let valueExpr = PythonPyc27_CodeObject.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.int:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == python_pyc_27.interned:
      let valueExpr = PythonPyc27_PyObject_InternedString.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.none:
      let valueExpr = PythonPyc27_PyObject_PyNone.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.py_false:
      let valueExpr = PythonPyc27_PyObject_PyFalse.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.py_true:
      let valueExpr = PythonPyc27_PyObject_PyTrue.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.string:
      let valueExpr = PythonPyc27_PyObject_PyString.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.string_ref:
      let valueExpr = PythonPyc27_PyObject_StringRef.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == python_pyc_27.tuple:
      let valueExpr = PythonPyc27_PyObject_Tuple.read(this.io, this.root, this)
      this.value = valueExpr

proc fromFile*(_: typedesc[PythonPyc27_PyObject], filename: string): PythonPyc27_PyObject =
  PythonPyc27_PyObject.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_InternedString], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_InternedString =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_InternedString)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let dataExpr = encode(this.io.readBytes(int(this.length)), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[PythonPyc27_PyObject_InternedString], filename: string): PythonPyc27_PyObject_InternedString =
  PythonPyc27_PyObject_InternedString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_PyFalse], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyFalse =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_PyFalse)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[PythonPyc27_PyObject_PyFalse], filename: string): PythonPyc27_PyObject_PyFalse =
  PythonPyc27_PyObject_PyFalse.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_PyNone], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyNone =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_PyNone)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[PythonPyc27_PyObject_PyNone], filename: string): PythonPyc27_PyObject_PyNone =
  PythonPyc27_PyObject_PyNone.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_PyString], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyString =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_PyString)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let dataExpr = this.io.readBytes(int(this.length))
  this.data = dataExpr

proc fromFile*(_: typedesc[PythonPyc27_PyObject_PyString], filename: string): PythonPyc27_PyObject_PyString =
  PythonPyc27_PyObject_PyString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_PyTrue], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_PyTrue =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_PyTrue)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[PythonPyc27_PyObject_PyTrue], filename: string): PythonPyc27_PyObject_PyTrue =
  PythonPyc27_PyObject_PyTrue.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_StringRef], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_StringRef =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_StringRef)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let internedListIndexExpr = this.io.readU4le()
  this.internedListIndex = internedListIndexExpr

proc fromFile*(_: typedesc[PythonPyc27_PyObject_StringRef], filename: string): PythonPyc27_PyObject_StringRef =
  PythonPyc27_PyObject_StringRef.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_Tuple], io: KaitaiStream, root: KaitaiStruct, parent: PythonPyc27_PyObject): PythonPyc27_PyObject_Tuple =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_Tuple)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU4le()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = PythonPyc27_PyObject.read(this.io, this.root, this)
    this.items.add(it)

proc fromFile*(_: typedesc[PythonPyc27_PyObject_Tuple], filename: string): PythonPyc27_PyObject_Tuple =
  PythonPyc27_PyObject_Tuple.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PythonPyc27_PyObject_UnicodeString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PythonPyc27_PyObject_UnicodeString =
  template this: untyped = result
  this = new(PythonPyc27_PyObject_UnicodeString)
  let root = if root == nil: cast[PythonPyc27](this) else: cast[PythonPyc27](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let dataExpr = encode(this.io.readBytes(int(this.length)), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[PythonPyc27_PyObject_UnicodeString], filename: string): PythonPyc27_PyObject_UnicodeString =
  PythonPyc27_PyObject_UnicodeString.read(newKaitaiFileStream(filename), nil, nil)

