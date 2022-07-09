import kaitai_struct_nim_runtime
import options

type
  Mcap* = ref object of KaitaiStruct
    `headerMagic`*: Mcap_Magic
    `records`*: seq[Mcap_Record]
    `footerMagic`*: Mcap_Magic
    `parent`*: KaitaiStruct
    `rawFooterInst`*: seq[byte]
    `footerInst`: Mcap_Record
    `footerInstFlag`: bool
    `ofsFooterInst`: int
    `ofsFooterInstFlag`: bool
  Mcap_Opcode* = enum
    header = 1
    footer = 2
    schema = 3
    channel = 4
    message = 5
    chunk = 6
    message_index = 7
    chunk_index = 8
    attachment = 9
    attachment_index = 10
    statistics = 11
    metadata = 12
    metadata_index = 13
    summary_offset = 14
    data_end = 15
  Mcap_PrefixedStr* = ref object of KaitaiStruct
    `lenStr`*: uint32
    `str`*: string
    `parent`*: KaitaiStruct
  Mcap_Chunk* = ref object of KaitaiStruct
    `messageStartTime`*: uint64
    `messageEndTime`*: uint64
    `uncompressedSize`*: uint64
    `uncompressedCrc32`*: uint32
    `compression`*: Mcap_PrefixedStr
    `lenRecords`*: uint64
    `records`*: KaitaiStruct
    `parent`*: Mcap_Record
    `rawRecords`*: seq[byte]
  Mcap_DataEnd* = ref object of KaitaiStruct
    `dataSectionCrc32`*: uint32
    `parent`*: Mcap_Record
  Mcap_Channel* = ref object of KaitaiStruct
    `id`*: uint16
    `schemaId`*: uint16
    `topic`*: Mcap_PrefixedStr
    `messageEncoding`*: Mcap_PrefixedStr
    `metadata`*: Mcap_MapStrStr
    `parent`*: Mcap_Record
  Mcap_MessageIndex* = ref object of KaitaiStruct
    `channelId`*: uint16
    `lenRecords`*: uint32
    `records`*: Mcap_MessageIndex_MessageIndexEntries
    `parent`*: Mcap_Record
    `rawRecords`*: seq[byte]
  Mcap_MessageIndex_MessageIndexEntry* = ref object of KaitaiStruct
    `logTime`*: uint64
    `offset`*: uint64
    `parent`*: Mcap_MessageIndex_MessageIndexEntries
  Mcap_MessageIndex_MessageIndexEntries* = ref object of KaitaiStruct
    `entries`*: seq[Mcap_MessageIndex_MessageIndexEntry]
    `parent`*: Mcap_MessageIndex
  Mcap_Statistics* = ref object of KaitaiStruct
    `messageCount`*: uint64
    `schemaCount`*: uint16
    `channelCount`*: uint32
    `attachmentCount`*: uint32
    `metadataCount`*: uint32
    `chunkCount`*: uint32
    `messageStartTime`*: uint64
    `messageEndTime`*: uint64
    `lenChannelMessageCounts`*: uint32
    `channelMessageCounts`*: Mcap_Statistics_ChannelMessageCounts
    `parent`*: Mcap_Record
    `rawChannelMessageCounts`*: seq[byte]
  Mcap_Statistics_ChannelMessageCounts* = ref object of KaitaiStruct
    `entries`*: seq[Mcap_Statistics_ChannelMessageCount]
    `parent`*: Mcap_Statistics
  Mcap_Statistics_ChannelMessageCount* = ref object of KaitaiStruct
    `channelId`*: uint16
    `messageCount`*: uint64
    `parent`*: Mcap_Statistics_ChannelMessageCounts
  Mcap_AttachmentIndex* = ref object of KaitaiStruct
    `ofsAttachment`*: uint64
    `lenAttachment`*: uint64
    `logTime`*: uint64
    `createTime`*: uint64
    `dataSize`*: uint64
    `name`*: Mcap_PrefixedStr
    `contentType`*: Mcap_PrefixedStr
    `parent`*: Mcap_Record
    `rawAttachmentInst`*: seq[byte]
    `attachmentInst`: Mcap_Record
    `attachmentInstFlag`: bool
  Mcap_Schema* = ref object of KaitaiStruct
    `id`*: uint16
    `name`*: Mcap_PrefixedStr
    `encoding`*: Mcap_PrefixedStr
    `lenData`*: uint32
    `data`*: seq[byte]
    `parent`*: Mcap_Record
  Mcap_MapStrStr* = ref object of KaitaiStruct
    `lenEntries`*: uint32
    `entries`*: Mcap_MapStrStr_Entries
    `parent`*: KaitaiStruct
    `rawEntries`*: seq[byte]
  Mcap_MapStrStr_Entries* = ref object of KaitaiStruct
    `entries`*: seq[Mcap_TupleStrStr]
    `parent`*: Mcap_MapStrStr
  Mcap_SummaryOffset* = ref object of KaitaiStruct
    `groupOpcode`*: Mcap_Opcode
    `ofsGroup`*: uint64
    `lenGroup`*: uint64
    `parent`*: Mcap_Record
    `rawGroupInst`*: seq[byte]
    `groupInst`: Mcap_Records
    `groupInstFlag`: bool
  Mcap_Attachment* = ref object of KaitaiStruct
    `logTime`*: uint64
    `createTime`*: uint64
    `name`*: Mcap_PrefixedStr
    `contentType`*: Mcap_PrefixedStr
    `lenData`*: uint64
    `data`*: seq[byte]
    `invokeCrc32InputEnd`*: seq[byte]
    `crc32`*: uint32
    `parent`*: Mcap_Record
    `crc32InputEndInst`: int
    `crc32InputEndInstFlag`: bool
    `crc32InputInst`: seq[byte]
    `crc32InputInstFlag`: bool
  Mcap_Metadata* = ref object of KaitaiStruct
    `name`*: Mcap_PrefixedStr
    `metadata`*: Mcap_MapStrStr
    `parent`*: Mcap_Record
  Mcap_Header* = ref object of KaitaiStruct
    `profile`*: Mcap_PrefixedStr
    `library`*: Mcap_PrefixedStr
    `parent`*: Mcap_Record
  Mcap_Message* = ref object of KaitaiStruct
    `channelId`*: uint16
    `sequence`*: uint32
    `logTime`*: uint64
    `publishTime`*: uint64
    `data`*: seq[byte]
    `parent`*: Mcap_Record
  Mcap_TupleStrStr* = ref object of KaitaiStruct
    `key`*: Mcap_PrefixedStr
    `value`*: Mcap_PrefixedStr
    `parent`*: Mcap_MapStrStr_Entries
  Mcap_MetadataIndex* = ref object of KaitaiStruct
    `ofsMetadata`*: uint64
    `lenMetadata`*: uint64
    `name`*: Mcap_PrefixedStr
    `parent`*: Mcap_Record
    `rawMetadataInst`*: seq[byte]
    `metadataInst`: Mcap_Record
    `metadataInstFlag`: bool
  Mcap_Magic* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `parent`*: Mcap
  Mcap_Records* = ref object of KaitaiStruct
    `records`*: seq[Mcap_Record]
    `parent`*: KaitaiStruct
  Mcap_Footer* = ref object of KaitaiStruct
    `ofsSummarySection`*: uint64
    `ofsSummaryOffsetSection`*: uint64
    `summaryCrc32`*: uint32
    `parent`*: Mcap_Record
    `rawSummarySectionInst`*: seq[byte]
    `rawSummaryOffsetSectionInst`*: seq[byte]
    `summarySectionInst`: Mcap_Records
    `summarySectionInstFlag`: bool
    `summaryOffsetSectionInst`: Mcap_Records
    `summaryOffsetSectionInstFlag`: bool
    `ofsSummaryCrc32InputInst`: int
    `ofsSummaryCrc32InputInstFlag`: bool
    `summaryCrc32InputInst`: seq[byte]
    `summaryCrc32InputInstFlag`: bool
  Mcap_Record* = ref object of KaitaiStruct
    `op`*: Mcap_Opcode
    `lenBody`*: uint64
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
  Mcap_ChunkIndex* = ref object of KaitaiStruct
    `messageStartTime`*: uint64
    `messageEndTime`*: uint64
    `ofsChunk`*: uint64
    `lenChunk`*: uint64
    `lenMessageIndexOffsets`*: uint32
    `messageIndexOffsets`*: Mcap_ChunkIndex_MessageIndexOffsets
    `messageIndexLength`*: uint64
    `compression`*: Mcap_PrefixedStr
    `compressedSize`*: uint64
    `uncompressedSize`*: uint64
    `parent`*: Mcap_Record
    `rawMessageIndexOffsets`*: seq[byte]
    `rawChunkInst`*: seq[byte]
    `chunkInst`: Mcap_Record
    `chunkInstFlag`: bool
  Mcap_ChunkIndex_MessageIndexOffset* = ref object of KaitaiStruct
    `channelId`*: uint16
    `offset`*: uint64
    `parent`*: Mcap_ChunkIndex_MessageIndexOffsets
  Mcap_ChunkIndex_MessageIndexOffsets* = ref object of KaitaiStruct
    `entries`*: seq[Mcap_ChunkIndex_MessageIndexOffset]
    `parent`*: Mcap_ChunkIndex

proc read*(_: typedesc[Mcap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap
proc read*(_: typedesc[Mcap_PrefixedStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_PrefixedStr
proc read*(_: typedesc[Mcap_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Chunk
proc read*(_: typedesc[Mcap_DataEnd], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_DataEnd
proc read*(_: typedesc[Mcap_Channel], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Channel
proc read*(_: typedesc[Mcap_MessageIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_MessageIndex
proc read*(_: typedesc[Mcap_MessageIndex_MessageIndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MessageIndex_MessageIndexEntries): Mcap_MessageIndex_MessageIndexEntry
proc read*(_: typedesc[Mcap_MessageIndex_MessageIndexEntries], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MessageIndex): Mcap_MessageIndex_MessageIndexEntries
proc read*(_: typedesc[Mcap_Statistics], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Statistics
proc read*(_: typedesc[Mcap_Statistics_ChannelMessageCounts], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Statistics): Mcap_Statistics_ChannelMessageCounts
proc read*(_: typedesc[Mcap_Statistics_ChannelMessageCount], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Statistics_ChannelMessageCounts): Mcap_Statistics_ChannelMessageCount
proc read*(_: typedesc[Mcap_AttachmentIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_AttachmentIndex
proc read*(_: typedesc[Mcap_Schema], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Schema
proc read*(_: typedesc[Mcap_MapStrStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_MapStrStr
proc read*(_: typedesc[Mcap_MapStrStr_Entries], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MapStrStr): Mcap_MapStrStr_Entries
proc read*(_: typedesc[Mcap_SummaryOffset], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_SummaryOffset
proc read*(_: typedesc[Mcap_Attachment], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Attachment
proc read*(_: typedesc[Mcap_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Metadata
proc read*(_: typedesc[Mcap_Header], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Header
proc read*(_: typedesc[Mcap_Message], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Message
proc read*(_: typedesc[Mcap_TupleStrStr], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MapStrStr_Entries): Mcap_TupleStrStr
proc read*(_: typedesc[Mcap_MetadataIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_MetadataIndex
proc read*(_: typedesc[Mcap_Magic], io: KaitaiStream, root: KaitaiStruct, parent: Mcap): Mcap_Magic
proc read*(_: typedesc[Mcap_Records], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_Records
proc read*(_: typedesc[Mcap_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Footer
proc read*(_: typedesc[Mcap_Record], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_Record
proc read*(_: typedesc[Mcap_ChunkIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_ChunkIndex
proc read*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffset], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_ChunkIndex_MessageIndexOffsets): Mcap_ChunkIndex_MessageIndexOffset
proc read*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffsets], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_ChunkIndex): Mcap_ChunkIndex_MessageIndexOffsets

proc footer*(this: Mcap): Mcap_Record
proc ofsFooter*(this: Mcap): int
proc attachment*(this: Mcap_AttachmentIndex): Mcap_Record
proc group*(this: Mcap_SummaryOffset): Mcap_Records
proc crc32InputEnd*(this: Mcap_Attachment): int
proc crc32Input*(this: Mcap_Attachment): seq[byte]
proc metadata*(this: Mcap_MetadataIndex): Mcap_Record
proc summarySection*(this: Mcap_Footer): Mcap_Records
proc summaryOffsetSection*(this: Mcap_Footer): Mcap_Records
proc ofsSummaryCrc32Input*(this: Mcap_Footer): int
proc summaryCrc32Input*(this: Mcap_Footer): seq[byte]
proc chunk*(this: Mcap_ChunkIndex): Mcap_Record


##[
MCAP is a modular container format and logging library for pub/sub messages with
arbitrary message serialization. It is primarily intended for use in robotics
applications, and works well under various workloads, resource constraints, and
durability requirements.

Time values (`log_time`, `publish_time`, `create_time`) are represented in
nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
etc.)

@see <a href="https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme">Source</a>
]##
proc read*(_: typedesc[Mcap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap =
  template this: untyped = result
  this = new(Mcap)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerMagicExpr = Mcap_Magic.read(this.io, this.root, this)
  this.headerMagic = headerMagicExpr
  block:
    var i: int
    while true:
      let it = Mcap_Record.read(this.io, this.root, this)
      this.records.add(it)
      if it.op == mcap.footer:
        break
      inc i
  let footerMagicExpr = Mcap_Magic.read(this.io, this.root, this)
  this.footerMagic = footerMagicExpr

proc footer(this: Mcap): Mcap_Record = 
  if this.footerInstFlag:
    return this.footerInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsFooter))
  let rawFooterInstExpr = this.io.readBytesFull()
  this.rawFooterInst = rawFooterInstExpr
  let rawFooterInstIo = newKaitaiStream(rawFooterInstExpr)
  let footerInstExpr = Mcap_Record.read(rawFooterInstIo, this.root, this)
  this.footerInst = footerInstExpr
  this.io.seek(pos)
  this.footerInstFlag = true
  return this.footerInst

proc ofsFooter(this: Mcap): int = 
  if this.ofsFooterInstFlag:
    return this.ofsFooterInst
  let ofsFooterInstExpr = int(((((this.io.size - 1) - 8) - 20) - 8))
  this.ofsFooterInst = ofsFooterInstExpr
  this.ofsFooterInstFlag = true
  return this.ofsFooterInst

proc fromFile*(_: typedesc[Mcap], filename: string): Mcap =
  Mcap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_PrefixedStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_PrefixedStr =
  template this: untyped = result
  this = new(Mcap_PrefixedStr)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenStrExpr = this.io.readU4le()
  this.lenStr = lenStrExpr
  let strExpr = encode(this.io.readBytes(int(this.lenStr)), "UTF-8")
  this.str = strExpr

proc fromFile*(_: typedesc[Mcap_PrefixedStr], filename: string): Mcap_PrefixedStr =
  Mcap_PrefixedStr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Chunk =
  template this: untyped = result
  this = new(Mcap_Chunk)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let messageStartTimeExpr = this.io.readU8le()
  this.messageStartTime = messageStartTimeExpr
  let messageEndTimeExpr = this.io.readU8le()
  this.messageEndTime = messageEndTimeExpr
  let uncompressedSizeExpr = this.io.readU8le()
  this.uncompressedSize = uncompressedSizeExpr

  ##[
  CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
CRC validation should not be performed.

  ]##
  let uncompressedCrc32Expr = this.io.readU4le()
  this.uncompressedCrc32 = uncompressedCrc32Expr
  let compressionExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.compression = compressionExpr
  let lenRecordsExpr = this.io.readU8le()
  this.lenRecords = lenRecordsExpr
  block:
    let on = this.compression.str
    if on == "":
      let rawRecordsExpr = this.io.readBytes(int(this.lenRecords))
      this.rawRecords = rawRecordsExpr
      let rawRecordsIo = newKaitaiStream(rawRecordsExpr)
      let recordsExpr = Mcap_Records.read(rawRecordsIo, this.root, this)
      this.records = recordsExpr
    else:
      let recordsExpr = this.io.readBytes(int(this.lenRecords))
      this.records = recordsExpr

proc fromFile*(_: typedesc[Mcap_Chunk], filename: string): Mcap_Chunk =
  Mcap_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_DataEnd], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_DataEnd =
  template this: untyped = result
  this = new(Mcap_DataEnd)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
available.

  ]##
  let dataSectionCrc32Expr = this.io.readU4le()
  this.dataSectionCrc32 = dataSectionCrc32Expr

proc fromFile*(_: typedesc[Mcap_DataEnd], filename: string): Mcap_DataEnd =
  Mcap_DataEnd.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Channel], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Channel =
  template this: untyped = result
  this = new(Mcap_Channel)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU2le()
  this.id = idExpr
  let schemaIdExpr = this.io.readU2le()
  this.schemaId = schemaIdExpr
  let topicExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.topic = topicExpr
  let messageEncodingExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.messageEncoding = messageEncodingExpr
  let metadataExpr = Mcap_MapStrStr.read(this.io, this.root, this)
  this.metadata = metadataExpr

proc fromFile*(_: typedesc[Mcap_Channel], filename: string): Mcap_Channel =
  Mcap_Channel.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MessageIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_MessageIndex =
  template this: untyped = result
  this = new(Mcap_MessageIndex)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let channelIdExpr = this.io.readU2le()
  this.channelId = channelIdExpr
  let lenRecordsExpr = this.io.readU4le()
  this.lenRecords = lenRecordsExpr
  let rawRecordsExpr = this.io.readBytes(int(this.lenRecords))
  this.rawRecords = rawRecordsExpr
  let rawRecordsIo = newKaitaiStream(rawRecordsExpr)
  let recordsExpr = Mcap_MessageIndex_MessageIndexEntries.read(rawRecordsIo, this.root, this)
  this.records = recordsExpr

proc fromFile*(_: typedesc[Mcap_MessageIndex], filename: string): Mcap_MessageIndex =
  Mcap_MessageIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MessageIndex_MessageIndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MessageIndex_MessageIndexEntries): Mcap_MessageIndex_MessageIndexEntry =
  template this: untyped = result
  this = new(Mcap_MessageIndex_MessageIndexEntry)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let logTimeExpr = this.io.readU8le()
  this.logTime = logTimeExpr
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

proc fromFile*(_: typedesc[Mcap_MessageIndex_MessageIndexEntry], filename: string): Mcap_MessageIndex_MessageIndexEntry =
  Mcap_MessageIndex_MessageIndexEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MessageIndex_MessageIndexEntries], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MessageIndex): Mcap_MessageIndex_MessageIndexEntries =
  template this: untyped = result
  this = new(Mcap_MessageIndex_MessageIndexEntries)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Mcap_MessageIndex_MessageIndexEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Mcap_MessageIndex_MessageIndexEntries], filename: string): Mcap_MessageIndex_MessageIndexEntries =
  Mcap_MessageIndex_MessageIndexEntries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Statistics], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Statistics =
  template this: untyped = result
  this = new(Mcap_Statistics)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let messageCountExpr = this.io.readU8le()
  this.messageCount = messageCountExpr
  let schemaCountExpr = this.io.readU2le()
  this.schemaCount = schemaCountExpr
  let channelCountExpr = this.io.readU4le()
  this.channelCount = channelCountExpr
  let attachmentCountExpr = this.io.readU4le()
  this.attachmentCount = attachmentCountExpr
  let metadataCountExpr = this.io.readU4le()
  this.metadataCount = metadataCountExpr
  let chunkCountExpr = this.io.readU4le()
  this.chunkCount = chunkCountExpr
  let messageStartTimeExpr = this.io.readU8le()
  this.messageStartTime = messageStartTimeExpr
  let messageEndTimeExpr = this.io.readU8le()
  this.messageEndTime = messageEndTimeExpr
  let lenChannelMessageCountsExpr = this.io.readU4le()
  this.lenChannelMessageCounts = lenChannelMessageCountsExpr
  let rawChannelMessageCountsExpr = this.io.readBytes(int(this.lenChannelMessageCounts))
  this.rawChannelMessageCounts = rawChannelMessageCountsExpr
  let rawChannelMessageCountsIo = newKaitaiStream(rawChannelMessageCountsExpr)
  let channelMessageCountsExpr = Mcap_Statistics_ChannelMessageCounts.read(rawChannelMessageCountsIo, this.root, this)
  this.channelMessageCounts = channelMessageCountsExpr

proc fromFile*(_: typedesc[Mcap_Statistics], filename: string): Mcap_Statistics =
  Mcap_Statistics.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Statistics_ChannelMessageCounts], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Statistics): Mcap_Statistics_ChannelMessageCounts =
  template this: untyped = result
  this = new(Mcap_Statistics_ChannelMessageCounts)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Mcap_Statistics_ChannelMessageCount.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Mcap_Statistics_ChannelMessageCounts], filename: string): Mcap_Statistics_ChannelMessageCounts =
  Mcap_Statistics_ChannelMessageCounts.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Statistics_ChannelMessageCount], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Statistics_ChannelMessageCounts): Mcap_Statistics_ChannelMessageCount =
  template this: untyped = result
  this = new(Mcap_Statistics_ChannelMessageCount)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let channelIdExpr = this.io.readU2le()
  this.channelId = channelIdExpr
  let messageCountExpr = this.io.readU8le()
  this.messageCount = messageCountExpr

proc fromFile*(_: typedesc[Mcap_Statistics_ChannelMessageCount], filename: string): Mcap_Statistics_ChannelMessageCount =
  Mcap_Statistics_ChannelMessageCount.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_AttachmentIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_AttachmentIndex =
  template this: untyped = result
  this = new(Mcap_AttachmentIndex)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsAttachmentExpr = this.io.readU8le()
  this.ofsAttachment = ofsAttachmentExpr
  let lenAttachmentExpr = this.io.readU8le()
  this.lenAttachment = lenAttachmentExpr
  let logTimeExpr = this.io.readU8le()
  this.logTime = logTimeExpr
  let createTimeExpr = this.io.readU8le()
  this.createTime = createTimeExpr
  let dataSizeExpr = this.io.readU8le()
  this.dataSize = dataSizeExpr
  let nameExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.name = nameExpr
  let contentTypeExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.contentType = contentTypeExpr

proc attachment(this: Mcap_AttachmentIndex): Mcap_Record = 
  if this.attachmentInstFlag:
    return this.attachmentInst
  let io = Mcap(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsAttachment))
  let rawAttachmentInstExpr = io.readBytes(int(this.lenAttachment))
  this.rawAttachmentInst = rawAttachmentInstExpr
  let rawAttachmentInstIo = newKaitaiStream(rawAttachmentInstExpr)
  let attachmentInstExpr = Mcap_Record.read(rawAttachmentInstIo, this.root, this)
  this.attachmentInst = attachmentInstExpr
  io.seek(pos)
  this.attachmentInstFlag = true
  return this.attachmentInst

proc fromFile*(_: typedesc[Mcap_AttachmentIndex], filename: string): Mcap_AttachmentIndex =
  Mcap_AttachmentIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Schema], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Schema =
  template this: untyped = result
  this = new(Mcap_Schema)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU2le()
  this.id = idExpr
  let nameExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.name = nameExpr
  let encodingExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.encoding = encodingExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr

proc fromFile*(_: typedesc[Mcap_Schema], filename: string): Mcap_Schema =
  Mcap_Schema.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MapStrStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_MapStrStr =
  template this: untyped = result
  this = new(Mcap_MapStrStr)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenEntriesExpr = this.io.readU4le()
  this.lenEntries = lenEntriesExpr
  let rawEntriesExpr = this.io.readBytes(int(this.lenEntries))
  this.rawEntries = rawEntriesExpr
  let rawEntriesIo = newKaitaiStream(rawEntriesExpr)
  let entriesExpr = Mcap_MapStrStr_Entries.read(rawEntriesIo, this.root, this)
  this.entries = entriesExpr

proc fromFile*(_: typedesc[Mcap_MapStrStr], filename: string): Mcap_MapStrStr =
  Mcap_MapStrStr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MapStrStr_Entries], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MapStrStr): Mcap_MapStrStr_Entries =
  template this: untyped = result
  this = new(Mcap_MapStrStr_Entries)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Mcap_TupleStrStr.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Mcap_MapStrStr_Entries], filename: string): Mcap_MapStrStr_Entries =
  Mcap_MapStrStr_Entries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_SummaryOffset], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_SummaryOffset =
  template this: untyped = result
  this = new(Mcap_SummaryOffset)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let groupOpcodeExpr = Mcap_Opcode(this.io.readU1())
  this.groupOpcode = groupOpcodeExpr
  let ofsGroupExpr = this.io.readU8le()
  this.ofsGroup = ofsGroupExpr
  let lenGroupExpr = this.io.readU8le()
  this.lenGroup = lenGroupExpr

proc group(this: Mcap_SummaryOffset): Mcap_Records = 
  if this.groupInstFlag:
    return this.groupInst
  let io = Mcap(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsGroup))
  let rawGroupInstExpr = io.readBytes(int(this.lenGroup))
  this.rawGroupInst = rawGroupInstExpr
  let rawGroupInstIo = newKaitaiStream(rawGroupInstExpr)
  let groupInstExpr = Mcap_Records.read(rawGroupInstIo, this.root, this)
  this.groupInst = groupInstExpr
  io.seek(pos)
  this.groupInstFlag = true
  return this.groupInst

proc fromFile*(_: typedesc[Mcap_SummaryOffset], filename: string): Mcap_SummaryOffset =
  Mcap_SummaryOffset.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Attachment], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Attachment =
  template this: untyped = result
  this = new(Mcap_Attachment)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let logTimeExpr = this.io.readU8le()
  this.logTime = logTimeExpr
  let createTimeExpr = this.io.readU8le()
  this.createTime = createTimeExpr
  let nameExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.name = nameExpr
  let contentTypeExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.contentType = contentTypeExpr
  let lenDataExpr = this.io.readU8le()
  this.lenData = lenDataExpr
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr
  if this.crc32InputEnd >= 0:
    let invokeCrc32InputEndExpr = this.io.readBytes(int(0))
    this.invokeCrc32InputEnd = invokeCrc32InputEndExpr

  ##[
  CRC-32 checksum of preceding fields in the record. A value of zero indicates that
CRC validation should not be performed.

  ]##
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr

proc crc32InputEnd(this: Mcap_Attachment): int = 
  if this.crc32InputEndInstFlag:
    return this.crc32InputEndInst
  let crc32InputEndInstExpr = int(this.io.pos)
  this.crc32InputEndInst = crc32InputEndInstExpr
  this.crc32InputEndInstFlag = true
  return this.crc32InputEndInst

proc crc32Input(this: Mcap_Attachment): seq[byte] = 
  if this.crc32InputInstFlag:
    return this.crc32InputInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let crc32InputInstExpr = this.io.readBytes(int(this.crc32InputEnd))
  this.crc32InputInst = crc32InputInstExpr
  this.io.seek(pos)
  this.crc32InputInstFlag = true
  return this.crc32InputInst

proc fromFile*(_: typedesc[Mcap_Attachment], filename: string): Mcap_Attachment =
  Mcap_Attachment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Metadata =
  template this: untyped = result
  this = new(Mcap_Metadata)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.name = nameExpr
  let metadataExpr = Mcap_MapStrStr.read(this.io, this.root, this)
  this.metadata = metadataExpr

proc fromFile*(_: typedesc[Mcap_Metadata], filename: string): Mcap_Metadata =
  Mcap_Metadata.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Header], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Header =
  template this: untyped = result
  this = new(Mcap_Header)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let profileExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.profile = profileExpr
  let libraryExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.library = libraryExpr

proc fromFile*(_: typedesc[Mcap_Header], filename: string): Mcap_Header =
  Mcap_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Message], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Message =
  template this: untyped = result
  this = new(Mcap_Message)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let channelIdExpr = this.io.readU2le()
  this.channelId = channelIdExpr
  let sequenceExpr = this.io.readU4le()
  this.sequence = sequenceExpr
  let logTimeExpr = this.io.readU8le()
  this.logTime = logTimeExpr
  let publishTimeExpr = this.io.readU8le()
  this.publishTime = publishTimeExpr
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Mcap_Message], filename: string): Mcap_Message =
  Mcap_Message.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_TupleStrStr], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_MapStrStr_Entries): Mcap_TupleStrStr =
  template this: untyped = result
  this = new(Mcap_TupleStrStr)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.key = keyExpr
  let valueExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[Mcap_TupleStrStr], filename: string): Mcap_TupleStrStr =
  Mcap_TupleStrStr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_MetadataIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_MetadataIndex =
  template this: untyped = result
  this = new(Mcap_MetadataIndex)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsMetadataExpr = this.io.readU8le()
  this.ofsMetadata = ofsMetadataExpr
  let lenMetadataExpr = this.io.readU8le()
  this.lenMetadata = lenMetadataExpr
  let nameExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.name = nameExpr

proc metadata(this: Mcap_MetadataIndex): Mcap_Record = 
  if this.metadataInstFlag:
    return this.metadataInst
  let io = Mcap(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsMetadata))
  let rawMetadataInstExpr = io.readBytes(int(this.lenMetadata))
  this.rawMetadataInst = rawMetadataInstExpr
  let rawMetadataInstIo = newKaitaiStream(rawMetadataInstExpr)
  let metadataInstExpr = Mcap_Record.read(rawMetadataInstIo, this.root, this)
  this.metadataInst = metadataInstExpr
  io.seek(pos)
  this.metadataInstFlag = true
  return this.metadataInst

proc fromFile*(_: typedesc[Mcap_MetadataIndex], filename: string): Mcap_MetadataIndex =
  Mcap_MetadataIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Magic], io: KaitaiStream, root: KaitaiStruct, parent: Mcap): Mcap_Magic =
  template this: untyped = result
  this = new(Mcap_Magic)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr

proc fromFile*(_: typedesc[Mcap_Magic], filename: string): Mcap_Magic =
  Mcap_Magic.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Records], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_Records =
  template this: untyped = result
  this = new(Mcap_Records)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Mcap_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[Mcap_Records], filename: string): Mcap_Records =
  Mcap_Records.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_Footer =
  template this: untyped = result
  this = new(Mcap_Footer)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsSummarySectionExpr = this.io.readU8le()
  this.ofsSummarySection = ofsSummarySectionExpr
  let ofsSummaryOffsetSectionExpr = this.io.readU8le()
  this.ofsSummaryOffsetSection = ofsSummaryOffsetSectionExpr

  ##[
  A CRC-32 of all bytes from the start of the Summary section up through and
including the end of the previous field (summary_offset_start) in the footer
record. A value of 0 indicates the CRC-32 is not available.

  ]##
  let summaryCrc32Expr = this.io.readU4le()
  this.summaryCrc32 = summaryCrc32Expr

proc summarySection(this: Mcap_Footer): Mcap_Records = 
  if this.summarySectionInstFlag:
    return this.summarySectionInst
  if this.ofsSummarySection != 0:
    let io = Mcap(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsSummarySection))
    let rawSummarySectionInstExpr = io.readBytes(int(((if this.ofsSummaryOffsetSection != 0: this.ofsSummaryOffsetSection else: Mcap(this.root).ofsFooter) - this.ofsSummarySection)))
    this.rawSummarySectionInst = rawSummarySectionInstExpr
    let rawSummarySectionInstIo = newKaitaiStream(rawSummarySectionInstExpr)
    let summarySectionInstExpr = Mcap_Records.read(rawSummarySectionInstIo, this.root, this)
    this.summarySectionInst = summarySectionInstExpr
    io.seek(pos)
  this.summarySectionInstFlag = true
  return this.summarySectionInst

proc summaryOffsetSection(this: Mcap_Footer): Mcap_Records = 
  if this.summaryOffsetSectionInstFlag:
    return this.summaryOffsetSectionInst
  if this.ofsSummaryOffsetSection != 0:
    let io = Mcap(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsSummaryOffsetSection))
    let rawSummaryOffsetSectionInstExpr = io.readBytes(int((Mcap(this.root).ofsFooter - this.ofsSummaryOffsetSection)))
    this.rawSummaryOffsetSectionInst = rawSummaryOffsetSectionInstExpr
    let rawSummaryOffsetSectionInstIo = newKaitaiStream(rawSummaryOffsetSectionInstExpr)
    let summaryOffsetSectionInstExpr = Mcap_Records.read(rawSummaryOffsetSectionInstIo, this.root, this)
    this.summaryOffsetSectionInst = summaryOffsetSectionInstExpr
    io.seek(pos)
  this.summaryOffsetSectionInstFlag = true
  return this.summaryOffsetSectionInst

proc ofsSummaryCrc32Input(this: Mcap_Footer): int = 
  if this.ofsSummaryCrc32InputInstFlag:
    return this.ofsSummaryCrc32InputInst
  let ofsSummaryCrc32InputInstExpr = int((if this.ofsSummarySection != 0: this.ofsSummarySection else: Mcap(this.root).ofsFooter))
  this.ofsSummaryCrc32InputInst = ofsSummaryCrc32InputInstExpr
  this.ofsSummaryCrc32InputInstFlag = true
  return this.ofsSummaryCrc32InputInst

proc summaryCrc32Input(this: Mcap_Footer): seq[byte] = 
  if this.summaryCrc32InputInstFlag:
    return this.summaryCrc32InputInst
  let io = Mcap(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsSummaryCrc32Input))
  let summaryCrc32InputInstExpr = io.readBytes(int((((Mcap(this.root).io.size - this.ofsSummaryCrc32Input) - 8) - 4)))
  this.summaryCrc32InputInst = summaryCrc32InputInstExpr
  io.seek(pos)
  this.summaryCrc32InputInstFlag = true
  return this.summaryCrc32InputInst

proc fromFile*(_: typedesc[Mcap_Footer], filename: string): Mcap_Footer =
  Mcap_Footer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_Record], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Mcap_Record =
  template this: untyped = result
  this = new(Mcap_Record)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let opExpr = Mcap_Opcode(this.io.readU1())
  this.op = opExpr
  let lenBodyExpr = this.io.readU8le()
  this.lenBody = lenBodyExpr
  block:
    let on = this.op
    if on == mcap.message:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Message.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.metadata_index:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_MetadataIndex.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.chunk:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Chunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.schema:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Schema.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.chunk_index:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_ChunkIndex.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.data_end:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_DataEnd.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.attachment_index:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_AttachmentIndex.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.statistics:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Statistics.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.message_index:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_MessageIndex.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.channel:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Channel.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.metadata:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Metadata.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.attachment:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Attachment.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.header:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Header.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.footer:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_Footer.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mcap.summary_offset:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Mcap_SummaryOffset.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.lenBody))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Mcap_Record], filename: string): Mcap_Record =
  Mcap_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_ChunkIndex], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_Record): Mcap_ChunkIndex =
  template this: untyped = result
  this = new(Mcap_ChunkIndex)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let messageStartTimeExpr = this.io.readU8le()
  this.messageStartTime = messageStartTimeExpr
  let messageEndTimeExpr = this.io.readU8le()
  this.messageEndTime = messageEndTimeExpr
  let ofsChunkExpr = this.io.readU8le()
  this.ofsChunk = ofsChunkExpr
  let lenChunkExpr = this.io.readU8le()
  this.lenChunk = lenChunkExpr
  let lenMessageIndexOffsetsExpr = this.io.readU4le()
  this.lenMessageIndexOffsets = lenMessageIndexOffsetsExpr
  let rawMessageIndexOffsetsExpr = this.io.readBytes(int(this.lenMessageIndexOffsets))
  this.rawMessageIndexOffsets = rawMessageIndexOffsetsExpr
  let rawMessageIndexOffsetsIo = newKaitaiStream(rawMessageIndexOffsetsExpr)
  let messageIndexOffsetsExpr = Mcap_ChunkIndex_MessageIndexOffsets.read(rawMessageIndexOffsetsIo, this.root, this)
  this.messageIndexOffsets = messageIndexOffsetsExpr
  let messageIndexLengthExpr = this.io.readU8le()
  this.messageIndexLength = messageIndexLengthExpr
  let compressionExpr = Mcap_PrefixedStr.read(this.io, this.root, this)
  this.compression = compressionExpr
  let compressedSizeExpr = this.io.readU8le()
  this.compressedSize = compressedSizeExpr
  let uncompressedSizeExpr = this.io.readU8le()
  this.uncompressedSize = uncompressedSizeExpr

proc chunk(this: Mcap_ChunkIndex): Mcap_Record = 
  if this.chunkInstFlag:
    return this.chunkInst
  let io = Mcap(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsChunk))
  let rawChunkInstExpr = io.readBytes(int(this.lenChunk))
  this.rawChunkInst = rawChunkInstExpr
  let rawChunkInstIo = newKaitaiStream(rawChunkInstExpr)
  let chunkInstExpr = Mcap_Record.read(rawChunkInstIo, this.root, this)
  this.chunkInst = chunkInstExpr
  io.seek(pos)
  this.chunkInstFlag = true
  return this.chunkInst

proc fromFile*(_: typedesc[Mcap_ChunkIndex], filename: string): Mcap_ChunkIndex =
  Mcap_ChunkIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffset], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_ChunkIndex_MessageIndexOffsets): Mcap_ChunkIndex_MessageIndexOffset =
  template this: untyped = result
  this = new(Mcap_ChunkIndex_MessageIndexOffset)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let channelIdExpr = this.io.readU2le()
  this.channelId = channelIdExpr
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

proc fromFile*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffset], filename: string): Mcap_ChunkIndex_MessageIndexOffset =
  Mcap_ChunkIndex_MessageIndexOffset.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffsets], io: KaitaiStream, root: KaitaiStruct, parent: Mcap_ChunkIndex): Mcap_ChunkIndex_MessageIndexOffsets =
  template this: untyped = result
  this = new(Mcap_ChunkIndex_MessageIndexOffsets)
  let root = if root == nil: cast[Mcap](this) else: cast[Mcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Mcap_ChunkIndex_MessageIndexOffset.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Mcap_ChunkIndex_MessageIndexOffsets], filename: string): Mcap_ChunkIndex_MessageIndexOffsets =
  Mcap_ChunkIndex_MessageIndexOffsets.read(newKaitaiFileStream(filename), nil, nil)

