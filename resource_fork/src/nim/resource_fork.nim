import kaitai_struct_nim_runtime
import options
import /common/bytes_with_io

import "bytes_with_io"
type
  ResourceFork* = ref object of KaitaiStruct
    `header`*: ResourceFork_FileHeader
    `systemData`*: seq[byte]
    `applicationData`*: seq[byte]
    `parent`*: KaitaiStruct
    `rawDataBlocksWithIoInst`*: seq[byte]
    `rawResourceMapInst`*: seq[byte]
    `dataBlocksWithIoInst`: BytesWithIo
    `dataBlocksWithIoInstFlag`: bool
    `dataBlocksInst`: seq[byte]
    `dataBlocksInstFlag`: bool
    `resourceMapInst`: ResourceFork_ResourceMap
    `resourceMapInstFlag`: bool
  ResourceFork_FileHeader* = ref object of KaitaiStruct
    `ofsDataBlocks`*: uint32
    `ofsResourceMap`*: uint32
    `lenDataBlocks`*: uint32
    `lenResourceMap`*: uint32
    `parent`*: KaitaiStruct
  ResourceFork_DataBlock* = ref object of KaitaiStruct
    `lenData`*: uint32
    `data`*: seq[byte]
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
  ResourceFork_ResourceMap* = ref object of KaitaiStruct
    `reservedFileHeaderCopy`*: ResourceFork_FileHeader
    `reservedNextResourceMapHandle`*: uint32
    `reservedFileReferenceNumber`*: uint16
    `fileAttributes`*: ResourceFork_ResourceMap_FileAttributes
    `ofsTypeList`*: uint16
    `ofsNames`*: uint16
    `parent`*: ResourceFork
    `rawFileAttributes`*: seq[byte]
    `rawTypeListAndReferenceListsInst`*: seq[byte]
    `rawNamesWithIoInst`*: seq[byte]
    `typeListAndReferenceListsInst`: ResourceFork_ResourceMap_TypeListAndReferenceLists
    `typeListAndReferenceListsInstFlag`: bool
    `namesWithIoInst`: BytesWithIo
    `namesWithIoInstFlag`: bool
    `namesInst`: seq[byte]
    `namesInstFlag`: bool
  ResourceFork_ResourceMap_FileAttributes* = ref object of KaitaiStruct
    `resourcesLocked`*: bool
    `reserved0`*: uint64
    `printerDriverMultifinderCompatible`*: bool
    `noWriteChanges`*: bool
    `needsCompact`*: bool
    `mapNeedsWrite`*: bool
    `reserved1`*: uint64
    `parent`*: ResourceFork_ResourceMap
    `asIntInst`: uint16
    `asIntInstFlag`: bool
  ResourceFork_ResourceMap_TypeListAndReferenceLists* = ref object of KaitaiStruct
    `typeList`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList
    `referenceLists`*: seq[byte]
    `parent`*: ResourceFork_ResourceMap
  ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList* = ref object of KaitaiStruct
    `numTypesM1`*: uint16
    `entries`*: seq[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry]
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists
    `numTypesInst`: int
    `numTypesInstFlag`: bool
  ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry* = ref object of KaitaiStruct
    `type`*: seq[byte]
    `numReferencesM1`*: uint16
    `ofsReferenceList`*: uint16
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList
    `numReferencesInst`: int
    `numReferencesInstFlag`: bool
    `referenceListInst`: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
    `referenceListInstFlag`: bool
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList* = ref object of KaitaiStruct
    `references`*: seq[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference]
    `numReferences`*: uint16
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference* = ref object of KaitaiStruct
    `id`*: int16
    `ofsName`*: uint16
    `attributes`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes
    `ofsDataBlock`*: uint64
    `reservedHandle`*: uint32
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
    `rawAttributes`*: seq[byte]
    `nameInst`: ResourceFork_ResourceMap_Name
    `nameInstFlag`: bool
    `dataBlockInst`: ResourceFork_DataBlock
    `dataBlockInstFlag`: bool
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes* = ref object of KaitaiStruct
    `systemReference`*: bool
    `loadIntoSystemHeap`*: bool
    `purgeable`*: bool
    `locked`*: bool
    `protected`*: bool
    `preload`*: bool
    `needsWrite`*: bool
    `compressed`*: bool
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
    `asIntInst`: uint8
    `asIntInstFlag`: bool
  ResourceFork_ResourceMap_Name* = ref object of KaitaiStruct
    `lenValue`*: uint8
    `value`*: seq[byte]
    `parent`*: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference

proc read*(_: typedesc[ResourceFork], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResourceFork
proc read*(_: typedesc[ResourceFork_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResourceFork_FileHeader
proc read*(_: typedesc[ResourceFork_DataBlock], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_DataBlock
proc read*(_: typedesc[ResourceFork_ResourceMap], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork): ResourceFork_ResourceMap
proc read*(_: typedesc[ResourceFork_ResourceMap_FileAttributes], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap): ResourceFork_ResourceMap_FileAttributes
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap): ResourceFork_ResourceMap_TypeListAndReferenceLists
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry, numReferences: any): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes
proc read*(_: typedesc[ResourceFork_ResourceMap_Name], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_Name

proc dataBlocksWithIo*(this: ResourceFork): BytesWithIo
proc dataBlocks*(this: ResourceFork): seq[byte]
proc resourceMap*(this: ResourceFork): ResourceFork_ResourceMap
proc typeListAndReferenceLists*(this: ResourceFork_ResourceMap): ResourceFork_ResourceMap_TypeListAndReferenceLists
proc namesWithIo*(this: ResourceFork_ResourceMap): BytesWithIo
proc names*(this: ResourceFork_ResourceMap): seq[byte]
proc asInt*(this: ResourceFork_ResourceMap_FileAttributes): uint16
proc numTypes*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList): int
proc numReferences*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry): int
proc referenceList*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
proc name*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_Name
proc dataBlock*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_DataBlock
proc asInt*(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes): uint8


##[
The data format of Macintosh resource forks,
used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
The kinds of data stored in resource forks include:

* Document resources:
  images, sounds, etc. used by a document
* Application resources:
  graphics, GUI layouts, localizable strings,
  and even code used by an application, a library, or system files
* Common metadata:
  custom icons and version metadata that could be displayed by the Finder
* Application-specific metadata:
  because resource forks follow a common format,
  other applications can store new metadata in them,
  even if the original application does not recognize or understand it

Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
which allows storing resources along with any file.
Non-Macintosh file systems and protocols have little or no support for resource forks,
so the resource fork data must be stored in some other way when using such file systems or protocols.
Various file formats and tools exist for this purpose,
such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
In some cases,
resource forks are stored as plain data in separate files with a .rsrc extension,
even on Mac systems that natively support resource forks.

On modern Mac OS X/macOS systems,
resource forks are used far less commonly than on classic Mac OS systems,
because of compatibility issues with other systems and historical limitations in the format.
Modern macOS APIs and libraries do not use resource forks,
and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
Despite this,
even current macOS systems still use resource forks for certain purposes,
such as custom file icons.

@see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151">Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format</a>
@see <a href="https://www.pagetable.com/?p=50">Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File</a>
@see <a href="https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format">Source</a>
@see <a href="https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks">Source</a>
]##
proc read*(_: typedesc[ResourceFork], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResourceFork =
  template this: untyped = result
  this = new(ResourceFork)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The resource file's header information.
  ]##
  let headerExpr = ResourceFork_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  System-reserved data area.
This field can generally be ignored when reading and writing.

This field is used by the Classic Mac OS Finder as temporary storage space.
It usually contains parts of the file metadata (name, type/creator code, etc.).
Any existing data in this field is ignored and overwritten.

In resource files written by Mac OS X,
this field is set to all zero bytes.

  ]##
  let systemDataExpr = this.io.readBytes(int(112))
  this.systemData = systemDataExpr

  ##[
  Application-specific data area.
This field can generally be ignored when reading and writing.

According to early revisions of Inside Macintosh,
this field is "available for application data".
In practice, it is almost never used for this purpose,
and usually contains only junk data.

In resource files written by Mac OS X,
this field is set to all zero bytes.

  ]##
  let applicationDataExpr = this.io.readBytes(int(128))
  this.applicationData = applicationDataExpr

proc dataBlocksWithIo(this: ResourceFork): BytesWithIo = 

  ##[
  Use `data_blocks` instead,
unless you need access to this instance's `_io`.

  ]##
  if this.dataBlocksWithIoInstFlag:
    return this.dataBlocksWithIoInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.ofsDataBlocks))
  let rawDataBlocksWithIoInstExpr = this.io.readBytes(int(this.header.lenDataBlocks))
  this.rawDataBlocksWithIoInst = rawDataBlocksWithIoInstExpr
  let rawDataBlocksWithIoInstIo = newKaitaiStream(rawDataBlocksWithIoInstExpr)
  let dataBlocksWithIoInstExpr = BytesWithIo.read(rawDataBlocksWithIoInstIo, this.root, this)
  this.dataBlocksWithIoInst = dataBlocksWithIoInstExpr
  this.io.seek(pos)
  this.dataBlocksWithIoInstFlag = true
  return this.dataBlocksWithIoInst

proc dataBlocks(this: ResourceFork): seq[byte] = 

  ##[
  Storage area for the data blocks of all resources.

These data blocks are not required to appear in any particular order,
and there may be unused space between and around them.

In practice,
the data blocks in newly created resource files are usually contiguous.
When existing resources are shortened,
the Mac OS resource manager leaves unused space where the now removed resource data was,
as this is quicker than moving the following resource data into the newly freed space.
Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
which happens when resources are removed entirely,
or when resources are added or grown so that more space is needed in the data area.

  ]##
  if this.dataBlocksInstFlag:
    return this.dataBlocksInst
  let dataBlocksInstExpr = seq[byte](this.dataBlocksWithIo.data)
  this.dataBlocksInst = dataBlocksInstExpr
  this.dataBlocksInstFlag = true
  return this.dataBlocksInst

proc resourceMap(this: ResourceFork): ResourceFork_ResourceMap = 

  ##[
  The resource file's resource map.
  ]##
  if this.resourceMapInstFlag:
    return this.resourceMapInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.ofsResourceMap))
  let rawResourceMapInstExpr = this.io.readBytes(int(this.header.lenResourceMap))
  this.rawResourceMapInst = rawResourceMapInstExpr
  let rawResourceMapInstIo = newKaitaiStream(rawResourceMapInstExpr)
  let resourceMapInstExpr = ResourceFork_ResourceMap.read(rawResourceMapInstIo, this.root, this)
  this.resourceMapInst = resourceMapInstExpr
  this.io.seek(pos)
  this.resourceMapInstFlag = true
  return this.resourceMapInst

proc fromFile*(_: typedesc[ResourceFork], filename: string): ResourceFork =
  ResourceFork.read(newKaitaiFileStream(filename), nil, nil)


##[
Resource file header,
containing the offsets and lengths of the resource data area and resource map.

]##
proc read*(_: typedesc[ResourceFork_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ResourceFork_FileHeader =
  template this: untyped = result
  this = new(ResourceFork_FileHeader)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Offset of the resource data area,
from the start of the resource file.

In practice,
this should always be `256`,
i. e. the resource data area should directly follow the application-specific data area.

  ]##
  let ofsDataBlocksExpr = this.io.readU4be()
  this.ofsDataBlocks = ofsDataBlocksExpr

  ##[
  Offset of the resource map,
from the start of the resource file.

In practice,
this should always be `ofs_data_blocks + len_data_blocks`,
i. e. the resource map should directly follow the resource data area.

  ]##
  let ofsResourceMapExpr = this.io.readU4be()
  this.ofsResourceMap = ofsResourceMapExpr

  ##[
  Length of the resource data area.

  ]##
  let lenDataBlocksExpr = this.io.readU4be()
  this.lenDataBlocks = lenDataBlocksExpr

  ##[
  Length of the resource map.

In practice,
this should always be `_root._io.size - ofs_resource_map`,
i. e. the resource map should extend to the end of the resource file.

  ]##
  let lenResourceMapExpr = this.io.readU4be()
  this.lenResourceMap = lenResourceMapExpr

proc fromFile*(_: typedesc[ResourceFork_FileHeader], filename: string): ResourceFork_FileHeader =
  ResourceFork_FileHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
A resource data block,
as stored in the resource data area.

Each data block stores the data contained in a resource,
along with its length.

]##
proc read*(_: typedesc[ResourceFork_DataBlock], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_DataBlock =
  template this: untyped = result
  this = new(ResourceFork_DataBlock)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The length of the resource data stored in this block.

  ]##
  let lenDataExpr = this.io.readU4be()
  this.lenData = lenDataExpr

  ##[
  The data stored in this block.

  ]##
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr

proc fromFile*(_: typedesc[ResourceFork_DataBlock], filename: string): ResourceFork_DataBlock =
  ResourceFork_DataBlock.read(newKaitaiFileStream(filename), nil, nil)


##[
Resource map,
containing information about the resources in the file and where they are located in the data area.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork): ResourceFork_ResourceMap =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Reserved space for a copy of the resource file header.
  ]##
  let reservedFileHeaderCopyExpr = ResourceFork_FileHeader.read(this.io, this.root, this)
  this.reservedFileHeaderCopy = reservedFileHeaderCopyExpr

  ##[
  Reserved space for a handle to the next loaded resource map in memory.
  ]##
  let reservedNextResourceMapHandleExpr = this.io.readU4be()
  this.reservedNextResourceMapHandle = reservedNextResourceMapHandleExpr

  ##[
  Reserved space for the resource file's file reference number.
  ]##
  let reservedFileReferenceNumberExpr = this.io.readU2be()
  this.reservedFileReferenceNumber = reservedFileReferenceNumberExpr

  ##[
  The resource file's attributes.
  ]##
  let rawFileAttributesExpr = this.io.readBytes(int(2))
  this.rawFileAttributes = rawFileAttributesExpr
  let rawFileAttributesIo = newKaitaiStream(rawFileAttributesExpr)
  let fileAttributesExpr = ResourceFork_ResourceMap_FileAttributes.read(rawFileAttributesIo, this.root, this)
  this.fileAttributes = fileAttributesExpr

  ##[
  Offset of the resource type list,
from the start of the resource map.

In practice,
this should always be `sizeof<resource_map>`,
i. e. the resource type list should directly follow the resource map.

  ]##
  let ofsTypeListExpr = this.io.readU2be()
  this.ofsTypeList = ofsTypeListExpr

  ##[
  Offset of the resource name area,
from the start of the resource map.

  ]##
  let ofsNamesExpr = this.io.readU2be()
  this.ofsNames = ofsNamesExpr

proc typeListAndReferenceLists(this: ResourceFork_ResourceMap): ResourceFork_ResourceMap_TypeListAndReferenceLists = 

  ##[
  The resource map's resource type list, followed by the resource reference list area.
  ]##
  if this.typeListAndReferenceListsInstFlag:
    return this.typeListAndReferenceListsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsTypeList))
  let rawTypeListAndReferenceListsInstExpr = this.io.readBytes(int((this.ofsNames - this.ofsTypeList)))
  this.rawTypeListAndReferenceListsInst = rawTypeListAndReferenceListsInstExpr
  let rawTypeListAndReferenceListsInstIo = newKaitaiStream(rawTypeListAndReferenceListsInstExpr)
  let typeListAndReferenceListsInstExpr = ResourceFork_ResourceMap_TypeListAndReferenceLists.read(rawTypeListAndReferenceListsInstIo, this.root, this)
  this.typeListAndReferenceListsInst = typeListAndReferenceListsInstExpr
  this.io.seek(pos)
  this.typeListAndReferenceListsInstFlag = true
  return this.typeListAndReferenceListsInst

proc namesWithIo(this: ResourceFork_ResourceMap): BytesWithIo = 

  ##[
  Use `names` instead,
unless you need access to this instance's `_io`.

  ]##
  if this.namesWithIoInstFlag:
    return this.namesWithIoInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsNames))
  let rawNamesWithIoInstExpr = this.io.readBytesFull()
  this.rawNamesWithIoInst = rawNamesWithIoInstExpr
  let rawNamesWithIoInstIo = newKaitaiStream(rawNamesWithIoInstExpr)
  let namesWithIoInstExpr = BytesWithIo.read(rawNamesWithIoInstIo, this.root, this)
  this.namesWithIoInst = namesWithIoInstExpr
  this.io.seek(pos)
  this.namesWithIoInstFlag = true
  return this.namesWithIoInst

proc names(this: ResourceFork_ResourceMap): seq[byte] = 

  ##[
  Storage area for the names of all resources.
  ]##
  if this.namesInstFlag:
    return this.namesInst
  let namesInstExpr = seq[byte](this.namesWithIo.data)
  this.namesInst = namesInstExpr
  this.namesInstFlag = true
  return this.namesInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap], filename: string): ResourceFork_ResourceMap =
  ResourceFork_ResourceMap.read(newKaitaiFileStream(filename), nil, nil)


##[
A resource file's attributes,
as stored in the resource map.

These attributes are sometimes also referred to as resource map attributes,
because of where they are stored in the file.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_FileAttributes], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap): ResourceFork_ResourceMap_FileAttributes =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_FileAttributes)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  TODO What does this attribute actually do,
and how is it different from `read_only`?

This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
but ResEdit has a checkbox called "Resources Locked" for this attribute.

  ]##
  let resourcesLockedExpr = this.io.readBitsIntBe(1) != 0
  this.resourcesLocked = resourcesLockedExpr

  ##[
  These attributes have no known usage or meaning and should always be zero.

  ]##
  let reserved0Expr = this.io.readBitsIntBe(6)
  this.reserved0 = reserved0Expr

  ##[
  Indicates that this printer driver is compatible with MultiFinder,
i. e. can be used simultaneously by multiple applications.
This attribute is only meant to be set on printer driver resource forks.

This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
It is documented in technote PR510,
and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.

  @see <a href="https://developer.apple.com/library/archive/technotes/pr/pr_510.html">Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'</a>
  ]##
  let printerDriverMultifinderCompatibleExpr = this.io.readBitsIntBe(1) != 0
  this.printerDriverMultifinderCompatible = printerDriverMultifinderCompatibleExpr

  ##[
  Indicates that the Resource Manager should not write any changes from memory into the resource file.
Any modification operations requested by the application will return successfully,
but will not actually update the resource file.

TODO Is this attribute supposed to be set on disk or only in memory?

  ]##
  let noWriteChangesExpr = this.io.readBitsIntBe(1) != 0
  this.noWriteChanges = noWriteChangesExpr

  ##[
  Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
This attribute is only meant to be set in memory;
it is cleared when the resource file is written to disk.

This attribute is mainly used internally by the Resource Manager,
but may also be set manually by the application.

  ]##
  let needsCompactExpr = this.io.readBitsIntBe(1) != 0
  this.needsCompact = needsCompactExpr

  ##[
  Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
This attribute is only meant to be set in memory;
it is cleared when the resource file is written to disk.

This attribute is mainly used internally by the Resource Manager,
but may also be set manually by the application.

  ]##
  let mapNeedsWriteExpr = this.io.readBitsIntBe(1) != 0
  this.mapNeedsWrite = mapNeedsWriteExpr

  ##[
  These attributes have no known usage or meaning and should always be zero.

  ]##
  let reserved1Expr = this.io.readBitsIntBe(5)
  this.reserved1 = reserved1Expr

proc asInt(this: ResourceFork_ResourceMap_FileAttributes): uint16 = 

  ##[
  The attributes as a packed integer,
as they are stored in the file.

  ]##
  if this.asIntInstFlag:
    return this.asIntInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let asIntInstExpr = this.io.readU2be()
  this.asIntInst = asIntInstExpr
  this.io.seek(pos)
  this.asIntInstFlag = true
  return this.asIntInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_FileAttributes], filename: string): ResourceFork_ResourceMap_FileAttributes =
  ResourceFork_ResourceMap_FileAttributes.read(newKaitaiFileStream(filename), nil, nil)


##[
Resource type list and storage area for resource reference lists in the resource map.

The two parts are combined into a single type here for technical reasons:
the start of the resource reference list area is not stored explicitly in the file,
instead it always starts directly after the resource type list.
The simplest way to implement this is by placing both types into a single `seq`.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap): ResourceFork_ResourceMap_TypeListAndReferenceLists =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The resource map's resource type list.
  ]##
  let typeListExpr = ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList.read(this.io, this.root, this)
  this.typeList = typeListExpr

  ##[
  Storage area for the resource map's resource reference lists.

According to Inside Macintosh,
the reference lists are stored contiguously,
in the same order as their corresponding resource type list entries.

  ]##
  let referenceListsExpr = this.io.readBytesFull()
  this.referenceLists = referenceListsExpr

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists =
  ResourceFork_ResourceMap_TypeListAndReferenceLists.read(newKaitaiFileStream(filename), nil, nil)


##[
Resource type list in the resource map.
]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The number of resource types in this list,
minus one.

If the resource list is empty,
the value of this field is `0xffff`,
i. e. `-1` truncated to a 16-bit unsigned integer.

  ]##
  let numTypesM1Expr = this.io.readU2be()
  this.numTypesM1 = numTypesM1Expr

  ##[
  Entries in the resource type list.
  ]##
  for i in 0 ..< int(this.numTypes):
    let it = ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc numTypes(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList): int = 

  ##[
  The number of resource types in this list.
  ]##
  if this.numTypesInstFlag:
    return this.numTypesInst
  let numTypesInstExpr = int(((this.numTypesM1 + 1) %%% 65536))
  this.numTypesInst = numTypesInstExpr
  this.numTypesInstFlag = true
  return this.numTypesInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList =
  ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList.read(newKaitaiFileStream(filename), nil, nil)


##[
A single entry in the resource type list.

Each entry corresponds to exactly one resource reference list.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The four-character type code of the resources in the reference list.
  ]##
  let typeExpr = this.io.readBytes(int(4))
  this.type = typeExpr

  ##[
  The number of resources in the reference list for this type,
minus one.

Empty reference lists should never exist.

  ]##
  let numReferencesM1Expr = this.io.readU2be()
  this.numReferencesM1 = numReferencesM1Expr

  ##[
  Offset of the resource reference list for this resource type,
from the start of the resource type list.

Although the offset is relative to the start of the type list,
it should never point into the type list itself,
but into the reference list storage area that directly follows it.
That is,
it should always be at least `_parent._sizeof`.

  ]##
  let ofsReferenceListExpr = this.io.readU2be()
  this.ofsReferenceList = ofsReferenceListExpr

proc numReferences(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry): int = 

  ##[
  The number of resources in the reference list for this type.
  ]##
  if this.numReferencesInstFlag:
    return this.numReferencesInst
  let numReferencesInstExpr = int(((this.numReferencesM1 + 1) %%% 65536))
  this.numReferencesInst = numReferencesInstExpr
  this.numReferencesInstFlag = true
  return this.numReferencesInst

proc referenceList(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList = 

  ##[
  The resource reference list for this resource type.

  ]##
  if this.referenceListInstFlag:
    return this.referenceListInst
  let io = this.parent.parent.io
  let pos = io.pos()
  io.seek(int(this.ofsReferenceList))
  let referenceListInstExpr = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList.read(io, this.root, this, this.numReferences)
  this.referenceListInst = referenceListInstExpr
  io.seek(pos)
  this.referenceListInstFlag = true
  return this.referenceListInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry =
  ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
A resource reference list,
as stored in the reference list area.

Each reference list has exactly one matching entry in the resource type list,
and describes all resources of a single type in the file.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry, numReferences: any): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numReferencesExpr = uint16(numReferences)
  this.numReferences = numReferencesExpr


  ##[
  The resource references in this reference list.
  ]##
  for i in 0 ..< int(this.numReferences):
    let it = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference.read(this.io, this.root, this)
    this.references.add(it)

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList =
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList.read(newKaitaiFileStream(filename), nil, nil)


##[
A single resource reference in a resource reference list.
]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  ID of the resource described by this reference.
  ]##
  let idExpr = this.io.readS2be()
  this.id = idExpr

  ##[
  Offset of the name for the resource described by this reference,
from the start of the resource name area.

If the resource has no name,
the value of this field is `0xffff`
i. e. `-1` truncated to a 16-bit unsigned integer.

  ]##
  let ofsNameExpr = this.io.readU2be()
  this.ofsName = ofsNameExpr

  ##[
  Attributes of the resource described by this reference.
  ]##
  let rawAttributesExpr = this.io.readBytes(int(1))
  this.rawAttributes = rawAttributesExpr
  let rawAttributesIo = newKaitaiStream(rawAttributesExpr)
  let attributesExpr = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes.read(rawAttributesIo, this.root, this)
  this.attributes = attributesExpr

  ##[
  Offset of the data block for the resource described by this reference,
from the start of the resource data area.

  ]##
  let ofsDataBlockExpr = this.io.readBitsIntBe(24)
  this.ofsDataBlock = ofsDataBlockExpr
  alignToByte(this.io)

  ##[
  Reserved space for the resource's handle in memory.
  ]##
  let reservedHandleExpr = this.io.readU4be()
  this.reservedHandle = reservedHandleExpr

proc name(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_Name = 

  ##[
  The name (if any) of the resource described by this reference.

  ]##
  if this.nameInstFlag:
    return this.nameInst
  if this.ofsName != 65535:
    let io = ResourceFork(this.root).resourceMap.namesWithIo.io
    let pos = io.pos()
    io.seek(int(this.ofsName))
    let nameInstExpr = ResourceFork_ResourceMap_Name.read(io, this.root, this)
    this.nameInst = nameInstExpr
    io.seek(pos)
  this.nameInstFlag = true
  return this.nameInst

proc dataBlock(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_DataBlock = 

  ##[
  The data block containing the data for the resource described by this reference.

  ]##
  if this.dataBlockInstFlag:
    return this.dataBlockInst
  let io = ResourceFork(this.root).dataBlocksWithIo.io
  let pos = io.pos()
  io.seek(int(this.ofsDataBlock))
  let dataBlockInstExpr = ResourceFork_DataBlock.read(io, this.root, this)
  this.dataBlockInst = dataBlockInstExpr
  io.seek(pos)
  this.dataBlockInstFlag = true
  return this.dataBlockInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference =
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference.read(newKaitaiFileStream(filename), nil, nil)


##[
A resource's attributes,
as stored in a resource reference.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Indicates that this resource reference is a system reference rather than a regular local reference.
This attribute is nearly undocumented.
For all practical purposes,
it should be considered reserved and should always be zero.

This attribute was last documented in the Promotional Edition of Inside Macintosh,
in the Resource Manager chapter,
on pages 37-41,
in a "System References" section that calls itself "of historical interest only".
The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
<CarbonCore/Resources.h> contains a `resSysRefBit` constant,
but no corresponding `resSysRef` constant like for all other resource attributes.

According to the Inside Macintosh Promotional Edition,
a system reference was effectively an alias pointing to a resource stored in the system file,
possibly with a different ID and name (but not type) than the system reference.
If this attribute is set,
`ofs_data_block` is ignored and should be zero,
and `reserved_handle` contains
(in its high and low two bytes, respectively)
the ID and name offset of the real system resource that this system reference points to.

TODO Do any publicly available Mac OS versions support system references,
and do any real files/applications use them?
So far the answer seems to be no,
but I would like to be proven wrong!

  ]##
  let systemReferenceExpr = this.io.readBitsIntBe(1) != 0
  this.systemReference = systemReferenceExpr

  ##[
  Indicates that this resource should be loaded into the system heap if possible,
rather than the application heap.

This attribute is only meant to be used by Mac OS itself,
for System and Finder resources,
and not by normal applications.

This attribute may be set both in memory and on disk,
but it only has any meaning while the resource file is loaded into memory.

  ]##
  let loadIntoSystemHeapExpr = this.io.readBitsIntBe(1) != 0
  this.loadIntoSystemHeap = loadIntoSystemHeapExpr

  ##[
  Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
This allows the resource data to be purged from memory if space is needed on the heap.
Purged resources can later be reloaded from disk if their data is needed again.

If the `locked` attribute is set,
this attribute has no effect
(i. e. locked resources are never purgeable).

This attribute may be set both in memory and on disk,
but it only has any meaning while the resource file is loaded into memory.

  ]##
  let purgeableExpr = this.io.readBitsIntBe(1) != 0
  this.purgeable = purgeableExpr

  ##[
  Indicates that this resource's data should be locked to the Mac OS Memory Manager.
This prevents the resource data from being moved when the heap is compacted.

This attribute may be set both in memory and on disk,
but it only has any meaning while the resource file is loaded into memory.

  ]##
  let lockedExpr = this.io.readBitsIntBe(1) != 0
  this.locked = lockedExpr

  ##[
  Indicates that this resource should be protected (i. e. unmodifiable) in memory.
This prevents the application from using the Resource Manager to change the resource's data or metadata,
or delete it.
The only exception are the resource's attributes,
which can always be changed,
even for protected resources.
This allows protected resources to be unprotected again by the application.

This attribute may be set both in memory and on disk,
but it only has any meaning while the resource file is loaded into memory.

  ]##
  let protectedExpr = this.io.readBitsIntBe(1) != 0
  this.protected = protectedExpr

  ##[
  Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.

This attribute may be set both in memory and on disk,
but it only has any meaning when the resource file is first opened.

  ]##
  let preloadExpr = this.io.readBitsIntBe(1) != 0
  this.preload = preloadExpr

  ##[
  Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
This attribute is only meant to be set in memory;
it is cleared when the resource file is written to disk.

This attribute is used internally by the Resource Manager and should not be set manually by the application.

  ]##
  let needsWriteExpr = this.io.readBitsIntBe(1) != 0
  this.needsWrite = needsWriteExpr

  ##[
  Indicates that this resource's data is compressed.
Compressed resource data is decompressed transparently by the Resource Manager when reading.

For a detailed description of the structure of compressed resources as they are stored in the file,
see the compressed_resource.ksy spec.

  ]##
  let compressedExpr = this.io.readBitsIntBe(1) != 0
  this.compressed = compressedExpr

proc asInt(this: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes): uint8 = 

  ##[
  The attributes as a packed integer,
as they are stored in the file.

  ]##
  if this.asIntInstFlag:
    return this.asIntInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let asIntInstExpr = this.io.readU1()
  this.asIntInst = asIntInstExpr
  this.io.seek(pos)
  this.asIntInstFlag = true
  return this.asIntInst

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes], filename: string): ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes =
  ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes.read(newKaitaiFileStream(filename), nil, nil)


##[
A resource name,
as stored in the resource name storage area in the resource map.

The resource names are not required to appear in any particular order.
There may be unused space between and around resource names,
but in practice they are often contiguous.

]##
proc read*(_: typedesc[ResourceFork_ResourceMap_Name], io: KaitaiStream, root: KaitaiStruct, parent: ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference): ResourceFork_ResourceMap_Name =
  template this: untyped = result
  this = new(ResourceFork_ResourceMap_Name)
  let root = if root == nil: cast[ResourceFork](this) else: cast[ResourceFork](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The length of the resource name, in bytes.

  ]##
  let lenValueExpr = this.io.readU1()
  this.lenValue = lenValueExpr

  ##[
  The resource name.

This field is exposed as a byte array,
because there is no universal encoding for resource names.
Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
including resource names,
use the system encoding,
which varies depending on the system language.
This means that resource names can use different encodings depending on what system language they were created with.

Many resource names are plain ASCII,
meaning that the encoding often does not matter
(because all Mac OS encodings are ASCII-compatible).
For non-ASCII resource names,
the most common encoding is perhaps MacRoman
(used for English and other Western languages),
but other encodings are also sometimes used,
especially for software in non-Western languages.

There is no requirement that all names in a single resource file use the same encoding.
For example,
localized software may have some (but not all) of its resource names translated.
For non-Western languages,
this can lead to some resource names using MacRoman,
and others using a different encoding.

  ]##
  let valueExpr = this.io.readBytes(int(this.lenValue))
  this.value = valueExpr

proc fromFile*(_: typedesc[ResourceFork_ResourceMap_Name], filename: string): ResourceFork_ResourceMap_Name =
  ResourceFork_ResourceMap_Name.read(newKaitaiFileStream(filename), nil, nil)

