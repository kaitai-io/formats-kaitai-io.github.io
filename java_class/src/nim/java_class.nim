import kaitai_struct_nim_runtime
import options

type
  JavaClass* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `versionMinor`*: uint16
    `versionMajor`*: uint16
    `constantPoolCount`*: uint16
    `constantPool`*: seq[JavaClass_ConstantPoolEntry]
    `accessFlags`*: uint16
    `thisClass`*: uint16
    `superClass`*: uint16
    `interfacesCount`*: uint16
    `interfaces`*: seq[uint16]
    `fieldsCount`*: uint16
    `fields`*: seq[JavaClass_FieldInfo]
    `methodsCount`*: uint16
    `methods`*: seq[JavaClass_MethodInfo]
    `attributesCount`*: uint16
    `attributes`*: seq[JavaClass_AttributeInfo]
    `parent`*: KaitaiStruct
  JavaClass_FloatCpInfo* = ref object of KaitaiStruct
    `value`*: float32
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_AttributeInfo* = ref object of KaitaiStruct
    `nameIndex`*: uint16
    `attributeLength`*: uint32
    `info`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawInfo`*: seq[byte]
    `nameAsStrInst`*: string
  JavaClass_AttributeInfo_AttrBodyCode* = ref object of KaitaiStruct
    `maxStack`*: uint16
    `maxLocals`*: uint16
    `codeLength`*: uint32
    `code`*: seq[byte]
    `exceptionTableLength`*: uint16
    `exceptionTable`*: seq[JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry]
    `attributesCount`*: uint16
    `attributes`*: seq[JavaClass_AttributeInfo]
    `parent`*: JavaClass_AttributeInfo
  JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry* = ref object of KaitaiStruct
    `startPc`*: uint16
    `endPc`*: uint16
    `handlerPc`*: uint16
    `catchType`*: uint16
    `parent`*: JavaClass_AttributeInfo_AttrBodyCode
    `catchExceptionInst`*: JavaClass_ConstantPoolEntry
  JavaClass_AttributeInfo_AttrBodyExceptions* = ref object of KaitaiStruct
    `numberOfExceptions`*: uint16
    `exceptions`*: seq[JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry]
    `parent`*: JavaClass_AttributeInfo
  JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry* = ref object of KaitaiStruct
    `index`*: uint16
    `parent`*: JavaClass_AttributeInfo_AttrBodyExceptions
    `asInfoInst`*: JavaClass_ClassCpInfo
    `nameAsStrInst`*: string
  JavaClass_AttributeInfo_AttrBodySourceFile* = ref object of KaitaiStruct
    `sourcefileIndex`*: uint16
    `parent`*: JavaClass_AttributeInfo
    `sourcefileAsStrInst`*: string
  JavaClass_AttributeInfo_AttrBodyLineNumberTable* = ref object of KaitaiStruct
    `lineNumberTableLength`*: uint16
    `lineNumberTable`*: seq[JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry]
    `parent`*: JavaClass_AttributeInfo
  JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry* = ref object of KaitaiStruct
    `startPc`*: uint16
    `lineNumber`*: uint16
    `parent`*: JavaClass_AttributeInfo_AttrBodyLineNumberTable
  JavaClass_MethodRefCpInfo* = ref object of KaitaiStruct
    `classIndex`*: uint16
    `nameAndTypeIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
    `classAsInfoInst`*: JavaClass_ClassCpInfo
    `nameAndTypeAsInfoInst`*: JavaClass_NameAndTypeCpInfo
  JavaClass_FieldInfo* = ref object of KaitaiStruct
    `accessFlags`*: uint16
    `nameIndex`*: uint16
    `descriptorIndex`*: uint16
    `attributesCount`*: uint16
    `attributes`*: seq[JavaClass_AttributeInfo]
    `parent`*: JavaClass
    `nameAsStrInst`*: string
  JavaClass_DoubleCpInfo* = ref object of KaitaiStruct
    `value`*: float64
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_LongCpInfo* = ref object of KaitaiStruct
    `value`*: uint64
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_InvokeDynamicCpInfo* = ref object of KaitaiStruct
    `bootstrapMethodAttrIndex`*: uint16
    `nameAndTypeIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_MethodHandleCpInfo* = ref object of KaitaiStruct
    `referenceKind`*: JavaClass_MethodHandleCpInfo_ReferenceKindEnum
    `referenceIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_MethodHandleCpInfo_ReferenceKindEnum* = enum
    get_field = 1
    get_static = 2
    put_field = 3
    put_static = 4
    invoke_virtual = 5
    invoke_static = 6
    invoke_special = 7
    new_invoke_special = 8
    invoke_interface = 9
  JavaClass_NameAndTypeCpInfo* = ref object of KaitaiStruct
    `nameIndex`*: uint16
    `descriptorIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
    `nameAsInfoInst`*: JavaClass_Utf8CpInfo
    `nameAsStrInst`*: string
    `descriptorAsInfoInst`*: JavaClass_Utf8CpInfo
    `descriptorAsStrInst`*: string
  JavaClass_Utf8CpInfo* = ref object of KaitaiStruct
    `strLen`*: uint16
    `value`*: string
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_StringCpInfo* = ref object of KaitaiStruct
    `stringIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_MethodTypeCpInfo* = ref object of KaitaiStruct
    `descriptorIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_InterfaceMethodRefCpInfo* = ref object of KaitaiStruct
    `classIndex`*: uint16
    `nameAndTypeIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
    `classAsInfoInst`*: JavaClass_ClassCpInfo
    `nameAndTypeAsInfoInst`*: JavaClass_NameAndTypeCpInfo
  JavaClass_ClassCpInfo* = ref object of KaitaiStruct
    `nameIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
    `nameAsInfoInst`*: JavaClass_Utf8CpInfo
    `nameAsStrInst`*: string
  JavaClass_ConstantPoolEntry* = ref object of KaitaiStruct
    `tag`*: JavaClass_ConstantPoolEntry_TagEnum
    `cpInfo`*: KaitaiStruct
    `parent`*: JavaClass
  JavaClass_ConstantPoolEntry_TagEnum* = enum
    utf8 = 1
    integer = 3
    float = 4
    long = 5
    double = 6
    class_type = 7
    string = 8
    field_ref = 9
    method_ref = 10
    interface_method_ref = 11
    name_and_type = 12
    method_handle = 15
    method_type = 16
    invoke_dynamic = 18
  JavaClass_MethodInfo* = ref object of KaitaiStruct
    `accessFlags`*: uint16
    `nameIndex`*: uint16
    `descriptorIndex`*: uint16
    `attributesCount`*: uint16
    `attributes`*: seq[JavaClass_AttributeInfo]
    `parent`*: JavaClass
    `nameAsStrInst`*: string
  JavaClass_IntegerCpInfo* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: JavaClass_ConstantPoolEntry
  JavaClass_FieldRefCpInfo* = ref object of KaitaiStruct
    `classIndex`*: uint16
    `nameAndTypeIndex`*: uint16
    `parent`*: JavaClass_ConstantPoolEntry
    `classAsInfoInst`*: JavaClass_ClassCpInfo
    `nameAndTypeAsInfoInst`*: JavaClass_NameAndTypeCpInfo

proc read*(_: typedesc[JavaClass], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JavaClass
proc read*(_: typedesc[JavaClass_FloatCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_FloatCpInfo
proc read*(_: typedesc[JavaClass_AttributeInfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JavaClass_AttributeInfo
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyCode
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyCode): JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyExceptions
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyExceptions): JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodySourceFile], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodySourceFile
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyLineNumberTable
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyLineNumberTable): JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry
proc read*(_: typedesc[JavaClass_MethodRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodRefCpInfo
proc read*(_: typedesc[JavaClass_FieldInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_FieldInfo
proc read*(_: typedesc[JavaClass_DoubleCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_DoubleCpInfo
proc read*(_: typedesc[JavaClass_LongCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_LongCpInfo
proc read*(_: typedesc[JavaClass_InvokeDynamicCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_InvokeDynamicCpInfo
proc read*(_: typedesc[JavaClass_MethodHandleCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodHandleCpInfo
proc read*(_: typedesc[JavaClass_NameAndTypeCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_NameAndTypeCpInfo
proc read*(_: typedesc[JavaClass_Utf8CpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_Utf8CpInfo
proc read*(_: typedesc[JavaClass_StringCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_StringCpInfo
proc read*(_: typedesc[JavaClass_MethodTypeCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodTypeCpInfo
proc read*(_: typedesc[JavaClass_InterfaceMethodRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_InterfaceMethodRefCpInfo
proc read*(_: typedesc[JavaClass_ClassCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_ClassCpInfo
proc read*(_: typedesc[JavaClass_ConstantPoolEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_ConstantPoolEntry
proc read*(_: typedesc[JavaClass_MethodInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_MethodInfo
proc read*(_: typedesc[JavaClass_IntegerCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_IntegerCpInfo
proc read*(_: typedesc[JavaClass_FieldRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_FieldRefCpInfo

proc nameAsStr*(this: JavaClass_AttributeInfo): string
proc catchException*(this: JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry): JavaClass_ConstantPoolEntry
proc asInfo*(this: JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry): JavaClass_ClassCpInfo
proc nameAsStr*(this: JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry): string
proc sourcefileAsStr*(this: JavaClass_AttributeInfo_AttrBodySourceFile): string
proc classAsInfo*(this: JavaClass_MethodRefCpInfo): JavaClass_ClassCpInfo
proc nameAndTypeAsInfo*(this: JavaClass_MethodRefCpInfo): JavaClass_NameAndTypeCpInfo
proc nameAsStr*(this: JavaClass_FieldInfo): string
proc nameAsInfo*(this: JavaClass_NameAndTypeCpInfo): JavaClass_Utf8CpInfo
proc nameAsStr*(this: JavaClass_NameAndTypeCpInfo): string
proc descriptorAsInfo*(this: JavaClass_NameAndTypeCpInfo): JavaClass_Utf8CpInfo
proc descriptorAsStr*(this: JavaClass_NameAndTypeCpInfo): string
proc classAsInfo*(this: JavaClass_InterfaceMethodRefCpInfo): JavaClass_ClassCpInfo
proc nameAndTypeAsInfo*(this: JavaClass_InterfaceMethodRefCpInfo): JavaClass_NameAndTypeCpInfo
proc nameAsInfo*(this: JavaClass_ClassCpInfo): JavaClass_Utf8CpInfo
proc nameAsStr*(this: JavaClass_ClassCpInfo): string
proc nameAsStr*(this: JavaClass_MethodInfo): string
proc classAsInfo*(this: JavaClass_FieldRefCpInfo): JavaClass_ClassCpInfo
proc nameAndTypeAsInfo*(this: JavaClass_FieldRefCpInfo): JavaClass_NameAndTypeCpInfo


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.1">Source</a>
]##
proc read*(_: typedesc[JavaClass], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JavaClass =
  template this: untyped = result
  this = new(JavaClass)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionMinorExpr = this.io.readU2be()
  this.versionMinor = versionMinorExpr
  let versionMajorExpr = this.io.readU2be()
  this.versionMajor = versionMajorExpr
  let constantPoolCountExpr = this.io.readU2be()
  this.constantPoolCount = constantPoolCountExpr
  for i in 0 ..< int((this.constantPoolCount - 1)):
    let it = JavaClass_ConstantPoolEntry.read(this.io, this.root, this)
    this.constantPool.add(it)
  let accessFlagsExpr = this.io.readU2be()
  this.accessFlags = accessFlagsExpr
  let thisClassExpr = this.io.readU2be()
  this.thisClass = thisClassExpr
  let superClassExpr = this.io.readU2be()
  this.superClass = superClassExpr
  let interfacesCountExpr = this.io.readU2be()
  this.interfacesCount = interfacesCountExpr
  for i in 0 ..< int(this.interfacesCount):
    let it = this.io.readU2be()
    this.interfaces.add(it)
  let fieldsCountExpr = this.io.readU2be()
  this.fieldsCount = fieldsCountExpr
  for i in 0 ..< int(this.fieldsCount):
    let it = JavaClass_FieldInfo.read(this.io, this.root, this)
    this.fields.add(it)
  let methodsCountExpr = this.io.readU2be()
  this.methodsCount = methodsCountExpr
  for i in 0 ..< int(this.methodsCount):
    let it = JavaClass_MethodInfo.read(this.io, this.root, this)
    this.methods.add(it)
  let attributesCountExpr = this.io.readU2be()
  this.attributesCount = attributesCountExpr
  for i in 0 ..< int(this.attributesCount):
    let it = JavaClass_AttributeInfo.read(this.io, this.root, this)
    this.attributes.add(it)

proc fromFile*(_: typedesc[JavaClass], filename: string): JavaClass =
  JavaClass.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
]##
proc read*(_: typedesc[JavaClass_FloatCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_FloatCpInfo =
  template this: untyped = result
  this = new(JavaClass_FloatCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readF4be()
  this.value = valueExpr

proc fromFile*(_: typedesc[JavaClass_FloatCpInfo], filename: string): JavaClass_FloatCpInfo =
  JavaClass_FloatCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): JavaClass_AttributeInfo =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameIndexExpr = this.io.readU2be()
  this.nameIndex = nameIndexExpr
  let attributeLengthExpr = this.io.readU4be()
  this.attributeLength = attributeLengthExpr
  block:
    let on = this.nameAsStr
    if on == "SourceFile":
      let rawInfoExpr = this.io.readBytes(int(this.attributeLength))
      this.rawInfo = rawInfoExpr
      let rawInfoIo = newKaitaiStream(rawInfoExpr)
      let infoExpr = JavaClass_AttributeInfo_AttrBodySourceFile.read(rawInfoIo, this.root, this)
      this.info = infoExpr
    elif on == "LineNumberTable":
      let rawInfoExpr = this.io.readBytes(int(this.attributeLength))
      this.rawInfo = rawInfoExpr
      let rawInfoIo = newKaitaiStream(rawInfoExpr)
      let infoExpr = JavaClass_AttributeInfo_AttrBodyLineNumberTable.read(rawInfoIo, this.root, this)
      this.info = infoExpr
    elif on == "Exceptions":
      let rawInfoExpr = this.io.readBytes(int(this.attributeLength))
      this.rawInfo = rawInfoExpr
      let rawInfoIo = newKaitaiStream(rawInfoExpr)
      let infoExpr = JavaClass_AttributeInfo_AttrBodyExceptions.read(rawInfoIo, this.root, this)
      this.info = infoExpr
    elif on == "Code":
      let rawInfoExpr = this.io.readBytes(int(this.attributeLength))
      this.rawInfo = rawInfoExpr
      let rawInfoIo = newKaitaiStream(rawInfoExpr)
      let infoExpr = JavaClass_AttributeInfo_AttrBodyCode.read(rawInfoIo, this.root, this)
      this.info = infoExpr
    else:
      let infoExpr = this.io.readBytes(int(this.attributeLength))
      this.info = infoExpr

proc nameAsStr(this: JavaClass_AttributeInfo): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.nameIndex - 1)].cpInfo)).value)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc fromFile*(_: typedesc[JavaClass_AttributeInfo], filename: string): JavaClass_AttributeInfo =
  JavaClass_AttributeInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyCode =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyCode)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let maxStackExpr = this.io.readU2be()
  this.maxStack = maxStackExpr
  let maxLocalsExpr = this.io.readU2be()
  this.maxLocals = maxLocalsExpr
  let codeLengthExpr = this.io.readU4be()
  this.codeLength = codeLengthExpr
  let codeExpr = this.io.readBytes(int(this.codeLength))
  this.code = codeExpr
  let exceptionTableLengthExpr = this.io.readU2be()
  this.exceptionTableLength = exceptionTableLengthExpr
  for i in 0 ..< int(this.exceptionTableLength):
    let it = JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry.read(this.io, this.root, this)
    this.exceptionTable.add(it)
  let attributesCountExpr = this.io.readU2be()
  this.attributesCount = attributesCountExpr
  for i in 0 ..< int(this.attributesCount):
    let it = JavaClass_AttributeInfo.read(this.io, this.root, this)
    this.attributes.add(it)

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode], filename: string): JavaClass_AttributeInfo_AttrBodyCode =
  JavaClass_AttributeInfo_AttrBodyCode.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyCode): JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Start of a code region where exception handler is being
active, index in code array (inclusive)

  ]##
  let startPcExpr = this.io.readU2be()
  this.startPc = startPcExpr

  ##[
  End of a code region where exception handler is being
active, index in code array (exclusive)

  ]##
  let endPcExpr = this.io.readU2be()
  this.endPc = endPcExpr

  ##[
  Start of exception handler code, index in code array
  ]##
  let handlerPcExpr = this.io.readU2be()
  this.handlerPc = handlerPcExpr

  ##[
  Exception class that this handler catches, index in constant
pool, or 0 (catch all exceptions handler, used to implement
`finally`).

  ]##
  let catchTypeExpr = this.io.readU2be()
  this.catchType = catchTypeExpr

proc catchException(this: JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry): JavaClass_ConstantPoolEntry = 
  if this.catchExceptionInst != nil:
    return this.catchExceptionInst
  if this.catchType != 0:
    let catchExceptionInstExpr = JavaClass_ConstantPoolEntry(JavaClass(this.root).constantPool[(this.catchType - 1)])
    this.catchExceptionInst = catchExceptionInstExpr
  if this.catchExceptionInst != nil:
    return this.catchExceptionInst

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry], filename: string): JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry =
  JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyExceptions =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyExceptions)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberOfExceptionsExpr = this.io.readU2be()
  this.numberOfExceptions = numberOfExceptionsExpr
  for i in 0 ..< int(this.numberOfExceptions):
    let it = JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry.read(this.io, this.root, this)
    this.exceptions.add(it)

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions], filename: string): JavaClass_AttributeInfo_AttrBodyExceptions =
  JavaClass_AttributeInfo_AttrBodyExceptions.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyExceptions): JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let indexExpr = this.io.readU2be()
  this.index = indexExpr

proc asInfo(this: JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry): JavaClass_ClassCpInfo = 
  if this.asInfoInst != nil:
    return this.asInfoInst
  let asInfoInstExpr = JavaClass_ClassCpInfo((JavaClass_ClassCpInfo(JavaClass(this.root).constantPool[(this.index - 1)].cpInfo)))
  this.asInfoInst = asInfoInstExpr
  if this.asInfoInst != nil:
    return this.asInfoInst

proc nameAsStr(this: JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string(this.asInfo.nameAsStr)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry], filename: string): JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry =
  JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodySourceFile], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodySourceFile =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodySourceFile)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sourcefileIndexExpr = this.io.readU2be()
  this.sourcefileIndex = sourcefileIndexExpr

proc sourcefileAsStr(this: JavaClass_AttributeInfo_AttrBodySourceFile): string = 
  if this.sourcefileAsStrInst.len != 0:
    return this.sourcefileAsStrInst
  let sourcefileAsStrInstExpr = string((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.sourcefileIndex - 1)].cpInfo)).value)
  this.sourcefileAsStrInst = sourcefileAsStrInstExpr
  if this.sourcefileAsStrInst.len != 0:
    return this.sourcefileAsStrInst

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodySourceFile], filename: string): JavaClass_AttributeInfo_AttrBodySourceFile =
  JavaClass_AttributeInfo_AttrBodySourceFile.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12">Source</a>
]##
proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo): JavaClass_AttributeInfo_AttrBodyLineNumberTable =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyLineNumberTable)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lineNumberTableLengthExpr = this.io.readU2be()
  this.lineNumberTableLength = lineNumberTableLengthExpr
  for i in 0 ..< int(this.lineNumberTableLength):
    let it = JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry.read(this.io, this.root, this)
    this.lineNumberTable.add(it)

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable], filename: string): JavaClass_AttributeInfo_AttrBodyLineNumberTable =
  JavaClass_AttributeInfo_AttrBodyLineNumberTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_AttributeInfo_AttrBodyLineNumberTable): JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry =
  template this: untyped = result
  this = new(JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let startPcExpr = this.io.readU2be()
  this.startPc = startPcExpr
  let lineNumberExpr = this.io.readU2be()
  this.lineNumber = lineNumberExpr

proc fromFile*(_: typedesc[JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry], filename: string): JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry =
  JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
]##
proc read*(_: typedesc[JavaClass_MethodRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodRefCpInfo =
  template this: untyped = result
  this = new(JavaClass_MethodRefCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let classIndexExpr = this.io.readU2be()
  this.classIndex = classIndexExpr
  let nameAndTypeIndexExpr = this.io.readU2be()
  this.nameAndTypeIndex = nameAndTypeIndexExpr

proc classAsInfo(this: JavaClass_MethodRefCpInfo): JavaClass_ClassCpInfo = 
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst
  let classAsInfoInstExpr = JavaClass_ClassCpInfo((JavaClass_ClassCpInfo(JavaClass(this.root).constantPool[(this.classIndex - 1)].cpInfo)))
  this.classAsInfoInst = classAsInfoInstExpr
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst

proc nameAndTypeAsInfo(this: JavaClass_MethodRefCpInfo): JavaClass_NameAndTypeCpInfo = 
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst
  let nameAndTypeAsInfoInstExpr = JavaClass_NameAndTypeCpInfo((JavaClass_NameAndTypeCpInfo(JavaClass(this.root).constantPool[(this.nameAndTypeIndex - 1)].cpInfo)))
  this.nameAndTypeAsInfoInst = nameAndTypeAsInfoInstExpr
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst

proc fromFile*(_: typedesc[JavaClass_MethodRefCpInfo], filename: string): JavaClass_MethodRefCpInfo =
  JavaClass_MethodRefCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5">Source</a>
]##
proc read*(_: typedesc[JavaClass_FieldInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_FieldInfo =
  template this: untyped = result
  this = new(JavaClass_FieldInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let accessFlagsExpr = this.io.readU2be()
  this.accessFlags = accessFlagsExpr
  let nameIndexExpr = this.io.readU2be()
  this.nameIndex = nameIndexExpr
  let descriptorIndexExpr = this.io.readU2be()
  this.descriptorIndex = descriptorIndexExpr
  let attributesCountExpr = this.io.readU2be()
  this.attributesCount = attributesCountExpr
  for i in 0 ..< int(this.attributesCount):
    let it = JavaClass_AttributeInfo.read(this.io, this.root, this)
    this.attributes.add(it)

proc nameAsStr(this: JavaClass_FieldInfo): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.nameIndex - 1)].cpInfo)).value)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc fromFile*(_: typedesc[JavaClass_FieldInfo], filename: string): JavaClass_FieldInfo =
  JavaClass_FieldInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
]##
proc read*(_: typedesc[JavaClass_DoubleCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_DoubleCpInfo =
  template this: untyped = result
  this = new(JavaClass_DoubleCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readF8be()
  this.value = valueExpr

proc fromFile*(_: typedesc[JavaClass_DoubleCpInfo], filename: string): JavaClass_DoubleCpInfo =
  JavaClass_DoubleCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
]##
proc read*(_: typedesc[JavaClass_LongCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_LongCpInfo =
  template this: untyped = result
  this = new(JavaClass_LongCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readU8be()
  this.value = valueExpr

proc fromFile*(_: typedesc[JavaClass_LongCpInfo], filename: string): JavaClass_LongCpInfo =
  JavaClass_LongCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10">Source</a>
]##
proc read*(_: typedesc[JavaClass_InvokeDynamicCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_InvokeDynamicCpInfo =
  template this: untyped = result
  this = new(JavaClass_InvokeDynamicCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bootstrapMethodAttrIndexExpr = this.io.readU2be()
  this.bootstrapMethodAttrIndex = bootstrapMethodAttrIndexExpr
  let nameAndTypeIndexExpr = this.io.readU2be()
  this.nameAndTypeIndex = nameAndTypeIndexExpr

proc fromFile*(_: typedesc[JavaClass_InvokeDynamicCpInfo], filename: string): JavaClass_InvokeDynamicCpInfo =
  JavaClass_InvokeDynamicCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8">Source</a>
]##
proc read*(_: typedesc[JavaClass_MethodHandleCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodHandleCpInfo =
  template this: untyped = result
  this = new(JavaClass_MethodHandleCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let referenceKindExpr = JavaClass_MethodHandleCpInfo_ReferenceKindEnum(this.io.readU1())
  this.referenceKind = referenceKindExpr
  let referenceIndexExpr = this.io.readU2be()
  this.referenceIndex = referenceIndexExpr

proc fromFile*(_: typedesc[JavaClass_MethodHandleCpInfo], filename: string): JavaClass_MethodHandleCpInfo =
  JavaClass_MethodHandleCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
]##
proc read*(_: typedesc[JavaClass_NameAndTypeCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_NameAndTypeCpInfo =
  template this: untyped = result
  this = new(JavaClass_NameAndTypeCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameIndexExpr = this.io.readU2be()
  this.nameIndex = nameIndexExpr
  let descriptorIndexExpr = this.io.readU2be()
  this.descriptorIndex = descriptorIndexExpr

proc nameAsInfo(this: JavaClass_NameAndTypeCpInfo): JavaClass_Utf8CpInfo = 
  if this.nameAsInfoInst != nil:
    return this.nameAsInfoInst
  let nameAsInfoInstExpr = JavaClass_Utf8CpInfo((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.nameIndex - 1)].cpInfo)))
  this.nameAsInfoInst = nameAsInfoInstExpr
  if this.nameAsInfoInst != nil:
    return this.nameAsInfoInst

proc nameAsStr(this: JavaClass_NameAndTypeCpInfo): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string(this.nameAsInfo.value)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc descriptorAsInfo(this: JavaClass_NameAndTypeCpInfo): JavaClass_Utf8CpInfo = 
  if this.descriptorAsInfoInst != nil:
    return this.descriptorAsInfoInst
  let descriptorAsInfoInstExpr = JavaClass_Utf8CpInfo((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.descriptorIndex - 1)].cpInfo)))
  this.descriptorAsInfoInst = descriptorAsInfoInstExpr
  if this.descriptorAsInfoInst != nil:
    return this.descriptorAsInfoInst

proc descriptorAsStr(this: JavaClass_NameAndTypeCpInfo): string = 
  if this.descriptorAsStrInst.len != 0:
    return this.descriptorAsStrInst
  let descriptorAsStrInstExpr = string(this.descriptorAsInfo.value)
  this.descriptorAsStrInst = descriptorAsStrInstExpr
  if this.descriptorAsStrInst.len != 0:
    return this.descriptorAsStrInst

proc fromFile*(_: typedesc[JavaClass_NameAndTypeCpInfo], filename: string): JavaClass_NameAndTypeCpInfo =
  JavaClass_NameAndTypeCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7">Source</a>
]##
proc read*(_: typedesc[JavaClass_Utf8CpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_Utf8CpInfo =
  template this: untyped = result
  this = new(JavaClass_Utf8CpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strLenExpr = this.io.readU2be()
  this.strLen = strLenExpr
  let valueExpr = encode(this.io.readBytes(int(this.strLen)), "UTF-8")
  this.value = valueExpr

proc fromFile*(_: typedesc[JavaClass_Utf8CpInfo], filename: string): JavaClass_Utf8CpInfo =
  JavaClass_Utf8CpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3">Source</a>
]##
proc read*(_: typedesc[JavaClass_StringCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_StringCpInfo =
  template this: untyped = result
  this = new(JavaClass_StringCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let stringIndexExpr = this.io.readU2be()
  this.stringIndex = stringIndexExpr

proc fromFile*(_: typedesc[JavaClass_StringCpInfo], filename: string): JavaClass_StringCpInfo =
  JavaClass_StringCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9">Source</a>
]##
proc read*(_: typedesc[JavaClass_MethodTypeCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_MethodTypeCpInfo =
  template this: untyped = result
  this = new(JavaClass_MethodTypeCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let descriptorIndexExpr = this.io.readU2be()
  this.descriptorIndex = descriptorIndexExpr

proc fromFile*(_: typedesc[JavaClass_MethodTypeCpInfo], filename: string): JavaClass_MethodTypeCpInfo =
  JavaClass_MethodTypeCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
]##
proc read*(_: typedesc[JavaClass_InterfaceMethodRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_InterfaceMethodRefCpInfo =
  template this: untyped = result
  this = new(JavaClass_InterfaceMethodRefCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let classIndexExpr = this.io.readU2be()
  this.classIndex = classIndexExpr
  let nameAndTypeIndexExpr = this.io.readU2be()
  this.nameAndTypeIndex = nameAndTypeIndexExpr

proc classAsInfo(this: JavaClass_InterfaceMethodRefCpInfo): JavaClass_ClassCpInfo = 
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst
  let classAsInfoInstExpr = JavaClass_ClassCpInfo((JavaClass_ClassCpInfo(JavaClass(this.root).constantPool[(this.classIndex - 1)].cpInfo)))
  this.classAsInfoInst = classAsInfoInstExpr
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst

proc nameAndTypeAsInfo(this: JavaClass_InterfaceMethodRefCpInfo): JavaClass_NameAndTypeCpInfo = 
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst
  let nameAndTypeAsInfoInstExpr = JavaClass_NameAndTypeCpInfo((JavaClass_NameAndTypeCpInfo(JavaClass(this.root).constantPool[(this.nameAndTypeIndex - 1)].cpInfo)))
  this.nameAndTypeAsInfoInst = nameAndTypeAsInfoInstExpr
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst

proc fromFile*(_: typedesc[JavaClass_InterfaceMethodRefCpInfo], filename: string): JavaClass_InterfaceMethodRefCpInfo =
  JavaClass_InterfaceMethodRefCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1">Source</a>
]##
proc read*(_: typedesc[JavaClass_ClassCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_ClassCpInfo =
  template this: untyped = result
  this = new(JavaClass_ClassCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameIndexExpr = this.io.readU2be()
  this.nameIndex = nameIndexExpr

proc nameAsInfo(this: JavaClass_ClassCpInfo): JavaClass_Utf8CpInfo = 
  if this.nameAsInfoInst != nil:
    return this.nameAsInfoInst
  let nameAsInfoInstExpr = JavaClass_Utf8CpInfo((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.nameIndex - 1)].cpInfo)))
  this.nameAsInfoInst = nameAsInfoInstExpr
  if this.nameAsInfoInst != nil:
    return this.nameAsInfoInst

proc nameAsStr(this: JavaClass_ClassCpInfo): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string(this.nameAsInfo.value)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc fromFile*(_: typedesc[JavaClass_ClassCpInfo], filename: string): JavaClass_ClassCpInfo =
  JavaClass_ClassCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4">Source</a>
]##
proc read*(_: typedesc[JavaClass_ConstantPoolEntry], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_ConstantPoolEntry =
  template this: untyped = result
  this = new(JavaClass_ConstantPoolEntry)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = JavaClass_ConstantPoolEntry_TagEnum(this.io.readU1())
  this.tag = tagExpr
  block:
    let on = this.tag
    if on == java_class.interface_method_ref:
      let cpInfoExpr = JavaClass_InterfaceMethodRefCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.class_type:
      let cpInfoExpr = JavaClass_ClassCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.utf8:
      let cpInfoExpr = JavaClass_Utf8CpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.method_type:
      let cpInfoExpr = JavaClass_MethodTypeCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.integer:
      let cpInfoExpr = JavaClass_IntegerCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.string:
      let cpInfoExpr = JavaClass_StringCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.float:
      let cpInfoExpr = JavaClass_FloatCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.long:
      let cpInfoExpr = JavaClass_LongCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.method_ref:
      let cpInfoExpr = JavaClass_MethodRefCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.double:
      let cpInfoExpr = JavaClass_DoubleCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.invoke_dynamic:
      let cpInfoExpr = JavaClass_InvokeDynamicCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.field_ref:
      let cpInfoExpr = JavaClass_FieldRefCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.method_handle:
      let cpInfoExpr = JavaClass_MethodHandleCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr
    elif on == java_class.name_and_type:
      let cpInfoExpr = JavaClass_NameAndTypeCpInfo.read(this.io, this.root, this)
      this.cpInfo = cpInfoExpr

proc fromFile*(_: typedesc[JavaClass_ConstantPoolEntry], filename: string): JavaClass_ConstantPoolEntry =
  JavaClass_ConstantPoolEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6">Source</a>
]##
proc read*(_: typedesc[JavaClass_MethodInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass): JavaClass_MethodInfo =
  template this: untyped = result
  this = new(JavaClass_MethodInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let accessFlagsExpr = this.io.readU2be()
  this.accessFlags = accessFlagsExpr
  let nameIndexExpr = this.io.readU2be()
  this.nameIndex = nameIndexExpr
  let descriptorIndexExpr = this.io.readU2be()
  this.descriptorIndex = descriptorIndexExpr
  let attributesCountExpr = this.io.readU2be()
  this.attributesCount = attributesCountExpr
  for i in 0 ..< int(this.attributesCount):
    let it = JavaClass_AttributeInfo.read(this.io, this.root, this)
    this.attributes.add(it)

proc nameAsStr(this: JavaClass_MethodInfo): string = 
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst
  let nameAsStrInstExpr = string((JavaClass_Utf8CpInfo(JavaClass(this.root).constantPool[(this.nameIndex - 1)].cpInfo)).value)
  this.nameAsStrInst = nameAsStrInstExpr
  if this.nameAsStrInst.len != 0:
    return this.nameAsStrInst

proc fromFile*(_: typedesc[JavaClass_MethodInfo], filename: string): JavaClass_MethodInfo =
  JavaClass_MethodInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4">Source</a>
]##
proc read*(_: typedesc[JavaClass_IntegerCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_IntegerCpInfo =
  template this: untyped = result
  this = new(JavaClass_IntegerCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readU4be()
  this.value = valueExpr

proc fromFile*(_: typedesc[JavaClass_IntegerCpInfo], filename: string): JavaClass_IntegerCpInfo =
  JavaClass_IntegerCpInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
]##
proc read*(_: typedesc[JavaClass_FieldRefCpInfo], io: KaitaiStream, root: KaitaiStruct, parent: JavaClass_ConstantPoolEntry): JavaClass_FieldRefCpInfo =
  template this: untyped = result
  this = new(JavaClass_FieldRefCpInfo)
  let root = if root == nil: cast[JavaClass](this) else: cast[JavaClass](root)
  this.io = io
  this.root = root
  this.parent = parent

  let classIndexExpr = this.io.readU2be()
  this.classIndex = classIndexExpr
  let nameAndTypeIndexExpr = this.io.readU2be()
  this.nameAndTypeIndex = nameAndTypeIndexExpr

proc classAsInfo(this: JavaClass_FieldRefCpInfo): JavaClass_ClassCpInfo = 
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst
  let classAsInfoInstExpr = JavaClass_ClassCpInfo((JavaClass_ClassCpInfo(JavaClass(this.root).constantPool[(this.classIndex - 1)].cpInfo)))
  this.classAsInfoInst = classAsInfoInstExpr
  if this.classAsInfoInst != nil:
    return this.classAsInfoInst

proc nameAndTypeAsInfo(this: JavaClass_FieldRefCpInfo): JavaClass_NameAndTypeCpInfo = 
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst
  let nameAndTypeAsInfoInstExpr = JavaClass_NameAndTypeCpInfo((JavaClass_NameAndTypeCpInfo(JavaClass(this.root).constantPool[(this.nameAndTypeIndex - 1)].cpInfo)))
  this.nameAndTypeAsInfoInst = nameAndTypeAsInfoInstExpr
  if this.nameAndTypeAsInfoInst != nil:
    return this.nameAndTypeAsInfoInst

proc fromFile*(_: typedesc[JavaClass_FieldRefCpInfo], filename: string): JavaClass_FieldRefCpInfo =
  JavaClass_FieldRefCpInfo.read(newKaitaiFileStream(filename), nil, nil)

