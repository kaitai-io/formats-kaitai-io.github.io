import kaitai_struct_nim_runtime
import options

type
  SomeIpSdEntries* = ref object of KaitaiStruct
    `entries`*: seq[SomeIpSdEntries_SdEntry]
    `parent`*: KaitaiStruct
  SomeIpSdEntries_SdEntry* = ref object of KaitaiStruct
    `header`*: SomeIpSdEntries_SdEntry_SdEntryHeader
    `content`*: KaitaiStruct
    `parent`*: SomeIpSdEntries
  SomeIpSdEntries_SdEntry_EntryTypes* = enum
    find = 0
    offer = 1
    subscribe = 6
    subscribe_ack = 7
  SomeIpSdEntries_SdEntry_SdEntryHeader* = ref object of KaitaiStruct
    `type`*: SomeIpSdEntries_SdEntry_EntryTypes
    `indexFirstOptions`*: uint8
    `indexSecondOptions`*: uint8
    `numberFirstOptions`*: uint64
    `numberSecondOptions`*: uint64
    `serviceId`*: uint16
    `instanceId`*: uint16
    `majorVersion`*: uint8
    `ttl`*: uint64
    `parent`*: SomeIpSdEntries_SdEntry
  SomeIpSdEntries_SdEntry_SdServiceEntry* = ref object of KaitaiStruct
    `minorVersion`*: uint32
    `parent`*: SomeIpSdEntries_SdEntry
  SomeIpSdEntries_SdEntry_SdEventgroupEntry* = ref object of KaitaiStruct
    `reserved`*: uint8
    `initialDataRequested`*: bool
    `reserved2`*: uint64
    `counter`*: uint64
    `eventGroupId`*: uint16
    `parent`*: SomeIpSdEntries_SdEntry

proc read*(_: typedesc[SomeIpSdEntries], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSdEntries
proc read*(_: typedesc[SomeIpSdEntries_SdEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries): SomeIpSdEntries_SdEntry
proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdEntryHeader], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdEntryHeader
proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdServiceEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdServiceEntry
proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdEventgroupEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdEventgroupEntry



##[
The entries are used to synchronize the state of services instances and the
Publish/-Subscribe handling.

@see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
-">section 4.1.2.3  Entry Format</a>
]##
proc read*(_: typedesc[SomeIpSdEntries], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSdEntries =
  template this: untyped = result
  this = new(SomeIpSdEntries)
  let root = if root == nil: cast[SomeIpSdEntries](this) else: cast[SomeIpSdEntries](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SomeIpSdEntries_SdEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[SomeIpSdEntries], filename: string): SomeIpSdEntries =
  SomeIpSdEntries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdEntries_SdEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries): SomeIpSdEntries_SdEntry =
  template this: untyped = result
  this = new(SomeIpSdEntries_SdEntry)
  let root = if root == nil: cast[SomeIpSdEntries](this) else: cast[SomeIpSdEntries](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = SomeIpSdEntries_SdEntry_SdEntryHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    let on = this.header.type
    if on == some_ip_sd_entries.find:
      let contentExpr = SomeIpSdEntries_SdEntry_SdServiceEntry.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_entries.offer:
      let contentExpr = SomeIpSdEntries_SdEntry_SdServiceEntry.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_entries.subscribe:
      let contentExpr = SomeIpSdEntries_SdEntry_SdEventgroupEntry.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_entries.subscribe_ack:
      let contentExpr = SomeIpSdEntries_SdEntry_SdEventgroupEntry.read(this.io, this.root, this)
      this.content = contentExpr

proc fromFile*(_: typedesc[SomeIpSdEntries_SdEntry], filename: string): SomeIpSdEntries_SdEntry =
  SomeIpSdEntries_SdEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdEntryHeader], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdEntryHeader =
  template this: untyped = result
  this = new(SomeIpSdEntries_SdEntry_SdEntryHeader)
  let root = if root == nil: cast[SomeIpSdEntries](this) else: cast[SomeIpSdEntries](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = SomeIpSdEntries_SdEntry_EntryTypes(this.io.readU1())
  this.type = typeExpr
  let indexFirstOptionsExpr = this.io.readU1()
  this.indexFirstOptions = indexFirstOptionsExpr
  let indexSecondOptionsExpr = this.io.readU1()
  this.indexSecondOptions = indexSecondOptionsExpr
  let numberFirstOptionsExpr = this.io.readBitsIntBe(4)
  this.numberFirstOptions = numberFirstOptionsExpr
  let numberSecondOptionsExpr = this.io.readBitsIntBe(4)
  this.numberSecondOptions = numberSecondOptionsExpr
  alignToByte(this.io)
  let serviceIdExpr = this.io.readU2be()
  this.serviceId = serviceIdExpr
  let instanceIdExpr = this.io.readU2be()
  this.instanceId = instanceIdExpr
  let majorVersionExpr = this.io.readU1()
  this.majorVersion = majorVersionExpr
  let ttlExpr = this.io.readBitsIntBe(24)
  this.ttl = ttlExpr

proc fromFile*(_: typedesc[SomeIpSdEntries_SdEntry_SdEntryHeader], filename: string): SomeIpSdEntries_SdEntry_SdEntryHeader =
  SomeIpSdEntries_SdEntry_SdEntryHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdServiceEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdServiceEntry =
  template this: untyped = result
  this = new(SomeIpSdEntries_SdEntry_SdServiceEntry)
  let root = if root == nil: cast[SomeIpSdEntries](this) else: cast[SomeIpSdEntries](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minorVersionExpr = this.io.readU4be()
  this.minorVersion = minorVersionExpr

proc fromFile*(_: typedesc[SomeIpSdEntries_SdEntry_SdServiceEntry], filename: string): SomeIpSdEntries_SdEntry_SdServiceEntry =
  SomeIpSdEntries_SdEntry_SdServiceEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdEntries_SdEntry_SdEventgroupEntry], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdEntries_SdEntry): SomeIpSdEntries_SdEntry_SdEventgroupEntry =
  template this: untyped = result
  this = new(SomeIpSdEntries_SdEntry_SdEventgroupEntry)
  let root = if root == nil: cast[SomeIpSdEntries](this) else: cast[SomeIpSdEntries](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let initialDataRequestedExpr = this.io.readBitsIntBe(1) != 0
  this.initialDataRequested = initialDataRequestedExpr
  let reserved2Expr = this.io.readBitsIntBe(3)
  this.reserved2 = reserved2Expr
  let counterExpr = this.io.readBitsIntBe(4)
  this.counter = counterExpr
  alignToByte(this.io)
  let eventGroupIdExpr = this.io.readU2be()
  this.eventGroupId = eventGroupIdExpr

proc fromFile*(_: typedesc[SomeIpSdEntries_SdEntry_SdEventgroupEntry], filename: string): SomeIpSdEntries_SdEntry_SdEventgroupEntry =
  SomeIpSdEntries_SdEntry_SdEventgroupEntry.read(newKaitaiFileStream(filename), nil, nil)

