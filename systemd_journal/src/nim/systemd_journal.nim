import kaitai_struct_nim_runtime
import options

type
  SystemdJournal* = ref object of KaitaiStruct
    `header`*: SystemdJournal_Header
    `objects`*: seq[SystemdJournal_JournalObject]
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
    `dataHashTableInst`: seq[byte]
    `dataHashTableInstFlag`: bool
    `fieldHashTableInst`: seq[byte]
    `fieldHashTableInstFlag`: bool
    `lenHeaderInst`: uint64
    `lenHeaderInstFlag`: bool
  SystemdJournal_State* = enum
    offline = 0
    online = 1
    archived = 2
  SystemdJournal_DataObject* = ref object of KaitaiStruct
    `hash`*: uint64
    `ofsNextHash`*: uint64
    `ofsHeadField`*: uint64
    `ofsEntry`*: uint64
    `ofsEntryArray`*: uint64
    `numEntries`*: uint64
    `payload`*: seq[byte]
    `parent`*: SystemdJournal_JournalObject
    `entryInst`: SystemdJournal_JournalObject
    `entryInstFlag`: bool
    `entryArrayInst`: SystemdJournal_JournalObject
    `entryArrayInstFlag`: bool
    `headFieldInst`: SystemdJournal_JournalObject
    `headFieldInstFlag`: bool
    `nextHashInst`: SystemdJournal_JournalObject
    `nextHashInstFlag`: bool
  SystemdJournal_Header* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `compatibleFlags`*: uint32
    `incompatibleFlags`*: uint32
    `state`*: SystemdJournal_State
    `reserved`*: seq[byte]
    `fileId`*: seq[byte]
    `machineId`*: seq[byte]
    `bootId`*: seq[byte]
    `seqnumId`*: seq[byte]
    `lenHeader`*: uint64
    `lenArena`*: uint64
    `ofsDataHashTable`*: uint64
    `lenDataHashTable`*: uint64
    `ofsFieldHashTable`*: uint64
    `lenFieldHashTable`*: uint64
    `ofsTailObject`*: uint64
    `numObjects`*: uint64
    `numEntries`*: uint64
    `tailEntrySeqnum`*: uint64
    `headEntrySeqnum`*: uint64
    `ofsEntryArray`*: uint64
    `headEntryRealtime`*: uint64
    `tailEntryRealtime`*: uint64
    `tailEntryMonotonic`*: uint64
    `numData`*: uint64
    `numFields`*: uint64
    `numTags`*: uint64
    `numEntryArrays`*: uint64
    `parent`*: SystemdJournal
  SystemdJournal_JournalObject* = ref object of KaitaiStruct
    `padding`*: seq[byte]
    `objectType`*: SystemdJournal_JournalObject_ObjectTypes
    `flags`*: uint8
    `reserved`*: seq[byte]
    `lenObject`*: uint64
    `payload`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawPayload`*: seq[byte]
  SystemdJournal_JournalObject_ObjectTypes* = enum
    unused = 0
    data = 1
    field = 2
    entry = 3
    data_hash_table = 4
    field_hash_table = 5
    entry_array = 6
    tag = 7

proc read*(_: typedesc[SystemdJournal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SystemdJournal
proc read*(_: typedesc[SystemdJournal_DataObject], io: KaitaiStream, root: KaitaiStruct, parent: SystemdJournal_JournalObject): SystemdJournal_DataObject
proc read*(_: typedesc[SystemdJournal_Header], io: KaitaiStream, root: KaitaiStruct, parent: SystemdJournal): SystemdJournal_Header
proc read*(_: typedesc[SystemdJournal_JournalObject], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SystemdJournal_JournalObject

proc dataHashTable*(this: SystemdJournal): seq[byte]
proc fieldHashTable*(this: SystemdJournal): seq[byte]
proc lenHeader*(this: SystemdJournal): uint64
proc entry*(this: SystemdJournal_DataObject): SystemdJournal_JournalObject
proc entryArray*(this: SystemdJournal_DataObject): SystemdJournal_JournalObject
proc headField*(this: SystemdJournal_DataObject): SystemdJournal_JournalObject
proc nextHash*(this: SystemdJournal_DataObject): SystemdJournal_JournalObject


##[
systemd, a popular user-space system/service management suite on Linux,
offers logging functionality, storing incoming logs in a binary journal
format.

On live Linux system running systemd, these journals are typically located at:

* /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
* /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)

@see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/">Source</a>
]##
proc read*(_: typedesc[SystemdJournal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SystemdJournal =
  template this: untyped = result
  this = new(SystemdJournal)
  let root = if root == nil: cast[SystemdJournal](this) else: cast[SystemdJournal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHeaderExpr = this.io.readBytes(int(this.lenHeader))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = SystemdJournal_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numObjects):
    let it = SystemdJournal_JournalObject.read(this.io, this.root, this)
    this.objects.add(it)

proc dataHashTable(this: SystemdJournal): seq[byte] = 
  if this.dataHashTableInstFlag:
    return this.dataHashTableInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.ofsDataHashTable))
  let dataHashTableInstExpr = this.io.readBytes(int(this.header.lenDataHashTable))
  this.dataHashTableInst = dataHashTableInstExpr
  this.io.seek(pos)
  this.dataHashTableInstFlag = true
  return this.dataHashTableInst

proc fieldHashTable(this: SystemdJournal): seq[byte] = 
  if this.fieldHashTableInstFlag:
    return this.fieldHashTableInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.ofsFieldHashTable))
  let fieldHashTableInstExpr = this.io.readBytes(int(this.header.lenFieldHashTable))
  this.fieldHashTableInst = fieldHashTableInstExpr
  this.io.seek(pos)
  this.fieldHashTableInstFlag = true
  return this.fieldHashTableInst

proc lenHeader(this: SystemdJournal): uint64 = 

  ##[
  Header length is used to set substream size, as it thus required
prior to declaration of header.

  ]##
  if this.lenHeaderInstFlag:
    return this.lenHeaderInst
  let pos = this.io.pos()
  this.io.seek(int(88))
  let lenHeaderInstExpr = this.io.readU8le()
  this.lenHeaderInst = lenHeaderInstExpr
  this.io.seek(pos)
  this.lenHeaderInstFlag = true
  return this.lenHeaderInst

proc fromFile*(_: typedesc[SystemdJournal], filename: string): SystemdJournal =
  SystemdJournal.read(newKaitaiFileStream(filename), nil, nil)


##[
Data objects are designed to carry log payload, typically in
form of a "key=value" string in `payload` attribute.

@see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects">Source</a>
]##
proc read*(_: typedesc[SystemdJournal_DataObject], io: KaitaiStream, root: KaitaiStruct, parent: SystemdJournal_JournalObject): SystemdJournal_DataObject =
  template this: untyped = result
  this = new(SystemdJournal_DataObject)
  let root = if root == nil: cast[SystemdJournal](this) else: cast[SystemdJournal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hashExpr = this.io.readU8le()
  this.hash = hashExpr
  let ofsNextHashExpr = this.io.readU8le()
  this.ofsNextHash = ofsNextHashExpr
  let ofsHeadFieldExpr = this.io.readU8le()
  this.ofsHeadField = ofsHeadFieldExpr
  let ofsEntryExpr = this.io.readU8le()
  this.ofsEntry = ofsEntryExpr
  let ofsEntryArrayExpr = this.io.readU8le()
  this.ofsEntryArray = ofsEntryArrayExpr
  let numEntriesExpr = this.io.readU8le()
  this.numEntries = numEntriesExpr
  let payloadExpr = this.io.readBytesFull()
  this.payload = payloadExpr

proc entry(this: SystemdJournal_DataObject): SystemdJournal_JournalObject = 
  if this.entryInstFlag:
    return this.entryInst
  if this.ofsEntry != 0:
    let io = SystemdJournal(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsEntry))
    let entryInstExpr = SystemdJournal_JournalObject.read(io, this.root, this)
    this.entryInst = entryInstExpr
    io.seek(pos)
  this.entryInstFlag = true
  return this.entryInst

proc entryArray(this: SystemdJournal_DataObject): SystemdJournal_JournalObject = 
  if this.entryArrayInstFlag:
    return this.entryArrayInst
  if this.ofsEntryArray != 0:
    let io = SystemdJournal(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsEntryArray))
    let entryArrayInstExpr = SystemdJournal_JournalObject.read(io, this.root, this)
    this.entryArrayInst = entryArrayInstExpr
    io.seek(pos)
  this.entryArrayInstFlag = true
  return this.entryArrayInst

proc headField(this: SystemdJournal_DataObject): SystemdJournal_JournalObject = 
  if this.headFieldInstFlag:
    return this.headFieldInst
  if this.ofsHeadField != 0:
    let io = SystemdJournal(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsHeadField))
    let headFieldInstExpr = SystemdJournal_JournalObject.read(io, this.root, this)
    this.headFieldInst = headFieldInstExpr
    io.seek(pos)
  this.headFieldInstFlag = true
  return this.headFieldInst

proc nextHash(this: SystemdJournal_DataObject): SystemdJournal_JournalObject = 
  if this.nextHashInstFlag:
    return this.nextHashInst
  if this.ofsNextHash != 0:
    let io = SystemdJournal(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsNextHash))
    let nextHashInstExpr = SystemdJournal_JournalObject.read(io, this.root, this)
    this.nextHashInst = nextHashInstExpr
    io.seek(pos)
  this.nextHashInstFlag = true
  return this.nextHashInst

proc fromFile*(_: typedesc[SystemdJournal_DataObject], filename: string): SystemdJournal_DataObject =
  SystemdJournal_DataObject.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SystemdJournal_Header], io: KaitaiStream, root: KaitaiStruct, parent: SystemdJournal): SystemdJournal_Header =
  template this: untyped = result
  this = new(SystemdJournal_Header)
  let root = if root == nil: cast[SystemdJournal](this) else: cast[SystemdJournal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(8))
  this.signature = signatureExpr
  let compatibleFlagsExpr = this.io.readU4le()
  this.compatibleFlags = compatibleFlagsExpr
  let incompatibleFlagsExpr = this.io.readU4le()
  this.incompatibleFlags = incompatibleFlagsExpr
  let stateExpr = SystemdJournal_State(this.io.readU1())
  this.state = stateExpr
  let reservedExpr = this.io.readBytes(int(7))
  this.reserved = reservedExpr
  let fileIdExpr = this.io.readBytes(int(16))
  this.fileId = fileIdExpr
  let machineIdExpr = this.io.readBytes(int(16))
  this.machineId = machineIdExpr
  let bootIdExpr = this.io.readBytes(int(16))
  this.bootId = bootIdExpr
  let seqnumIdExpr = this.io.readBytes(int(16))
  this.seqnumId = seqnumIdExpr
  let lenHeaderExpr = this.io.readU8le()
  this.lenHeader = lenHeaderExpr
  let lenArenaExpr = this.io.readU8le()
  this.lenArena = lenArenaExpr
  let ofsDataHashTableExpr = this.io.readU8le()
  this.ofsDataHashTable = ofsDataHashTableExpr
  let lenDataHashTableExpr = this.io.readU8le()
  this.lenDataHashTable = lenDataHashTableExpr
  let ofsFieldHashTableExpr = this.io.readU8le()
  this.ofsFieldHashTable = ofsFieldHashTableExpr
  let lenFieldHashTableExpr = this.io.readU8le()
  this.lenFieldHashTable = lenFieldHashTableExpr
  let ofsTailObjectExpr = this.io.readU8le()
  this.ofsTailObject = ofsTailObjectExpr
  let numObjectsExpr = this.io.readU8le()
  this.numObjects = numObjectsExpr
  let numEntriesExpr = this.io.readU8le()
  this.numEntries = numEntriesExpr
  let tailEntrySeqnumExpr = this.io.readU8le()
  this.tailEntrySeqnum = tailEntrySeqnumExpr
  let headEntrySeqnumExpr = this.io.readU8le()
  this.headEntrySeqnum = headEntrySeqnumExpr
  let ofsEntryArrayExpr = this.io.readU8le()
  this.ofsEntryArray = ofsEntryArrayExpr
  let headEntryRealtimeExpr = this.io.readU8le()
  this.headEntryRealtime = headEntryRealtimeExpr
  let tailEntryRealtimeExpr = this.io.readU8le()
  this.tailEntryRealtime = tailEntryRealtimeExpr
  let tailEntryMonotonicExpr = this.io.readU8le()
  this.tailEntryMonotonic = tailEntryMonotonicExpr
  if not(this.io.isEof):
    let numDataExpr = this.io.readU8le()
    this.numData = numDataExpr
  if not(this.io.isEof):
    let numFieldsExpr = this.io.readU8le()
    this.numFields = numFieldsExpr
  if not(this.io.isEof):
    let numTagsExpr = this.io.readU8le()
    this.numTags = numTagsExpr
  if not(this.io.isEof):
    let numEntryArraysExpr = this.io.readU8le()
    this.numEntryArrays = numEntryArraysExpr

proc fromFile*(_: typedesc[SystemdJournal_Header], filename: string): SystemdJournal_Header =
  SystemdJournal_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects">Source</a>
]##
proc read*(_: typedesc[SystemdJournal_JournalObject], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SystemdJournal_JournalObject =
  template this: untyped = result
  this = new(SystemdJournal_JournalObject)
  let root = if root == nil: cast[SystemdJournal](this) else: cast[SystemdJournal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paddingExpr = this.io.readBytes(int((8 - this.io.pos) %%% 8))
  this.padding = paddingExpr
  let objectTypeExpr = SystemdJournal_JournalObject_ObjectTypes(this.io.readU1())
  this.objectType = objectTypeExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let reservedExpr = this.io.readBytes(int(6))
  this.reserved = reservedExpr
  let lenObjectExpr = this.io.readU8le()
  this.lenObject = lenObjectExpr
  block:
    let on = this.objectType
    if on == systemd_journal.data:
      let rawPayloadExpr = this.io.readBytes(int(this.lenObject - 16))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = SystemdJournal_DataObject.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    else:
      let payloadExpr = this.io.readBytes(int(this.lenObject - 16))
      this.payload = payloadExpr

proc fromFile*(_: typedesc[SystemdJournal_JournalObject], filename: string): SystemdJournal_JournalObject =
  SystemdJournal_JournalObject.read(newKaitaiFileStream(filename), nil, nil)

