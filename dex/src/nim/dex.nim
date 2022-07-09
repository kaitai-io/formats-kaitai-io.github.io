import kaitai_struct_nim_runtime
import options
import /common/vlq_base128_le

import "vlq_base128_le"
type
  Dex* = ref object of KaitaiStruct
    `header`*: Dex_HeaderItem
    `parent`*: KaitaiStruct
    `stringIdsInst`: seq[Dex_StringIdItem]
    `stringIdsInstFlag`: bool
    `methodIdsInst`: seq[Dex_MethodIdItem]
    `methodIdsInstFlag`: bool
    `linkDataInst`: seq[byte]
    `linkDataInstFlag`: bool
    `mapInst`: Dex_MapList
    `mapInstFlag`: bool
    `classDefsInst`: seq[Dex_ClassDefItem]
    `classDefsInstFlag`: bool
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
    `typeIdsInst`: seq[Dex_TypeIdItem]
    `typeIdsInstFlag`: bool
    `protoIdsInst`: seq[Dex_ProtoIdItem]
    `protoIdsInstFlag`: bool
    `fieldIdsInst`: seq[Dex_FieldIdItem]
    `fieldIdsInstFlag`: bool
  Dex_ClassAccessFlags* = enum
    public = 1
    private = 2
    protected = 4
    static = 8
    final = 16
    interface = 512
    abstract = 1024
    synthetic = 4096
    annotation = 8192
    enum = 16384
  Dex_HeaderItem* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `versionStr`*: string
    `checksum`*: uint32
    `signature`*: seq[byte]
    `fileSize`*: uint32
    `headerSize`*: uint32
    `endianTag`*: Dex_HeaderItem_EndianConstant
    `linkSize`*: uint32
    `linkOff`*: uint32
    `mapOff`*: uint32
    `stringIdsSize`*: uint32
    `stringIdsOff`*: uint32
    `typeIdsSize`*: uint32
    `typeIdsOff`*: uint32
    `protoIdsSize`*: uint32
    `protoIdsOff`*: uint32
    `fieldIdsSize`*: uint32
    `fieldIdsOff`*: uint32
    `methodIdsSize`*: uint32
    `methodIdsOff`*: uint32
    `classDefsSize`*: uint32
    `classDefsOff`*: uint32
    `dataSize`*: uint32
    `dataOff`*: uint32
    `parent`*: Dex
  Dex_HeaderItem_EndianConstant* = enum
    endian_constant = 305419896
    reverse_endian_constant = 2018915346
  Dex_MapList* = ref object of KaitaiStruct
    `size`*: uint32
    `list`*: seq[Dex_MapItem]
    `parent`*: Dex
  Dex_EncodedValue* = ref object of KaitaiStruct
    `valueArg`*: uint64
    `valueType`*: Dex_EncodedValue_ValueTypeEnum
    `value`*: KaitaiStruct
    `parent`*: KaitaiStruct
  Dex_EncodedValue_ValueTypeEnum* = enum
    byte = 0
    short = 2
    char = 3
    int = 4
    long = 6
    float = 16
    double = 17
    method_type = 21
    method_handle = 22
    string = 23
    type = 24
    field = 25
    method = 26
    enum = 27
    array = 28
    annotation = 29
    null = 30
    boolean = 31
  Dex_CallSiteIdItem* = ref object of KaitaiStruct
    `callSiteOff`*: uint32
    `parent`*: KaitaiStruct
  Dex_MethodIdItem* = ref object of KaitaiStruct
    `classIdx`*: uint16
    `protoIdx`*: uint16
    `nameIdx`*: uint32
    `parent`*: Dex
    `classNameInst`: string
    `classNameInstFlag`: bool
    `protoDescInst`: string
    `protoDescInstFlag`: bool
    `methodNameInst`: string
    `methodNameInstFlag`: bool
  Dex_TypeItem* = ref object of KaitaiStruct
    `typeIdx`*: uint16
    `parent`*: Dex_TypeList
    `valueInst`: string
    `valueInstFlag`: bool
  Dex_TypeIdItem* = ref object of KaitaiStruct
    `descriptorIdx`*: uint32
    `parent`*: Dex
    `typeNameInst`: string
    `typeNameInstFlag`: bool
  Dex_AnnotationElement* = ref object of KaitaiStruct
    `nameIdx`*: VlqBase128Le
    `value`*: Dex_EncodedValue
    `parent`*: Dex_EncodedAnnotation
  Dex_EncodedField* = ref object of KaitaiStruct
    `fieldIdxDiff`*: VlqBase128Le
    `accessFlags`*: VlqBase128Le
    `parent`*: Dex_ClassDataItem
  Dex_EncodedArrayItem* = ref object of KaitaiStruct
    `value`*: Dex_EncodedArray
    `parent`*: Dex_ClassDefItem
  Dex_ClassDataItem* = ref object of KaitaiStruct
    `staticFieldsSize`*: VlqBase128Le
    `instanceFieldsSize`*: VlqBase128Le
    `directMethodsSize`*: VlqBase128Le
    `virtualMethodsSize`*: VlqBase128Le
    `staticFields`*: seq[Dex_EncodedField]
    `instanceFields`*: seq[Dex_EncodedField]
    `directMethods`*: seq[Dex_EncodedMethod]
    `virtualMethods`*: seq[Dex_EncodedMethod]
    `parent`*: Dex_ClassDefItem
  Dex_FieldIdItem* = ref object of KaitaiStruct
    `classIdx`*: uint16
    `typeIdx`*: uint16
    `nameIdx`*: uint32
    `parent`*: Dex
    `classNameInst`: string
    `classNameInstFlag`: bool
    `typeNameInst`: string
    `typeNameInstFlag`: bool
    `fieldNameInst`: string
    `fieldNameInstFlag`: bool
  Dex_EncodedAnnotation* = ref object of KaitaiStruct
    `typeIdx`*: VlqBase128Le
    `size`*: VlqBase128Le
    `elements`*: seq[Dex_AnnotationElement]
    `parent`*: Dex_EncodedValue
  Dex_ClassDefItem* = ref object of KaitaiStruct
    `classIdx`*: uint32
    `accessFlags`*: Dex_ClassAccessFlags
    `superclassIdx`*: uint32
    `interfacesOff`*: uint32
    `sourceFileIdx`*: uint32
    `annotationsOff`*: uint32
    `classDataOff`*: uint32
    `staticValuesOff`*: uint32
    `parent`*: Dex
    `typeNameInst`: string
    `typeNameInstFlag`: bool
    `classDataInst`: Dex_ClassDataItem
    `classDataInstFlag`: bool
    `staticValuesInst`: Dex_EncodedArrayItem
    `staticValuesInstFlag`: bool
  Dex_TypeList* = ref object of KaitaiStruct
    `size`*: uint32
    `list`*: seq[Dex_TypeItem]
    `parent`*: Dex_ProtoIdItem
  Dex_StringIdItem* = ref object of KaitaiStruct
    `stringDataOff`*: uint32
    `parent`*: Dex
    `valueInst`: Dex_StringIdItem_StringDataItem
    `valueInstFlag`: bool
  Dex_StringIdItem_StringDataItem* = ref object of KaitaiStruct
    `utf16Size`*: VlqBase128Le
    `data`*: string
    `parent`*: Dex_StringIdItem
  Dex_ProtoIdItem* = ref object of KaitaiStruct
    `shortyIdx`*: uint32
    `returnTypeIdx`*: uint32
    `parametersOff`*: uint32
    `parent`*: Dex
    `shortyDescInst`: string
    `shortyDescInstFlag`: bool
    `paramsTypesInst`: Dex_TypeList
    `paramsTypesInstFlag`: bool
    `returnTypeInst`: string
    `returnTypeInstFlag`: bool
  Dex_EncodedMethod* = ref object of KaitaiStruct
    `methodIdxDiff`*: VlqBase128Le
    `accessFlags`*: VlqBase128Le
    `codeOff`*: VlqBase128Le
    `parent`*: Dex_ClassDataItem
  Dex_MapItem* = ref object of KaitaiStruct
    `type`*: Dex_MapItem_MapItemType
    `unused`*: uint16
    `size`*: uint32
    `offset`*: uint32
    `parent`*: Dex_MapList
  Dex_MapItem_MapItemType* = enum
    header_item = 0
    string_id_item = 1
    type_id_item = 2
    proto_id_item = 3
    field_id_item = 4
    method_id_item = 5
    class_def_item = 6
    call_site_id_item = 7
    method_handle_item = 8
    map_list = 4096
    type_list = 4097
    annotation_set_ref_list = 4098
    annotation_set_item = 4099
    class_data_item = 8192
    code_item = 8193
    string_data_item = 8194
    debug_info_item = 8195
    annotation_item = 8196
    encoded_array_item = 8197
    annotations_directory_item = 8198
  Dex_EncodedArray* = ref object of KaitaiStruct
    `size`*: VlqBase128Le
    `values`*: seq[Dex_EncodedValue]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Dex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex
proc read*(_: typedesc[Dex_HeaderItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_HeaderItem
proc read*(_: typedesc[Dex_MapList], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_MapList
proc read*(_: typedesc[Dex_EncodedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_EncodedValue
proc read*(_: typedesc[Dex_CallSiteIdItem], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_CallSiteIdItem
proc read*(_: typedesc[Dex_MethodIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_MethodIdItem
proc read*(_: typedesc[Dex_TypeItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_TypeList): Dex_TypeItem
proc read*(_: typedesc[Dex_TypeIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_TypeIdItem
proc read*(_: typedesc[Dex_AnnotationElement], io: KaitaiStream, root: KaitaiStruct, parent: Dex_EncodedAnnotation): Dex_AnnotationElement
proc read*(_: typedesc[Dex_EncodedField], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDataItem): Dex_EncodedField
proc read*(_: typedesc[Dex_EncodedArrayItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDefItem): Dex_EncodedArrayItem
proc read*(_: typedesc[Dex_ClassDataItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDefItem): Dex_ClassDataItem
proc read*(_: typedesc[Dex_FieldIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_FieldIdItem
proc read*(_: typedesc[Dex_EncodedAnnotation], io: KaitaiStream, root: KaitaiStruct, parent: Dex_EncodedValue): Dex_EncodedAnnotation
proc read*(_: typedesc[Dex_ClassDefItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_ClassDefItem
proc read*(_: typedesc[Dex_TypeList], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ProtoIdItem): Dex_TypeList
proc read*(_: typedesc[Dex_StringIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_StringIdItem
proc read*(_: typedesc[Dex_StringIdItem_StringDataItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_StringIdItem): Dex_StringIdItem_StringDataItem
proc read*(_: typedesc[Dex_ProtoIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_ProtoIdItem
proc read*(_: typedesc[Dex_EncodedMethod], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDataItem): Dex_EncodedMethod
proc read*(_: typedesc[Dex_MapItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_MapList): Dex_MapItem
proc read*(_: typedesc[Dex_EncodedArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_EncodedArray

proc stringIds*(this: Dex): seq[Dex_StringIdItem]
proc methodIds*(this: Dex): seq[Dex_MethodIdItem]
proc linkData*(this: Dex): seq[byte]
proc map*(this: Dex): Dex_MapList
proc classDefs*(this: Dex): seq[Dex_ClassDefItem]
proc data*(this: Dex): seq[byte]
proc typeIds*(this: Dex): seq[Dex_TypeIdItem]
proc protoIds*(this: Dex): seq[Dex_ProtoIdItem]
proc fieldIds*(this: Dex): seq[Dex_FieldIdItem]
proc className*(this: Dex_MethodIdItem): string
proc protoDesc*(this: Dex_MethodIdItem): string
proc methodName*(this: Dex_MethodIdItem): string
proc value*(this: Dex_TypeItem): string
proc typeName*(this: Dex_TypeIdItem): string
proc className*(this: Dex_FieldIdItem): string
proc typeName*(this: Dex_FieldIdItem): string
proc fieldName*(this: Dex_FieldIdItem): string
proc typeName*(this: Dex_ClassDefItem): string
proc classData*(this: Dex_ClassDefItem): Dex_ClassDataItem
proc staticValues*(this: Dex_ClassDefItem): Dex_EncodedArrayItem
proc value*(this: Dex_StringIdItem): Dex_StringIdItem_StringDataItem
proc shortyDesc*(this: Dex_ProtoIdItem): string
proc paramsTypes*(this: Dex_ProtoIdItem): Dex_TypeList
proc returnType*(this: Dex_ProtoIdItem): string


##[
Android OS applications executables are typically stored in its own
format, optimized for more efficient execution in Dalvik virtual
machine.

This format is loosely similar to Java .class file format and
generally holds the similar set of data: i.e. classes, methods,
fields, annotations, etc.

@see <a href="https://source.android.com/devices/tech/dalvik/dex-format">Source</a>
]##
proc read*(_: typedesc[Dex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex =
  template this: untyped = result
  this = new(Dex)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Dex_HeaderItem.read(this.io, this.root, this)
  this.header = headerExpr

proc stringIds(this: Dex): seq[Dex_StringIdItem] = 

  ##[
  string identifiers list.

These are identifiers for all the strings used by this file, either for
internal naming (e.g., type descriptors) or as constant objects referred to by code.

This list must be sorted by string contents, using UTF-16 code point values
(not in a locale-sensitive manner), and it must not contain any duplicate entries.

  ]##
  if this.stringIdsInstFlag:
    return this.stringIdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.stringIdsOff))
  for i in 0 ..< int(this.header.stringIdsSize):
    let it = Dex_StringIdItem.read(this.io, this.root, this)
    this.stringIdsInst.add(it)
  this.io.seek(pos)
  this.stringIdsInstFlag = true
  return this.stringIdsInst

proc methodIds(this: Dex): seq[Dex_MethodIdItem] = 

  ##[
  method identifiers list.

These are identifiers for all methods referred to by this file,
whether defined in the file or not.

This list must be sorted, where the defining type (by type_id index
is the major order, method name (by string_id index) is the intermediate
order, and method prototype (by proto_id index) is the minor order.

The list must not contain any duplicate entries.

  ]##
  if this.methodIdsInstFlag:
    return this.methodIdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.methodIdsOff))
  for i in 0 ..< int(this.header.methodIdsSize):
    let it = Dex_MethodIdItem.read(this.io, this.root, this)
    this.methodIdsInst.add(it)
  this.io.seek(pos)
  this.methodIdsInstFlag = true
  return this.methodIdsInst

proc linkData(this: Dex): seq[byte] = 

  ##[
  data used in statically linked files.

The format of the data in this section is left unspecified by this document.

This section is empty in unlinked files, and runtime implementations may
use it as they see fit.

  ]##
  if this.linkDataInstFlag:
    return this.linkDataInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.linkOff))
  let linkDataInstExpr = this.io.readBytes(int(this.header.linkSize))
  this.linkDataInst = linkDataInstExpr
  this.io.seek(pos)
  this.linkDataInstFlag = true
  return this.linkDataInst

proc map(this: Dex): Dex_MapList = 
  if this.mapInstFlag:
    return this.mapInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.mapOff))
  let mapInstExpr = Dex_MapList.read(this.io, this.root, this)
  this.mapInst = mapInstExpr
  this.io.seek(pos)
  this.mapInstFlag = true
  return this.mapInst

proc classDefs(this: Dex): seq[Dex_ClassDefItem] = 

  ##[
  class definitions list.

The classes must be ordered such that a given class's superclass and
implemented interfaces appear in the list earlier than the referring class.

Furthermore, it is invalid for a definition for the same-named class to
appear more than once in the list.

  ]##
  if this.classDefsInstFlag:
    return this.classDefsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.classDefsOff))
  for i in 0 ..< int(this.header.classDefsSize):
    let it = Dex_ClassDefItem.read(this.io, this.root, this)
    this.classDefsInst.add(it)
  this.io.seek(pos)
  this.classDefsInstFlag = true
  return this.classDefsInst

proc data(this: Dex): seq[byte] = 

  ##[
  data area, containing all the support data for the tables listed above.

Different items have different alignment requirements, and padding bytes
are inserted before each item if necessary to achieve proper alignment.

  ]##
  if this.dataInstFlag:
    return this.dataInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.dataOff))
  let dataInstExpr = this.io.readBytes(int(this.header.dataSize))
  this.dataInst = dataInstExpr
  this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc typeIds(this: Dex): seq[Dex_TypeIdItem] = 

  ##[
  type identifiers list.

These are identifiers for all types (classes, arrays, or primitive types)
referred to by this file, whether defined in the file or not.

This list must be sorted by string_id index, and it must not contain any duplicate entries.

  ]##
  if this.typeIdsInstFlag:
    return this.typeIdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.typeIdsOff))
  for i in 0 ..< int(this.header.typeIdsSize):
    let it = Dex_TypeIdItem.read(this.io, this.root, this)
    this.typeIdsInst.add(it)
  this.io.seek(pos)
  this.typeIdsInstFlag = true
  return this.typeIdsInst

proc protoIds(this: Dex): seq[Dex_ProtoIdItem] = 

  ##[
  method prototype identifiers list.

These are identifiers for all prototypes referred to by this file.

This list must be sorted in return-type (by type_id index) major order,
and then by argument list (lexicographic ordering, individual arguments
ordered by type_id index). The list must not contain any duplicate entries.

  ]##
  if this.protoIdsInstFlag:
    return this.protoIdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.protoIdsOff))
  for i in 0 ..< int(this.header.protoIdsSize):
    let it = Dex_ProtoIdItem.read(this.io, this.root, this)
    this.protoIdsInst.add(it)
  this.io.seek(pos)
  this.protoIdsInstFlag = true
  return this.protoIdsInst

proc fieldIds(this: Dex): seq[Dex_FieldIdItem] = 

  ##[
  field identifiers list.

These are identifiers for all fields referred to by this file, whether defined in the file or not.

This list must be sorted, where the defining type (by type_id index)
is the major order, field name (by string_id index) is the intermediate
order, and type (by type_id index) is the minor order.

The list must not contain any duplicate entries.

  ]##
  if this.fieldIdsInstFlag:
    return this.fieldIdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.fieldIdsOff))
  for i in 0 ..< int(this.header.fieldIdsSize):
    let it = Dex_FieldIdItem.read(this.io, this.root, this)
    this.fieldIdsInst.add(it)
  this.io.seek(pos)
  this.fieldIdsInstFlag = true
  return this.fieldIdsInst

proc fromFile*(_: typedesc[Dex], filename: string): Dex =
  Dex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_HeaderItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_HeaderItem =
  template this: untyped = result
  this = new(Dex_HeaderItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionStrExpr = encode(this.io.readBytes(int(4)).bytesTerminate(0, false), "ascii")
  this.versionStr = versionStrExpr

  ##[
  adler32 checksum of the rest of the file (everything but magic and this field);
used to detect file corruption

  ]##
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr

  ##[
  SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
and this field); used to uniquely identify files

  ]##
  let signatureExpr = this.io.readBytes(int(20))
  this.signature = signatureExpr

  ##[
  size of the entire file (including the header), in bytes

  ]##
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr

  ##[
  size of the header (this entire section), in bytes. This allows for at
least a limited amount of backwards/forwards compatibility without
invalidating the format.

  ]##
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr
  let endianTagExpr = Dex_HeaderItem_EndianConstant(this.io.readU4le())
  this.endianTag = endianTagExpr

  ##[
  size of the link section, or 0 if this file isn't statically linked

  ]##
  let linkSizeExpr = this.io.readU4le()
  this.linkSize = linkSizeExpr

  ##[
  offset from the start of the file to the link section, or 0 if link_size == 0.
The offset, if non-zero, should be to an offset into the link_data section.
The format of the data pointed at is left unspecified by this document;
this header field (and the previous) are left as hooks for use by runtime implementations.

  ]##
  let linkOffExpr = this.io.readU4le()
  this.linkOff = linkOffExpr

  ##[
  offset from the start of the file to the map item.
The offset, which must be non-zero, should be to an offset into the data
section, and the data should be in the format specified by "map_list" below.

  ]##
  let mapOffExpr = this.io.readU4le()
  this.mapOff = mapOffExpr

  ##[
  count of strings in the string identifiers list

  ]##
  let stringIdsSizeExpr = this.io.readU4le()
  this.stringIdsSize = stringIdsSizeExpr

  ##[
  offset from the start of the file to the string identifiers list,
or 0 if string_ids_size == 0 (admittedly a strange edge case).
The offset, if non-zero, should be to the start of the string_ids section.

  ]##
  let stringIdsOffExpr = this.io.readU4le()
  this.stringIdsOff = stringIdsOffExpr

  ##[
  count of elements in the type identifiers list, at most 65535

  ]##
  let typeIdsSizeExpr = this.io.readU4le()
  this.typeIdsSize = typeIdsSizeExpr

  ##[
  offset from the start of the file to the type identifiers list,
or 0 if type_ids_size == 0 (admittedly a strange edge case).
The offset, if non-zero, should be to the start of the type_ids section.

  ]##
  let typeIdsOffExpr = this.io.readU4le()
  this.typeIdsOff = typeIdsOffExpr

  ##[
  count of elements in the prototype identifiers list, at most 65535

  ]##
  let protoIdsSizeExpr = this.io.readU4le()
  this.protoIdsSize = protoIdsSizeExpr

  ##[
  offset from the start of the file to the prototype identifiers list,
or 0 if proto_ids_size == 0 (admittedly a strange edge case).
The offset, if non-zero, should be to the start of the proto_ids section.

  ]##
  let protoIdsOffExpr = this.io.readU4le()
  this.protoIdsOff = protoIdsOffExpr

  ##[
  count of elements in the field identifiers list

  ]##
  let fieldIdsSizeExpr = this.io.readU4le()
  this.fieldIdsSize = fieldIdsSizeExpr

  ##[
  offset from the start of the file to the field identifiers list,
or 0 if field_ids_size == 0.
The offset, if non-zero, should be to the start of the field_ids section.

  ]##
  let fieldIdsOffExpr = this.io.readU4le()
  this.fieldIdsOff = fieldIdsOffExpr

  ##[
  count of elements in the method identifiers list

  ]##
  let methodIdsSizeExpr = this.io.readU4le()
  this.methodIdsSize = methodIdsSizeExpr

  ##[
  offset from the start of the file to the method identifiers list,
or 0 if method_ids_size == 0.
The offset, if non-zero, should be to the start of the method_ids section.

  ]##
  let methodIdsOffExpr = this.io.readU4le()
  this.methodIdsOff = methodIdsOffExpr

  ##[
  count of elements in the class definitions list

  ]##
  let classDefsSizeExpr = this.io.readU4le()
  this.classDefsSize = classDefsSizeExpr

  ##[
  offset from the start of the file to the class definitions list,
or 0 if class_defs_size == 0 (admittedly a strange edge case).
The offset, if non-zero, should be to the start of the class_defs section.

  ]##
  let classDefsOffExpr = this.io.readU4le()
  this.classDefsOff = classDefsOffExpr

  ##[
  Size of data section in bytes. Must be an even multiple of sizeof(uint).

  ]##
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr

  ##[
  offset from the start of the file to the start of the data section.

  ]##
  let dataOffExpr = this.io.readU4le()
  this.dataOff = dataOffExpr

proc fromFile*(_: typedesc[Dex_HeaderItem], filename: string): Dex_HeaderItem =
  Dex_HeaderItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_MapList], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_MapList =
  template this: untyped = result
  this = new(Dex_MapList)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  for i in 0 ..< int(this.size):
    let it = Dex_MapItem.read(this.io, this.root, this)
    this.list.add(it)

proc fromFile*(_: typedesc[Dex_MapList], filename: string): Dex_MapList =
  Dex_MapList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_EncodedValue =
  template this: untyped = result
  this = new(Dex_EncodedValue)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueArgExpr = this.io.readBitsIntBe(3)
  this.valueArg = valueArgExpr
  let valueTypeExpr = Dex_EncodedValue_ValueTypeEnum(this.io.readBitsIntBe(5))
  this.valueType = valueTypeExpr
  alignToByte(this.io)
  block:
    let on = this.valueType
    if on == dex.int:
      let valueExpr = KaitaiStruct(this.io.readS4le())
      this.value = valueExpr
    elif on == dex.annotation:
      let valueExpr = Dex_EncodedAnnotation.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == dex.long:
      let valueExpr = KaitaiStruct(this.io.readS8le())
      this.value = valueExpr
    elif on == dex.method_handle:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.byte:
      let valueExpr = KaitaiStruct(this.io.readS1())
      this.value = valueExpr
    elif on == dex.array:
      let valueExpr = Dex_EncodedArray.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == dex.method_type:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.short:
      let valueExpr = KaitaiStruct(this.io.readS2le())
      this.value = valueExpr
    elif on == dex.method:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.double:
      let valueExpr = KaitaiStruct(this.io.readF8le())
      this.value = valueExpr
    elif on == dex.float:
      let valueExpr = KaitaiStruct(this.io.readF4le())
      this.value = valueExpr
    elif on == dex.type:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.enum:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.field:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.string:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr
    elif on == dex.char:
      let valueExpr = KaitaiStruct(this.io.readU2le())
      this.value = valueExpr

proc fromFile*(_: typedesc[Dex_EncodedValue], filename: string): Dex_EncodedValue =
  Dex_EncodedValue.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_CallSiteIdItem], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_CallSiteIdItem =
  template this: untyped = result
  this = new(Dex_CallSiteIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  offset from the start of the file to call site definition.

The offset should be in the data section, and the data there should
be in the format specified by "call_site_item" below.

  ]##
  let callSiteOffExpr = this.io.readU4le()
  this.callSiteOff = callSiteOffExpr

proc fromFile*(_: typedesc[Dex_CallSiteIdItem], filename: string): Dex_CallSiteIdItem =
  Dex_CallSiteIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_MethodIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_MethodIdItem =
  template this: untyped = result
  this = new(Dex_MethodIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the type_ids list for the definer of this method.
This must be a class or array type, and not a primitive type.

  ]##
  let classIdxExpr = this.io.readU2le()
  this.classIdx = classIdxExpr

  ##[
  index into the proto_ids list for the prototype of this method

  ]##
  let protoIdxExpr = this.io.readU2le()
  this.protoIdx = protoIdxExpr

  ##[
  index into the string_ids list for the name of this method.
The string must conform to the syntax for MemberName, defined above.

  ]##
  let nameIdxExpr = this.io.readU4le()
  this.nameIdx = nameIdxExpr

proc className(this: Dex_MethodIdItem): string = 

  ##[
  the definer of this method
  ]##
  if this.classNameInstFlag:
    return this.classNameInst
  let classNameInstExpr = string(Dex(this.root).typeIds[this.classIdx].typeName)
  this.classNameInst = classNameInstExpr
  this.classNameInstFlag = true
  return this.classNameInst

proc protoDesc(this: Dex_MethodIdItem): string = 

  ##[
  the short-form descriptor of the prototype of this method
  ]##
  if this.protoDescInstFlag:
    return this.protoDescInst
  let protoDescInstExpr = string(Dex(this.root).protoIds[this.protoIdx].shortyDesc)
  this.protoDescInst = protoDescInstExpr
  this.protoDescInstFlag = true
  return this.protoDescInst

proc methodName(this: Dex_MethodIdItem): string = 

  ##[
  the name of this method
  ]##
  if this.methodNameInstFlag:
    return this.methodNameInst
  let methodNameInstExpr = string(Dex(this.root).stringIds[this.nameIdx].value.data)
  this.methodNameInst = methodNameInstExpr
  this.methodNameInstFlag = true
  return this.methodNameInst

proc fromFile*(_: typedesc[Dex_MethodIdItem], filename: string): Dex_MethodIdItem =
  Dex_MethodIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_TypeItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_TypeList): Dex_TypeItem =
  template this: untyped = result
  this = new(Dex_TypeItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeIdxExpr = this.io.readU2le()
  this.typeIdx = typeIdxExpr

proc value(this: Dex_TypeItem): string = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = string(Dex(this.root).typeIds[this.typeIdx].typeName)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Dex_TypeItem], filename: string): Dex_TypeItem =
  Dex_TypeItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_TypeIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_TypeIdItem =
  template this: untyped = result
  this = new(Dex_TypeIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the string_ids list for the descriptor string of this type.
The string must conform to the syntax for TypeDescriptor, defined above.

  ]##
  let descriptorIdxExpr = this.io.readU4le()
  this.descriptorIdx = descriptorIdxExpr

proc typeName(this: Dex_TypeIdItem): string = 
  if this.typeNameInstFlag:
    return this.typeNameInst
  let typeNameInstExpr = string(Dex(this.root).stringIds[this.descriptorIdx].value.data)
  this.typeNameInst = typeNameInstExpr
  this.typeNameInstFlag = true
  return this.typeNameInst

proc fromFile*(_: typedesc[Dex_TypeIdItem], filename: string): Dex_TypeIdItem =
  Dex_TypeIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_AnnotationElement], io: KaitaiStream, root: KaitaiStruct, parent: Dex_EncodedAnnotation): Dex_AnnotationElement =
  template this: untyped = result
  this = new(Dex_AnnotationElement)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  element name, represented as an index into the string_ids section.

The string must conform to the syntax for MemberName, defined above.

  ]##
  let nameIdxExpr = VlqBase128Le.read(this.io, this.root, this)
  this.nameIdx = nameIdxExpr

  ##[
  element value

  ]##
  let valueExpr = Dex_EncodedValue.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[Dex_AnnotationElement], filename: string): Dex_AnnotationElement =
  Dex_AnnotationElement.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedField], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDataItem): Dex_EncodedField =
  template this: untyped = result
  this = new(Dex_EncodedField)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the field_ids list for the identity of this field
(includes the name and descriptor), represented as a difference
from the index of previous element in the list.

The index of the first element in a list is represented directly.

  ]##
  let fieldIdxDiffExpr = VlqBase128Le.read(this.io, this.root, this)
  this.fieldIdxDiff = fieldIdxDiffExpr

  ##[
  access flags for the field (public, final, etc.).

See "access_flags Definitions" for details.

  ]##
  let accessFlagsExpr = VlqBase128Le.read(this.io, this.root, this)
  this.accessFlags = accessFlagsExpr

proc fromFile*(_: typedesc[Dex_EncodedField], filename: string): Dex_EncodedField =
  Dex_EncodedField.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedArrayItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDefItem): Dex_EncodedArrayItem =
  template this: untyped = result
  this = new(Dex_EncodedArrayItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = Dex_EncodedArray.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[Dex_EncodedArrayItem], filename: string): Dex_EncodedArrayItem =
  Dex_EncodedArrayItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_ClassDataItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDefItem): Dex_ClassDataItem =
  template this: untyped = result
  this = new(Dex_ClassDataItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  the number of static fields defined in this item

  ]##
  let staticFieldsSizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.staticFieldsSize = staticFieldsSizeExpr

  ##[
  the number of instance fields defined in this item

  ]##
  let instanceFieldsSizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.instanceFieldsSize = instanceFieldsSizeExpr

  ##[
  the number of direct methods defined in this item

  ]##
  let directMethodsSizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.directMethodsSize = directMethodsSizeExpr

  ##[
  the number of virtual methods defined in this item

  ]##
  let virtualMethodsSizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.virtualMethodsSize = virtualMethodsSizeExpr

  ##[
  the defined static fields, represented as a sequence of encoded elements.

The fields must be sorted by field_idx in increasing order.

  ]##
  for i in 0 ..< int(this.staticFieldsSize.value):
    let it = Dex_EncodedField.read(this.io, this.root, this)
    this.staticFields.add(it)

  ##[
  the defined instance fields, represented as a sequence of encoded elements.

The fields must be sorted by field_idx in increasing order.

  ]##
  for i in 0 ..< int(this.instanceFieldsSize.value):
    let it = Dex_EncodedField.read(this.io, this.root, this)
    this.instanceFields.add(it)

  ##[
  the defined direct (any of static, private, or constructor) methods,
represented as a sequence of encoded elements.

The methods must be sorted by method_idx in increasing order.

  ]##
  for i in 0 ..< int(this.directMethodsSize.value):
    let it = Dex_EncodedMethod.read(this.io, this.root, this)
    this.directMethods.add(it)

  ##[
  the defined virtual (none of static, private, or constructor) methods,
represented as a sequence of encoded elements.

This list should not include inherited methods unless overridden by
the class that this item represents.

The methods must be sorted by method_idx in increasing order.

The method_idx of a virtual method must not be the same as any direct method.

  ]##
  for i in 0 ..< int(this.virtualMethodsSize.value):
    let it = Dex_EncodedMethod.read(this.io, this.root, this)
    this.virtualMethods.add(it)

proc fromFile*(_: typedesc[Dex_ClassDataItem], filename: string): Dex_ClassDataItem =
  Dex_ClassDataItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_FieldIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_FieldIdItem =
  template this: untyped = result
  this = new(Dex_FieldIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the type_ids list for the definer of this field.
This must be a class type, and not an array or primitive type.

  ]##
  let classIdxExpr = this.io.readU2le()
  this.classIdx = classIdxExpr

  ##[
  index into the type_ids list for the type of this field

  ]##
  let typeIdxExpr = this.io.readU2le()
  this.typeIdx = typeIdxExpr

  ##[
  index into the string_ids list for the name of this field.
The string must conform to the syntax for MemberName, defined above.

  ]##
  let nameIdxExpr = this.io.readU4le()
  this.nameIdx = nameIdxExpr

proc className(this: Dex_FieldIdItem): string = 

  ##[
  the definer of this field
  ]##
  if this.classNameInstFlag:
    return this.classNameInst
  let classNameInstExpr = string(Dex(this.root).typeIds[this.classIdx].typeName)
  this.classNameInst = classNameInstExpr
  this.classNameInstFlag = true
  return this.classNameInst

proc typeName(this: Dex_FieldIdItem): string = 

  ##[
  the type of this field
  ]##
  if this.typeNameInstFlag:
    return this.typeNameInst
  let typeNameInstExpr = string(Dex(this.root).typeIds[this.typeIdx].typeName)
  this.typeNameInst = typeNameInstExpr
  this.typeNameInstFlag = true
  return this.typeNameInst

proc fieldName(this: Dex_FieldIdItem): string = 

  ##[
  the name of this field
  ]##
  if this.fieldNameInstFlag:
    return this.fieldNameInst
  let fieldNameInstExpr = string(Dex(this.root).stringIds[this.nameIdx].value.data)
  this.fieldNameInst = fieldNameInstExpr
  this.fieldNameInstFlag = true
  return this.fieldNameInst

proc fromFile*(_: typedesc[Dex_FieldIdItem], filename: string): Dex_FieldIdItem =
  Dex_FieldIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedAnnotation], io: KaitaiStream, root: KaitaiStruct, parent: Dex_EncodedValue): Dex_EncodedAnnotation =
  template this: untyped = result
  this = new(Dex_EncodedAnnotation)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  type of the annotation.

This must be a class (not array or primitive) type.

  ]##
  let typeIdxExpr = VlqBase128Le.read(this.io, this.root, this)
  this.typeIdx = typeIdxExpr

  ##[
  number of name-value mappings in this annotation

  ]##
  let sizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.size = sizeExpr

  ##[
  elements of the annotation, represented directly in-line (not as offsets).

Elements must be sorted in increasing order by string_id index.

  ]##
  for i in 0 ..< int(this.size.value):
    let it = Dex_AnnotationElement.read(this.io, this.root, this)
    this.elements.add(it)

proc fromFile*(_: typedesc[Dex_EncodedAnnotation], filename: string): Dex_EncodedAnnotation =
  Dex_EncodedAnnotation.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_ClassDefItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_ClassDefItem =
  template this: untyped = result
  this = new(Dex_ClassDefItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the type_ids list for this class.

This must be a class type, and not an array or primitive type.

  ]##
  let classIdxExpr = this.io.readU4le()
  this.classIdx = classIdxExpr

  ##[
  access flags for the class (public, final, etc.).

See "access_flags Definitions" for details.

  ]##
  let accessFlagsExpr = Dex_ClassAccessFlags(this.io.readU4le())
  this.accessFlags = accessFlagsExpr

  ##[
  index into the type_ids list for the superclass,
or the constant value NO_INDEX if this class has no superclass
(i.e., it is a root class such as Object).

If present, this must be a class type, and not an array or primitive type.

  ]##
  let superclassIdxExpr = this.io.readU4le()
  this.superclassIdx = superclassIdxExpr

  ##[
  offset from the start of the file to the list of interfaces, or 0 if there are none.

This offset should be in the data section, and the data there should
be in the format specified by "type_list" below. Each of the elements
of the list must be a class type (not an array or primitive type),
and there must not be any duplicates.

  ]##
  let interfacesOffExpr = this.io.readU4le()
  this.interfacesOff = interfacesOffExpr

  ##[
  index into the string_ids list for the name of the file containing
the original source for (at least most of) this class, or the
special value NO_INDEX to represent a lack of this information.

The debug_info_item of any given method may override this source file,
but the expectation is that most classes will only come from one source file.

  ]##
  let sourceFileIdxExpr = this.io.readU4le()
  this.sourceFileIdx = sourceFileIdxExpr

  ##[
  offset from the start of the file to the annotations structure for
this class, or 0 if there are no annotations on this class.

This offset, if non-zero, should be in the data section, and the data
there should be in the format specified by "annotations_directory_item"
below,with all items referring to this class as the definer.

  ]##
  let annotationsOffExpr = this.io.readU4le()
  this.annotationsOff = annotationsOffExpr

  ##[
  offset from the start of the file to the associated class data for this
item, or 0 if there is no class data for this class.

(This may be the case, for example, if this class is a marker interface.)

The offset, if non-zero, should be in the data section, and the data
there should be in the format specified by "class_data_item" below,
with all items referring to this class as the definer.

  ]##
  let classDataOffExpr = this.io.readU4le()
  this.classDataOff = classDataOffExpr

  ##[
  offset from the start of the file to the list of initial values for
static fields, or 0 if there are none (and all static fields are to be
initialized with 0 or null).

This offset should be in the data section, and the data there should
be in the format specified by "encoded_array_item" below.

The size of the array must be no larger than the number of static fields
declared by this class, and the elements correspond to the static fields
in the same order as declared in the corresponding field_list.

The type of each array element must match the declared type of its
corresponding field.

If there are fewer elements in the array than there are static fields,
then the leftover fields are initialized with a type-appropriate 0 or null.

  ]##
  let staticValuesOffExpr = this.io.readU4le()
  this.staticValuesOff = staticValuesOffExpr

proc typeName(this: Dex_ClassDefItem): string = 
  if this.typeNameInstFlag:
    return this.typeNameInst
  let typeNameInstExpr = string(Dex(this.root).typeIds[this.classIdx].typeName)
  this.typeNameInst = typeNameInstExpr
  this.typeNameInstFlag = true
  return this.typeNameInst

proc classData(this: Dex_ClassDefItem): Dex_ClassDataItem = 
  if this.classDataInstFlag:
    return this.classDataInst
  if this.classDataOff != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.classDataOff))
    let classDataInstExpr = Dex_ClassDataItem.read(this.io, this.root, this)
    this.classDataInst = classDataInstExpr
    this.io.seek(pos)
  this.classDataInstFlag = true
  return this.classDataInst

proc staticValues(this: Dex_ClassDefItem): Dex_EncodedArrayItem = 
  if this.staticValuesInstFlag:
    return this.staticValuesInst
  if this.staticValuesOff != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.staticValuesOff))
    let staticValuesInstExpr = Dex_EncodedArrayItem.read(this.io, this.root, this)
    this.staticValuesInst = staticValuesInstExpr
    this.io.seek(pos)
  this.staticValuesInstFlag = true
  return this.staticValuesInst

proc fromFile*(_: typedesc[Dex_ClassDefItem], filename: string): Dex_ClassDefItem =
  Dex_ClassDefItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_TypeList], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ProtoIdItem): Dex_TypeList =
  template this: untyped = result
  this = new(Dex_TypeList)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  for i in 0 ..< int(this.size):
    let it = Dex_TypeItem.read(this.io, this.root, this)
    this.list.add(it)

proc fromFile*(_: typedesc[Dex_TypeList], filename: string): Dex_TypeList =
  Dex_TypeList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_StringIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_StringIdItem =
  template this: untyped = result
  this = new(Dex_StringIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  offset from the start of the file to the string data for this item.
The offset should be to a location in the data section, and the data
should be in the format specified by "string_data_item" below.
There is no alignment requirement for the offset.

  ]##
  let stringDataOffExpr = this.io.readU4le()
  this.stringDataOff = stringDataOffExpr

proc value(this: Dex_StringIdItem): Dex_StringIdItem_StringDataItem = 
  if this.valueInstFlag:
    return this.valueInst
  let pos = this.io.pos()
  this.io.seek(int(this.stringDataOff))
  let valueInstExpr = Dex_StringIdItem_StringDataItem.read(this.io, this.root, this)
  this.valueInst = valueInstExpr
  this.io.seek(pos)
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Dex_StringIdItem], filename: string): Dex_StringIdItem =
  Dex_StringIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_StringIdItem_StringDataItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_StringIdItem): Dex_StringIdItem_StringDataItem =
  template this: untyped = result
  this = new(Dex_StringIdItem_StringDataItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let utf16SizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.utf16Size = utf16SizeExpr
  let dataExpr = encode(this.io.readBytes(int(this.utf16Size.value)), "ascii")
  this.data = dataExpr

proc fromFile*(_: typedesc[Dex_StringIdItem_StringDataItem], filename: string): Dex_StringIdItem_StringDataItem =
  Dex_StringIdItem_StringDataItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_ProtoIdItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex): Dex_ProtoIdItem =
  template this: untyped = result
  this = new(Dex_ProtoIdItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the string_ids list for the short-form descriptor string of this prototype.
The string must conform to the syntax for ShortyDescriptor, defined above,
and must correspond to the return type and parameters of this item.

  ]##
  let shortyIdxExpr = this.io.readU4le()
  this.shortyIdx = shortyIdxExpr

  ##[
  index into the type_ids list for the return type of this prototype

  ]##
  let returnTypeIdxExpr = this.io.readU4le()
  this.returnTypeIdx = returnTypeIdxExpr

  ##[
  offset from the start of the file to the list of parameter types for this prototype,
or 0 if this prototype has no parameters.
This offset, if non-zero, should be in the data section, and the data
there should be in the format specified by "type_list" below.
Additionally, there should be no reference to the type void in the list.

  ]##
  let parametersOffExpr = this.io.readU4le()
  this.parametersOff = parametersOffExpr

proc shortyDesc(this: Dex_ProtoIdItem): string = 

  ##[
  short-form descriptor string of this prototype, as pointed to by shorty_idx
  ]##
  if this.shortyDescInstFlag:
    return this.shortyDescInst
  let shortyDescInstExpr = string(Dex(this.root).stringIds[this.shortyIdx].value.data)
  this.shortyDescInst = shortyDescInstExpr
  this.shortyDescInstFlag = true
  return this.shortyDescInst

proc paramsTypes(this: Dex_ProtoIdItem): Dex_TypeList = 

  ##[
  list of parameter types for this prototype
  ]##
  if this.paramsTypesInstFlag:
    return this.paramsTypesInst
  if this.parametersOff != 0:
    let io = Dex(this.root).io
    let pos = io.pos()
    io.seek(int(this.parametersOff))
    let paramsTypesInstExpr = Dex_TypeList.read(io, this.root, this)
    this.paramsTypesInst = paramsTypesInstExpr
    io.seek(pos)
  this.paramsTypesInstFlag = true
  return this.paramsTypesInst

proc returnType(this: Dex_ProtoIdItem): string = 

  ##[
  return type of this prototype
  ]##
  if this.returnTypeInstFlag:
    return this.returnTypeInst
  let returnTypeInstExpr = string(Dex(this.root).typeIds[this.returnTypeIdx].typeName)
  this.returnTypeInst = returnTypeInstExpr
  this.returnTypeInstFlag = true
  return this.returnTypeInst

proc fromFile*(_: typedesc[Dex_ProtoIdItem], filename: string): Dex_ProtoIdItem =
  Dex_ProtoIdItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedMethod], io: KaitaiStream, root: KaitaiStruct, parent: Dex_ClassDataItem): Dex_EncodedMethod =
  template this: untyped = result
  this = new(Dex_EncodedMethod)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  index into the method_ids list for the identity of this method
(includes the name and descriptor), represented as a difference
from the index of previous element in the list.

The index of the first element in a list is represented directly.

  ]##
  let methodIdxDiffExpr = VlqBase128Le.read(this.io, this.root, this)
  this.methodIdxDiff = methodIdxDiffExpr

  ##[
  access flags for the field (public, final, etc.).

See "access_flags Definitions" for details.

  ]##
  let accessFlagsExpr = VlqBase128Le.read(this.io, this.root, this)
  this.accessFlags = accessFlagsExpr

  ##[
  offset from the start of the file to the code structure for this method,
or 0 if this method is either abstract or native.

The offset should be to a location in the data section.

The format of the data is specified by "code_item" below.

  ]##
  let codeOffExpr = VlqBase128Le.read(this.io, this.root, this)
  this.codeOff = codeOffExpr

proc fromFile*(_: typedesc[Dex_EncodedMethod], filename: string): Dex_EncodedMethod =
  Dex_EncodedMethod.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_MapItem], io: KaitaiStream, root: KaitaiStruct, parent: Dex_MapList): Dex_MapItem =
  template this: untyped = result
  this = new(Dex_MapItem)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  type of the items; see table below

  ]##
  let typeExpr = Dex_MapItem_MapItemType(this.io.readU2le())
  this.type = typeExpr

  ##[
  (unused)

  ]##
  let unusedExpr = this.io.readU2le()
  this.unused = unusedExpr

  ##[
  count of the number of items to be found at the indicated offset

  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

  ##[
  offset from the start of the file to the items in question

  ]##
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr

proc fromFile*(_: typedesc[Dex_MapItem], filename: string): Dex_MapItem =
  Dex_MapItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dex_EncodedArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dex_EncodedArray =
  template this: untyped = result
  this = new(Dex_EncodedArray)
  let root = if root == nil: cast[Dex](this) else: cast[Dex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = VlqBase128Le.read(this.io, this.root, this)
  this.size = sizeExpr
  for i in 0 ..< int(this.size.value):
    let it = Dex_EncodedValue.read(this.io, this.root, this)
    this.values.add(it)

proc fromFile*(_: typedesc[Dex_EncodedArray], filename: string): Dex_EncodedArray =
  Dex_EncodedArray.read(newKaitaiFileStream(filename), nil, nil)

